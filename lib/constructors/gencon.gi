#############################################################################
##
#W  gencon.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct general graphs.
##  
##

#############################################################################
##
#F  AdjFunGraph( <vertices>, <function> )
##  
InstallGlobalFunction( AdjFunGraph,
function(V, F)
  return Graph(Group(()), V, function(x, g) return x; end, F, true);
end);

#############################################################################
##
#O  ProductGraphCons( [<filter>, ]<graphs>, <function> )
##  
InstallMethod( ProductGraphCons, "without names", true,
               [NoVertexNames, IsList, IsFunction], 0,
function(filter, Gs, F)
  local dp;
  if not ForAll(Gs, IsGraph) then
    TryNextMethod();
  fi;
  if Length(Gs) = 0 then
    return AdjFunGraph([[]], ReturnFalse);
  fi;
  dp := DirectProduct(List(Gs, H -> H.group));
  return Graph(dp, Cartesian(List(Gs, H -> [1..H.order])),
      OnProduct(Length(Gs), dp), F, true);
end );

InstallMethod( ProductGraphCons, "with names", true,
     [IsObject, IsList, IsFunction], 0,
function(filter, Gs, F)
  local G, GG;
  G := ProductGraphCons(NoVertexNames, Gs, F);
  for GG in Gs do
    if not "names" in RecNames(GG) then
      GG.names := [1..GG.order];
    fi;
  od;
  AssignVertexNames(G, List(G.names,
  f -> List([1..Length(f)], i -> Gs[i].names[f[i]])));
  return G;
end );

#############################################################################
##
#F  ProductGraph( [<filter>, ]<graphs>, <function> )
##  
InstallGlobalFunction( ProductGraph,
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
    return ProductGraphCons(filt, arg[j], arg[j+1]);
  else
    Error("usage: ProductGraph( [<filter>, ]<graphs>, <func> )");
  fi;
end );

#############################################################################
##
#O  PowerGraphCons( [<filter>, ]<graph>, <integer>, <function> )
##  
InstallMethod( PowerGraphCons, "without names", true,
    [NoVertexNames, IsRecord, IsInt, IsFunction], 0,
function(filter, G, n, F)
  local wp;
  if not IsGraph(G) then
    TryNextMethod();
  fi;
  if n = 0 then
    return AdjFunGraph([[]], ReturnFalse);
  fi;
  wp := WreathProduct(G.group, SymmetricGroup(n));
  return Graph(wp, Tuples([1..G.order], n),
               OnWreathProduct(n, G.order, wp), F, true);
end );

InstallMethod( PowerGraphCons, "with names", true,
    [IsObject, IsRecord, IsInt, IsFunction], 0,
function(filter, G, n, F)
  local H;
  H := PowerGraphCons(NoVertexNames, G, n, F);
  if not "names" in RecNames(G) then
    G.names := [1..G.order];
  fi;
  AssignVertexNames(H, List(H.names, f -> G.names{f}));
  return H;
end );

#############################################################################
##
#F  PowerGraph( [<filter>, ]<graph>, <integer>, <function> )
##  
InstallGlobalFunction( PowerGraph,
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
    return PowerGraphCons(filt, arg[j], arg[j+1], arg[j+2]);
  else
    Error("usage: PowerGraph( [<filter>, ]<graph>, <int>, <func> )");
  fi;
end );

#############################################################################
##
#F  BoxProductGraph( [<filter>, ]<graphs> )
##  
InstallGlobalFunction( BoxProductGraph,
function(arg)
  local Gs, j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    Gs := arg[j];
  else
    Gs := arg{[j..Length(arg)]};
  fi;
  return ProductGraph(filt, Gs, function(x, y)
        local l;
        l := List([1..Length(Gs)], i -> Distance(Gs[i], x[i], y[i]));
        return (WeightVecFFE(l) = 1) and (1 in l);
    end);
end );

#############################################################################
##
#F  BoxPowerGraph( [<filter>, ]<graph>, <integer> )
##  
InstallGlobalFunction( BoxPowerGraph,
function(arg)
  local G, j, n, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j+1 then
    G := arg[j];
    n := arg[j+1];
    return PowerGraphCons(filt, G, n, function(x, y)
         local l;
         l := List([1..n], i -> Distance(G, x[i], y[i]));
         return WeightVecFFE(l) = 1 and 1 in l;
        end);
  else
    Error("usage: BoxPowerGraph( [<filter>, ]<graph>, <int> )");
  fi;
end );

