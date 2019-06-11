#############################################################################
##
#W  srgs.gi           Strongly Regular graph library               Rhys Evans
##
##
##  This file contains the routines for the strongly regular graphs library
##

######################
## GLOBAL FUNCTIONS ##
######################
##---------------------------------------------------------------------------------------------

#############################################################################
##
#F  ERGParameters( <gamma> )
##  
InstallGlobalFunction( ERGParameters,
function( gamma )
  local v,edges,orbs,reps,e,x,y,adjx,adjy,k,lambda;
  
  if not IsGraph(gamma) then 
    Error("usage: ERGParameters( <Graph> )");
  fi;

  v:=gamma.order;

  # The empty graph is not edge-regular
  if v=0 then
    return false;
  fi;

  if not IsSimpleGraph(gamma) then
    return false;
  fi;

  if not IsRegularGraph(gamma) then
    return false;
  fi;  

  edges := UndirectedEdges(gamma);

  # Null graphs are not edge-regular
  if edges=[] then
    return false;
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
  lambda := Length(Intersection(adjx,adjy));

  for e in reps do
    x:=e[1];
    y:=e[2];
    adjx := Adjacency(gamma,x);
    adjy := Adjacency(gamma,y);

    if not Length(Intersection(adjx,adjy)) = lambda then
        return false;
    fi;
  od;

  return [v,k,lambda];
end );

#############################################################################
##
#F  IsERG( <gamma> )
##  
InstallGlobalFunction( IsERG,
function(gamma)
  if not ERGParameters(gamma)=false then
    return true;
  fi;
  return false;
end );

#############################################################################
##
#F  IsFeasibleERGParameters( [ <v>, <k>, <l> ] )
##  
InstallGlobalFunction( IsFeasibleERGParameters,
function( parms )
  local v,k,l;

  if not IsList(parms) then
    return false;
  fi;  

  # Length exactly 3
  if not Length(parms)=3 then
    return false;
  fi;
 
  v:=parms[1]; 
  k:=parms[2];
  l:= parms[3];

  # Parameters are always integer
  if not (IsInt(v) and IsInt(k) and IsInt(l)) then
    return false;
  fi;

  # No graphs without vertices or edges
  if v=0 or k=0 then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (l >=0 and k>l and v>k) then
    return false;
  fi;

  # Divisibility conditions
  if not (2 in DivisorsInt(v*k)) then 
    return false;    
  fi;
  
  if not l=0 then
    if not (2 in DivisorsInt(k*l) and 6 in DivisorsInt(v*k*l)) then
      return false;
    fi;
  fi;

  # Simple counting argument force the following inequality
  if not (v-2*k+l>=0) then
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
local v,k,lambda,mu,eparms,cparms;

  v:=gamma.order;
  if not IsGraph(gamma) then 
    Error("usage: SRGParameters( <Graph> )");
  fi;

  eparms := ERGParameters(gamma);
  
  if eparms=false then
    return false;
  fi;

  cparms := ERGParameters(ComplementGraph(gamma));

  if cparms=false then
    return false;
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
  if not SRGParameters(gamma)=false then
    return true;
  fi;
  return false;
end );

#############################################################################
##
#F  IsFeasibleSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( IsFeasibleSRGParameters,
function( parms )
  local v,k,l,m,disc,sqrt,m1;

  if not IsList(parms) then
    return false;
  fi;  

  # List of length exactly 4
  if not Length(parms)=4 then
    return false;
  fi;
 
  v:=parms[1]; 
  k:=parms[2];
  l:=parms[3];
  m:=parms[4];

  # Parameters are always integer
  if not (IsInt(v) and IsInt(k) and IsInt(l) and IsInt(m)) then
    return false;
  fi;

  # No graphs without vertices or edges
  if v=0 or k=0 then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (l>=0 and k>l and v>k and k>=m) then
    return false;
  fi;

  # Divisibility conditions
  if not (2 in DivisorsInt(v*k)) then 
    return false;    
  fi;
  
  if not l=0 then
    if not (2 in DivisorsInt(k*l) and 6 in DivisorsInt(v*k*l)) then
      return false;
    fi;
  fi;

  # Simple counting arguments force the following equality
  if not (v-k-1)*m=k*(k-l-1) then
   return false;    
  fi;

  # Simple counting arguments force the following inequalities
  if not (v-2*k+l>=0 and v-2-2*k+m>=0) then
   return false;    
  fi;

  # Integrality of eigenvalue multiplicities
  disc:=(l-m)*(l-m)+4*(k-m);
  sqrt:=RootInt(disc);
  if not (disc=sqrt*sqrt or 2*k+(v-1)*(l-m)=0) then
    return false;
  fi;
  
  m1:=((v-1)+((2*k+(v-1)*(l-m))/sqrt))/2;
  if not IsInt(m1) then
    return false;
  fi;

  return true;

