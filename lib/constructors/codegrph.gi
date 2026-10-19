#############################################################################
##
#W  codegrph.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct code graphs.
##  
##

#############################################################################
##
#F  PreparataGraph( [<filter>, ]<integer>, <integer> )
##  
InstallMethod( PreparataGraphCons,
     "as a code graph with full automorphism group", true,
     [IsCodeGraph and FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, t, e)
  local B, C, F, H, K, s, dp, p1, p2, p3, p4, pi, rho;
  if t = 1 then
    H := HypercubeGraph2(IsVectorGraph and FullAutomorphismGroup, 3);
    AssignVertexNames(H, List(H.names,
                                t -> ([t[1]+t[3], t[2]+t[3], t[3]-1])*Z(2)^0));
    return H;
  elif e mod (2*t-1) = 0 then
    TryNextMethod();
  elif t = 2 then
    s := 2^e;
    F := OnFFE(8);
    dp := DirectProduct(Group(Z(8)), FieldAdditionPermutationGroup(2),
                        FieldExponentiationPermutationGroup(8),
                        Group((1, 2)));
    p1 := Projection(dp, 1);
    p2 := Projection(dp, 2);
    p3 := Projection(dp, 3);
    p4 := Projection(dp, 4);
    pi := [[Z(2)^0, 0*Z(2), 0*Z(2)],
           [0*Z(2), 0*Z(2), Z(2)^0],
           [0*Z(2), Z(2)^0, 0*Z(2)]];
    rho := [[Z(2)^0, 0*Z(2), 0*Z(2)],
            [0*Z(2), Z(2)^0, 0*Z(2)],
            [0*Z(2), Z(2)^0, Z(2)^0]];
    if e mod 3 = 2 then
      rho := TransposedMat(rho);
    fi;
    B := OnFFEByBasis(Basis(GF(8)));
    C := [t -> t, function(t)
                    local r;
                    r := B(t[1], rho);
                    return [r + Z(2)^0, t[2], B(t[3], pi) + r + r^s];
                  end];
    return Graph(dp, Cartesian(GF(8), GF(2), GF(8)),
                 function(t, g)
                   local g1;
                   g1 := Image(p1, g);
                   return C[2^Image(p4, g)](List([g1*t[1],
                                                   t[2] + 2^Image(p2, g),
                                                   t[3]*g1^(s+1)],
                                               x -> F(x, Image(p3, g))));
                 end, CrookedAdjacency(GoldFunction(s)), true);
    else
      return PreparataGraphCons(IsCodeGraph, t, e);
    fi;
end );

InstallMethod( PreparataGraphCons, "as a code graph", true,
     [IsCodeGraph, IsInt, IsInt], 0,
function(filter, t, e)
  local q, s, F, K, dp;
  q := 2^(2*t-1);
  s := 2^e;
  F := GF(q);
  dp := DirectProduct(Group(Z(q)), FieldAdditionPermutationGroup(2),
                      FieldAdditionPermutationGroup(q),
                      FieldExponentiationPermutationGroup(q));
  return Graph(dp, Cartesian(F, GF(2), F), OnPreparata(q, s, dp),
                   CrookedAdjacency(GoldFunction(s)), true);
end );

InstallMethod( PreparataGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, t, e)
  return PreparataGraphCons(IsCodeGraph
                                         and FullAutomorphismGroup, t, e);
end );

InstallMethod( PreparataGraphCons, "default", true,
     [IsObject, IsInt, IsInt], 0,
function(filter, t, e)
  return PreparataGraphCons(IsCodeGraph, t, e);
end );

