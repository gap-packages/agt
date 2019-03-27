#############################################################################
##
#W  srgs.gd           Strongly regular graph library               Rhys Evans
##
##
#Y  Copyright (C) ????????????????????????????????????TODO
##
##  Explanation of file????????????????????????????????????TODO
##

#############################################################################
##
#F  EdgeRegularGraphParameters( <gamma> )
##  
##  <#GAPDoc Label="EdgeRegularGraphParameters">
##  <ManSection>
##  <Func Name="EdgeRegularGraphParameters"
##   Arg='gamma'/>
##
##  <Description>
##  If the graph <A>gamma</A> is edge-regular, this function returns the 
##  edge-regular graph parameters of <A>gamma</A>. Otherwise, it returns
##  false.
##    <Example>
##      <![CDATA[
##gap> gamma:=NullGraph(Group(()),5);;
##gap> EdgeRegularGraphParameters(gamma);
##false
##gap> gamma:=JohnsonGraph(7,3);;
##gap> EdgeRegularGraphParameters(gamma);
##[ 35, 12, 5 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "EdgeRegularGraphParameters" );

#############################################################################
##
#F  IsEdgeRegularGraph( <gamma> )
##  
##  <#GAPDoc Label="IsEdgeRegularGraph">
##  <ManSection>
##  <Func Name="IsEdgeRegularGraph"
##   Arg='gamma'/>
##
##  <Description>
##  This function returns true if the graph <A>gamma</A> is an edge-regular
##  graph, and false otherwise.
##    <Example>
##      <![CDATA[
##gap> gamma:=NullGraph(Group(()),5);;
##gap> IsEdgeRegularGraph(gamma);
##false
##gap> gamma:=JohnsonGraph(7,3);;
##gap> IsEdgeRegularGraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsEdgeRegularGraph" );

#############################################################################
##
#F  IsFeasibleERGParameters( [ <v>, <k>, <l> ] )
##  
##  <#GAPDoc Label="IsFeasibleERGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleERGParameters"
##   Arg='[ v, k, l ]'/>
##
##  <Description>
##  This function returns true if <M>( v, k, l )</M> is a feasible
##  parameter tuple for a edge-regular graph, according to the following 
##  well known necessary conditions;
##  <List>
##  <Item><M>v,k,l</M> are integers.</Item> 
##  <Item><M>v>k>l\geq 0</M></Item>
##  <Item><M>2</M> divides <M>vk</M> and <M>kl</M>, and <M>6</M> 
##        divides <M>vkl</M>.</Item>
##  <Item><M>v-2k+l \geq 0</M></Item>
##  </List> 
##  Otherwise, it returns false.
##    <Example>
##      <![CDATA[
##gap> IsFeasibleERGParameters([15,9,6]);
##false
##gap> IsFeasibleERGParameters([16,9,4]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleERGParameters" );

#############################################################################
##
#F  StronglyRegularGraphParameters( <gamma> )
##  
##  <#GAPDoc Label="StronglyRegularGraphParameters">
##  <ManSection>
##  <Func Name="StronglyRegularGraphParameters"
##   Arg='gamma'/>
##
##  <Description>
##  If the graph <A>gamma</A> is strongly regular, this function returns  
##  the strongly regular graph parameters of <A>gamma</A>. Otherwise, it 
##  returns false.
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteGraph(Group(()),5);;
##gap> StronglyRegularGraphParameters(gamma);
##false
##gap> gamma:=JohnsonGraph(5,3);;            
##gap> StronglyRegularGraphParameters(gamma);
##[ 10, 6, 3, 4 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraphParameters" );

#############################################################################
##
#F  IsStronglyRegularGraph( <gamma> )
##  
##  <#GAPDoc Label="IsStronglyRegularGraph">
##  <ManSection>
##  <Func Name="IsStronglyRegularGraph"
##   Arg='gamma'/>
##
##  <Description>
##  This function returns true if the graph <A>gamma</A> is a strongly
##  regular graph, and false otherwise.
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteGraph(Group(()),5);;
##gap> IsStronglyRegularGraph(gamma);
##false
##gap> gamma:=JohnsonGraph(5,3);;         
##gap> IsStronglyRegularGraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsStronglyRegularGraph" );