end );

#############################################################################
##
#F  IsPrimitiveSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( IsPrimitiveSRGParameters,
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;
  return not (parms[4]=0 or ComplementParameters(parms)[4]=0);
end );

#############################################################################
##
#F  IsTypeIParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( IsTypeIParameters, 
function( parms )
  local t,ist1;
  
  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  ist1:=true;
  t:=parms[4];
  
  ist1:=ist1 and t>0;
  ist1:=ist1 and parms[1]=4*t+1;
  ist1:=ist1 and parms[2]=2*t;
  ist1:=ist1 and parms[3]=t-1;

  return ist1;
end );

#############################################################################
##
#F  IsTypeIIParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( IsTypeIIParameters, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;
  return IsInt(LeastEigenvalueFromSRGParameters(parms));
end );

#############################################################################
##
#F  ComplementParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( ComplementParameters, 
function( parms )

  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;    

  return [parms[1],
          parms[1]-parms[2]-1,
          parms[1]-2-2*parms[2]+parms[4],
          parms[1]-2*parms[2]+parms[3]];
end );

#############################################################################
##
#F  SRGToGlobalParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( SRGToGlobalParameters, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
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
  local v,k,l,m;  

  if (not Length(parms) = 3) or ForAny(parms, x-> -1 in x) then
    return false;
  fi;
  
  k:=parms[1][3];
  l:=parms[2][2];
  m:=parms[3][1];

  if m=0 then
    return false;
  fi;    

  v:=k+1+k*(k-l-1)/m;

  if not IsFeasibleSRGParameters([v,k,l,m]) then
    return false;
  fi;

  return [ v, k, l, m ];
end );

#############################################################################
##
#O  LeastEigenvalueInterval( <gamma> , <eps> )
##  
InstallMethod( LeastEigenvalueInterval, "graph", [IsRecord,IsRat],
function( gamma , eps )
  local k,chi,sigma,G,sze;

  if not IsGraph(gamma) then
    #Error("<gamma> must be a grape graph");
    TryNextMethod();
  fi;

  sigma := [];
  sze := gamma.order;
  G := AutGroupGraph(gamma);

  k := Maximum(List([1..sze],x->VertexDegree(gamma,x)));

  if IsTransitive(G,[1..sze]) then
    chi := CharacteristicPolynomial(CollapsedAdjacencyMat(Stabilizer(G,1),gamma));
  else
    chi := CharacteristicPolynomial(CollapsedAdjacencyMat(Group(()),gamma));
  fi;

  sigma:=DESIGN_IntervalForLeastRealZero(chi,-k,k,eps);

  return sigma;

end );

#############################################################################
##
#O  LeastEigenvalueInterval( [ <v>, <k>, <l>, <m> ] , <eps> )
##  
InstallMethod( LeastEigenvalueInterval, "SRG parameter tuple", [IsList,IsRat], 
function( parms , eps )
  local k,chi,sigma,x;

  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  sigma := [];
  k:=parms[2];
  x:=Indeterminate(Rationals,"x");

  chi:=x*x+(parms[4]-parms[3])*x+parms[4]-k;

  sigma:=DESIGN_IntervalForLeastRealZero(chi,-k,k,eps);

  return sigma;
end );

#############################################################################
##
#O  SecondEigenvalueInterval( <gamma> , <eps> )
##  
InstallMethod( SecondEigenvalueInterval, "regular graph", [IsRecord, IsRat],
function( gamma , eps )
  local k;

  if not IsRegularGraph(gamma) then
    #Error("<gamma> must be a grape graph");
    TryNextMethod();
  fi;
  
  k:=Length(Adjacency(gamma,1));
  
  if not IsConnectedGraph(gamma) then
    return [k,k]; 
  fi;

  return -1-Reversed(LeastEigenvalueInterval(ComplementGraph(gamma),eps));
end );

