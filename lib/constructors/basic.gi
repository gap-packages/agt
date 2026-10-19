#############################################################################
##
#W  basic.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct basic graphs.
##  
##

#############################################################################
##
#O  CompleteMultipartiteGraphCons( [<filter>, ]<list>  )
##  
InstallOtherMethod( CompleteMultipartiteGraphCons,
     "for a list of part sizes with full automorphism group", true,
     [FullAutomorphismGroup, IsList], 0,
function(filter, sizes)
  local H, Gs, dp, l, p;
  l := Set(sizes);
  p := List(l, i -> Filtered([1..Length(sizes)], j -> sizes[j] = i));
  Gs := List([1..Length(l)],
              i -> CompleteMultipartiteGraphCons(FullAutomorphismGroup,
                                                  Length(p[i]), l[i]));
  H := GraphJoin(NoVertexNames, Gs);
  AssignVertexNames(H, List(H.names, function(t)
                                       local tt;
                                       tt := Gs[t[1]].names[t[2]];
                                       return [p[t[1]][tt[1]], tt[2]];
                                     end));
  return H;
end );

InstallOtherMethod( CompleteMultipartiteGraphCons, "for a list of part sizes",
     true, [IsObject, IsList], 0,
function(filter, sizes)
  local dp;
  dp := DirectProduct(List(sizes, i -> SymmetricGroup(i)));
  return Graph(dp, Union(List([1..Length(sizes)],
    i -> List([1..sizes[i]], j -> [i, j]))),
    OnSum(dp), DifferentParts, true);
end );

#############################################################################
##
#O  CompleteMultipartiteGraphCons( [<filter>, ]<integer>, <integer>  )
##  
InstallMethod( CompleteMultipartiteGraphCons,
     "for equal part sizes with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, m, n)
  return Graph(WreathProductSymmetricGroups(n, m),
               Cartesian([1..m], [1..n]),
               function(x, g)
                 local y;
                 y := (n*(x[1]-1)+x[2])^g - 1;
                 return [Int(y/n)+1, y mod n + 1];
               end, DifferentParts, true);
end );

InstallMethod( CompleteMultipartiteGraphCons, "for equal part sizes",
     true, [IsObject, IsInt, IsInt], 0,
function(filter, m, n)
  return CompleteMultipartiteGraphCons(FullAutomorphismGroup, m, n);
end );

#############################################################################
##
#F  CompleteMultipartiteGraph( [<filter>, ]<list>  )
#F  CompleteMultipartiteGraph( [<filter>, ]<integer>, <integer>  )
##  
InstallGlobalFunction( CompleteMultipartiteGraph,
function(arg)
  local j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    return CompleteMultipartiteGraphCons(filt, arg[j]);
  elif Length(arg) = j+1 then
    return CompleteMultipartiteGraphCons(filt, arg[j], arg[j+1]);
  else
    Error("usage: CompleteMultipartiteGraph( [<filter>, ]{<list> |<int>, <int> })");
  fi;
end );

#############################################################################
##
#F  CycleGraph( <integer> )
##  
InstallGlobalFunction( CycleGraph2,
n -> Graph(DihedralGroup(IsPermGroup, 2*n), [1..n],
  OnPoints, function(x, y)
    return (x-y) mod n in [1,n-1];
  end, true)
);

#############################################################################
##
#F  CocktailPartyGraph( <integer> )
##  
InstallGlobalFunction( CocktailPartyGraph,
   n -> CompleteMultipartiteGraphCons(FullAutomorphismGroup, n, 2)
 );

#############################################################################
##
#F  PaleyGraph( <integer> )
##  
InstallGlobalFunction( PaleyGraph,
function(q)
  local dp;
  dp := DirectProduct(FieldAdditionPermutationGroup(q), Group(Z(q)^2),
                      FieldExponentiationPermutationGroup(q));
  return Graph(dp, Elements(GF(q)), OnPaley(q, dp),
      function(x, y)
        return IsOne((x-y)^((q-1)/2));
      end, true);
end );

#############################################################################
##
#O  LatinSquareGraphCons( <matrix> )
##  
InstallMethod( LatinSquareGraphCons,
     "for Cayley tables", true,
     [IsObject, IsList, IsBool], 0,
function(filter, M, invt)
  local G, dim;
  if not ForAll(M, IsList) then
    TryNextMethod();
  fi;
  dim := DimensionsMat(M);
  if M = TransposedMat(M) then
    G := Group((1,2));
  else
    G := Group(());
  fi;
  return Graph(G, Cartesian([1..dim[1]], [1..dim[2]]), Permuted,
               function(x, y)
                 return x <> y and (x[1] = y[1] or x[2] = y[2]
                                or M[x[1]][x[2]] = M[y[1]][y[2]]);
               end, true);
end );

