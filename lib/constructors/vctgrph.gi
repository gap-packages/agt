#############################################################################
##
#W  vctgrph.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct vector graphs.
##  
##

#############################################################################
##
#O  HammingGraphCons( [<filter>, ]<integer>, <integer> )
##  
InstallMethod( HammingGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, d, e)
  return BoxPowerGraph(NoVertexNames,
                       CompleteGraph(SymmetricGroup(e), e), d);
end );

InstallMethod( HammingGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt, IsInt], 0,
function(filter, d, e)
  return HammingGraphCons(IsVectorGraph and FullAutomorphismGroup, d, e);
end );

InstallMethod( HammingGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, d, e)
  return HammingGraphCons(IsVectorGraph and FullAutomorphismGroup, d, e);
end );

InstallMethod( HammingGraphCons, "default", true,
     [IsObject, IsInt, IsInt], 0,
function(filter, d, e)
  return HammingGraphCons(IsVectorGraph, d, e);
end );

#############################################################################
##
#F  HammingGraph2( [<filter>, ]<integer>, <integer> )
##  
InstallGlobalFunction( HammingGraph2,
function(arg)
  local j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j+1 then
    return HammingGraphCons(filt, arg[j], arg[j+1]);
  else
    Error("usage: HammingGraph( [<filter>, ]<int>, <int> )");
  fi;
end );

#############################################################################
##
#F  SquareLatticeGraph( <integer> )
##  
InstallGlobalFunction( SquareLatticeGraph, 
function( n )   
  if not (IsPosInt(n) and n>1) then
    Error("usage: SquareLatticeGraph(<n>), where \n\
                  <n> is a positive integer of size at least 1.");
  fi;

  return HammingGraphCons(IsVectorGraph and FullAutomorphismGroup,2,n);
end );

#############################################################################
##
#F  HypercubeGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( HypercubeGraph2,
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
    return HammingGraphCons(filt, arg[j], 2);
  else
    Error("usage: HypercubeGraph2( [<filter>, ]<int> )");
  fi;
end );
    
#############################################################################
##
#O  DoobGraphCons( [<filter>, ]<integer>, <integer> )
##  
InstallMethod( DoobGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, n, d)
  return BoxProductGraph(
         BoxPowerGraph(ShrikhandeGraphCons(IsVectorGraph), n),
         HammingGraphCons(IsVectorGraph and FullAutomorphismGroup, d, 4));
end );

InstallMethod( DoobGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt, IsInt], 0,
function(filter, n, d)
  return DoobGraphCons(IsVectorGraph and FullAutomorphismGroup, n, d);
end );

InstallMethod( DoobGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, n, d)
  return DoobGraphCons(IsVectorGraph and FullAutomorphismGroup, n, d);
end );

InstallMethod( DoobGraphCons, "default", true,
     [IsObject, IsInt, IsInt], 0,
function(filter, n, d)
  return DoobGraphCons(IsVectorGraph, n, d);
end );

#############################################################################
##
#F  DoobGraph( [<filter>, ]<integer>, <integer> )
##  
InstallGlobalFunction( DoobGraph,
function(arg)
  local j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j+1 then
    return DoobGraphCons(filt, arg[j], arg[j+1]);
  else
    Error("usage: DoobGraph( [<filter>, ]<int>, <int> )");
  fi;
end );

#############################################################################
##
#O  HalvedCubeGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( HalvedCubeGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  local G;
  if d = 4 then
    G := CocktailPartyGraph(4);
    AssignVertexNames(G, List(G.names,
          t -> List([1..4], function(i)
                              if t[1] = 1 or i = 1 or i = t[1] then
                                return t[2];
                              else
                                return 3 - t[2];
                              fi;
                            end)));
    return G;
  else
    return HalvedCubeGraphCons(IsVectorGraph, d);
  fi;
end );

InstallMethod( HalvedCubeGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt], 0,
function(filter, d)
  return HalvedGraph(HammingGraphCons(IsVectorGraph, d, 2));
end );

InstallMethod( HalvedCubeGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  return HalvedCubeGraphCons(IsVectorGraph and FullAutomorphismGroup, d);
end );

InstallMethod( HalvedCubeGraphCons, "as a vector graph", true,
     [IsObject, IsInt], 0,
function(filter, d)
  return HalvedCubeGraphCons(IsVectorGraph, d);
end );

