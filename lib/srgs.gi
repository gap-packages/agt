#############################################################################
##
#W  srgs.gd           Strongly Regular graph library               Rhys Evans
##
##
##  This file contains the routines for the strongly regular graphs library
##

#############################################################################
##
#F  EdgeRegularGraphParameters( <gamma> )
##  
InstallGlobalFunction( EdgeRegularGraphParameters,
function(gamma)
  local orbs,orbnum,reps,next,x,y,vtxset,adjx,adjy,v,k,lambda;
  
  if not IsGraph(gamma) then 
    Error("usage: EdgeRegularGraphParameters( <Graph> )");
  fi;

  v:=gamma.order;
  if v=0 then
    return [];
  fi;

  if not IsSimpleGraph(gamma) then
    Error("<gamma> not a simple graph");
  fi;

  if not IsRegularGraph(gamma) then
    return false;
  fi;  

  if IsBound(gamma.autGroup) then
    orbs:=GRAPE_OrbitNumbers(gamma.autGroup,v);
  else
    orbs:=GRAPE_OrbitNumbers(gamma.group,v);
  fi;

  vtxset := [1..v];
  orbnum:=orbs.orbitNumbers;
  reps:=orbs.representatives;

  adjx := Adjacency(gamma,reps[1]);
  k:=Length(adjx);

  adjy := Adjacency(gamma,adjx[1]);
  lambda := Length(Intersection(adjx,adjy));

  for x in [1..Length(reps)] do
    adjx := Adjacency(gamma,reps[x]);
    
    for y in Intersection(adjx,vtxset) do
      adjy := Adjacency(gamma,y);

      if not Length(Intersection(adjx,adjy)) = lambda then
        return false;
      fi;
    od;
  od;

  return [v,k,lambda];
end );

#############################################################################
##
#F  IsEdgeRegularGraph( <gamma> )
##  
InstallGlobalFunction( IsEdgeRegularGraph,
function(gamma)
  if not EdgeRegularGraphParameters(gamma)=false then
    return true;
  fi;
  return false;
end );

#############################################################################
##
#F  StronglyRegularGraphParameters( <gamma> )
##  
InstallGlobalFunction( StronglyRegularGraphParameters,
function(gamma)
local orbs,orbnum,reps,next,i,x,y,z,vtxset,adjx,adjy,adjz,notadjx, v,k,lambda,mu;

  v:=gamma.order;
  if not IsGraph(gamma) then 
    Error("usage: StronglyRegularGraphParameters( <Graph> )");
  fi;

  if gamma.order=0 then
    return [];
  fi;

  if not IsSimpleGraph(gamma) then
    Error("<gamma> not a simple graph");
  fi;

  if not IsRegularGraph(gamma) then
    return false;
  fi;  

  if IsBound(gamma.autGroup) then
    orbs:=GRAPE_OrbitNumbers(gamma.autGroup,gamma.order);
  else
    orbs:=GRAPE_OrbitNumbers(gamma.group,gamma.order);
  fi;

  vtxset := [1..v];
  orbnum:=orbs.orbitNumbers;
  reps:=orbs.representatives;

  x := reps[1];
  adjx := Adjacency(gamma,x);
  k:=Length(adjx);
  notadjx := Filtered(vtxset,a->(not a in adjx) and  a<>x);

  y:= adjx[1];
  adjy := Adjacency(gamma,y);
  lambda := Length(Intersection(adjx,adjy));

  z := notadjx[1];
  adjz := Adjacency(gamma,z);
  mu := Length(Intersection(adjx,adjz));

  for i in [1..Length(reps)] do
    x:=reps[i];
    adjx := Adjacency(gamma,x);
    notadjx := Filtered(vtxset,a->(not a in adjx) and  a<>x);
    
    for y in adjx do
      adjy := Adjacency(gamma,y);

      if not Length(Intersection(adjx,adjy)) = lambda then
        return false;
      fi;
    od;

    for z in notadjx do
      adjz := Adjacency(gamma,z);

      if not Length(Intersection(adjx,adjz)) = mu then
        return false;
      fi;
    od;
  od;

  return [v,k,lambda,mu];
end );

#############################################################################
##
#F  IsStronglyRegularGraph( <gamma> )
##  
InstallGlobalFunction( IsStronglyRegularGraph,
function(gamma)
  if not StronglyRegularGraphParameters(gamma)=false then
    return true;
  fi;
  return false;
end );

#############################################################################
##
#F  FeasibleSRGParameterTuples( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( FeasibleSRGParameterTuples, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsFeasibleSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsFeasibleSRGParameterTuple,
function( parms )
  local v,k,lambda,mu,disc,sqrt,m1;
 
  v:=parms[1]; 
  k:=parms[2];
  lambda:= parms[3];
  mu:=parms[4];

  # Parameters are always integer
  if not (IsInt(v) and IsInt(k) and IsInt(lambda) and IsInt(mu)) then
    return false;
  fi;

  # No graphs without vertices or edges
  if v=0 or k=0 then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (lambda >=0 and k>lambda and v>k and k>=mu) then
    return false;
  fi;

  # Divisibility conditions
  if not (2 in DivisorsInt(v*k)) then 
    return false;    
  fi;
  
  if not lambda=0 then
    if not (2 in DivisorsInt(k*lambda) and 6 in DivisorsInt(v*k*lambda)) then
      return false;
    fi;
  fi;

  # Simple counting arguments forces the following equality
  if not (v-k-1)*mu=k*(k-lambda-1) then
   return false;    
  fi;

  # Simple counting arguments forces the following inequalities
  if not (v-2*k+lambda>=0 and v-2-2*k+mu>=0) then
   return false;    
  fi;

  # Integrality of eigenvalue multiplicities
  disc:=(lambda-mu)*(lambda-mu)+4*(k-mu);
  sqrt:=RootInt(disc);
  if not (disc=sqrt*sqrt or 2*k+(v-1)*(lambda-mu)=0) then
    return false;
  fi;
  
  m1:=((v-1)+((2*k+(v-1)*(lambda-mu))/sqrt))/2;
  if not IsInt(m1) then
    return false;
  fi;

  return true;