#############################################################################
##
#F  IsFeasibleSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsFeasibleSRGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  This function returns true if <M>( v, k, l, m )</M> is a feasible
##  parameter tuple for a strongly regular graph, according to the following 
##  well known necessary conditions;
##  <List>
##  <Item><M>v,k,l,m</M> are integers.</Item> 
##  <Item><M>v>k>l\geq 0,k\geq m</M></Item>
##  <Item><M>2</M> divides <M>vk</M> and <M>kl</M>, and <M>6</M> 
##        divides <M>vkl</M>.</Item>
##  <Item><M>(v-k-1)m = k(k-l -1).</M></Item>
##  <Item><M>v-2k+l \geq 0</M> and <M>v-2-2k+m \geq 0</M>.</Item>
##  <Item>The formulae for the multiplicities of the eigenvalues of a strongly
##        regular graph with these parameters must be integer.</Item>
##  </List> 
##  Otherwise, it returns false. 
##    <Example>
##      <![CDATA[
##gap> IsFeasibleSRGParameters([15,9,4,7]);
##false
##gap> IsFeasibleSRGParameters([10,3,0,1]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleSRGParameters" );

#############################################################################
##
#F  IsPrimitiveSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsPrimitiveSRGParameters">
##  <ManSection>
##  <Func Name="IsPrimitiveSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  This function returns true if a strongly regular graph with parameters
##  <M>( v, k, l, m )</M> is primitive. Otherwise, it returns false.  
##    <Example>
##      <![CDATA[
##gap> IsFeasibleSRGParameters([8,6,4,6]); 
##true
##gap> IsPrimitiveSRGParameters([8,6,4,6]);
##false
##gap> IsPrimitiveSRGParameters([10,6,3,4]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsPrimitiveSRGParameters" );

#############################################################################
##
#F  IsTypeIParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsTypeIParameters">
##  <ManSection>
##  <Func Name="IsTypeIParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  This function returns true if a strongly regular graph with parameters
##  <M>( v, k, l, m )</M> is of type I. Otherwise, it returns false.
##    <Example>
##      <![CDATA[
##gap> IsTypeIParameters([5,2,0,1]);                              
##true
##gap> IsTypeIParameters([9,4,1,2]);
##true
##gap> IsTypeIParameters([10,3,0,1]); 
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsTypeIParameters" );
#############################################################################
##
#F  IsTypeIIParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsTypeIIParameters">
##  <ManSection>
##  <Func Name="IsTypeIIParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  This function returns true a strongly regular graph with parameters
##  <M>( v, k, l, m )</M> is of type II. Otherwise, it returns false.
##    <Example>
##      <![CDATA[
##gap> IsTypeIIParameters([5,2,0,1]); 
##false
##gap> IsTypeIIParameters([9,4,1,2]); 
##true
##gap> IsTypeIIParameters([10,3,0,1]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsTypeIIParameters" );

#############################################################################
##
#F  ComplementParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="ComplementParameters">
##  <ManSection>
##  <Func Name="ComplementParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If <M>( v, k, l, m )</M> is a feasible strongly regular parameter tuple,
##  this function returns the complementary parameter tuple. Therefore, a
##  graph with parameters <M>( v, k, l, m )</M> exists if and only if there
##  exists a graph with parameters <C>ComplementParameters([v,k,l,m])</C>.
##  If <M>( v, k, l, m )</M> is not feasible, it returns false.
##    <Example>
##      <![CDATA[
##gap> ComplementParameters([15,9,7,3]);
##false
##gap> ComplementParameters([16,9,4,6]);
##[ 16, 6, 2, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ComplementParameters" );