#############################################################################
##
#F  HalvedCubeGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( HalvedCubeGraph2,
function(arg)
  local G, j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    return HalvedCubeGraphCons(filt, arg[j]);
  else
    Error("usage: HalvedCubeGraph2( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#O  FoldedCubeGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( FoldedCubeGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  local G;
  if d = 4 then
    G := CompleteMultipartiteGraph(2, 4);
    AssignVertexNames(G, List(List(G.names, t -> List([1..4],
                      function(i)
                        if t[1] = 1 and (t[2] = 1 or i = 1 or i = t[2])
                           or t[1] = 2 and i <> t[2] then
                          return 1;
                        else
                          return 2;
                        fi;
                      end)), s -> Set([s, 3-s])));
    return G;
  else
    return FoldedCubeGraphCons(IsVectorGraph, d);
  fi;
end );

InstallMethod( FoldedCubeGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt], 0,
function(filter, d)
  return AntipodalQuotientGraph(HammingGraphCons(IsVectorGraph, d, 2));
end );

InstallMethod( FoldedCubeGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  return FoldedCubeGraphCons(IsVectorGraph and FullAutomorphismGroup, d);
end );

InstallMethod(FoldedCubeGraphCons, "as a vector graph", true,
     [IsObject, IsInt], 0,
function(filter, d)
  return FoldedCubeGraphCons(IsVectorGraph, d);
end );

#############################################################################
##
#F  FoldedCubeGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( FoldedCubeGraph,
function(arg)
  local G, j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    return FoldedCubeGraphCons(filt, arg[j]);
  else
    Error("usage: FoldedCubeGraph( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#O  FoldedHalvedCubeGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( FoldedHalvedCubeGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  local G;
  if d = 3 then
    G := CompleteGraph(SymmetricGroup(16));
    AssignVertexNames(G, List(Tuples([1,2], 4), function(t)
              if WeightVecFFE(t-1) mod 2 = 0 then
                return [Concatenation([1,1], t),
                        Concatenation([2,2], 3-t)];
              else
                return [Concatenation([1,2], t),
                        Concatenation([2,1], 3-t)];
              fi;
            end));
    return G;
  else
    return FoldedHalvedCubeGraphCons(IsVectorGraph, d);
  fi;
end );

InstallMethod( FoldedHalvedCubeGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt], 0,
function(filter, d)
  return AntipodalQuotientGraph(HalvedGraph(
                                HammingGraphCons(IsVectorGraph, 2*d, 2)));
end );

InstallMethod( FoldedHalvedCubeGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  return FoldedHalvedCubeGraphCons(
                          IsVectorGraph and FullAutomorphismGroup, d);
end );

InstallMethod( FoldedHalvedCubeGraphCons, "as a vector graph", true,
     [IsObject, IsInt], 0,
function(filter, d)
  return FoldedHalvedCubeGraphCons(IsVectorGraph, d);
end );

#############################################################################
##
#F  FoldedHalvedCubeGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( FoldedHalvedCubeGraph,
function(arg)
  local G, j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    return FoldedHalvedCubeGraphCons(filt, arg[j]);
  else
    Error("usage: FoldedHalvedCubeGraph( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#F  BrouwerGraph( [<filter>, ]<integer> )
##  

# Convert an integer to a bitstring of length w
# TODO Temporarily placed here for use in the Brouwer graph constructor
BindGlobal("IntToBits", function(x, w)
    return List([1..w], i -> Int(x / 2^(w-i)) mod 2);
end);

#############################################################################
##
#O  BrouwerGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( BrouwerGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt], 0,
function(filter, q)
  local G, dp, wp;
  if q = 2 then
    G := FoldedCubeGraph(IsVectorGraph and FullAutomorphismGroup, 7);
    AssignVertexNames(G, List(G.names, function(p)
                              local t, u, v;
                              v := First(p, s -> WeightVecFFE(s-1) <= 3);
                              t := List(Filtered([1..7], i -> v[i] = 2),
                                         j -> IntToBits(j, 3)*Z(2)^0);
                              if Length(t) <= 1 then
                                u := [0*Z(2), 0*Z(2), 0*Z(2)];
                              elif Length(t) = 2 then
                                u := VectorProduct(t[1], t[2]);
                              else
                                u := VectorProduct(t[1], t[2])
                                     + VectorProduct(t[1], t[3])
                                     + VectorProduct(t[2], t[3]);
                              fi;
                              if Length(t) = 0 then
                                t[1] := u;
                              fi;
                              return [u, Sum(t)];
                              end));
    return G;
  else
    wp := WreathProduct(FieldAdditionPermutationGroup(q),
                        MatrixColumnEvenPermutationGroup(2, 3));
    dp := DirectProduct(wp, GL(3, q),
                          FieldExponentiationPermutationGroup(q));
    return Graph(dp, Elements(GF(q)^[2,3]), OnVectorPairs(q, dp, wp),
           function(x, y)
             return x <> y and x[1] - y[1] = VectorProduct(x[2], y[2]);
           end, true);
  fi;
end );

