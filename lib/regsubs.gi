#############################################################################
##
#W  regsubs.gi           Algebraic Graph Theory package         Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving regular subgraphs of graphs. 
##


#############################################################################
##
#O  HoffmanCocliqueBound( <gamma> )
##  
InstallMethod( HoffmanCocliqueBound, [IsRecord], 
function( gamma )
  local sigma,a,b,v,k,sig1,sig2,eps;

  if not IsGraph(gamma) then
    TryNextMethod();
  fi;

  if IsNullGraph(gamma) or not IsRegularGraph(gamma) then
    Error("Gamma must be a non-empty regular graph");
  fi;

  sigma:=[];
  sig1:=-1;
  sig2:=-2;
  eps:=1/10;

  repeat 

  sigma:=LeastEigenvalueInterval(gamma,eps);
  sig1:=sigma[1];
  sig2:=sigma[2];

  v:= gamma.order;
  k:= VertexDegree(gamma,1);
  a:=v*(-sig2)/(k-sig2);
  b:=v*(-sig1)/(k-sig1);

  eps:=eps/2;

  until Int(a)=Int(b);

  return Int(a);
end );

#############################################################################
##
#O  HoffmanCocliqueBound( <parms> )
##  
InstallMethod( HoffmanCocliqueBound, [IsList],
function( parms )
  local sigma,a,b,v,k,sig1,sig2,eps;
  
  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  sigma:=[];
  sig1:=-1;
  sig2:=-2;
  eps:=1/10;

  repeat 

  sigma:=LeastEigenvalueInterval(parms,eps);
  sig1:=sigma[1];
  sig2:=sigma[2];

  v:= parms[1];
  k:= parms[2];
  a:=v*(-sig2)/(k-sig2);
  b:=v*(-sig1)/(k-sig1);

  eps:=eps/2;

  until Int(a)=Int(b);

  return Int(a);
end );

#############################################################################
##
#O  HoffmanCliqueBound( <gamma> )
##  
InstallMethod( HoffmanCliqueBound, [IsRecord], 
function( gamma )
  return HoffmanCocliqueBound(ComplementGraph(gamma));
end );

#############################################################################
##
#O  HoffmanCliqueBound( <parms> )
##  
InstallMethod( HoffmanCliqueBound, [IsList],
function( parms )
  return HoffmanCocliqueBound(ComplementSRGParameters(parms));
end );


#############################################################################
##
#O  HaemersRegularUpperBound( <gamma> , <d> )
##  
InstallMethod( HaemersRegularUpperBound, [IsRecord, IsInt], 
function( gamma, d )
  local sigma,a,b,v,k,sig1,sig2,eps;

  if not IsGraph(gamma) then
    TryNextMethod();
  fi;

  if IsNullGraph(gamma) or not IsRegularGraph(gamma) or d<0 then
    Error("Gamma must be a non-empty regular graph, d>=0");
  fi;

  sigma:=[];
  sig1:=-1;
  sig2:=-2;
  eps:=1/10;

  repeat 

  sigma:=LeastEigenvalueInterval(gamma,eps);
  sig1:=sigma[1];
  sig2:=sigma[2];

  v:= gamma.order;
  k:= VertexDegree(gamma,1);
  a:=v*(d-sig2)/(k-sig2);
  b:=v*(d-sig1)/(k-sig1);

  eps:=eps/2;

  until Int(a)=Int(b);

  return Int(a);
end );

#############################################################################
##
#O  HaemersRegularUpperBound( <parms> )
##  
InstallMethod( HaemersRegularUpperBound, [IsList,IsInt],
function( parms , d )
  local sigma,a,b,v,k,sig1,sig2,eps;
  
  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  if d<0 then
    Error("d must be an integer, d>=0");
  fi;

  sigma:=[];
  sig1:=-1;
  sig2:=-2;
  eps:=1/10;

  repeat 

  sigma:=LeastEigenvalueInterval(parms,eps);
  sig1:=sigma[1];
  sig2:=sigma[2];

  v:= parms[1];
  k:= parms[2];
  a:=v*(d-sig2)/(k-sig2);
  b:=v*(d-sig1)/(k-sig1);

  eps:=eps/2;

  until Int(a)=Int(b);

  return Int(a);
end );




