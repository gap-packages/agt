#############################################################################
##
#W  srglib.gi           Algebraic Graph Theory package             Rhys Evans
##
##
##  TODO This file contains the routines for the strongly regular graphs library
##

######################
## GLOBAL FUNCTIONS ##
######################
##---------------------------------------------------------------------------------------------

#############################################################################
##
#F  IsSRGAvailable( <parms> )
##
InstallGlobalFunction( IsSRGAvailable, 
function( parms )
  local fn;
  
  if not IsFeasibleSRGParameters(parms) then
    return fail;
  fi;
  
  fn := AGT_SRGFilename(parms);  

  return IsReadableFile(fn);
end );

#############################################################################
##
#F  SRG( <parms> , <n> )
##  
InstallGlobalFunction( SRG, 
function( parms, n )
  local fn;
  
  if not IsFeasibleSRGParameters(parms) then
    return fail;
  fi;

  if not IsSRGAvailable(parms) then
    return false;
  fi;
  
  fn := AGT_SRGFilename(parms);  

  return Graph(ReadDigraphs(fn,n));
end );

#############################################################################
##
#F  NrSRGs( <parms> )
##  
InstallGlobalFunction( NrSRGs, 
function( parms )
  local pos;
  
  if not IsFeasibleSRGParameters(parms) then
    return fail;
  fi;
 
  if not IsSRGAvailable(parms) then
    return false;
  fi;

  pos:=Position(AGT_Brouwer_Parameters{[1..Length(AGT_Brouwer_Parameters)]}[1],
                parms);

   
  return AGT_Brouwer_Parameters[pos][3];
end );

#############################################################################
##
#F  OneSRG( <parms> )
##  
InstallGlobalFunction( OneSRG, 
function( parms )
  return SRG(parms,1);
end );

#############################################################################
##
#F  AllSRGs( <parms> )
##  
InstallGlobalFunction( AllSRGs, 
function( parms )
  local fn;
  
  if not IsFeasibleSRGParameters(parms) then
    return fail;
  fi;

  if not IsSRGAvailable(parms) then
    return false;
  fi;
  
  fn := AGT_SRGFilename(parms);  

  return List(ReadDigraphs(fn),Graph);
end );

#############################################################################
##
#F  SRGIterator( <parms> )
##  
InstallGlobalFunction( SRGIterator, 
function( parms )
  local filename, decoder, file, record, arg;
  
  filename := AGT_SRGFilename(parms);

  file := DigraphFile(filename, "r");

  if file = fail then
    return fail;
  fi;

  record := rec(file := file, current := Graph(file!.coder(file)));

  record.NextIterator := function(iter)
    local next;
    next := iter!.current;
    iter!.current := iter!.file!.coder(iter!.file); 
    if iter!.current <> IO_Nothing then
      iter!.current:=Graph(iter!.current);
    fi; 
    return next;
  end;

  record.IsDoneIterator := function(iter)
    if iter!.current = IO_Nothing then
      if not iter!.file!.closed then
        IO_Close(iter!.file);
      fi;
      return true;
    else
      return false;
    fi;
  end;

  record.ShallowCopy := function(iter)
    local file;
    file := DigraphFile(UserHomeExpand(filename), decoder, "r");
    return rec(file := file, current := Graph(file!.coder(file)));
  end;

  return IteratorByFunctions(record);
end );

#############################################################################
##
#F  SmallFeasibleSRGParameterTuples( v )
##  
InstallGlobalFunction( SmallFeasibleSRGParameterTuples, 
function( v )
  local parml;

  parml:=Filtered(AGT_Brouwer_Parameters,x->(x[1][1]<=v and x[2]<3));
  parml:=parml{[1..Length(parml)]}[1];

  return parml;
  
end );

#############################################################################
##
#F  IsEnumeratedSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsEnumeratedSRGParameterTuple, 
function( parms )
  local pos;

  if not IsFeasibleSRGParameters(parms) or parms[1]>1300 then
    return fail;
  fi;

  if not IsPrimitiveSRGParameters(parms) then
    return true;
  fi;
  
  pos := PositionProperty(AGT_Brouwer_Parameters,x->x[1]=parms);  

  return (AGT_Brouwer_Parameters[pos][2]=0);

end );

#############################################################################
##
#F  IsKnownSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsKnownSRGParameterTuple, 
function( parms )
  local pos;

  if not IsFeasibleSRGParameters(parms) or parms[1]>1300 then
    return fail;
  fi;

  if not IsPrimitiveSRGParameters(parms) then
    return true;
  fi;
  
  pos := PositionProperty(AGT_Brouwer_Parameters,x->x[1]=parms);  

  return (AGT_Brouwer_Parameters[pos][2]<2);

