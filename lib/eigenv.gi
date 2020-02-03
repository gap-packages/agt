#############################################################################
##
#W  eigenv.gi          Algebraic Graph Theory package         Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions involving eigenvalues of graphs. 
##


#############################################################################
##
#O  LeastEigenvalueInterval( <gamma> , <eps> )
##  
InstallMethod( LeastEigenvalueInterval, "graph", [IsRecord,IsRat],
function( gamma , eps )
  local k,chi,sigma,G,sze;

  if not IsGraph(gamma) then
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
#O  LeastEigenvalueInterval( <parms> , <eps> )
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
#O  SecondEigenvalueInterval( <parms>, <eps> )
##  
InstallMethod( SecondEigenvalueInterval, "tuple", [IsList, IsRat], 
function( parms, eps )
  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  if parms[4]=0 then
    return [parms[2],parms[2]];
  fi;
  
  return -1-Reversed(LeastEigenvalueInterval(ComplementSRGParameters(parms),eps));
end );

#############################################################################
##
#F  LeastEigenvalueFromSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( LeastEigenvalueFromSRGParameters, 
function( parms )
  local v,k,a,b,disc,sqrt,s;

  if not IsFeasibleSRGParameters(parms) then
    Error("usage: LeastEigenvalueFromSRGParameters( <parms> ), where <parms> is a \n \
           feasible strongly regular graph parameter tuple");
  fi;

  v:=parms[1];
  k:=parms[2];
  a:=parms[3];
  b:=parms[4];

  disc:=(a-b)*(a-b)+4*(k-b);
  sqrt:=Sqrt(disc);
  
  s:=(a-b-sqrt)/2;  

  return s;
end );

#############################################################################
##
#F  SecondEigenvalueFromSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
InstallGlobalFunction( SecondEigenvalueFromSRGParameters, 
function( parms )
  if not IsFeasibleSRGParameters(parms) then
    Error("usage: SecondEigenvalueFromSRGParameters( <parms> ), where <parms> is a \n \
           feasible strongly regular graph parameter tuple");
  fi;

  return parms[3]-parms[4]-LeastEigenvalueFromSRGParameters(parms);
end );

#############################################################################
##
#O  LeastEigenvalueMultiplicity( [ <v>, <k>, <a>, <b> ] )
##  
InstallMethod( LeastEigenvalueMultiplicity, "SRG tuple", [IsList],
function( parms )
  local v,k,a,b,disc,sqrt,f;

  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  v:=parms[1];
  k:=parms[2];
  a:=parms[3];
  b:=parms[4];

  disc:=(a-b)*(a-b)+4*(k-b);
  sqrt:=Sqrt(disc);
  
  f:= (v-1+((v-1)*(a-b)+2*k)/sqrt)/2;

  return f;  
end );

#############################################################################
##
#O  SecondEigenvalueMultiplicity( [ <v>, <k>, <a>, <b> ] )
##  
InstallMethod( SecondEigenvalueMultiplicity, "SRG tuple", [IsList], 
function( parms )
  local v,k,a,b,disc,sqrt,f;

  if not IsFeasibleSRGParameters(parms) then
    TryNextMethod();
  fi;

  v:=parms[1];
  k:=parms[2];
  a:=parms[3];
  b:=parms[4];

  disc:=(a-b)*(a-b)+4*(k-b);
  sqrt:=Sqrt(disc);
  
  f:= (v-1-((v-1)*(a-b)+2*k)/sqrt)/2;

  return f;
end );

#############################################################################
##
#E