#############################################################################
##
#F  SRGToGlobalParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="SRGToGlobalParameters">
##  <ManSection>
##  <Func Name="SRGToGlobalParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If <M>( v, k, l, m )</M> is a feasible strongly regular parameter 
##  tuple, this function returns the global parameters of the graph. 
##  Otherwise, it returns false.
##    <Example>
##      <![CDATA[
##gap> SRGToGlobalParameters([20,7,3,8]);
##false
##gap> SRGToGlobalParameters([50,7,0,1]);
##[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 1, 6, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SRGToGlobalParameters" );

#############################################################################
##
#F  GlobalToSRGParameters( <parms> )
##  
##  <#GAPDoc Label="GlobalToSRGParameters">
##  <ManSection>
##  <Func Name="GlobalToSRGParameters"
##   Arg='parms'/>
##
##  <Description>
##  If <C>parms</C> is the global parameters of a primitive strongly regular
##  graph, this function returns the corresponding strongly regular graph
##  parameters. Otherwise, it returns false.
##    <Example>
##      <![CDATA[
##gap> parms:=GlobalParameters(JohnsonGraph(7,3));
##[ [ 0, 0, 12 ], [ 1, 5, 6 ], [ 4, 6, 2 ], [ 9, 3, 0 ] ]
##gap> GlobalToSRGParameters(parms);
##false
##gap> parms:=GlobalParameters(JohnsonGraph(5,3));
##[ [ 0, 0, 6 ], [ 1, 3, 2 ], [ 4, 2, 0 ] ]
##gap> GlobalToSRGParameters(parms);              
##[ 10, 6, 3, 4 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GlobalToSRGParameters" );

#############################################################################
##
#O  LeastEigenvalueInterval( <gamma> , <eps> )
##  
##  <#GAPDoc Label="LeastEigenvalueInterval">
##  <ManSection>
##  <Oper Name="LeastEigenvalueInterval"
##   Arg="gamma, eps"/>
##  <Oper Name="LeastEigenvalueInterval"
##   Arg="list, eps" Label="for SRG parameters"/>
##
##  <Description>
##  This function returns an interval containing the least eigenvalue of a
##  graph. The interval <M>[a,b]</M> returned by this function  will have
##  length <M>b-a\leq eps</M>. If the eigenvalue is rational, then this 
##  function will return an interval of length 0.
##  <P/>
##  Given a graph <C>gamma</C>, this function returns an interval containing
##  the least eigenvalue of <C>gamma</C>.
##  <P/>
##  Given a list <C>list</C>, this function will check if <C>list</C> is a
##  feasible strongly regular graph parameter tuple. If so, this function 
##  returns an interval containing the least eigenvalue of a strongly 
##  regular graph with parameters <C>list</C>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
##gap> LeastEigenvalueInterval(gamma,1/10);            
##[ -13/8, -25/16 ]
##gap> parms:=StronglyRegularGraphParameters(gamma);
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
##  
##  <#GAPDoc Label="SecondEigenvalueInterval">
##  <ManSection>
##  <Oper Name="SecondEigenvalueInterval"
##   Arg="gamma, eps"/>
##  <Oper Name="SecondEigenvalueInterval"
##   Arg="list, eps" Label="for SRG parameters"/>
##
##  <Description>
##  This function returns an interval containing the second largest 
##  eigenvalue of a regular graph. The interval <M>[a,b]</M> returned by 
##  this function  will have length <M>b-a\leq eps</M>. If the eigenvalue is
##  rational, then this function will return an interval of length 0.
##  <P/>
##  Given a graph <C>gamma</C>, this function returns an interval containing
##  the second largest eigenvalue of <C>gamma</C>.
##  <P/>
##  Given a list <C>list</C>, this function will check if <C>list</C> is a
##  feasible strongly regular graph parameter tuple. If so, this function 
##  returns an interval containing the second largest eigenvalue of a strongly 
##  regular graph with parameters <C>list</C>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
##gap> SecondEigenvalueInterval(gamma,1/10);           
##[ 9/16, 5/8 ]
##gap> parms:=StronglyRegularGraphParameters(gamma);
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
#F  LeastEigenvalueFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="LeastEigenvalueFromSRGParameters">
##  <ManSection>
##  <Func Name="LeastEigenvalueFromSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If the parameters <M>(v,k,l,m)</M> are feasible strongly regular graph 
##  parameters, this function returns the least eigenvalue of a strongly 
##  regular graph with these parameters. Otherwise, it returns false. 
##  <P/>
##  If the eigenvalue is integer, the object returned is an integer. If the
##  eigenvalue is irrational, the object returned lies in a cyclotomic field.
##    <Example>
##      <![CDATA[
##gap> LeastEigenvalueFromSRGParameters([20,7,3,1]);
##false
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
#F  SecondEigenvalueFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="SecondEigenvalueFromSRGParameters">
##  <ManSection>
##  <Func Name="SecondEigenvalueFromSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If the parameters <M>(v,k,l,m)</M> are feasible strongly regular graph 
##  parameters, this function returns the second largest eigenvalue of a 
## strongly regular graph with these parameters. Otherwise, it returns false. 
##  <P/>
##  If the eigenvalue is integer, the object returned is an integer. If the
##  eigenvalue is irrational, the object returned lies in a cyclotomic field.
##    <Example>
##      <![CDATA[
##gap> SecondEigenvalueFromSRGParameters([20,7,3,1]);
##false
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
#F  LeastEigenvaluemultiplicityFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="LeastEigenvalueMultiplicityFromSRGParameters">
##  <ManSection>
##  <Func Name="LeastEigenvalueMultiplicityFromSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If the parameters <M>(v,k,l,m)</M> are feasible strongly regular graph 
##  parameters, this function returns the multiplicity of the least
##  eigenvalue of a strongly regular graph with these parameters. Otherwise,
##  it returns false. 
##    <Example>
##      <![CDATA[
##gap> LeastEigenvalueMultiplicityFromSRGParameters([22,15,4,6]);
##false
##gap> LeastEigenvalueMultiplicityFromSRGParameters([16,9,4,6]); 
##6
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "LeastEigenvalueMultiplicityFromSRGParameters" );

