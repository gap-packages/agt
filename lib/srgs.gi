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
  local v,edges,orbs,reps,e,x,y,adjx,adjy,k,lambda;
  
  if not IsGraph(gamma) then 
    Error("usage: EdgeRegularGraphParameters( <Graph> )");
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
#F  IsFeasibleERGParameters( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( IsFeasibleERGParameters,
function( parms )
  local v,k,lambda;

  # Length exactly 3
  if not Length(parms)=3 then
    return false;
  fi;
 
  v:=parms[1]; 
  k:=parms[2];
  lambda:= parms[3];

  # Parameters are always integer
  if not (IsInt(v) and IsInt(k) and IsInt(lambda)) then
    return false;
  fi;

  # No graphs without vertices or edges
  if v=0 or k=0 then
    return false;
  fi;

  # Basic bounds relating the parameters
  if not (lambda >=0 and k>lambda and v>k) then
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

  # Simple counting argument force the following inequality
  if not (v-2*k+lambda>=0) then
   return false;    
  fi;

  return true;

end );

#############################################################################
##
#F  StronglyRegularGraphParameters( <gamma> )
##  
InstallGlobalFunction( StronglyRegularGraphParameters,
function(gamma)
local v,k,lambda,mu,eparms,cparms;

  v:=gamma.order;
  if not IsGraph(gamma) then 
    Error("usage: StronglyRegularGraphParameters( <Graph> )");
  fi;

  eparms := EdgeRegularGraphParameters(gamma);
  
  if eparms=false then
    return false;
  fi;

  cparms := EdgeRegularGraphParameters(ComplementGraph(gamma));

  if cparms=false then
    return false;
  fi;

  Add(eparms,v-2*cparms[2]+cparms[3]);

  return eparms;
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





TODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODOTODO
#############################################################################
##
#F  FeasibleSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( FeasibleSRGParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );




#############################################################################
##
#F  IsFeasibleSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallMethod( IsFeasibleSRGParameters, "list", [IsList],
function( parms )
  local v,k,lambda,mu,disc,sqrt,m1;

  # Length exactly 4
  if not Length(parms)=4 then
    return false;
  fi;
 
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

  # Simple counting arguments force the following equality
  if not (v-k-1)*mu=k*(k-lambda-1) then
   return false;    
  fi;

  # Simple counting arguments force the following inequalities
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
#F  IsTypeIParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsTypeIParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  IsTypeIIParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( IsTypeIIParameters, 
function( str )
    local   pieces,  start,  i;

    pieces := [];    
    return pieces;
end );

#############################################################################
##
#F  ComplementParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( ComplementParameters, 
function( parms )

  if not IsFeasibleSRGParameters(parms) then
    Error("[<v>,<k>,<lambda>,<mu>] is not a feasible parameter tuple");
  fi;    

  return [parms[1],
          parms[1]-parms[2]-1,
          parms[1]-2-2*parms[2]+parms[4],
          parms[1]-2*parms[2]+parms[3]];
end );

#############################################################################
##
#F  SRGToGlobalParameters( [ <v>, <k>, <lambda>, <mu> ] )
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
  local v,k,lambda,mu;  

  if (not Length(parms) = 3) or ForAny(parms, x-> -1 in x) then
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
#O  LeastEigenvalueInterval( [ <v>, <k>, <lambda>, <mu> ] , <eps> )
##  
InstallMethod( LeastEigenvalueInterval, "tuple", [IsList,IsRat], 
function( parms , eps )
  local k,chi,sigma,x;

  if not IsFeasibleSRGParameters(parms) then
    #Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
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

  if not IsRegularGraph(gamma) then
    #Error("<gamma> must be a grape graph");
    TryNextMethod();
  fi;
  
  return -1-Reversed(LeastEigenvalueInterval(ComplementGraph(gamma),eps));
end );