#############################################################################
##
#F  SecondEigenvalueInterval( [ <v>, <k>, <l>, <m> ] )
##  
InstallMethod( SecondEigenvalueInterval, "tuple", [IsList, IsRat], 
function( parms, eps )
  if not IsFeasibleSRGParameters(parms) then
    #Error("<gamma> must be a grape graph");
    TryNextMethod();
  fi;

  if parms[4]=0 then
    return [parms[2],parms[2]];
  fi;
  
  return -1-Reversed(LeastEigenvalueInterval(ComplementParameters(parms),eps));
end );

#############################################################################
##
#F  LeastEigenvalueFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( LeastEigenvalueFromSRGParameters, 
function( parms )
  local v,k,l,m,disc,sqrt,s;

  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  v:=parms[1];
  k:=parms[2];
  l:=parms[3];
  m:=parms[4];

  disc:=(l-m)*(l-m)+4*(k-m);
  sqrt:=Sqrt(disc);
  
  s:=(l-m-sqrt)/2;  

  return s;
end );

#############################################################################
##
#F  SecondEigenvalueFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( SecondEigenvalueFromSRGParameters, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  return parms[3]-parms[4]-LeastEigenvalueFromSRGParameters(parms);
end );

#############################################################################
##
#F  LeastEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( LeastEigenvalueMultiplicityFromSRGParameters, 
function( parms )
  local v,k,l,m,disc,sqrt,f;

  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  v:=parms[1];
  k:=parms[2];
  l:=parms[3];
  m:=parms[4];

  disc:=(l-m)*(l-m)+4*(k-m);
  sqrt:=Sqrt(disc);
  
  f:= (v-1+((v-1)*(l-m)+2*k)/sqrt)/2;

  return f;  
end );

#############################################################################
##
#F  SecondEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( SecondEigenvalueMultiplicityFromSRGParameters, 
function( parms )
  local v,k,l,m,disc,sqrt,f;

  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  v:=parms[1];
  k:=parms[2];
  l:=parms[3];
  m:=parms[4];

  disc:=(l-m)*(l-m)+4*(k-m);
  sqrt:=Sqrt(disc);
  
  f:= (v-1-((v-1)*(l-m)+2*k)/sqrt)/2;

  return f;
end );

#############################################################################
##
#F  KreinParameters( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( KreinParameters, 
function( parms )
  local k,r,s,K;

  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  K:=[];
  k:=parms[2];
  s:=LeastEigenvalueFromSRGParameters(parms);
  r:=SecondEigenvalueFromSRGParameters(parms);

  K[1]:=(k+r)*(s+1)*(s+1)-(r+1)*(k+r+2*r*s);
  K[2]:=(k+s)*(r+1)*(r+1)-(s+1)*(k+s+2*r*s);

  return K;

end );

#############################################################################
##
#F  KreinConditionsCheck( [ <v>, <k>, <l>, <m> ] )
##  
InstallGlobalFunction( KreinConditionsCheck, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;
  
  if IsTypeIParameters(parms) then
    return true;
  fi;

  return ForAll(KreinParameters(parms),x->x>=0);
end );

#############################################################################
##
#F  AbsoluteBoundCheck( [ v, k, l, m ] )
##  
InstallGlobalFunction( AbsoluteBoundCheck, 
function( parms )
  local v,f,g;

  if not IsFeasibleSRGParameters(parms) then
    return false;
  fi;

  v := parms[1];
  f := LeastEigenvalueMultiplicityFromSRGParameters(parms);
  g := SecondEigenvalueMultiplicityFromSRGParameters(parms);

  return 2*v <= f*(f+3) and 2*v <= g*(g+3);
end );

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
#O  HoffmanCocliqueBound( [ <v>, <k>, <l>, <m> ] )
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
#O  HoffmanCliqueBound( [ <v>, <k>, <l>, <m> ] )
##  
InstallMethod( HoffmanCliqueBound, [IsList],
function( parms )
  return HoffmanCocliqueBound(ComplementParameters(parms));
end );

#############################################################################
##
#O  DelsarteCliqueBound( <gamma> )
##  
InstallMethod( DelsarteCliqueBound, [IsRecord],
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
  a:=1-k/sig2;
  b:=1-k/sig1;

  eps:=eps/2;

  until Int(a)=Int(b);

  return Int(a);
end );