#############################################################################
##
#F  SecondEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="SecondEigenvalueMultiplicityFromSRGParameters">
##  <ManSection>
##  <Func Name="SecondEigenvalueMultiplicityFromSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If the parameters <M>(v,k,l,m)</M> are feasible strongly regular graph 
##  parameters, this function returns the multiplicity of the second largest
##  eigenvalue of a strongly regular graph with these parameters. Otherwise,
##  it returns false. 
##    <Example>
##      <![CDATA[
##gap> SecondEigenvalueMultiplicityFromSRGParameters([22,15,4,6]);
##false
##gap> SecondEigenvalueMultiplicityFromSRGParameters([16,9,4,6]); 
##9
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SecondEigenvalueMultiplicityFromSRGParameters" );

#############################################################################
##
#F  KreinParameters( [ v, k, l, m ] )
##  
##  <#GAPDoc Label="KreinParameters">
##  <ManSection>
##  <Func Name="KreinParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If the parameters <M>(v,k,l,m)</M> are feasible strongly regular graph 
##  parameters, this function returns a list of  (non-trivial) Krein 
##  parameters of a strongly regular graph with these parameters. Otherwise,
##  it returns false.
##  <P/>
##  If the eigenvalues of the strongly regular graph are integer, the object
##  returned is a list of integers. If the eigenvalues are irrational, the 
##  object returned could be a list of cyclotomic numbers.
##    <Example>
##      <![CDATA[
##gap> KreinParameters([14,5,3,5]);
##false
##gap> KreinParameters([13,6,2,3]);
##[ -14*E(13)-12*E(13)^2-14*E(13)^3-14*E(13)^4-12*E(13)^5-12*E(13)^6-12*E(13)^7
##     -12*E(13)^8-14*E(13)^9-14*E(13)^10-12*E(13)^11-14*E(13)^12, 
##  -12*E(13)-14*E(13)^2-12*E(13)^3-12*E(13)^4-14*E(13)^5-14*E(13)^6-14*E(13)^7
##     -14*E(13)^8-12*E(13)^9-12*E(13)^10-14*E(13)^11-12*E(13)^12 ]
##gap> KreinParameters([10,6,3,4]);
##[ 1, 16 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "KreinParameters" );

