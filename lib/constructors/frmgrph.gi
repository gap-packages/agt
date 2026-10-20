#############################################################################
##
#W  frmgrph.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct forms graphs.
##  
##

#############################################################################
##
#O  BilinearFormsGraphCons( [<filter>, ]<integer>, <integer>, <integer> )
##  
InstallMethod( BilinearFormsGraphCons,
     "as a forms graph with full automorphism group", true,
     [IsFormsGraph and FullAutomorphismGroup, IsInt, IsInt, IsInt], 0,
function(filter, q, d, e)
  local dp, tr;
  if d = e then
    tr := (1, 2);
  else
    tr := ();
  fi;
  dp := DirectProduct(Concatenation([Group(tr), GL(d, q), GL(e, q)],
        ListWithIdenticalEntries(d*e, FieldAdditionPermutationGroup(q))));
  return Graph(dp, Elements(GF(q)^[d,e]), OnMatrices(q, d, e, dp),
               RankAdjacency([1]), true);
end );

InstallMethod( BilinearFormsGraphCons, "as a forms graph", true,
     [IsFormsGraph, IsInt, IsInt, IsInt], 0,
function(filter, q, d, e)
  return BilinearFormsGraphCons(IsFormsGraph and FullAutomorphismGroup,
                                 q, d, e);
end );

InstallMethod( BilinearFormsGraphCons, "with full automorphism group", true,
    [FullAutomorphismGroup, IsInt, IsInt, IsInt], 0,
function(filter, q, d, e)
  return BilinearFormsGraphCons(IsFormsGraph and FullAutomorphismGroup,
                                q, d, e);
end );

InstallMethod( BilinearFormsGraphCons, "default", true,
     [IsObject, IsInt, IsInt, IsInt], 0,
function(filter, q, d, e)
  return BilinearFormsGraphCons(IsFormsGraph, q, d, e);
end );

#############################################################################
##
#F  BilinearFormsGraph( [<filter>, ]<integer>, <integer>, <integer> )
##  
InstallGlobalFunction( BilinearFormsGraph,
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
    return BilinearFormsGraphCons(filt, arg[j], arg[j+1], arg[j+2]);
  else
    Error("usage: BilinearFormsGraph( [<filter>, ]<int>, <int>, <int> )");
  fi;
end );

#############################################################################
##
#O  HermiteanFormsGraphCons( [<filter>, ]<integer>, <integer> )
##  
InstallMethod( HermiteanFormsGraphCons, "as a forms graph", true,
     [IsFormsGraph, IsInt, IsInt], 0,
function(filter, d, r)
  local dp;
  dp := DirectProduct(Concatenation([GL(d, r^2)],
        ListWithIdenticalEntries(d*d, FieldAdditionPermutationGroup(r))));
  return Graph(dp, List(GF(r)^[d, d], x -> ToHermitean(x, r)),
              OnHermiteanMatrices(r, d, dp), RankAdjacency([1]), true);
end );

InstallMethod( HermiteanFormsGraphCons, "default", true,
     [IsObject, IsInt, IsInt], 0,
function(filter, d, r)
  return HermiteanFormsGraphCons(IsFormsGraph, d, r);
end );

#############################################################################
##
#F  HermiteanFormsGraph( [<filter>, ]<integer>, <integer> )
##  
InstallGlobalFunction( HermiteanFormsGraph,
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
    return HermiteanFormsGraphCons(filt, arg[j], arg[j+1]);
  else
    Error("usage: HermiteanFormsGraph( [<filter>, ]<int>, <int> )");
  fi;
end );

#############################################################################
##
#E