#############################################################################
##
#O  DelsarteCliqueBound( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallMethod( DelsarteCliqueBound, [IsList],
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
  a:=1-k/sig2;
  b:=1-k/sig1;

  eps:=eps/2;

  until Int(a)=Int(b);

  return Int(a);
end );

#############################################################################
##
#F  CliqueAdjacencyPolynomial( [ <v>, <k>, <l> ], x, y )
##  
InstallGlobalFunction( CliqueAdjacencyPolynomial, 
function( parms, xn, yn )
  local v,k,l,x,y;

  if not (Length(parms)=3 and ForAll(parms, IsInt))  then
    Error("usage: CliqueAdjacencyBound( [<Int>, <Int>, <Int>])");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  l:=parms[3]; 

  if not (l >= 0 and l < k and k < v) then
    Error("Input (v,k,lambda) must satisfy 0 <= lambda < k < v"); 
  fi;

  x:=Indeterminate(Rationals,xn);
  y:=Indeterminate(Rationals,yn);

  return (v-y)*x*(x+1) - 2*y*(k-y+1) + y*(y-1)*(l-y+2);

end );

#############################################################################
##
#F  CliqueAdjacencyBound( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( CliqueAdjacencyBound, 
function( parms )
    local v,k,l,a,b,c,disc,s,m,lambdas,firstbnd;

  if not (Length(parms)=3 and ForAll(parms, IsInt))  then
    Error("usage: CliqueAdjacencyBound( [<Int>, <Int>, <Int>])");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  l:=parms[3]; 

  if not (l >= 0 and l < k and k < v) then
    Error("Input (v,k,lambda) must satisfy 0 <= lambda < k < v"); 
  fi;

  m := [0,0];

  firstbnd := l+2;

  for s in [2..firstbnd] do

    m[s+1] := 0;  # For future use we always update m. 

    # Calculating the discriminant of the Block Intersection Polynomial
    a := v-s;
    b := a-2*s*(k-s+1);
    c := s*(s-1)*(l-s+2);
    disc := b*b-4*a*c;

    # If it attains no negative value, we leave this s 
    if disc <= 0 then
      continue;
    fi;

    # Here we use a costly function to find if there is an integer
    # evaluating to a negative number under the polynomial
    # May be able to improve on this for the specific case of quadratic
    lambdas := [ v - s , k - s + 1, l - s + 2 ];
 
    if not BlockIntersectionPolynomialCheck(m,lambdas) then
      return s-1;
    fi;
  od;

  return firstbnd;

end );

##TODO check this over
#############################################################################
##
#F  RegularCliqueERGParameters( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( RegularCliqueERGParameters, 
function( parms )
  local v,k,l,b,a,c,disc,s,m,sqrt,t;

  if not Length(parms)=3 then
    Error("usage: RegularCliqueERGParameters( [<Int>, <Int>, <Int>] )");
  fi;  

  v := parms[1];
  k := parms[2];
  l := parms[3];

  if not (IsInt(v) and IsInt(k) and IsInt(l)) then
    Error("usage: RegularCliqueERGParameters( [<Int>, <Int>, <Int>] )");
  fi;

  if not (l >= 0 and l < k and k < v) then
    Error("Input [v,k,lambda] must satisfy 0 <= lambda < k < v"); 
  fi;

  a := v-2*k+l;
  b := k*k+3*k-l-v*(l+2);
  c := v*(l+1-k);

  # Complete multipartite case
  if a=0 then
    t:=v-k;
    s:=v/t;
    if not (IsInt(s) and s > 0) then
      return false;
    fi;

    if l=k-1  then
      # Parameters of a complete graph
      return List([1..(v-1)],x->[x,x]);
    fi;
    return [s,s-1];
  fi;

  disc := b*b-4*a*c;

  if disc < 0 then
    return false;
  fi;

  sqrt := Sqrt(disc);
  s := (-b+sqrt)/(2*a);

  if not IsInt(s) then
    return false;
  fi;

  a := v-s;
  b := -a;
  c := -s*(s-1)*(l-s+2);

  disc := b*b-4*a*c;

  if disc < 0 then
    return false;
  fi;

  sqrt := Sqrt(disc);
  m := (-b+sqrt)/(2*a);

  if not IsInt(m) then
    return false;
  fi;
 
  return [s,m];
end );


