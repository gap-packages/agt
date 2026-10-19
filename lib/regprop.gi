#############################################################################
##
#W  regprop.gi          Algebraic Graph Theory package         Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving regularity properties of 
##  graphs.
##


#############################################################################
##
#F  RGParameters( <gamma> )
##  
InstallGlobalFunction( RGParameters,
function( gamma )
  local v;
  
  if not IsGraph(gamma) then 
    Error("usage: RGParameters( <Graph> )");
  fi;

  if not IsSimpleGraph(gamma) then
    return fail;
  fi;

  if not IsRegularGraph(gamma) then
    return fail;
  fi;  

  return [gamma.order, Length(Adjacency(gamma,1))];
end );

#############################################################################
##
#F  IsRG( <gamma> )
##  
## See GRAPE package function IsRegularGraph


#############################################################################
##
#F  IsFeasibleRGParameters( [ <v>, <k> ] )
##  
InstallGlobalFunction( IsFeasibleRGParameters,
function( parms )
  local v,k;

  # Input is list of 2 integers
  if not (IsList(parms) and Length(parms)=2 and ForAll(parms,IsInt)) then
    Error("usage: IsFeasibleRGParameters( [ <Int>, <Int> ] )");
  fi;  
 
  v:=parms[1]; 
  k:=parms[2];

  # No graphs without vertices or edges
  if v=0 then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (k >=0 and v>k) then
    return false;
  fi;

  # Divisibility conditions
  if not (2 in DivisorsInt(v*k)) then 
    return false;    
  fi;

  return true;

end );


#############################################################################
##
#F  ERGParameters( <gamma> )
##  
InstallGlobalFunction( ERGParameters,
function( gamma )
  local edges,reps,x,y,adjx,adjy,a;
  
  if not IsGraph(gamma) then 
    Error("usage: ERGParameters( <Graph> )");
  fi;

  # The empty graph is not edge-regular
  if gamma.order=0 then
    return fail;
  fi;

  if not IsSimpleGraph(gamma) then
    return fail;
  fi;

  if not IsRegularGraph(gamma) then
    return fail;
  fi;  

  edges := Adjacency(gamma,1);

  # Null graphs are not edge-regular
  if edges=[] then
    return fail;
  fi;  

  if IsBound(gamma.autGroup) then
    reps:=GRAPE_OrbitNumbers(gamma.autGroup,gamma.order).representatives;
  else 
    reps:=gamma.representatives;
  fi;

  adjx := Adjacency(gamma,reps[1]);
  adjy := Adjacency(gamma,adjx[1]);
  a := Length(Intersection(adjx,adjy));

  for x in [1..Length(reps)] do
    adjx := Adjacency(gamma,reps[x]);

    for y in adjx do
      adjy := Adjacency(gamma,y);

      if not Length(Intersection(adjx,adjy)) = a then
        return fail;
      fi;
    od;
  od;

  return [gamma.order, Length(adjx),a];
end );

#############################################################################
##
#F  IsERG( <gamma> )
##  
InstallGlobalFunction( IsERG,
function(gamma)
  if not IsGraph(gamma) then 
    Error("usage: IsERG( <Graph> )");
  fi;

  if not ERGParameters(gamma)=fail then
    return true;
  fi;
  return false;
end );

#############################################################################
##
#F  IsFeasibleERGParameters( [ <v>, <k>, <a> ] )
##  
InstallGlobalFunction( IsFeasibleERGParameters,
function( parms )
  local v,k,a;

  # Input is list of 3 integers
  if not (IsList(parms) and Length(parms)=3 and ForAll(parms,IsInt)) then
    Error("usage: IsFeasibleERGParameters( [ <Int>, <Int>, <Int> ] )");
  fi;  
 
  v:=parms[1]; 
  k:=parms[2];
  a:= parms[3];

  # No graphs without vertices or edges
  if v=0 or k=0 then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (a >=0 and k>a and v>k) then
    return false;
  fi;

  # Divisibility conditions
  if not (2 in DivisorsInt(v*k)) then 
    return false;    
  fi;
  
  if not a=0 then
    if not (2 in DivisorsInt(k*a) and 6 in DivisorsInt(v*k*a)) then
      return false;
    fi;
  fi;

  # Simple counting argument force the following inequality
  if not (v-2*k+a>=0) then
   return false;    
  fi;

  return true;

end );