#############################################################################
##
#O  LatinSquareGraphCons( [<filter>, ]<group>[, <bool>] )
##  
InstallMethod( LatinSquareGraphCons,
     "for groups with full automorphism group", true,
     [FullAutomorphismGroup, IsGroup, IsBool], 0,
function(filter, G, invt)
  local A, F, H, dp, vcs;
  if Order(G) = 3 then
    H := Graph(WreathProductSymmetricGroups(3, 3), [1..9], OnPoints,
               function(x, y)
                 return Int(x/3) <> Int(y/3);
               end, true);
    AssignVertexNames(H, Cartesian(G, G){[1,5,9,2,6,7,3,4,8]});
    return H;
  elif Order(G) = 4 and RankPGroup(G) = 2 then
    F := Elements(G);
    A := Filtered(AutomorphismGroup(G), g -> Order(g) = 3);
    H := ComplementGraph(HammingGraphCons(IsVectorGraph, 2, 4));
    AssignVertexNames(H, List(List(H.names,
                                     t -> List(t, x -> F[Int(x)+1])),
                                t -> [t[1]^A[1] * t[2]^A[2],
                                      t[1]^A[2] * t[2]^A[1]]));
    return H;
  else
    if IsAbelian(G) then
      A := Group((1,2));
    else
      A := Group(());
    fi;
    dp := DirectProduct(G, G, AutomorphismGroup(G),
                        A, SymmetricGroup(3));
    if invt then
      vcs := Cartesian(G, G);
    else
      vcs := [[One(G), One(G)]];
    fi;
    return Graph(dp, vcs, OnLatinSquare(dp),
                function(x, y)
                  return x <> y and (x[1] = y[1] or x[2] = y[2]
                                 or x[1]*x[2] = y[1]*y[2]); # LatinSquareAdjacency?
                 end, invt);
  fi;
end );

InstallMethod( LatinSquareGraphCons,
     "for groups", true,
     [IsObject, IsGroup, IsBool], 0,
function(filter, G, invt)
  local A, dp, vcs;
  if IsAbelian(G) then
    A := Group((1,2));
  else
    A := Group(());
  fi;
  dp := DirectProduct(G, G, Group(IdentityMapping(G)),
                      A, SymmetricGroup(3));
  if invt then
    vcs := Cartesian(G, G);
  else
    vcs := [[One(G), One(G)]];
  fi;
  return Graph(dp, vcs, OnLatinSquare(dp), LatinSquareAdjacency, invt);
end );

#############################################################################
##
#F  LatinSquareGraph( <matrix> )
#F  LatinSquareGraph( [<filter>, ]<group>[, <bool>] )
##  
InstallGlobalFunction( LatinSquareGraph,
function(arg)
  local j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    return LatinSquareGraphCons(filt, arg[j], true);
  elif Length(arg) = j+1 then
    return LatinSquareGraphCons(filt, arg[j], arg[j+1]);
  else
    Error("usage: LatinSquareGraph( [<filter>, ]{<mat>|<grp>}[, <bool>] )");
  fi;
end );

#############################################################################
##
#F  CompleteTaylorGraph( <integer> )
##  
InstallGlobalFunction( CompleteTaylorGraph,
function(n)
  local G;
  G := EdgeOrbitsGraph(Group([(1,2)(n+1,n+2),
       PermList(Concatenation([2..n], [1], [n+2..2*n], [n+1])),
       PermList(Concatenation([n+1..2*n], [1..n]))]), [1, n+2]);
  AssignVertexNames(G, Cartesian([1, 2], [1..n]));
  return G;
end );

#############################################################################
##
#O  HaarGraphCons( <integer>[, <list>] )
##  
InstallMethod( HaarGraphCons, "", true, [IsObject, IsInt, IsList], 0,
function(filter, n, adj)
  return Graph(Group([DirectProductElement([(),
                        PermList(Concatenation([2..n], [1]))]),
                      DirectProductElement([(1,2),
                        PermList(Concatenation([1], [n,n-1..2]))])]),
               Cartesian([1,2], [1..n]), function(x, g)
                      return [x[1]^g[1], x[2]^g[2]];
                    end, function(x, y)
                      return x[1] <> y[1] and
                          ((-1)^x[1] * (x[2]-y[2])) mod n in adj;
                    end, true);
end );

#############################################################################
##
#F  HaarGraph( <integer>[, <list>] )
##  
InstallGlobalFunction( HaarGraph2,
function(arg)
  local j, m, n, adj, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    n := 0;
    adj := [];
    m := arg[j];
    while m <> 0 do
      if m mod 2 = 1 then
        Add(adj, n);
      fi;
      m := Int(m/2);
      n := n+1;
    od;
  elif Length(arg) = j+1 then
    n := arg[j];
    adj := arg[j+1];
  else
    Error("usage: HaarGraph( <integer>[, <list> ])");
  fi;
  return HaarGraphCons(filt, n, adj);
end );

#############################################################################
##
#E