#############################################################################
##
#F  CrossProductGraph( [<filter>, ]<graphs> )
##  
InstallGlobalFunction( CrossProductGraph,
function(arg)
  local Gs, j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    Gs := arg[j];
  else
    Gs := arg{[j..Length(arg)]};
  fi;
  return ProductGraph(filt, Gs, function(x, y)
      return ForAll([1..Length(Gs)],
                      i -> IsVertexPairEdge(Gs[i], x[i], y[i]));
    end);
end );

#############################################################################
##
#F  CrossPowerGraph( [<filter, ]<graph>, <integer> )
##  
InstallGlobalFunction( CrossPowerGraph,
function(arg)
  local G, Gs, j, n, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j+1 then
    G := arg[j];
    n := arg[j+1];
    return PowerGraphCons(filt, G, n, function(x, y)
        return ForAll([1..n], i -> IsVertexPairEdge(G, x[i], y[i]));
    end);
  else
    Error("usage: CrossPowerGraph( [<filter>, ]<graph>, <int> )");
  fi;
end );

#############################################################################
##
#F  StrongProductGraph( [<filter>, ]<graphs> )
##  
InstallGlobalFunction( StrongProductGraph,
function(arg)
  local Gs, j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    Gs := arg[j];
  else
    Gs := arg{[j..Length(arg)]};
  fi;
  return ProductGraph(filt, Gs, function(x, y)
      return Maximum(List([1..Length(Gs)],
                          i -> Distance(Gs[i], x[i], y[i]))) = 1;
  end);
end );

#############################################################################
##
#F  StrongPowerGraph( [<filter, ]<graph>, <integer> )
##  
InstallGlobalFunction( StrongPowerGraph,
function(arg)
  local G, Gs, j, n, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j+1 then
    G := arg[j];
    n := arg[j+1];
    return PowerGraphCons(filt, G, n, function(x, y)
          return Maximum(List([1..n], i -> Distance(G, x[i], y[i]))) = 1;
      end);
  else
    Error("usage: StrongPowerGraph( [<filter>, ]<graph>, <int> )");
  fi;
end );

#############################################################################
##
#O  GraphJoinCons( [<filter>, ]<graphs> )
##  
InstallMethod( GraphJoinCons, "without names", true,
     [NoVertexNames, IsList], 0,
function(filter, Gs)
  local dp;
  dp := DirectProduct(List(Gs, H -> H.group));
  return Graph(dp, Union(List([1..Length(Gs)],
                               i -> List([1..Gs[i].order], j -> [i, j]))),
               OnSum(dp), GraphJoinAdjacency(Gs), true);
end );

InstallMethod( GraphJoinCons, "with names", true,
     [IsObject, IsList], 0,
function(filter, Gs)
  local G, GG;
  G := GraphJoinCons(NoVertexNames, Gs);
  for GG in Gs do
    if not "names" in RecNames(GG) then
      GG.names := [1..GG.order];
    fi;
  od;
  AssignVertexNames(G, List(G.names, f -> [f[1], Gs[f[1]].names[f[2]]]));
  return G;
end );

#############################################################################
##
#F  GraphJoin( [<filter>, ]<graphs> )
##  
InstallGlobalFunction( GraphJoin,
function(arg)
  local Gs, j, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  if Length(arg) = j then
    Gs := arg[j];
  else
    Gs := arg{[j..Length(arg)]};
  fi;
  return GraphJoinCons(filt, Gs);
end );

#############################################################################
##
#F  BipartiteDoubleGraph( <graph> )
##  
InstallGlobalFunction( BipartiteDoubleGraph,
function(G)
  local H;
  H := BipartiteDouble(G);
  CheckDualityFunctions(G);
  H.halfDuality := BipartiteDoubleDualityFunction(G.duality);
  H.halfPrimality := BipartiteDoubleDualityFunction(G.primality);
  return H;
end );


#############################################################################
##
#O  ExtendedBipartiteDoubleGraphCons( <graph> )
##  
InstallMethod( ExtendedBipartiteDoubleGraphCons, "without names", true,
     [NoVertexNames, IsRecord], 0,
function(filter, G)
  local H, dp, signs;
  if not IsGraph(G) then
    TryNextMethod();
  fi;
  signs := ["+", "-"];
  dp := DirectProduct(G.group, SymmetricGroup(2));
  H := Graph(dp, Cartesian(G.representatives, signs),
       OnSignedPoints(dp, signs), function(x, y)
          return x[2] <> y[2] and Distance(G, x[1], y[1]) <= 1;
      end);
  H.halfDuality := BipartiteDoubleDualityFunction(DefaultDualityFunction);
  H.halfPrimality := BipartiteDoubleDualityFunction(DefaultPrimalityFunction);
  return H;
end );