InstallOtherMethod( PreparataGraphCons,
     "as a code graph for quotients given a graph", true,
     [IsCodeGraph, IsRecord, IsInt], 0,
function(filter, G, h)
  local s, t, A, F, H, K, T, V;
  if not IsGraph(G) then
    TryNextMethod();
  fi;
  if IsFFE(G.names[1][3]) then
    s := 1;
  else
    s := Size(G.names[1][3]);
  fi;
  t := Log2Int(2*s*G.order)/4;
  F := GF(2^(2*t-1));
  if IsFFE(G.names[1][3]) then
    if (2*t-1) mod h = 0 then
      K := GF(2^h);
    else
      K := Subspace(F, Elements(Basis(F)){[1..h]}, "basis");
    fi;
    V := List(G.names, x -> [x[1], x[2], x[3]+K]);
  else
    A := AdditivelyActingDomain(G.names[1][1]);
    K := A + Subspace(F,
                         Elements(Basis(OrthogonalSpaceInFullRowSpace(A,
                                                          F))){[1..h]},
                          "basis");
    V := List(G.names, x -> [x[1], x[2], Representative(x[3])+K]);
  fi;
  T := Set(List(V, x -> Positions(V, x)));
  H := Graph(Stabilizer(G.group, T, OnSetsSets), T, OnSets, function(x,y)
             return IsSubset(DistanceSet(G, 1, x), y);
           end, true);
  AssignVertexNames(H, List(T, x -> V[x[1]]));
  return H;
end );

InstallOtherMethod( PreparataGraphCons,
     "as a code graph for quotients given parameters", true,
     [IsCodeGraph, IsInt, IsInt, IsInt], 0,
function(filter, t, e, h)
  return PreparataGraphCons(IsCodeGraph,
                            PreparataGraphCons(IsCodeGraph, t, e), h);
end );

InstallOtherMethod( PreparataGraphCons, "for quotients given a graph", true,
     [IsObject, IsRecord, IsInt], 0,
function(filter, G, h)
  return PreparataGraphCons(IsCodeGraph, G, h);
end );

InstallOtherMethod( PreparataGraphCons, "for quotients given parameters", true,
     [IsObject, IsInt, IsInt, IsInt], 0,
function(filter, t, e, h)
  return PreparataGraphCons(IsCodeGraph, t, e, h);
end );

InstallGlobalFunction( PreparataGraph,
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
    return PreparataGraphCons(filt, arg[j], 1);
  elif Length(arg) = j+1 then
    return PreparataGraphCons(filt, arg[j], arg[j+1]);
  elif Length(arg) = j+2 then
    return PreparataGraphCons(filt, arg[j], arg[j+1], arg[j+2]);
  else
    Error("usage: PreparataGraph( [<filter>, ]{<int>, <int>|<graph>}[, <int>] )");
  fi;
end );

#############################################################################
##
#F  KasamiGraph( <integer>, <integer>, <integer> )
##  
InstallGlobalFunction( KasamiGraph,
function(i, j, m)
  local q, s, t, dp, G;
  q := 2^i;
  s := q^(2*j+1);
  t := q^m + 1;
  G := FieldAdditionPermutationGroup(s);
  dp := DirectProduct(G, G, FieldExponentiationPermutationGroup(s));
  return Graph(dp, Elements(GF(s)^2), OnKasami(s, s, dp),
        function(x, y)
            return x <> y and x[1]+y[1] = (x[2]+y[2])^t;
        end, true);
end );

#############################################################################
##
#F  ExtendedKasamiGraph( <integer>, <integer>, <integer> )
##  
InstallGlobalFunction( ExtendedKasamiGraph,
function(i, j, m)
  return ExtendedBipartiteDoubleGraph(KasamiGraph(i, j, m));
end );

#############################################################################
##
#F  QuadraticKasamiGraph( <integer> )
##  
InstallGlobalFunction( QuadraticKasamiGraph,
function(i)
  local q, s, t, dp;
  q := 2^i;
  s := q^2;
  t := q + 1;
  dp := DirectProduct(FieldAdditionPermutationGroup(q),
          FieldAdditionPermutationGroup(s),
          FieldExponentiationPermutationGroup(s));
  return Graph(dp, Cartesian(GF(q), GF(s)), OnKasami(q, s, dp),
        function(x, y)
            return x <> y and x[1]+y[1] = (x[2]+y[2])^t;
        end, true);
end );

#############################################################################
##
#F  ExtendedQuadraticKasamiGraph( <integer> )
##  
InstallGlobalFunction( ExtendedQuadraticKasamiGraph,
function(i)
  return ExtendedBipartiteDoubleGraph(QuadraticKasamiGraph(i));
end );

#############################################################################
##
#E