#############################################################################
##
#F  KreinConditionsCheck( [ v, k, l, m ] )
##  
##  <#GAPDoc Label="KreinConditionsCheck">
##  <ManSection>
##  <Func Name="KreinConditionsCheck"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If the parameters <M>(v,k,l,m)</M> are feasible strongly regular graph 
##  parameters, this function will check whether the parameters satisfy the
##  Krein conditions. Otherwise, it returns false.
##    <Example>
##      <![CDATA[
##gap> KreinConditionsCheck([13,6,3,4]);    
##false
##gap> KreinConditionsCheck([28,9,0,4]);
##false
##gap> KreinConditionsCheck([13,6,2,3]);
##true
##gap> KreinConditionsCheck([10,6,3,4]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "KreinConditionsCheck" );

#############################################################################
##
#F  AbsoluteBoundCheck( [ v, k, l, m ] )
##  
##  <#GAPDoc Label="AbsoluteBoundCheck">
##  <ManSection>
##  <Func Name="AbsoluteBoundCheck"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  If the parameters <M>(v,k,l,m)</M> are feasible strongly regular graph 
##  parameters, this function will check whether the parameters satisfy the
##  Absolute bounds. Otherwise, it returns false.
##    <Example>
##      <![CDATA[
##gap> AbsoluteBoundCheck([13,6,3,4]);
##false
##gap> AbsoluteBoundCheck([50,21,4,12]);
##false
##gap> AbsoluteBoundCheck([50,21,8,9]); 
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AbsoluteBoundCheck" );

##---------------------------------------------------------------------------------------------

#############################################################################
##
#O  HoffmanCocliqueBound( <gamma> )
##  
##  <#GAPDoc Label="HoffmanCocliqueBound">
##  <ManSection>
##  <Func Name="HoffmanCocliqueBound"
##   Arg='gamma'/>
##
##  <Description>
##  This function returns returns the Hoffman coclique bound of a graph. 
##  <P/>
##  Given a graph <C>gamma</C>, this function returns the Hoffman coclique 
##  bound of <C>gamma</C>.
##  <P/>
##  Given a list <C>list</C>, this function will check if <C>list</C> is a
##  feasible strongly regular graph parameter tuple. If so, this function 
##  returns the Hoffman coclique bound of a strongly regular graph with 
##  parameters <C>list</C>. 
##    <Example>
##      <![CDATA[
##
##      ]]>
##    </Example>
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "HoffmanCocliqueBound" , [IsRecord] );
DeclareOperation( "HoffmanCocliqueBound" , [IsList] );

#############################################################################
##
#O  HoffmanCliqueBound( <gamma> )
##  
##  <#GAPDoc Label="HoffmanCliqueBound">
##  <ManSection>
##  <Func Name="HoffmanCliqueBound"
##   Arg='gamma'/>
##
##  <Description>
##  TODO This function will calculate the Hoffman clique bound of a graph
##  blah de blah TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "HoffmanCliqueBound" , [IsRecord] );
DeclareOperation( "HoffmanCliqueBound" , [IsList] );

#############################################################################
##
#O  DelsarteCliqueBound( <gamma> )
##  
##  <#GAPDoc Label="DelsarteCliqueBound">
##  <ManSection>
##  <Func Name="DelsarteCliqueBound"
##   Arg='gamma'/>
##
##  <Description>
##  TODO This function will calculate the Delsarte clique bound of a graph
##  TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "DelsarteCliqueBound" , [IsRecord] );
DeclareOperation( "DelsarteCliqueBound" , [IsList] );
DeclareSynonym( "HoffmanColouringBound" , DelsarteCliqueBound);
DeclareSynonym( "HoffmanColoringBound" , DelsarteCliqueBound);