end );

#############################################################################
##
#F  KreinParameters( TODO )
##  
InstallGlobalFunction( KreinParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  KreinConditionsCheck( TODO )
##  
InstallGlobalFunction( KreinConditionsCheck, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  AbsoluteBoundCheck( TODO )
##  
InstallGlobalFunction( AbsoluteBoundCheck, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  SRGToGlobalParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( SRGToGlobalParameters, 
function( parms )
  if not IsFeasibleSRGParameterTuple(parms) then
    return false;
  fi;
  return [[0,0,parms[2]],
          [1,parms[3],parms[2]-parms[3]-1],
          [parms[4],parms[2]-parms[4],0]];
end );

#############################################################################
##
#F  GlobalToSRGParameters( <parms> )
##  
InstallGlobalFunction( GlobalToSRGParameters, 
function( parms )
  local v,k,lambda,mu;  

  if not Length(parms) = 3 then
    return false;
  elif ForAny(parms, x-> -1 in x) then
    return false;   
  fi;
  
  k:=parms[1][3];
  lambda:=parms[2][2];
  mu:=parms[3][1];
  v:=k+1+k*(k-lambda-1)/mu;

  return [ v, k, lambda, mu ];
end );

#############################################################################
##
#F  SmallestEigenvalueInterval( <gamma> )
##  
InstallGlobalFunction( SmallestEigenvalueInterval, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  LargestEigenvalueInterval( <gamma> )
##  
InstallGlobalFunction( LargestEigenvalueInterval, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  SmallestEigenvalueIntervalFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( SmallestEigenvalueIntervalFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  LargestEigenvalueIntervalFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( LargestEigenvalueIntervalFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  SmallestEigenvalueFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( SmallestEigenvalueFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  LargestEigenvalueFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( LargestEigenvalueFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  SmallestEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( SmallestEigenvalueMultiplicityFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  LargestEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( LargestEigenvalueMultiplicityFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  HoffmanCocliqueBound( <gamma> )
##  
InstallGlobalFunction( HoffmanCocliqueBound, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  HoffmanCliqueBound( <gamma> )
##  
InstallGlobalFunction( HoffmanCliqueBound, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  DelsarteCliqueBound( <gamma> )
##  
InstallGlobalFunction( DelsarteCliqueBound, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  HoffmanCocliqueBoundFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( HoffmanCocliqueBoundFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  HoffmanCliqueBoundFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( HoffmanCliqueBoundFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  DelsarteCliqueBoundFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( DelsarteCliqueBoundFromSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  CliqueAdjacencyPolynomial( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( CliqueAdjacencyPolynomial, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  CliqueAdjacencyBound( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( CliqueAdjacencyBound, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsFeasibleRegularCliqueERGParameters( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( IsFeasibleRegularCliqueERGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsFeasibleQuasiRegularCliqueERGParameters( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( IsFeasibleQuasiRegularCliqueERGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  RegularAdjacencyPolynomial( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( RegularAdjacencyPolynomial, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  RegularAdjacencyBounds( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( RegularAdjacencyBounds, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsFeasibleRegularSetSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsFeasibleRegularSetSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsFeasibleQuasiRegularCliqueSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsFeasibleQuasiRegularSetSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  BasicEdgeSwitching( <gamma> , <list1> , <list2> )
##  
InstallGlobalFunction( BasicEdgeSwitching, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  GodsilMcKaySwitching( <gamma> , <partition> )
##  
InstallGlobalFunction( GodsilMcKaySwitching, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsGodsilMcKayPartition( <gamma> , <partition> )
##  
InstallGlobalFunction( IsGodsilMcKayPartition, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
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
#F  AffinePolarGraph( <q> , <e> , <epsilon> )
##  
InstallGlobalFunction( AffinePolarGraph, 
function( q, e, epsilon )
  local   gamma, grp, Qform;
  
  grp := GO(epsilon,e,q);
  Qform := InvariantQuadraticForm(grp).matrix;

 # gamma:=Graph(grp,Elements(GF(q)^e)
end );

#############################################################################
##
#F  StronglyRegularGraphAvailable( <parms>  )
##
InstallGlobalFunction( StronglyRegularGraphAvailable, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  StronglyRegularGraph( <parms> , <nr> )
##  
InstallGlobalFunction( StronglyRegularGraph, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  NrStronglyRegularGraphs( <parms> )
##  
InstallGlobalFunction( NrStronglyRegularGraphs, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  OneStronglyRegularGraph( <parms> )
##  
InstallGlobalFunction( OneStronglyRegularGraph, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  AllStronglyRegularGraphs( <parms> )
##  
InstallGlobalFunction( AllStronglyRegularGraphs, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  StronglyRegularGraphsIterator( <parms> )
##  
InstallGlobalFunction( StronglyRegularGraphIterator, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  SmallFeasibleSRGParameterTuples( [ <v>, <k>, <lambda>, <mu> ], <opt> )
##  
InstallGlobalFunction( SmallFeasibleSRGParameterTuples, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsEnumeratedSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsEnumeratedSRGParameterTuple, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsKnownSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsKnownSRGParameterTuple, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#E

