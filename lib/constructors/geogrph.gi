#############################################################################
##
#W  geogrph.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct geometry graphs.
##  
##

#############################################################################
##
#F  DesarguesianPlaneIncidenceGraph( <integer> )
##  
InstallGlobalFunction( DesarguesianPlaneIncidenceGraph,
function(q)
  local G, V, dp;
  V := GF(q)^3;
  dp := DirectProduct(GL(3, q), SymmetricGroup(2));
  G := Graph(dp, Union(List([1,2], d -> Subspaces(V, d))),
              OnProjectivePlane(V, dp), function(x, y)
                  return x <> y and Intersection(x, y) in [x, y];
              end, true);
  G.halfDuality := Sum;
  G.halfPrimality := Intersection;
  return G;
end );

#############################################################################
##
#F  HallPlaneIncidenceGraph( <integer> )
##  
InstallGlobalFunction( HallPlaneIncidenceGraph,
function(q)
  local c, p, G, H, L, P, dp, mul;
  H := GF(q)^2;
  p := DefiningPolynomial(GF(GF(q), 2));
  c := CoefficientsOfUnivariatePolynomial(p);
  mul := HallMultiplication(p);
  P := Union([[]], List(H, x -> [x]), Cartesian(H, H));
  L := Union([Union([[]], List(H, z -> [z]))],
              List(H, x -> Union([[]], List(H, z -> [x, z]))),
              List(Cartesian(H, H), w -> Union([[w[1]]],
                  List(H, z -> [z, mul(z, w[1]) + w[2]]))));
  dp := DirectProduct(Concatenation(ListWithIdenticalEntries(5,
                                      FieldAdditionPermutationGroup(q)),
                      [Group(Z(q)), Group([[c[2], Z(q)^0],
                                           [-c[1], 0*Z(q)]])]));
  G := Graph(dp, Union(P, L), OnHallPlane(q, dp),
              PointLineIncidence, true);
  G.halfDuality := DefaultDualityFunction;
  G.halfPrimality := DefaultPrimalityFunction;
  return G;
end );

#############################################################################
##
#F  HughesPlaneIncidenceGraph( <integer>[, <integer>] )
##  
InstallGlobalFunction( HughesPlaneIncidenceGraph,
function(arg)
  local c, n, q, A, B, F, G, H, P, df, dp, th, mul, rdiv, gens, orth;
  if Length(arg) < 1 then
    Error("at least one argument expected");
    return fail;
  fi;
  q := arg[1];
  if Length(arg) > 1 then
    n := arg[2];
  else
    n := 0;
  fi;
  th := Z(q^2)^((q+1)/2);
  B := Basis(GF(q^2), [Z(q)^0, th]);
  if n = 0 then
    mul := DicksonMultiplication(q);
    rdiv := DicksonRightDivision(q);
  else
    gens := [[[0, -1], [1, 0]]];
    if q = 5 then
      gens[2] := [[1, -2], [-1, -2]];
    elif q = 7 then
      gens[2] := [[1, 3], [-1, -2]];
    elif q = 11 and n = 1 then
      gens[2] := [[1, 5], [-5, -2]];
      gens[3] := [[4, 0], [0, 4]];
    elif q = 11 and n = 2 then
      gens[2] := [[2, 4], [1, -3]];
    elif q = 23 then
      gens[2] := [[1, -6], [12, -2]];
      gens[3] := [[2, 0], [0, 2]];
    elif q = 29 then
      gens[2] := [[1, -7], [-12, -2]];
      gens[3] := [[16, 0], [0, 16]];
    elif q = 59 then
      gens[2] := [[9, 15], [-10, -10]];
      gens[3] := [[4, 0], [0, 4]];
    else
      Error("the specified exceptional near-field does not exist");
      return fail;
    fi;
    G := Group(gens * Z(q)^0);
    F := Union([NullMat(2, 2, GF(q))], Elements(G));
    SortBy(F, x -> IntVecFFE(x[1]));
    mul := ExceptionalMultiplication(q, F, B);
    rdiv := ExceptionalRightDivision(q, F, B);
  fi;
  c := CoefficientsOfUnivariatePolynomial(DefiningPolynomial(GF(GF(q), 3)));
  A := [[-c[3], Z(q)^0, 0*Z(q)],
        [-c[2], 0*Z(q), Z(q)^0],
        [-c[1], 0*Z(q), 0*Z(q)]];
  P := Filtered(GF(q^2)^3,
          x -> not IsZero(x) and IsOne(First(x, y -> not IsZero(y))));
  dp := DirectProduct(Group(A), SymmetricGroup(2));
  orth := function(x, y)
            local z;
            z := TransposedMat(List(y, w -> Coefficients(B, w)));
            return IsZero(x*z[1] + mul(th, x*z[2]));
          end;
  H := Graph(dp, Cartesian([1, 2], P), OnHughesPlane(q, rdiv, dp),
              function(x, y)
                return x[1] <> y[1] and orth(x[2], y[2]);
              end, true);
  df := x -> [x[1][1]^(1, 2),
              Intersection(List(x,
                                  y -> Filtered(P, z -> orth(y[2], z))))[1]];
  H.halfDuality := df;
  H.halfPrimality := df;
  return H;
end );