#############################################################################
##
#F  CliqueAdjacencyPolynomial( [ <v>, <k>, <l> ] )
##  
##  <#GAPDoc Label="CliqueAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="CliqueAdjacencyPolynomial"
##   Arg='[ v, k, l ]'/>
##
##  <Description>
##  TODO This function will return the Clique Adjacency Polynomial of a graph
##  from ERG parameters TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CliqueAdjacencyPolynomial" );

#############################################################################
##
#F  CliqueAdjacencyBound( [ <v>, <k>, <l> ] )
##  
##  <#GAPDoc Label="CliqueAdjacencyBound">
##  <ManSection>
##  <Func Name="CliqueAdjacencyBound"
##   Arg='[ v, k, l ]'/>
##
##  <Description>
##  TODO This function will return the Clique Adjacency Bound of a graph
##  from ERG parameters TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CliqueAdjacencyBound" );

#############################################################################
##
#F  RegularCliqueERGParameters( [ <v>, <k>, <l> ])
##  
##  <#GAPDoc Label="RegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="RegularCliqueERGParameters"
##   Arg='[ v, k, l ]'/>
##
##  <Description>
##  TODO This function will return size of a regular clique 
##  if an ERG with these parameters permits one, false otherwise
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularCliqueERGParameters" );

#############################################################################
##
#F  IsFeasibleRegularCliqueERGParameters( [ <v>, <k>, <l> ])
##  
##  <#GAPDoc Label="IsFeasibleRegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleRegularCliqueERGParameters"
##   Arg='[ v, k, l ]'/>
##
##  <Description>
##  TODO This function will return true if an ERG with these parameters
##  has feasible parameters for a regular clique TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleRegularCliqueERGParameters" );

#############################################################################
##
#F  IsFeasibleQuasiRegularCliqueERGParameters( [ <v>, <k>, <l> ] )
##  
##  <#GAPDoc Label="IsFeasibleQuasiRegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleQuasiRegularCliqueERGParameters"
##   Arg='[ v, k, l ]'/>
##
##  <Description>
##  TODO This function will return true if an ERG with these parameters
##  has feasible parameters for a quasi-regular clique TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleQuasiRegularCliqueERGParameters" );

#############################################################################
##
#F  RegularAdjacencyPolynomial( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="RegularAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="RegularAdjacencyPolynomial"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  TODO This function will return the Regular Adjacency Polynomial of a 
##  graph with strongly regular graph parameters TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularAdjacencyPolynomial" );

#############################################################################
##
#F  RegularAdjacencyBounds( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="RegularAdjacencyBounds">
##  <ManSection>
##  <Func Name="RegularAdjacencyBounds"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  TODO This function will return the Regular Adjacency Bounds of a 
##  graph with strongly regular graph parameters TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularAdjacencyBounds" );

#############################################################################
##
#F  IsFeasibleRegularSetSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsFeasibleRegularSetSRGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleRegularSetSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  TODO This function will return true if an SRG with these parameters
##  has feasible parameters for a regular set TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleRegularSetSRGParameters" );

#############################################################################
##
#F  IsFeasibleQuasiRegularSetSRGParameters( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsFeasibleQuasiRegularSetSRGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleQuasiRegularSetSRGParameters"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  TODO This function will return true if an ERG with these parameters
##  has feasible parameters for a quasi-regular set TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleQuasiRegularSetSRGParameters" );

#############################################################################
##
#F  BasicEdgeSwitching( <gamma> , <list1> , <list2> )
##  
##  <#GAPDoc Label="BasicEdgeSwitching">
##  <ManSection>
##  <Func Name="BasicEdgeSwitching"
##   Arg='gamma, list1, list2'/>
##
##  <Description>
##  TODO This function will switch edges relative to the vertex sets 
##  list1 and list2
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "BasicEdgeSwitching" );