#############################################################################
##
#O  HaemersRegularLowerBound( <gamma> , <d> )
##  
InstallMethod( HaemersRegularLowerBound, [IsRecord, IsInt], 
function( gamma, d )
  local sigma,a,b,v,k,sig1,sig2,eps;

  if not IsGraph(gamma) then
    TryNextMethod();
  fi;

  if IsNullGraph(gamma) or not IsRegularGraph(gamma) or not IsConnectedGraph(gamma) then
    Error("Gamma must be a non-empty, connected regular graph");
  fi;

  sigma:=[];
  sig1:=-1;
  sig2:=-2;
  eps:=1/10;

  repeat 

  sigma:=SecondEigenvalueInterval(gamma,eps);
  sig1:=sigma[1];
  sig2:=sigma[2];

  v:= gamma.order;
  k:= VertexDegree(gamma,1);
  a:=v*(d-sig2)/(k-sig2);
  b:=v*(d-sig1)/(k-sig1);

  eps:=eps/2;

  until  Int(Ceil(Float(a)))= Int(Ceil(Float(b)));

  return Int(Ceil(Float(a)));
end );

#############################################################################
##
#O  HaemersRegularLowerBound( <parms> )
##  
InstallMethod( HaemersRegularLowerBound, [IsList,IsInt],
function( parms , d )
  local sigma,a,b,v,k,sig1,sig2,eps;
  
  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  if d<0 or parms[4]=0 then
    Error("d must be an integer, d>=0 and parms must not have parms[4]=0");
  fi;


  sigma:=[];
  sig1:=-1;
  sig2:=-2;
  eps:=1/10;

  repeat 

  sigma:=SecondEigenvalueInterval(parms,eps);
  sig1:=sigma[1];
  sig2:=sigma[2];

  v:= parms[1];
  k:= parms[2];
  a:=v*(d-sig2)/(k-sig2);
  b:=v*(d-sig1)/(k-sig1);

  eps:=eps/2;

  until  Int(Ceil(Float(a)))= Int(Ceil(Float(b)));

  return Int(Ceil(Float(a)));
end );

#############################################################################
##
#F  CliqueAdjacencyPolynomial( <parms>, <x>, <y> )
##  
InstallGlobalFunction( CliqueAdjacencyPolynomial, 
function( parms, x, y )
  local v,k,a;

  if not IsFeasibleERGParameters(parms) then
    Error("usage: CliqueAdjacencyPolynomial(<parms>,<x>,<y>), where <parms> \n\
           is a feasible edge-regular graph parameter tuple");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  a:=parms[3]; 

  return (v-y)*x*(x+1) - 2*y*(k-y+1) + y*(y-1)*(a-y+2);

end );

#############################################################################
##
#F  CliqueAdjacencyBound( <parms> )
##  
InstallGlobalFunction( CliqueAdjacencyBound, 
function( parms )
    local v,k,a,al,b,c,disc,s,m,lambdas,firstbnd;

  if not IsFeasibleERGParameters(parms) then
    Error("usage: CliqueAdjacencyBound(<parms>), where <parms> is \n\
           feasible edge-regular graph parameters");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  a:=parms[3]; 

  m := [0,0];

  firstbnd := a+2;

  for s in [2..firstbnd] do

    m[s+1] := 0;  # For future use we always update m. 

    # Calculating the discriminant of the Block Intersection Polynomial
    al := v-s;
    b := al-2*s*(k-s+1);
    c := s*(s-1)*(a-s+2);
    disc := b*b-4*al*c;

    # If it attains no negative value, we leave this s 
    if disc <= 0 then
      continue;
    fi;

    # Here we use a costly function to find if there is an integer
    # evaluating to a negative number under the polynomial
    # May be able to improve on this for the specific case of quadratic
    lambdas := [ v - s , k - s + 1, a - s + 2 ];
 
    if not BlockIntersectionPolynomialCheck(m,lambdas) then
      return s-1;
    fi;
  od;

  return firstbnd;

end );