InstallMethod( BrouwerGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt], 0,
function(filter, q)
  local dp, wp;
  wp := WreathProduct(FieldAdditionPermutationGroup(q),
                      MatrixColumnEvenPermutationGroup(2, 3));
  dp := DirectProduct(wp, Group(IdentityMat(3, GF(q))), Group(()));
  return Graph(dp, Elements(GF(q)^[2,3]), OnVectorPairs(q, dp, wp),
               function(x, y)
                 return x <> y and x[1] - y[1] = VectorProduct(x[2], y[2]);
               end, true);
end );

InstallMethod( BrouwerGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt], 0,
function(filter, q)
  return BrouwerGraphCons(IsVectorGraph and FullAutomorphismGroup, q);
end );

InstallMethod( BrouwerGraphCons, "as a vector graph", true,
     [IsObject, IsInt], 0,
function(filter, q)
  return BrouwerGraphCons(IsVectorGraph, q);
end );

#############################################################################
##
#F  BrouwerGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( BrouwerGraph,
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
    return BrouwerGraphCons(filt, arg[j]);
  else
    Error("usage: BrouwerGraph( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#O  PasechnikGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( PasechnikGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt], 0,
function(filter, q)
  return ExtendedBipartiteDoubleGraph(BrouwerGraphCons(IsVectorGraph,
                                                        q));
end );

InstallMethod( PasechnikGraphCons, "as a vector graph", true,
    [IsObject, IsInt], 0,
function(filter, q)
  return PasechnikGraphCons(IsVectorGraph, q);
end );

#############################################################################
##
#F  PasechnikGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( PasechnikGraph,
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
    return PasechnikGraphCons(filt, arg[j]);
  else
    Error("usage: PasechnikGraph( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#O  AdditiveSymplecticCoverGraphCons( [<filter>, ]<integer>, <integer>
##                                                            [, <integer>] )
##  
InstallMethod( AdditiveSymplecticCoverGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt, IsInt, IsInt], 0,
function(filter, q, n, h)
  local F, G, m;
  F := GF(q);
  if h = 0 then
    return AdditiveSymplecticCoverGraphCons(IsVectorGraph, q, n, h);
  elif h = Dimension(F) then
    m := 2*n;
    G := CompleteGraph(SymmetricGroup(q^m));
    AssignVertexNames(G, Cartesian([F], F^m));
    return G;
  else
    TryNextMethod();
  fi;
end );

InstallMethod( AdditiveSymplecticCoverGraphCons, "as a vector graph", true,
     [IsVectorGraph, IsInt, IsInt, IsInt], 0,
function(filter, q, n, h)
  local B, F, G, K, M, X, m, r, dp;
  F := GF(q);
  m := 2*n;
  G := Sp(m, q);
  B := InvariantBilinearForm(G).matrix;
  if h = 0 then
    r := q;
    K := [0*Z(q)];
    M := Group(Z(q));
    X := FieldExponentiationPermutationGroup(q);
  elif Dimension(F) mod h = 0 then
    r := Characteristic(F)^h;
    K := GF(r);
    M := Group(Z(r));
    X := FieldExponentiationPermutationGroup(q);
  else
    r := q;
    K := Subspace(F, BasisVectors(Basis(F)){[1..h]}, "basis");
    M := Group(Z(q)^0);
    X := Group(());
  fi;
  dp := DirectProduct(Concatenation([G, M, M, X],
        ListWithIdenticalEntries(m+1, FieldAdditionPermutationGroup(q))));
  return Graph(dp, Cartesian(Unique(List(F, x -> x+K)), F^m),
            OnAdditiveSymplecticCover(q, m, B, K, dp),
            function(x, y)
              return x <> y and x[2]*B*y[2]+y[1]-Representative(x[1]) = K;
            end, true);
end );

InstallMethod( AdditiveSymplecticCoverGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt, IsInt], 0,
function(filter, q, n, h)
  return AdditiveSymplecticCoverGraphCons(IsVectorGraph and
                                              FullAutomorphismGroup,
                                           q, n, h);
end );

InstallMethod( AdditiveSymplecticCoverGraphCons, "default", true,
     [IsObject, IsInt, IsInt, IsInt], 0,
function(filter, q, n, h)
  return AdditiveSymplecticCoverGraphCons(IsVectorGraph, q, n, h);
end );

#############################################################################
##
#O  AdditiveSymplecticCoverGraphCons( [<filter>, ]<graph>[, <integer>] )
##  
InstallOtherMethod( AdditiveSymplecticCoverGraphCons,
     "as a code graph for quotients given a graph", true,
     [IsVectorGraph, IsRecord, IsInt], 0,
function(filter, G, h)
  local p, t, A, F, H, K, T, V;
  if not IsGraph(G) then
    TryNextMethod();
  fi;
  p := Characteristic(GF(G.order));
  t := LogInt(G.order*Size(G.names[1][1]), p)/(Size(G.names[1][2])+1);
  F := GF(p^t);
  if IsList(G.names[1][1]) then
    if t mod h = 0 then
      K := GF(p^h);
    else
      K := Subspace(F, Elements(Basis(F)){[1..h]}, "basis");
    fi;
    V := List(G.names, x -> [x[1][1]+K, x[2]]);
  else
    A := AdditivelyActingDomain(G.names[1][1]);
    K := A + Subspace(F,
                        Elements(Basis(OrthogonalSpaceInFullRowSpace(A,
                                                              F))){[1..h]},
                                "basis");
    V := List(G.names, x -> [Representative(x[1])+K, x[2]]);
  fi;
  T := Set(List(V, x -> Positions(V, x)));
  H := Graph(Stabilizer(G.group, T, OnSetsSets), T, OnSets, function(x,y)
                         return IsSubset(DistanceSet(G, 1, x), y);
                       end, true);
  AssignVertexNames(H, List(T, x -> V[x[1]]));
  return H;
end );

InstallOtherMethod( AdditiveSymplecticCoverGraphCons,
    "for quotients given a graph", true, [IsObject, IsRecord, IsInt], 0,
function(filter, G, h)
  return AdditiveSymplecticCoverGraphCons(IsVectorGraph, G, h);
end );

#############################################################################
##
#F  AdditiveSymplecticCoverGraph( [<filter>, ]<integer>, <integer>
##                                                            [, <integer>] )
#F  AdditiveSymplecticCoverGraph( [<filter>, ]<graph>[, <integer>] )
##  
InstallGlobalFunction( AdditiveSymplecticCoverGraph,
function(arg)
  local j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j+2 then
    return AdditiveSymplecticCoverGraphCons(filt, arg[j], arg[j+1],
                                            arg[j+2]);
  elif IsGraph(arg[j]) then
    if Length(arg) = j then
      return AdditiveSymplecticCoverGraphCons(filt, arg[j], 1);
    elif Length(arg) = j+1 then
      return AdditiveSymplecticCoverGraphCons(filt, arg[j], arg[j+1]);
    fi;
  else
    if Length(arg) = j then
      return AdditiveSymplecticCoverGraphCons(filt, arg[j], 1, 0);
    elif Length(arg) = j+1 then
      return AdditiveSymplecticCoverGraphCons(filt, arg[j], arg[j+1], 0);
    fi;
  fi;
  Error("usage: AdditiveSymplecticCoverGraph( [<filter>, ]{<int>, <int>[, <int>] |<graph>, <int> })");
end );