#############################################################################
##
#F  GeneralizedQuadrangleQ( <integer>, <integer> )
##  
InstallGlobalFunction( GeneralizedQuadrangleQ,
function(d, q)
  return PolarGraphO(4-d, d+1, q);
end );

#############################################################################
##
#F  GeneralizedQuadrangleH( <integer>, <integer> )
##  
InstallGlobalFunction( GeneralizedQuadrangleH,
function(d, r)
  return PolarGraphU(d+1, r);
end );

#############################################################################
##
#F  GeneralizedQuadrangleW( <integer> )
##  
InstallGlobalFunction( GeneralizedQuadrangleW,
q -> PolarGraphSp(4, q)
);

#############################################################################
##
#F  GeneralizedQuadrangleT( <integer>, <integer>, <list>[, <group>] )
##  
InstallGlobalFunction( GeneralizedQuadrangleT,
function(arg)
  local d, o, q, G, H, O, V, gr;
  if Length(arg) < 1 then
    Error("at least one argument expected");
    return fail;
  elif Length(arg) < 3 then
    d := arg[1].d;
    q := arg[1].q;
    o := arg[1].points;
    G := arg[1].group;
  else
    d := arg[1];
    q := arg[2];
    o := arg[3];
    if Length(arg) > 3 then
      G := arg[4];
    else
      G := Group(IdentityMat(d+1, GF(q)));
    fi;
  fi;
  V := GF(q)^(d+2);
  H := Subspace(V, BasisVectors(CanonicalBasis(V)){[2..d+2]}, "basis");
  O := List(o, x -> Subspace(V,
          [Concatenation([0*Z(q)], BasisVectors(Basis(x))[1])], "basis"));
  gr := Graph(Group(List(GeneratorsOfGroup(G),
                          g -> Concatenation([Concatenation([Z(q)^0],
                              ListWithIdenticalEntries(d+1, 0*Z(q)))],
                              List(g, l -> Concatenation([0*Z(q)], l))))),
             Union(Filtered(Subspaces(V, 1), x -> not IsSubset(H, x)),
                   Filtered(Subspaces(V, d+1),
                       x -> Length(Filtered(O, y -> IsSubset(x, y))) = 1), [V]),
          OnSubspaces(V), function(x, y)
              local dx, dy, xy, yx;
            dx := Dimension(x);
            dy := Dimension(y);
            xy := x+y;
            yx := Intersection(x, y);
            return (dx = d+2 and dy = d+1) or (dx = d+1 and dy = d+2) or
                (dx = 1 and dy = 1 and ForAny(O, z -> IsSubset(xy, z))) or
                (dx = 1 and dy = d+1 and ForAny(O, z -> IsSubset(y, x+z))) or
                (dx = d+1 and dy = 1 and ForAny(O, z -> IsSubset(x, y+z))) or
                (dx = d+1 and dy = d+1 and x <> y and
                                            ForAny(O, z -> IsSubset(yx, z)));
        end, true);
  gr.duality := function(x)
        if V in x then
          return First(O, y -> IsSubset(Intersection(x), y));
        else
          return Sum(Filtered(x, y -> Dimension(y) = 1));
        fi;
      end;
  gr.primality := function(x)
        if ForAll(x, y -> Dimension(y) = 1) then
          return V;
        elif ForAll(x, y -> Dimension(y) = 2) then
          return Intersection(x);
        else
          return Sum(x);
        fi;
      end;
  return gr;
end );

#############################################################################
##
#F  GeneralizedQuadrangleTstar( <integer>, <list>[, <group>] )
##  
InstallGlobalFunction( GeneralizedQuadrangleTstar,
function(arg)
  local o, q, G, H, O, V, gr;
  if Length(arg) < 1 then
    Error("at least one argument expected");
    return fail;
  elif Length(arg) < 3 then
    q := arg[1].q;
    o := arg[1].points;
    G := arg[1].group;
  else
    q := 2^arg[1];
    o := arg[2];
    if Length(arg) > 2 then
      G := arg[3];
    else
      G := Group(IdentityMat(3, GF(q)));
    fi;
  fi;
  V := GF(q)^4;
  H := Subspace(V, BasisVectors(CanonicalBasis(V)){[2..4]}, "basis");
  O := List(o, x -> Subspace(V,
          [Concatenation([0*Z(q)], BasisVectors(Basis(x))[1])], "basis"));
  gr := Graph(Group(List(GeneratorsOfGroup(G),
                          g -> Concatenation([Concatenation([Z(q)^0],
                                  ListWithIdenticalEntries(3, 0*Z(q)))],
                              List(g, l -> Concatenation([0*Z(q)], l))))),
              Filtered(Subspaces(V, 1), x -> not IsSubset(H, x)),
              OnSubspaces(V), function(x, y)
                  local xy;
                  xy := x+y;
                  return not IsSubset(H, xy)
                      and ForAny(O, z -> IsSubset(xy, z));
                end, true);
  gr.duality := Sum;
  gr.primality := Intersection;
  return gr;
end );