##TODO check this over
#############################################################################
##
#F  RegularCliqueERGParameters( <parms> )
##  
InstallGlobalFunction( RegularCliqueERGParameters, 
function( parms )
  local v,k,a,b,al,c,disc,s,m,sqrt,t;

  if not IsFeasibleERGParameters(parms) then
    Error("usage: RegularCliqueERGParameters(<parms>), where <parms> is \n\
           feasible edge-regular graph parameters");
  fi;

  v := parms[1];
  k := parms[2];
  a := parms[3];

  al := v-2*k+a;
  b := k*k+3*k-a-v*(a+2);
  c := v*(a+1-k);

  # Complete multipartite case
  if al=0 then
    t:=v-k;
    s:=v/t;
    if not (IsInt(s) and s > 0) then
      return [];
    fi;

    if a=k-1  then
      # Parameters of a complete graph
      return List([1..(v-1)],x->[x,x]);
    fi;
    return [[s,s-1]];
  fi;

  disc := b*b-4*al*c;

  if disc < 0 then
    return [];
  fi;

  sqrt := Sqrt(disc);
  s := (-b+sqrt)/(2*al);

  if not IsInt(s) then
    return [];
  fi;

  al := v-s;
  b := -al;
  c := -s*(s-1)*(a-s+2);

  disc := b*b-4*al*c;

  if disc < 0 then
    return [];
  fi;

  sqrt := Sqrt(disc);
  m := (-b+sqrt)/(2*al);

  if not IsInt(m) then
    return [];
  fi;
 
  return [[s,m]];
end );

#############################################################################
##
#F  RegularAdjacencyPolynomial( <parms>, <x>, <y>, <d> )
##  
InstallGlobalFunction( RegularAdjacencyPolynomial, 
function( parms, x, y, d )
   local v,k,a,b;

  if not IsFeasibleSRGParameters(parms) then
    Error("usage: RegularAdjacencyPolynomial(<parms>,<x>,<y>,<d>), where \n\
           <parms> is feasible strongly regular graph parameters");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  a:=parms[3]; 
  b:=parms[4];

  return (v-y)*x*(x+1) - 2*x*y*k + (2*x+a-b+1)*y*d + y*(y-1)*b - y*d*d;

end );

#############################################################################
##
#F  RegularAdjacencyUpperBound( <parms>, <d> )
##  
InstallGlobalFunction( RegularAdjacencyUpperBound, 
function( parms , d )
  local v,k,a,b,s,al,bl,cl,disc,m,mint,C;

  if not (IsFeasibleSRGParameters(parms) and IsInt(d) and d>=0 and d<=parms[2]) then
    Error("usage: RegularAdjacencyUpperBound(<parms>,<d>), where \n\
           <parms> is feasible strongly regular graph parameters and <d> \n\
           is a non-negative integer d<=parms[2].");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  a:=parms[3]; 
  b:=parms[4];

  if d=k then
    return v;
  fi;

  for s in Reversed([d+1..v-1]) do

    # The coefficients of the rap
    al := v-s;
    bl := al-2*s*(k-d);
    cl := (a-b+1)*s*d+s*(s-1)*b-s*d*d;
    disc := bl*bl-4*al*cl;

    # If rap is never negative, we have found a feasible s 
    if disc <= 0 then
      return s;
    fi;
 
    # Find a closest integer to the critical point of the rap
    m:=((2*(k-d)+1)*s-v)/(2*(v-s));
    mint:=BestQuoInt(NumeratorRat(m),DenominatorRat(m));

    # The rap at (x,s,d)
    C:=UnivariatePolynomial(Rationals,[cl,bl,al],1);

    # If the rap at x=mint is not negative, its not negative for all integers    
    if Value(C,mint)>=0 then
      return s;
    fi;
  od;
  
  # Finally, we have not found a feasible value for s 
  return 0;
end );