#############################################################################
##
#F  GodsilMcKaySwitching( <gamma> , <partition> )
##  
##  <#GAPDoc Label="GodsilMcKaySwitching">
##  <ManSection>
##  <Func Name="GodsilMcKaySwitching"
##   Arg='gamma, partition'/>
##
##  <Description>
##  TODO This function will switch edges relative to the Godsil-McKay  
##  partition.
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GodsilMcKaySwitching" );

#############################################################################
##
#F  IsGodsilMcKayPartition( <gamma> , <partition> )
##  
##  <#GAPDoc Label="IsGodsilMcKayPartition">
##  <ManSection>
##  <Func Name="IsGodsilMcKayPartition"
##   Arg='gamma, partition'/>
##
##  <Description>
##  TODO This function will return true if the partition is a Godsil-McKay  
##  partition.
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsGodsilMcKayPartition" );

#############################################################################
##
#F  DisjointUnionOfCliques( <n1> , <n2>, ... )
##  
##  <#GAPDoc Label="DisjointUnionOfCliques">
##  <ManSection>
##  <Func Name="DisjointUnionOfCliques"
##   Arg='n1, n2, ... '/>
##
##  <Description>
##  TODO This function will return the disjoint union of cliques with sizes
##  n1, n2, ...TODO Note that the ordering of the sizes greater than 1 are
##  fixed, parts of size 1 are moved to the 'end' 
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "DisjointUnionOfCliques" );

#############################################################################
##
#F  CompleteMultipartiteGraph( <n1> , <n2>, ... )
##  
##  <#GAPDoc Label="CompleteMultipartiteGraph">
##  <ManSection>
##  <Func Name="CompleteMultipartiteGraph"
##   Arg='n1, n2, ... '/>
##
##  <Description>
##  TODO This function will return the complete multipartite graph with parts
##  of size n1, n2, ...TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CompleteMultipartiteGraph" );

#############################################################################
##
#F  TriangularGraph( <n> )
##  
##  <#GAPDoc Label="TriangularGraph">
##  <ManSection>
##  <Func Name="TriangularGraph"
##   Arg='n'/>
##
##  <Description>
##  TODO This function will return the triangular graph on n points.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "TriangularGraph" );

#############################################################################
##
#F  SquareLatticeGraph( <n> )
##  
##  <#GAPDoc Label="SquareLatticeGraph">
##  <ManSection>
##  <Func Name="SquareLatticeGraph"
##   Arg='n'/>
##
##  <Description>
##  TODO This function will return the square lattice graph on n points.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SquareLatticeGraph" );

#############################################################################
##
#F  HoffmanSingletonGraph(  )
##  
##  <#GAPDoc Label="HoffmanSingletonGraph">
##  <ManSection>
##  <Func Name="HoffmanSingletonGraph"
##   Arg=''/>
##
##  <Description>
##  TODO This function will return the Hoffman-Singleton graph. This function
##  constructs the graph through the use of a simple combinatorial 
##  description found in Brouwer [REF]TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HoffmanSingletonGraph" );

#############################################################################
##
#F  HigmanSimsGraph(  )
##  
##  <#GAPDoc Label="HigmanSimsGraph">
##  <ManSection>
##  <Func Name="HigmanSimsGraph"
##   Arg=''/>
##
##  <Description>
##  TODO This function will return the Higman-Sims graph. This function
##  constructs the graph through the use of a combinatorial 
##  description found in Brouwer [REF]TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HigmanSimsGraph" );

#############################################################################
##
#F  SimsGerwitzGraph(  )
##  
##  <#GAPDoc Label="SimsGerwitzGraph">
##  <ManSection>
##  <Func Name="SimsGerwitzGraph"
##   Arg=''/>
##
##  <Description>
##  TODO This function will return the Sims-Gerwitz graph.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SimsGerwitzGraph" );

#############################################################################
##
#F  AffinePolarGraph( <q> , <e> , <epsilon> )
##  
##  <#GAPDoc Label="AffinePolarGraph">
##  <ManSection>
##  <Func Name="AffinePolarGraph"
##   Arg='q, e, epsilon'/>
##
##  <Description>
##  TODO This function will return the Affine polar graph over <M>F_{q}</M>
##  of dimension <M>2e</M> with type <M>\epsilon</M>.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AffinePolarGraph" );

