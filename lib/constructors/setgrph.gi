#############################################################################
##
#W  setgrph.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct set graphs.
##  
##

#############################################################################
##
#O  KneserGraphCons( [<filter>, ]<integer> <integer>[, <bool>] )
##  
InstallMethod( KneserGraphCons, "as a set graph with full automorphism group",
     true, [IsSetGraph and FullAutomorphismGroup, IsInt, IsInt, IsBool], 0,
function(filter, n, k, invt)
  local G, vcs;
  if n < 2*k then
    invt := true;
  fi;
  if n = 2*k then
    vcs := List(Combinations([2..n], k),
                s -> [Difference([1..n], s), s]);
    G := ComplementGraph(CocktailPartyGraph(Length(vcs)));
    AssignVertexNames(G, List(G.names, t -> vcs[t[1]][t[2]]));
  else
    if invt then
      vcs := Combinations([1..n], k);
    else
      vcs := [[1..k]];
    fi;
    if n < 2*k then
      G := NullGraph(SymmetricGroup(Length(vcs)), Length(vcs));
      AssignVertexNames(G, vcs);
    else
      G := Graph(SymmetricGroup(n), vcs, OnSets, DisjointSets, invt);
    fi;
  fi;
  return G;
end );

InstallMethod( KneserGraphCons, "as a set graph", true,
     [IsSetGraph, IsInt, IsInt, IsBool], 0,
function(filter, n, k, invt)
  return KneserGraphCons(IsSetGraph and FullAutomorphismGroup,
                         n, k, invt);
end );

InstallMethod( KneserGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt, IsBool], 0,
function(filter, n, k, invt)
  return KneserGraphCons(IsSetGraph and FullAutomorphismGroup,
                         n, k, invt);
end );

InstallMethod( KneserGraphCons, "default", true,
     [IsObject, IsInt, IsInt, IsBool], 0,
function(filter, n, k, invt)
  return KneserGraphCons(IsSetGraph, n, k, invt);
end );

#############################################################################
##
#F  KneserGraph( [<filter>, ]<integer> <integer>[, <bool>] )
##  
InstallGlobalFunction( KneserGraph2,
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
    return KneserGraphCons(filt, arg[j], arg[j+1], true);
  elif Length(arg) = j+2 then
    return KneserGraphCons(filt, arg[j], arg[j+1], arg[j+2]);
  else
    Error("usage: KneserGraph( [<filter>, ]<int>, <int>[, <bool>] )");
  fi;
end );

#############################################################################
##
#F  OddGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( OddGraph2,
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
    return KneserGraphCons(filt, 2*arg[j]+1, arg[j], false);
  else
    Error("usage: OddGraph2( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#O  DoubledOddGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( DoubledOddGraphCons,
     "as a set graph with full automorphism group", true,
     [IsSetGraph and FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  local n, dp;
  n := 2*d+1;
  dp := DirectProduct(SymmetricGroup(n), SymmetricGroup(2));
  return Graph(dp, Union(Combinations([1..n], d),
                         Combinations([1..n], d+1)),
                  OnDoubledOdd(n, dp), SymmetrizedInclusion, true);
end );

InstallMethod( DoubledOddGraphCons, "as a set graph", true,
     [IsSetGraph, IsInt], 0,
function(filter, d)
  return DoubledOddGraphCons(IsSetGraph and FullAutomorphismGroup, d);
end );

InstallMethod( DoubledOddGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  return DoubledOddGraphCons(IsSetGraph and FullAutomorphismGroup, d);
end );

InstallMethod( DoubledOddGraphCons, "default", true,
     [IsObject, IsInt], 0,
function(filter, d)
  return DoubledOddGraphCons(IsSetGraph, d);
end );

#############################################################################
##
#F  DoubledOddGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( DoubledOddGraph,
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
    return DoubledOddGraphCons(filt, arg[j]);
  else
    Error("usage: DoubledOddGraph( [<filter>, ]<int> )");
  fi;
end );

# The Johnson graph on d-subsets of a set with n elements.
InstallMethod( JohnsonGraphCons, "as a set graph with full automorphism group",
     true, [IsSetGraph and FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, n, d)
  local dp;
  if n = 2*d then
    dp := DirectProduct(SymmetricGroup(n), Group((1,2)));
    return Graph(dp, Combinations([1..n], d), OnJohnson(n, dp),
                 SetIntersection(d-1), true);
  else
    return JohnsonGraphCons(IsSetGraph, n, d);
  fi;
end );