#############################################################################
##
#O  MultiplicativeSymplecticCoverGraphCons( [<filter>, ]<integer>, <integer> )
##  
InstallMethod( MultiplicativeSymplecticCoverGraphCons,
     "as a vector graph with full automorphism group", true,
     [IsVectorGraph and FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, q, m)
  local G;
  if m = q-1 then
    G := CompleteGraph(SymmetricGroup(q+1));
    AssignVertexNames(G, List(Subspaces(GF(q)^2, 1),
                          s -> Set(Filtered(s, v -> not IsZero(v)))));
    return G;
  else
    return MultiplicativeSymplecticCoverGraphCons(IsVectorGraph, q, m);
  fi;
end );

InstallMethod( MultiplicativeSymplecticCoverGraphCons, "as a vector graph",
     true, [IsVectorGraph, IsInt, IsInt], 0,
function(filter, q, m)
  local B, F, G, K, N, dp;
  F := GF(q);
  K := Group(Z(q)^((q-1)/m));
  G := Sp(2, q);
  B := InvariantBilinearForm(G).matrix;
  if q mod 2 = 0 or m mod 2 = 0 then
    N := Group((1,2));
  else
    N := Group(());
  fi;
  dp := DirectProduct(G, N, K, FieldExponentiationPermutationGroup(q));
  return Graph(dp, Unique(List(Filtered(F^2, x -> x <> Zero(F^2)),
                          v -> Set(List(K, g -> List(v, x -> g*x))))),
               OnMultiplicativeSymplecticCover(q, dp), function(x, y)
                  return x <> y and x[1]*B*y[1] in K;
                end, true);
end );

InstallMethod( MultiplicativeSymplecticCoverGraphCons,
     "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, q, m)
  return MultiplicativeSymplecticCoverGraphCons(IsVectorGraph and
                                                FullAutomorphismGroup,
                                                q, m);
end );

InstallMethod( MultiplicativeSymplecticCoverGraphCons, "as a vector graph",
     true, [IsObject, IsInt, IsInt], 0,
function(filter, q, m)
  return MultiplicativeSymplecticCoverGraphCons(IsVectorGraph, q, m);
end );

#############################################################################
##
#F  MultiplicativeSymplecticCoverGraph( [<filter>, ]<integer>, <integer> )
##  
InstallGlobalFunction( MultiplicativeSymplecticCoverGraph,
function(arg)
  local j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j+1 then
    return MultiplicativeSymplecticCoverGraphCons(filt, arg[j], arg[j+1]);
  else
    Error("usage: MultiplicativeSymplecticCoverGraph( [<filter>, ]<int>, <int> )");
  fi;
end );

#############################################################################
##
#F  AffinePolarGraphVO( [<integer>, ]<integer>, <integer> )
##  
InstallGlobalFunction( AffinePolarGraphVO,
function(arg)
  local d, e, q, B, G, Q, V, dp;
  if Length(arg) < 2 then
    Error("at least two arguments expected");
    return fail;
  elif Length(arg) = 2 then
    e := 0;
    d := arg[1];
    q := arg[2];
  else
    e := arg[1];
    d := arg[2];
    q := arg[3];
  fi;
  G := GO(e, d, q);
  dp := DirectProduct(Concatenation([G, Group(Z(q))],
           ListWithIdenticalEntries(d, FieldAdditionPermutationGroup(q))));
  Q := InvariantQuadraticForm(G).matrix;
  return Graph(dp, Elements(GF(q)^d), OnAffine(q, d, dp), function(x, y)
                  return x <> y and IsZero((x-y)*Q*(x-y));
              end, true);
end );

#############################################################################
##
#F  AffinePolarGraphVNO( [<integer>, ]<integer>, <integer> )
##  
InstallGlobalFunction( AffinePolarGraphVNO,
function(arg)
  local d, e, q, B, G, H, Q, V, dp;
  if Length(arg) < 2 then
    Error("at least two arguments expected");
    return fail;
  elif Length(arg) = 2 then
    e := 0;
    d := arg[1];
    q := arg[2];
  else
    e := arg[1];
    d := arg[2];
    q := arg[3];
  fi;
  G := GO(e, d, q);
  dp := DirectProduct(Concatenation([G, Group(Z(q))],
            ListWithIdenticalEntries(d, FieldAdditionPermutationGroup(q))));  
  Q := InvariantQuadraticForm(G).matrix;
  return Graph(dp, Elements(GF(q)^d), OnAffine(q, d, dp),
              function(x, y)
                  return x <> y and IsOne(((x-y)*Q*(x-y))^((q-1)/2));
              end, true);
end );

#############################################################################
##
#E