#############################################################################
##
#F  RegularAdjacencyLowerBound( <parms>, <d> )
##  
InstallGlobalFunction( RegularAdjacencyLowerBound, 
function( parms , d )
  local v,k,a,b,s,al,bl,cl,disc,m,mint,C;

  if not (IsFeasibleSRGParameters(parms) and IsInt(d) and d>=0 and d<=parms[2]) then
    Error("usage: RegularAdjacencyLowerBound(<parms>,<d>), where \n\
           <parms> is feasible strongly regular graph parameters and <d> \n\
           is a non-negative integer d<=parms[2].");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  a:=parms[3]; 
  b:=parms[4];

  if d=k then
    return v;
  fi;

  for s in [d+1..v-1] do

    # The coefficients of the rap
    al := v-s;
    bl := al-2*s*(k-d);
    cl := (a-b+1)*s*d+s*(s-1)*b-s*d*d;
    disc := bl*bl-4*al*cl;

    # If it attains no negative value, we have found a feasible s 
    if disc <= 0 then
      return s;
    fi;
 
    # Find a closest integer to the critical point of the rap
    m:=((2*(k-d)+1)*s-v)/(2*(v-s));
    mint:=BestQuoInt(NumeratorRat(m),DenominatorRat(m));

    # The rap at (x,s,d)
    C:=UnivariatePolynomial(Rationals,[cl,bl,al],1);

    # If the rap at x=mint is not negative, its not negative for all integers    
    if Value(C,mint)>=0 then
      return s;
    fi;
  od;

  # Finally, we have not found a feasible value for s 
  return v+1;
end );


#############################################################################
##
#F  Nexus( <gamma> )
##  
InstallGlobalFunction( Nexus,
function( gamma, U )
  local u,vertices,nex,out;

  vertices:=Vertices(gamma);
  Sort(vertices);
  Sort(U);
  
  if not IsSubsetSet(vertices,U) then
    Error("usage: Nexus(<gamma>,<U>), where <gamma> is a graph and <U> \n\
           is a subset of its vertices.");
  fi;

  out:=Difference(vertices,U);
  nex:=Length(Intersection(Adjacency(gamma,out[1]),U));

  for u in out do
    if not Length(Intersection(Adjacency(gamma,u),U))=nex then
      return fail;
    fi;
  od;

  return nex;

end );


#############################################################################
##
#F  RegularSetParameters( <gamma>, <U> )
##  
InstallGlobalFunction( RegularSetParameters, 
function( gamma, U )
  local u,vertices,nex,out,indg,regp;

  if not IsGraph(gamma) then
    Error("usage: Nexus(<gamma>,<U>), where <gamma> is a graph and <U> \n\
           is a subset of its vertices.");
  fi;
  
  vertices:=Vertices(gamma);
  Sort(vertices);
  Sort(U);
  
  if not IsSubsetSet(vertices,U) then
    Error("usage: Nexus(<gamma>,<U>), where <gamma> is a graph and <U> \n\
           is a subset of its vertices.");
  fi;

  indg:=InducedSubgraph(gamma,U);
  regp:=RGParameters(indg);
  nex:=Nexus(gamma,U);

  if regp=fail or nex=fail then
    return fail;
  fi;
  
  return [regp[2],nex];
  
end );

#############################################################################
##
#F  IsRegularSet( <gamma> , <U> , <opt> )
##  
InstallGlobalFunction( IsRegularSet,
function( gamma, U, opt )
  if opt=true then
    if not RegularSetParameters(gamma,U)=fail then
      return true;
    fi;
    return false;
  fi;

  if opt=false then
    if not Nexus(gamma,U)=fail then
      return true;
    fi;
    return false;
  fi;
end );