#############################################################################
##
#F  SRGParameters( <gamma> )
##  
InstallGlobalFunction( SRGParameters,
function( gamma )
  local edges,reps,x,y,adjx,adjy,nadjy,a,b;
  
  if not IsGraph(gamma) then 
    Error("usage: SRGParameters( <Graph> )");
  fi;

  # The empty graph is not strongly regular
  if gamma.order=0 then
    return fail;
  fi;

  if not IsSimpleGraph(gamma) then
    return fail;
  fi;

  if not IsRegularGraph(gamma) then
    return fail;
  fi;  

  edges := Adjacency(gamma,1);

  # Null and complete graphs are not strongly regular
  if edges=[] or Length(edges)=gamma.order - 1 then
    return fail;
  fi;  

  if IsBound(gamma.autGroup) then
    reps:=GRAPE_OrbitNumbers(gamma.autGroup,gamma.order).representatives;
  else 
    reps:=gamma.representatives;
  fi;

  adjx := Adjacency(gamma,reps[1]);
  adjy := Adjacency(gamma,adjx[1]);
  nadjy:= Adjacency(gamma,Difference([1..gamma.order],Union(adjx,[reps[1]]))[1]);
  a := Length(Intersection(adjx,adjy));
  b:= Length(Intersection(adjx,nadjy));

  for x in [1..Length(reps)] do
    adjx := Adjacency(gamma,reps[x]);

    for y in adjx do
      adjy := Adjacency(gamma,y);

      if not Length(Intersection(adjx,adjy)) = a then
        return fail;
      fi;
    od;
    for y in Difference([1..gamma.order],Union(adjx,[reps[x]])) do
      nadjy:= Adjacency(gamma,y);

      if not Length(Intersection(adjx,nadjy)) = b then
        return fail;
      fi;
    od;
  od;

  return [gamma.order, Length(adjx),a,b];
end );

#############################################################################
##
#F  IsSRG( <gamma> )
##  
InstallGlobalFunction( IsSRG,
function( gamma )
  if not IsGraph(gamma) then 
    Error("usage: IsSRG( <Graph> )");
  fi;

  if not SRGParameters(gamma)=fail then
    return true;
  fi;
  return false;
end );

#############################################################################
##
#F  IsFeasibleSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( IsFeasibleSRGParameters,
function( parms )
  local v,k,a,b,disc,sqrt,m1;

  # Input is list of 4 integers
  if not (IsList(parms) and Length(parms)=4 and ForAll(parms,IsInt)) then
    Error("usage: IsFeasibleERGParameters( [ <Int>, <Int>, <Int>, <Int> ] )");
  fi;  

  v:=parms[1]; 
  k:=parms[2];
  a:=parms[3];
  b:=parms[4];

  # No graphs without vertices or edges
  if v=0 or k=0 then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (a>=0 and k>a and v>k and k>=b) then
    return false;
  fi;

  # Divisibility conditions
  if not (2 in DivisorsInt(v*k)) then 
    return false;    
  fi;
  
  if not a=0 then
    if not (2 in DivisorsInt(k*a) and 6 in DivisorsInt(v*k*a)) then
      return false;
    fi;
  fi;

  # Simple counting arguments force the following equality
  if not (v-k-1)*b=k*(k-a-1) then
   return false;    
  fi;

  # Simple counting arguments force the following inequalities
  if not (v-2*k+a>=0 and v-2-2*k+b>=0) then
   return false;    
  fi;

  # Integrality of eigenvalue multiplicities
  disc:=(a-b)*(a-b)+4*(k-b);
  sqrt:=RootInt(disc);
  if not (disc=sqrt*sqrt or 2*k+(v-1)*(a-b)=0) then
    return false;
  fi;
  
  m1:=((v-1)+((2*k+(v-1)*(a-b))/sqrt))/2;
  if not IsInt(m1) then
    return false;
  fi;

  return true;

end );

#############################################################################
##
#E