InstallMethod( ExtendedBipartiteDoubleGraphCons, "with names", true,
     [IsObject, IsRecord], 0,
function(filter, G)
  local H;
  if not IsGraph(G) then
    TryNextMethod();
  fi;
  H := ExtendedBipartiteDoubleGraphCons(NoVertexNames, G);
  if "names" in RecNames(G) then
    AssignVertexNames(H, List(H.names, x -> [G.names[x[1]], x[2]]));
  fi;
  CheckDualityFunctions(G);
  H.halfDuality := BipartiteDoubleDualityFunction(G.duality);
  H.halfPrimality := BipartiteDoubleDualityFunction(G.primality);
  return H;
end );

#############################################################################
##
#F  ExtendedBipartiteDoubleGraph( <graph> )
##  
InstallGlobalFunction( ExtendedBipartiteDoubleGraph,
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
    return ExtendedBipartiteDoubleGraphCons(filt, arg[j]);
  else
    Error("usage: ExtendedBipartiteDoubleGraph( [<filter>, ]<graph> )");
  fi;
end );

#############################################################################
##
#F  HalvedGraph( <graph>[, <integer>] )
##  
InstallGlobalFunction( HalvedGraph,
function(arg)
  local n, G, G2, H, vs;
  if Length(arg) < 1 then
    Error("at least one argument expected");
    return fail;
  fi;
  G := arg[1];
  if Length(arg) > 1 then
    n := arg[2];
  else
    n := 1;
  fi;
  if not IsConnectedGraph(G) then
    Error("not a connected graph");
    return fail;
  fi;
  if not IsBipartite(G) then
    Error("not a bipartite graph");
    return fail;
  fi;
  G2 := DistanceGraph(G, 2);
  vs := ConnectedComponent(G2, 1);
  if n = 2 then
    vs := Difference([1..G.order], vs);
  fi;
  H := InducedSubgraph(G2, vs, Stabilizer(G.group, vs, OnSets));
  if "halfDuality" in RecNames(G) then
    if n = 2 then
      H.primality := G.halfDuality;
    else
      H.duality := G.halfDuality;
    fi;
  fi;
  if "halfPrimality" in RecNames(G) then
    if n = 2 then
      H.duality := G.halfPrimality;
    else
      H.primality := G.halfPrimality;
    fi;
  fi;
  return H;
end );

#############################################################################
##
#O  AntipodalQuotientGraphCons( [<filter>, ]<graph> )
##  
InstallMethod( AntipodalQuotientGraphCons, "without names", true,
     [NoVertexNames, IsRecord], 0,
function(filter, G)
  local d;
  if not IsGraph(G) then
    TryNextMethod();
  fi;
  if not IsAntipodalCover(G) then
    Error("not an antipodal cover");
    return fail;
  fi;
  d := Diameter(G);
  return Graph(G.group,
      Set(List(G.representatives, x -> DistanceSet(G, [0, d], x))),
      OnSets, function(x, y)
        return IsSubset(DistanceSet(G, 1, x), y);
      end);
end );

# The antipodal quotient of an antipodal cover.
InstallMethod( AntipodalQuotientGraphCons, "with names", true,
     [IsObject, IsRecord], 0,
function(filter, G)
  local H;
  if not IsGraph(G) then
    TryNextMethod();
  fi;
  H := AntipodalQuotientGraphCons(NoVertexNames, G);
  if "names" in RecNames(G) then
    AssignVertexNames(H, List(H.names, f -> G.names{f}));
  fi;
  return H;
end );

#############################################################################
##
#F  AntipodalQuotientGraph( [<filter>, ]<graph> )
##  
InstallGlobalFunction( AntipodalQuotientGraph,
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
    return AntipodalQuotientGraphCons(filt, arg[j]);
  else
    Error("usage: AntipodalQuotientGraph( [<filter>, ]<graph> )");
  fi;
end );

#############################################################################
##
#F  SubspaceGraph( <mtrxgrp>, <subspcs>, <vctrspc>, <integer>[, <action>,
##                                                                  <invt>] )
##  
InstallGlobalFunction( SubspaceGraph,
function(arg)
  local A, G, H, S, V, d, invt, vcs;
  if Length(arg) < 4 then
    Error("at least four arguments expected");
    return fail;
  fi;
  G := arg[1];
  S := arg[2];
  V := arg[3];
  d := arg[4];
  A := OnSubspaces(V);
  invt := true;
  if Length(arg) > 5 then
    A := arg[5];
    invt := arg[6];
  elif Length(arg) > 4 then
    if IsFunction(arg[5]) then
      A := arg[5];
    else
      invt := arg[5];
    fi;
  fi;
  if IsList(S) then
    vcs := S;
  else
    vcs := S(Subspaces(V, d));
  fi;
  H := Graph(G, vcs, A, function(x,y)
                  return Dimension(Intersection(x,y)) = d-1;
              end, invt);
  H.duality := Intersection;
  H.primality := Sum;
  return H;
end );