#############################################################################
##
#F  SecondEigenvalueInterval( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallMethod( SecondEigenvalueInterval, "tuple", [IsList, IsRat], 
function( parms, eps )
  if not IsFeasibleSRGParameters(parms) then
    #Error("<gamma> must be a grape graph");
    TryNextMethod();
  fi;
  
  return -1-Reversed(LeastEigenvalueInterval(ComplementParameters(parms),eps));
end );

#############################################################################
##
#F  LeastEigenvalueFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( LeastEigenvalueFromSRGParameters, 
function( parms )
  local v,k,l,m,disc,sqrt,s;

  if not IsFeasibleSRGParameters(parms) then
    Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
    #TryNextMethod();
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
#F  SecondEigenvalueFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( SecondEigenvalueFromSRGParameters, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
    #TryNextMethod();
  fi;

  return parms[3]-parms[4]-LeastEigenvalueFromSRGParameters(parms);
end );

#############################################################################
##
#F  LeastEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( LeastEigenvalueMultiplicityFromSRGParameters, 
function( parms )
  local v,k,l,m,disc,sqrt,f;

  if not IsFeasibleSRGParameters(parms) then
    Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
    #TryNextMethod();
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
#F  SecondEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallGlobalFunction( SecondEigenvalueMultiplicityFromSRGParameters, 
function( parms )
  local v,k,l,m,disc,sqrt,f;

  if not IsFeasibleSRGParameters(parms) then
    Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
    #TryNextMethod();
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
#F  KreinParameters( [ <v>, <k>, <lamda>, <mu>] )
##  
InstallGlobalFunction( KreinParameters, 
function( parms )
  local k,r,s,K;

  if not IsFeasibleSRGParameters(parms) then
    Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
    #TryNextMethod();
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
#F  KreinConditionsCheck( parms )
##  
InstallGlobalFunction( KreinConditionsCheck, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
    #TryNextMethod();
  fi;
  ##################Type check???????????????
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
    Error("[ <v>, <k>, <lambda>, <mu> ] must be a feasible SRG parameter set");
    #TryNextMethod();
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
#O  HoffmanCocliqueBound( [ <v>, <k>, <lambda>, <mu> ] )
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
#F  HoffmanCliqueBound( <gamma> )
##  
InstallMethod( HoffmanCliqueBound, [IsRecord], 
function( gamma )
  return HoffmanCocliqueBound(ComplementGraph(gamma));
end );

#############################################################################
##
#F  HoffmanCliqueBound( [ <v>, <k>, <lambda>, <mu> ] )
##  
InstallMethod( HoffmanCliqueBound, [IsList],
function( parms )
  return HoffmanCocliqueBound(ComplementParameters(parms));
end );

#############################################################################
##
#F  DelsarteCliqueBound( <gamma> )
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
#F  DelsarteCliqueBound( [ <v>, <k>, <lambda>, <mu> ] )
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
#F  CliqueAdjacencyPolynomial( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( CliqueAdjacencyPolynomial, 
function( parms )
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

  x:=Indeterminate(Rationals,"x");
  y:=Indeterminate(Rationals,"y");

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

#############################################################################
##
#F  RegularCliqueERGParameters( [ <v>, <k>, <lambda> ] )
##  
InstallGlobalFunction( RegularCliqueERGParameters, 
function( parms )
  local v,k,l,b,a,c,disc,s,m,sqrt;


  ############# Make feasible ERGs function?
  if not (IsInt(v) and IsInt(k) and IsInt(l)) then
    Error("usage: RegularCliqueFeasabilityList( <Int>, <Int>, <Int>)");
  fi;

  if not (l >= 0 and l < k and k < v) then
    Error("Input (v,k,lambda) must satisfy 0 <= lambda < k < v"); 
  fi;

  v := parms[1];
  k := parms[2];
  l := parms[3];

  a := v-2*k+l;
  b := k*k+3*k-l-v*(l+2);
  c := v*(l+1-k);

  if a=0 then
    if b=0 then
    ###############Fill in depending on ERG feasability checking
    fi;
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
#F  IsFeasibleQuasiRegularSetSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
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