#############################################################################
##
#F  RegularSetSRGParameters( <parms>, <d> )
##  
InstallGlobalFunction( RegularSetSRGParameters, 
function( parms, d )
   local bl,al,c,disc,v,k,a,b,s,m,firstbnd,mslist,sqrt,roots;


  if not (IsFeasibleSRGParameters(parms) and IsInt(d) and d>=0 and d<=parms[2]) then
    Error("usage: RegularAdjacencyLowerBound(<parms>,<d>), where \n\
           <parms> is feasible strongly regular graph parameters and <d> \n\
           is a non-negative integer d<=parms[2].");
  fi;

  v:=parms[1];
  k:=parms[2];
  a:=parms[3];
  b:=parms[4];

  mslist:=[];

  for s in [2..v] do

    # Calculating the discriminant of the Block Intersection Polynomial
    al := v-s;
    bl := al-2*s*(k-d);
    c := s*((s-1)*b + (a-b+1)*d - d*d);
    disc := bl*bl-4*al*c;

    if (disc > 0) then

      sqrt := RootInt(disc);
     
      # We need 2 integer zeros which differ by exactly 1
      if (not al = 0) and (disc = sqrt*sqrt) and (sqrt = al) then
      
        roots := [(-bl+sqrt)/(2*al),(-bl-sqrt)/(2*al)];
        Sort(roots);    

        if (IsInt(roots[1])) and (roots[1]>=0) then
          Add(mslist,[s,roots[2]]);;
        fi;
      fi;
    fi;
  od;
  
  return mslist;

end );

#############################################################################
##
#F  NGParameters( <gamma> )
##  
InstallGlobalFunction( NGParameters,
function( gamma )
  local v,eparms,nparms;

  v:=gamma.order;
  if not IsGraph(gamma) then 
    Error("usage: NGParameters( <Graph> )");
  fi;

  eparms := ERGParameters(gamma);
  
  if eparms=fail then
    return fail;
  fi;

  nparms := RegularCliqueERGParameters(eparms);

  if nparms = fail then
    return fail;
  fi;

  if ForAll(nparms,x->(Cliques(gamma,x[1])=[])) then
    return fail;
  fi;

  return List(nparms,x-> [eparms[1],eparms[2],eparms[3],x[1],x[2]]);

end );

#############################################################################
##
#F  IsNG( <gamma> )
##  
InstallGlobalFunction( IsNG,
function( gamma )
  local nparms;

  if not IsGraph(gamma) then 
    Error("usage: IsNG( <Graph> )");
  fi;

  if not NGParameters(gamma)=fail then
    return true;
  fi;
  return false;
end );

#############################################################################
##
#F  IsFeasibleNGParameters( [ <v>, <k>, <a>, <s>, <m> ] )
##  
InstallGlobalFunction( IsFeasibleNGParameters,
function( parms )
  local v,k,a,s,m;

  # Input is list of 5 integers
  if not (IsList(parms) and Length(parms)=5 and ForAll(parms,IsInt)) then
    Error("usage: IsFeasibleNGParameters( [ <Int>, <Int>, <Int>, <Int>, <Int> ] )");
  fi;  

  v:=parms[1]; 
  k:=parms[2];
  a:=parms[3];
  s:=parms[4];
  m:=parms[5];

  # Needs to be an ERG
  if not IsFeasibleERGParameters([v,k,a]) then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (m>0 and s>=m and s>=2 and s<=a+2) then
    return false;
  fi;

  # Simple counting arguments force the following equalities
  if not ((v-s)*m=s*(k-s+1) and (k-s+1)*(m-1)=(s-1)*(a-s+2)) then
   return false;    
  fi;

  return true;

end );

#############################################################################
##
#E