#############################################################################
##
#O  CliqueGraphCons( [<filter>, ]<graph>[, <list>] )
##  
InstallMethod( CliqueGraphCons, "without names", true,
     [NoVertexNames, IsRecord, IsList], 0,
function(filter, G, C)
  local H;
  if not (IsGraph(G) and ForAll(C, IsList)) then
    TryNextMethod();
  fi;
  H := Graph(G.group, C, OnSets,
          function(x, y)
            return Size(Intersection(x,y)) = 1;
          end);
  H.duality := DefaultPrimalityFunction;
  H.primality := DefaultDualityFunction;
  return H;
end );

InstallMethod( CliqueGraphCons, "with names", true,
    [IsObject, IsRecord, IsList], 0,
function(filter, G, C)
  local H;
  if not (IsGraph(G) and ForAll(C, IsList)) then
    TryNextMethod();
  fi;
  H := CliqueGraphCons(NoVertexNames, G, C);
  if "names" in RecNames(G) then
    CheckDualityFunctions(G);
    H.duality := G.primality;
    H.primality := G.duality;
    AssignVertexNames(H, List(H.names, f -> G.duality(G.names{f})));
    if "halfDuality" in RecNames(G) then
      H.halfDuality := G.halfDuality;
    fi;
    if "halfPrimality" in RecNames(G) then
      H.halfPrimality := G.halfPrimality;
    fi;
  fi;
  return H;
end );

#############################################################################
##
#F  CliqueGraph( [<filter>, ]<graph>[, <list>] )
##  
InstallGlobalFunction( CliqueGraph,
function(arg)
  local C, G, H, j, n, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  G := arg[j];
  C := Cliques(G);
  if Length(arg) > j then
    n := arg[j+1];
    if not IsList(n) then
      n := [n];
    fi;
  else
    n := [1..Length(C)];
  fi;
  return CliqueGraphCons(filt, G, C{n});
end );

#############################################################################
##
#O  IncidenceGraphCons( [<filter>, ]<graph>[, <list>] )
##  
InstallMethod( IncidenceGraphCons, "without names", true,
    [NoVertexNames, IsRecord, IsList], 0,
function(filter, G, C)
  local H;
  if not (IsGraph(G) and ForAll(C, IsList)) then
    TryNextMethod();
  fi;
  H := Graph(G.group, Union(G.representatives, C),
          OnPointsOrLines(OnPoints, IsList),
          function(x, y)
            return (IsList(y) and x in y) or (IsList(x) and y in x);
          end);;
  if H.order > 0 and IsList(H.names[1]) then
    H.halfDuality := DefaultPrimalityFunction;
    H.halfPrimality := DefaultDualityFunction;
  else
    H.halfDuality := DefaultDualityFunction;
    H.halfPrimality := DefaultPrimalityFunction;
  fi;
  return H;
end );

InstallMethod( IncidenceGraphCons, "with names", true,
     [IsObject, IsRecord, IsList], 0,
function(filter, G, C)
  local H;
  if not (IsGraph(G) and ForAll(C, IsList)) then
    TryNextMethod();
  fi;
  H := IncidenceGraphCons(NoVertexNames, G, C);
  if "names" in RecNames(G) and G.order > 0 then
    CheckDualityFunctions(G);
    if IsList(H.names[1]) then
      H.halfDuality := G.primality;
      H.halfPrimality := G.duality;
    else
      H.halfDuality := G.duality;
      H.halfPrimality := G.primality;
    fi;
    AssignVertexNames(H, List(H.names, function(f)
                                    if IsList(f) then
                                      return G.duality(G.names{f});
                                    else
                                      return G.names[f];
                                    fi;
                                  end));
  fi;
  return H;
end );

#############################################################################
##
#F  IncidenceGraph( [<filter>, ]<graph>[, <list>] )
##  
InstallGlobalFunction( AGT_IncidenceGraph,
function(arg)
  local C, G, H, j, n, filt;
  if IsAFilter(arg[1]) then
    filt := arg[1];
    j := 2;
  else
    filt := IsObject;
    j := 1;
  fi;
  G := arg[j];
  C := Cliques(G);
  if Length(arg) > j then
    n := arg[j+1];
    if not IsList(n) then
      n := [n];
    fi;
  else
    n := [1..Length(C)];
  fi;
  return IncidenceGraphCons(filt, G, C{n});
end );

#############################################################################
##
#E