end );

#############################################################################
##
#F  DisjointUnionOfCliques( <n1> , <n2>, ... )
##  
InstallGlobalFunction( DisjointUnionOfCliques, 
function( arg... )
    local   sum, Grs, Grp,  i, fedg, gamma;

    sum := 0;
    Grs := [];
    fedg := [];

    for i in arg do
      sum := sum + i;
      if i>1 then
        Add(fedg,[sum-i+1,sum-i+2]);
        Add(Grs,SymmetricGroup([sum-i+1..sum]));
      fi;
    od;      

    Grp:=DirectProduct(Grs);
    gamma:=EdgeOrbitsGraph(Grp,fedg,sum);

    return UnderlyingGraph(gamma);
end );

#############################################################################
##
#F  CompleteMultipartiteGraph( <n1> , <n2> , ... )
##  
InstallGlobalFunction( CompleteMultipartiteGraph, 
function( arg... )
    local   sum, Grs, Grp,  i, fvtx, comb, gamma;

    sum := 0;
    Grs := [];
    fvtx := [];

    for i in arg do
      sum := sum + i;
      Add(fvtx,sum-i+1);
      Add(Grs,SymmetricGroup([sum-i+1..sum]));
    od;      

    comb:=Combinations(fvtx,2);
    Grp:=DirectProduct(Grs);
    gamma:=EdgeOrbitsGraph(Grp,comb,sum);

    return UnderlyingGraph(gamma);
end );

#############################################################################
##
#F  TriangularGraph( <n> )
##  
InstallGlobalFunction( TriangularGraph, 
function( n )
    return JohnsonGraph(n,2);
end );

#############################################################################
##
#F  SquareLatticeGraph( <n> )
##  
InstallGlobalFunction( SquareLatticeGraph, 
function( n )   
    return HammingGraph(2,n);
end );

#############################################################################
##
#F  HoffmanSingletonGraph(  )
##  
InstallGlobalFunction( HoffmanSingletonGraph, 
function(  )
  local G, cyrng, cyflip, permlist, edgelist, gamma, i,j,h,hi,hij;

  permlist := [];
  edgelist:=[];

  # Create initial groups to add multiple edges as orbit members
  for i in [0..9] do
    cyrng := (5*i+1,5*i+2,5*i+3,5*i+4,5*i+5);
    Add(permlist,cyrng);
  od;

  # Add edge. We have 5 5-cycles and then 5 pentagrams
  for i in [0..4] do
    Append(edgelist,[[5*i+1,5*i+2],[5*i+2,5*i+1]]);
    Append(edgelist,[25+[5*i+1,5*i+3],25+[5*i+3,5*i+1]]);
  od;

  G := Group(permlist);
  gamma := EdgeOrbitsGraph(G,edgelist,50);

  # Get rid of the group as it may not consist of automorphisms of 
  # the complete graph
  gamma := NewGroupGraph(Group(()),gamma);
  

  # Adding edges as described by Brouwer
  for h in [1..5] do
    for i in [1..5] do 
      hi := h*i;
      for j in [1..5] do
        hij := ((hi+j) mod 5)+1 ;
        AddEdgeOrbit(gamma,[5*(h-1)+j,20+5*i+hij]);
        AddEdgeOrbit(gamma,[20+5*i+hij,5*(h-1)+j]);
      od;
    od;
  od;  

  # Store the Automorphism group
  AutGroupGraph(gamma);

  return gamma;

end );

#############################################################################
##
#F  HigmanSimsGraph(  )
##  
InstallGlobalFunction( HigmanSimsGraph, 
function(  )
  local gamma, cocliqs;

  gamma := HoffmanSingletonGraph();
  gamma := ComplementGraph(gamma);

  cocliqs := CompleteSubgraphsOfGivenSize(gamma,15,2,false);

  return Graph(Group(()),cocliqs,OnSets,
               function(x,y) return Length(Intersection(x,y)) in [0,8]; end);

end );

#############################################################################
##
#F  SimsGerwitzGraph(  )
##  
InstallGlobalFunction( SimsGerwitzGraph, 
function(  )
  local gamma;
  gamma := HigmanSimsGraph();

  return DistanceSetInduced(gamma,[2],[1,2]);
end );

#############################################################################
##
#E