InstallMethod( JohnsonGraphCons, "as a set graph", true,
     [IsSetGraph, IsInt, IsInt], 0,
function(filter, n, d)
  return JohnsonGraph(n, d);
end );

InstallMethod( JohnsonGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt, IsInt], 0,
function(filter, n, d)
  return JohnsonGraphCons(IsSetGraph and FullAutomorphismGroup, n, d);
end );

InstallMethod( JohnsonGraphCons, "default", true,
     [IsObject, IsInt, IsInt], 0,
function(filter, n, d)
  return JohnsonGraphCons(IsSetGraph, n, d);
end );

#############################################################################
##
#F  TriangularGraph( <int> )
##  
InstallGlobalFunction( TriangularGraph, 
function( n )
  if not (IsPosInt(n) and n>2) then
    Error("usage: TriangularGraph(<n>), where \n\
          <n> is a positive integer of size at least 2.");
  fi;

  return JohnsonGraphCons(IsSetGraph and FullAutomorphismGroup,n,2);
end );

#############################################################################
##
#O  FoldedJohnsonGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( FoldedJohnsonGraphCons,
     "as a set graph with full automorphism group", true,
     [IsSetGraph and FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  local G;
  if d = 3 then
    G := CompleteGraph(SymmetricGroup(10));
    AssignVertexNames(G, List(Combinations([2..6], 3),
                              s -> [Difference([1..6], s), s]));
    return G;
  else
    return FoldedJohnsonGraphCons(IsSetGraph, d);
  fi;
end );

InstallMethod( FoldedJohnsonGraphCons, "as a set graph", true,
     [IsSetGraph, IsInt], 0,
function(filter, d)
  return AntipodalQuotientGraph(JohnsonGraphCons(IsSetGraph, 2*d, d));
end );

InstallMethod( FoldedJohnsonGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt], 0,
function(filter, d)
  return FoldedJohnsonGraphCons(IsSetGraph and FullAutomorphismGroup, d);
end );

InstallMethod(FoldedJohnsonGraphCons, "default", true,
     [IsObject, IsInt], 0,
function(filter, d)
  return FoldedJohnsonGraphCons(IsSetGraph, d);
end );

#############################################################################
##
#F  FoldedJohnsonGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( FoldedJohnsonGraph,
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
    return FoldedJohnsonGraphCons(filt, arg[j]);
  else
    Error("usage: FoldedJohnsonGraph( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#O  ChangGraphCons( [<filter>, ]<integer> )
##  
InstallMethod( ChangGraphCons,
     "as a set graph with full automorphism group", true,
     [IsSetGraph and FullAutomorphismGroup, IsInt], 0,
function(filter, j)
  local J, dp;
  J := JohnsonGraphCons(IsSetGraph, 8, 2);
  dp := DirectProduct(Stabilizer(SymmetricGroup(8),
                               ChangGraphSwitchingSet[j], OnSetsSets),
                      Group(ChangGraphInvolution[j]));
  return SwitchedGraph(J, List(ChangGraphSwitchingSet[j],
                                  x -> Position(J.names, x)),
                          Action(dp, J.names, OnChang(dp)));
end );

InstallMethod( ChangGraphCons, "as a set graph", true,
     [IsSetGraph, IsInt], 0,
function(filter, j)
  local J, S;
  J := JohnsonGraphCons(IsSetGraph, 8, 2);
  S := List(ChangGraphSwitchingSet[j], x -> Position(J.names, x));
  return SwitchedGraph(J, S, Stabilizer(J.group, S, OnSets));
end );

InstallMethod( ChangGraphCons, "with full automorphism group", true,
     [FullAutomorphismGroup, IsInt], 0,
function(filter, j)
  return ChangGraphCons(IsSetGraph and FullAutomorphismGroup, j);
end );

InstallMethod( ChangGraphCons, "default", true,
     [IsObject, IsInt], 0,
function(filter, j)
  return ChangGraphCons(IsSetGraph, j);
end );

#############################################################################
##
#F  ChangGraph( [<filter>, ]<integer> )
##  
InstallGlobalFunction( ChangGraph,
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
    return ChangGraphCons(filt, arg[j]);
  else
    Error("usage: ChangGraph( [<filter>, ]<int> )");
  fi;
end );

#############################################################################
##
#E