#############################################################################
##
#F  IsFeasibleRegularCliqueERGParameters( [ <v>, <k>, <l> ] )
##  
InstallGlobalFunction( IsFeasibleRegularCliqueERGParameters, 
function( parms )
  if RegularCliqueERGParameters(parms)=false then
    return false;
  fi;
  return true;
end );

#############################################################################
##
#F  RegularAdjacencyPolynomial( [ <v>, <k>, <lambda>, <mu> ], x, y, d )
##  
InstallGlobalFunction( RegularAdjacencyPolynomial, 
function( parms, xn, yn, dn )
   local v,k,l,m,x,y,d;

  if not IsFeasibleSRGParameters(parms) then
    Error("Input (v,k,lambda) must satisfy 0 <= lambda < k < v"); 
  fi;

  v:=parms[1]; 
  k:=parms[2];
  l:=parms[3]; 
  m:=parms[4];
  
  x:=Indeterminate(Rationals,xn);
  y:=Indeterminate(Rationals,yn);
  d:=Indeterminate(Rationals,dn);

  return (v-y)*x*(x+1) - 2*x*k + (2*x+l-m+1)*y*d + y*(y-1)*m - y*d*d;

end );

#############################################################################
##
#F  RegularAdjacencyBounds( [ <v>, <k>, <lambda>, <mu> ], d )
##  
InstallGlobalFunction( RegularAdjacencyBounds, 
function( parms , d )
    local v,k,l,mu,s,m,lambdas,flbnd,fubnd,lam2;

  if not IsFeasibleSRGParameters(parms) then
    Error("usage: RegularAdjacencyBounds( [<Int>, <Int>, <Int>, <Int>] , <Int>)");
  fi;

  v:=parms[1]; 
  k:=parms[2];
  l:=parms[3]; 
  mu:=parms[4];

  m := [0,0];

  flbnd:=d+1;
  fubnd:=v;

  for s in [2..v] do

    m[s+1] := 0;  # For future use we always update m. 

    lam2 := mu + (((l - mu + 1) - d)*d)/(s-1);
    if lam2 < 0 then
      continue;
    fi;

    # Here we use a costly function to find if there is an integer
    # evaluating to a negative number under the polynomial
    # May be able to improve on this for the specific case of quadratic
    lambdas := [ v - s , k - d, lam2 ];
 
    if BlockIntersectionPolynomialCheck(m,lambdas) then
      flbnd:= s;
      break;
    fi;
  od;

  for s in Reversed([2..v]) do

    m:=ListWithIdenticalEntries(s+1,0);  # For future use we always update m. 

    lam2 := mu + (((l - mu + 1) - d)*d)/(s-1);
    if lam2 < 0 then
      continue;
    fi;

    # Here we use a costly function to find if there is an integer
    # evaluating to a negative number under the polynomial
    # May be able to improve on this for the specific case of quadratic
    lambdas := [ v - s , k - d, lam2 ];
 
    if BlockIntersectionPolynomialCheck(m,lambdas) then
      fubnd:= s;
      break;
    fi;
  od;

  return [flbnd,fubnd];

end );

#############################################################################
##
#F  IsFeasibleRegularSetSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsFeasibleRegularSetSRGParameters, 
function( parms, d )
   local b,a,c,disc,v,k,l,mu,s,m,firstbnd,mslist,sqrt,roots;

  if not IsFeasibleSRGParameters(parms) then
    Error("usage: IsFeasibleRegularSetSRGParameters([ <Int>, <Int>, <Int>, <Int>] , d)");
  fi;

  v:=parms[1];
  k:=parms[2];
  l:=parms[3];
  mu:=parms[4];

  if not (d >= 0 and d <= k) then
    Error("Input (v,k,lambda,mu,d) must satisfy 0 <= lambda < k < v, 0 <= d <= k "); 
  fi;

  mslist:=[];

  for s in [2..v] do

    # Calculating the discriminant of the Block Intersection Polynomial
    a := v-s;
    b := a-2*s*(k-d);
    c := s*((s-1)*mu + (l-mu+1)*d - d*d);
    disc := b*b-4*a*c;

    if (disc > 0) then

      sqrt := RootInt(disc);
     
      # We need 2 integer zeros which differ by exactly 1
      if (not a = 0) and (disc = sqrt*sqrt) and (sqrt = a) then
      
        roots := [(-b+sqrt)/(2*a),(-b-sqrt)/(2*a)];
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
#E