#############################################################################
##
#F  StronglyRegularGraphAvailable( <parms>  )
##  
##  <#GAPDoc Label="StronglyRegularGraphAvailable">
##  <ManSection>
##  <Func Name="StronglyRegularGraphAvailable"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return true if an srg with parameters parms
##  has been stored in the library. TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraphAvailable" );

#############################################################################
##
#F  StronglyRegularGraph( <parms> , <nr> )
##  
##  <#GAPDoc Label="StronglyRegularGraph">
##  <ManSection>
##  <Func Name="StronglyRegularGraph"
##   Arg='parms, nr'/>
##
##  <Description>
##  TODO This function will return the strongly regular graph with parameters
##  <A>parms</A> and index <A>nr</A> in the stored list. TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraph" );

#############################################################################
##
#F  NrStronglyRegularGraphs( <parms> )
##  
##  <#GAPDoc Label="NrStronglyRegularGraphs">
##  <ManSection>
##  <Func Name="NrStronglyRegularGraphs"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return the number of strongly regular graphs
##  with parameters <A>parms</A>. It may accept subsets of fixed parms.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrStronglyRegularGraphs" );

#############################################################################
##
#F  OneStronglyRegularGraph( <parms> )
##  
##  <#GAPDoc Label="OneStronglyRegularGraph">
##  <ManSection>
##  <Func Name="OneStronglyRegularGraph"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return one strongly regular graph 
##  with parameters <A>parms</A>. It may accept subsets of fixed parms.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "OneStronglyRegularGraph" );

#############################################################################
##
#F  AllStronglyRegularGraphs( <parms> )
##  
##  <#GAPDoc Label="AllStronglyRegularGraphs">
##  <ManSection>
##  <Func Name="AllStronglyRegularGraphs"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return a list of all strongly regular graphs 
##  (up to isomorphism) with parameters <A>parms</A>.
##  It may accept subsets of fixed parms.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllStronglyRegularGraphs" );

#############################################################################
##
#F  StronglyRegularGraphsIterator( <parms> )
##  
##  <#GAPDoc Label="StronglyRegularGraphIterator">
##  <ManSection>
##  <Func Name="StronglyRegularGraphIterator"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return an iterator of all strongly regular graphs 
##  with parameters <A>parms</A>. It may accept subsets of fixed parms.TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraphIterator" );



#############################################################################
##
#F  SmallFeasibleSRGParameterTuples( [ <v>, <k>, <l>, <m> ], <opt> )
##  
##  <#GAPDoc Label="SmallFeasibleSRGParameterTuples">
##  <ManSection>
##  <Func Name="SmallFeasibleSRGParameterTuples"
##   Arg='[ v, k, l, m ], opt'/>
##
##  <Description>TODO
##  This function will give all feasible parameter tuples with certain fixed
##  values with <A>v</A> in the list of Brouwer. Options will include
##  looking at parameters in which graphs have been enumerated, proven to
##  exist, not disproven to exist and all 'feasible' parameters.  TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallFeasibleSRGParameterTuples" );

#############################################################################
##
#F  IsEnumeratedSRGParameterTuple( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsEnumeratedSRGParameterTuple">
##  <ManSection>
##  <Func Name="IsEnumeratedSRGParameterTuple"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>TODO
##  This function will return true if srgs with parameters parms have been 
##  completely enumerated (v is small enough).  TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsEnumeratedSRGParameterTuple" );

#############################################################################
##
#F  IsKnownSRGParameterTuple( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsKnownSRGParameterTuple">
##  <ManSection>
##  <Func Name="IsKnownSRGParameterTuple"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>TODO
##  This function will return true if there is an srg with parameters parms  
##  (v is small enough).  TODO
##    <Example>
##      <![CDATA[

##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsKnownSRGParameterTuple" );

#############################################################################
##
#E