#############################################################################
##
#F  GeneralizedQuadrangleP( <graph>, <vertex> )
##  
InstallGlobalFunction( GeneralizedQuadrangleP,
function(Q, z)
  local H, P;
  H := Graph(Stabilizer(Q.group, z), DistanceSet(Q, 2, z), OnPoints,
          function(x, y)
            local c;
            c := Intersection(Adjacency(Q, x), Adjacency(Q, y));
            return not z in c and (y in Adjacency(Q, x)
                                or ForAll(c, w -> z in Adjacency(Q, w)));
          end, true);
  AssignVertexNames(H, Q.names{H.names});
  CheckDualityFunctions(Q);
  H.duality := function(x)
      local p;
      p := List(x, u -> Position(Q.names, u));
      if ForAny(Cartesian(p, p), w -> Distance(Q, w[1], w[2]) = 2) then
        return [2, Set(x)];
      else
        return [1, Q.duality(Union(x,
                Q.names{Intersection(List(p, v -> Adjacency(Q, v)))}))];
      fi;
    end;
  H.primality := x -> Q.primality(List(Filtered(x, y -> y[1] = 1),
                                  w -> w[2]));
  return H;
end );

#############################################################################
##
#F  GeneralizedQuadrangleAS( <integer> )
##  
InstallGlobalFunction( GeneralizedQuadrangleAS,
q -> GeneralizedQuadrangleP(GeneralizedQuadrangleW(q), 1)
);

# The incidence graph of a projective plane read from a file as on
#   http://www.uwyo.edu/moorhouse/pub/planes/       or
#   http://www.uwyo.edu/moorhouse/pub/genpoly/
# The optional second parameter is a file containing generators of the
# automorphism group.
InstallGlobalFunction( IncidenceGraphFromFile,
function(arg)
  local l, m, n, G, L, fst, lst, lns;
  if Length(arg) < 1 then
    Error("at least one argument expected");
    return fail;
  fi;
  lns := ReadLines(arg[1]);
  n := Length(lns);
  L := List(lns, l -> List(SplitString(l, " "), x -> Int(x)+n+1));
  if Length(arg) > 1 then
    lns := ReadLines(arg[2]);
    m := Length(lns);
    fst := Filtered([1..m], i -> IntChar(lns[i][1]) <> 32);
    l := Length(fst);
    lst := List(fst{[2..l]}, i -> i-1);
    Add(lst, m);
    G := Group(List([1..l], i -> PermList(List(SplitString(
                JoinStringsWithSeparator(lns{[fst[i]..lst[i]]}, ""),
                " "), x -> Int(x)+1))));
  else
    G := Group(());
  fi;
  return Graph(G, [1..2*n], OnPoints, function(x, y)
          return (x <= n and y in L[x]) or (y <= n and x in L[y]);
        end, true);
end );

# The collinearity graph of a projective plane read from a file as on
#   http://www.uwyo.edu/moorhouse/pub/genpoly/
# The optional second parameter is a file containing generators of the
# automorphism group.
InstallGlobalFunction( CollinearityGraphFromFile,
function(arg)
  local l, m, n, G, L, fst, lst, lns;
  if Length(arg) < 1 then
    Error("at least one argument expected");
    return fail;
  fi;
  lns := ReadLines(arg[1]);
  n := Length(lns);
  L := List(lns, l -> List(SplitString(l, " "), x -> Int(x)));
  if Length(arg) > 1 then
    lns := ReadLines(arg[2]);
    m := Length(lns);
    fst := Filtered([1..m], i -> IntChar(lns[i][1]) <> 32);
    l := Length(fst);
    lst := List(fst{[2..l]}, i -> i-1);
    Add(lst, m);
    G := Group(List([1..l], i -> PermList(Filtered(List(SplitString(
               JoinStringsWithSeparator(lns{[fst[i]..lst[i]]}, ""),
                " "), x -> Int(x)+1), y -> y <= n))));
  else
    G := Group(());
  fi;
  return Graph(G, [1..n], OnPoints, function(x, y)
          return Length(Intersection(L[x], L[y])) = 1;
      end, true);
end );

#############################################################################
##
#E
