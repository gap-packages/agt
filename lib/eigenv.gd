#############################################################################
##
#W  eigenv.gd            Algebraic Graph Theory package        Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving eigenvalues of graphs.
##


#############################################################################
##
#O  LeastEigenvalueInterval( <gamma> , <eps> )
#O  LeastEigenvalueInterval( <parms> , <eps> )
##  
##  <#GAPDoc Label="LeastEigenvalueInterval">
##  <ManSection>
##  <Oper Name="LeastEigenvalueInterval"
##   Arg="gamma, eps"/>
##  <Oper Name="LeastEigenvalueInterval"
##   Arg="parms, eps" Label="for SRG parameters"/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and rational number <A>eps</A>, this function 
##  returns an interval containing the least eigenvalue of <A>gamma</A>.
##  <P/>
##  Given feasible strongly regular graph parameters <A>parms</A> and rational 
##  number <A>eps</A>, this function returns an interval containing the least
##  eigenvalue of a strongly regular graph with parameters <A>parms</A>. 
##  <P/>
##  The interval returned is in the form of a list, <A>[y,z]</A> of rationals 
##  <M><A>y</A>\leq <A>z</A></M> with the property that
##  <M><A>z</A>-<A>y</A>\leq <A>eps</A></M>. If the eigenvalue is rational this 
##  function will return a list <A>[y,z]</A>, where <M><A>y</A>=<A>z</A></M>.  
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
##gap> LeastEigenvalueInterval(gamma,1/10);            
##[ -13/8, -25/16 ]
##gap> parms:=SRGParameters(gamma);
##[ 5, 2, 0, 1 ]
##gap> LeastEigenvalueInterval(parms,1/10);         
##[ -13/8, -25/16 ]
##gap> LeastEigenvalueInterval(JohnsonGraph(7,3),1/20);
##[ -3, -3 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "LeastEigenvalueInterval", [IsRecord, IsRat] );
DeclareOperation( "LeastEigenvalueInterval",  [IsList, IsRat]  );

#############################################################################
##
#O  SecondEigenvalueInterval( <gamma> , <eps> )
#O  SecondEigenvalueInterval( <parms> , <eps> )
##  
##  <#GAPDoc Label="SecondEigenvalueInterval">
##  <ManSection>
##  <Oper Name="SecondEigenvalueInterval"
##   Arg="gamma, eps"/>
##  <Oper Name="SecondEigenvalueInterval"
##   Arg="parms, eps" Label="for SRG parameters"/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given a regular graph <A>gamma</A> and rational number <A>eps</A>, this
##  function returns an interval containing the second largest eigenvalue
##  of <A>gamma</A>. 
##  <P/>
##  Given feasible strongly regular graph parameters <A>parms</A> and 
##  rational number <A>eps</A>, this function returns an interval containing
##  the second largest  eigenvalue of a strongly regular graph with 
##  parameters <A>parms</A>. 
##  <P/>
##  The interval returned is in the form of a list, <A>[y,z]</A> of rationals 
##  <M><A>y</A>\leq <A>z</A></M> with the property that 
##  <M><A>z</A>-<A>y</A>\leq <A>eps</A></M>. If the eigenvalue is rational this
##  function will return a list <A>[y,z]</A>, where 
##  <M><A>y</A>=<A>z</A></M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
##gap> SecondEigenvalueInterval(gamma,1/10);           
##[ 9/16, 5/8 ]
##gap> parms:=SRGParameters(gamma);
##[ 5, 2, 0, 1 ]
##gap> SecondEigenvalueInterval(parms,1/10);           
##[ 9/16, 5/8 ]
##gap> SecondEigenvalueInterval(JohnsonGraph(7,3),1/20);
##[ 5, 5 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "SecondEigenvalueInterval" , [IsRecord, IsRat]);
DeclareOperation( "SecondEigenvalueInterval" , [IsList, IsRat] );

#############################################################################
##
#F  LeastEigenvalueFromSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="LeastEigenvalueFromSRGParameters">
##  <ManSection>
##  <Func Name="LeastEigenvalueFromSRGParameters"
##   Arg='[ v, k, a, b ]'/>
##  <Returns>An integer or an element of a cyclotomic field.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>[v, k, a, b]</A> 
##  this function returns the least eigenvalue of a strongly regular graph
##  with parameters <M>(<A>v,k,a,b</A>)</M>. If the eigenvalue is integer, the 
##  object returned is an integer. If the eigenvalue is irrational, the object
##  returned lies in a cyclotomic field.
##    <Example>
##      <![CDATA[
##gap> LeastEigenvalueFromSRGParameters([5,2,0,1]); 
##E(5)^2+E(5)^3
##gap> LeastEigenvalueFromSRGParameters([10,3,0,1]);
##-2
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "LeastEigenvalueFromSRGParameters" );

#############################################################################
##
#F  SecondEigenvalueFromSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="SecondEigenvalueFromSRGParameters">
##  <ManSection>
##  <Func Name="SecondEigenvalueFromSRGParameters"
##   Arg='[ v, k, a, b ]'/>
##  <Returns>An integer or an element of a cyclotomic field.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>[v, k, a, b]</A>, 
##  this function returns the second largest eigenvalue of a strongly 
##  regular graph with parameters <M>(<A>v,k,a,b</A>)</M>. If the eigenvalue is
##  integer, the object returned is an integer. If the eigenvalue is 
##  irrational, the object returned lies in a cyclotomic field.
##    <Example>
##      <![CDATA[
##gap> SecondEigenvalueFromSRGParameters([5,2,0,1]);
##E(5)+E(5)^4
##gap> SecondEigenvalueFromSRGParameters([10,3,0,1]);
##1
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SecondEigenvalueFromSRGParameters" );

#############################################################################
##
#O  LeastEigenvalueMultiplicity( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="LeastEigenvalueMultiplicity">
##  <ManSection>
##  <Oper Name="LeastEigenvalueMultiplicity"
##   Arg='[ v, k, a, b ]'/>
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>[v, k, a, b]</A> 
##  this function returns the multiplicity of the least eigenvalue of a 
##  strongly regular graph with parameters <M>(<A>v,k,a,b</A>)</M>.
##    <Example>
##      <![CDATA[
##gap> LeastEigenvalueMultiplicity([16,9,4,6]); 
##6
##gap> LeastEigenvalueMultiplicity([25,12,5,6]);
##12
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "LeastEigenvalueMultiplicity" , [IsList] );

#############################################################################
##
#O  SecondEigenvalueMultiplicity( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="SecondEigenvalueMultiplicity">
##  <ManSection>
##  <Oper Name="SecondEigenvalueMultiplicity"
##   Arg='[ v, k, a, b ]'/>
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>[v, k, a, b]</A> 
##  this function returns the multiplicity of the second eigenvalue of a 
##  strongly regular graph with parameters <M>(<A>v,k,a,b</A>)</M>.
##    <Example>
##      <![CDATA[
##gap> SecondEigenvalueMultiplicity([16,9,4,6]); 
##9
##gap> SecondEigenvalueMultiplicity([25,12,5,6]);
##12
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "SecondEigenvalueMultiplicity", [IsList] );

#############################################################################
##
#E
