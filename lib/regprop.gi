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
  local v,edges,orbs,reps,e,x,y,adjx,adjy,k,a;
  
  if not IsGraph(gamma) then 
    Error("usage: ERGParameters( <Graph> )");
  fi;

  v:=gamma.order;

  # The empty graph is not edge-regular
  if v=0 then
    return fail;
  fi;

  if not IsSimpleGraph(gamma) then
    return fail;
  fi;

  if not IsRegularGraph(gamma) then
    return fail;
  fi;  

  edges := UndirectedEdges(gamma);

  # Null graphs are not edge-regular
  if edges=[] then
    return fail;
  fi;  

  if IsBound(gamma.autGroup) then
    orbs:=Orbits(gamma.autGroup,edges,OnSets);
  else
    orbs:=Orbits(gamma.group,edges,OnSets);
  fi;

  reps:=orbs{[1..Length(orbs)]}[1];

  x := reps[1][1];
  adjx := Adjacency(gamma,x);
  k:=Length(adjx);

  y := reps[1][2];
  adjy := Adjacency(gamma,y);
  a := Length(Intersection(adjx,adjy));

  for e in reps do
    x:=e[1];
    y:=e[2];
    adjx := Adjacency(gamma,x);
    adjy := Adjacency(gamma,y);

    if not Length(Intersection(adjx,adjy)) = a then
        return fail;
    fi;
  od;

  return [v,k,a];
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
  local v,eparms,cparms;

  v:=gamma.order;
  if not IsGraph(gamma) then 
    Error("usage: SRGParameters( <Graph> )");
  fi;

  eparms := ERGParameters(gamma);
  
  if eparms=fail then
    return fail;
  fi;

  cparms := ERGParameters(ComplementGraph(gamma));

  if cparms=fail then
    return fail;
  fi;

  Add(eparms,v-2*cparms[2]+cparms[3]);

  return eparms;
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

