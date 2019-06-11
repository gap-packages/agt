#############################################################################
##
#W  srgs.gd           Strongly regular graph library               Rhys Evans
##
##
#Y  Copyright (C) ????????????????????????????????????TODO
##
##  Explanation of file????????????????????????????????????TODO
##

######################
## GLOBAL FUNCTIONS ##
######################
##---------------------------------------------------------------------------------------------

#############################################################################
##
#F  ERGParameters( <gamma> )
##  
##  <#GAPDoc Label="ERGParameters">
##  <ManSection>
##  <Func Name="ERGParameters"
##   Arg='gamma'/>
##
##  <Description>
##  If the graph <A>gamma</A> is edge-regular, this function returns the 
##  edge-regular graph parameters of <A>gamma</A>. Otherwise, it returns
##  <C>false</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=NullGraph(Group(()),5);;
##gap> ERGParameters(gamma);
##false
##gap> gamma:=JohnsonGraph(7,3);;
##gap> ERGParameters(gamma);
##[ 35, 12, 5 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ERGParameters" );

#############################################################################
##
#F  IsERG( <gamma> )
##  
##  <#GAPDoc Label="IsERG">
##  <ManSection>
##  <Func Name="IsERG"
##   Arg='gamma'/>
##
##  <Description>
##  This function returns <C>true</C> if the graph <A>gamma</A> is an edge-regular
##  graph, and <C>false</C> otherwise.
##    <Example>
##      <![CDATA[
##gap> gamma:=NullGraph(Group(()),5);;
##gap> IsERG(gamma);
##false
##gap> gamma:=JohnsonGraph(7,3);;
##gap> IsERG(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsERG" );

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
##  This function returns <C>true</C> if <M>( v, k, l )</M> is a feasible
##  parameter tuple for a edge-regular graph, according to the following 
##  well known necessary conditions;
##  <List>
##  <Item><M>v,k,l</M> are integers.</Item> 
##  <Item><M>v>k>l\geq 0</M></Item>
##  <Item><M>2</M> divides <M>vk</M> and <M>kl</M>, and <M>6</M> 
##        divides <M>vkl</M>.</Item>
##  <Item><M>v-2k+l \geq 0</M></Item>
##  </List> 
##  Otherwise, it returns <C>false</C>.
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
#F  SRGParameters( <gamma> )
##  
##  <#GAPDoc Label="SRGParameters">
##  <ManSection>
##  <Func Name="SRGParameters"
##   Arg='gamma'/>
##
##  <Description>
##  If the graph <A>gamma</A> is strongly regular, this function returns  
##  the strongly regular graph parameters of <A>gamma</A>. Otherwise, it 
##  returns <C>false</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteGraph(Group(()),5);;
##gap> SRGParameters(gamma);
##false
##gap> gamma:=JohnsonGraph(5,3);;            
##gap> SRGParameters(gamma);
##[ 10, 6, 3, 4 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SRGParameters" );

#############################################################################
##
#F  IsSRG( <gamma> )
##  
##  <#GAPDoc Label="IsSRG">
##  <ManSection>
##  <Func Name="IsSRG"
##   Arg='gamma'/>
##
##  <Description>
##  This function returns true if the graph <A>gamma</A> is a strongly
##  regular graph, and <C>false</C> otherwise.
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteGraph(Group(()),5);;
##gap> IsSRG(gamma);
##false
##gap> gamma:=JohnsonGraph(5,3);;         
##gap> IsSRG(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsSRG" );

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
##  This function returns <C>true</C> if <M>( v, k, l, m )</M> is a feasible
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
##  Otherwise, it returns <C>false</C>. 
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
##  This function returns <C>true</C> if a strongly regular graph with parameters
##  <M>( v, k, l, m )</M> is primitive. Otherwise, it returns <C>false</C>.  
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
##  This function returns <C>true</C> if a strongly regular graph with parameters
##  <M>( v, k, l, m )</M> is of type I. Otherwise, it returns <C>false</C>.
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
##  This function returns <C>true</C> a strongly regular graph with parameters
##  <M>( v, k, l, m )</M> is of type II. Otherwise, it returns <C>false</C>.
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
##  If <M>( v, k, l, m )</M> is not feasible, it returns <C>false</C>.
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
##  Otherwise, it returns <C>false</C>.
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
##  parameters. Otherwise, it returns <C>false</C>.
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
##  regular graph with these parameters. Otherwise, it returns <C>false</C>. 
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
## strongly regular graph with these parameters. Otherwise, it returns <C>false</C>. 
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
##  it returns <C>false</C>. 
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
##  it returns <C>false</C>. 
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
##  it returns <C>false</C>.
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
##  Krein conditions. Otherwise, it returns <C>false</C>.
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
##  Absolute bounds. Otherwise, it returns <C>false</C>.
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

#############################################################################
##
#O  HoffmanCocliqueBound( <gamma> )
##  
##  <#GAPDoc Label="HoffmanCocliqueBound">
##  <ManSection>
##  <Oper Name="HoffmanCocliqueBound"
##   Arg="gamma"/>
##  <Oper Name="HoffmanCocliqueBound"
##   Arg="list" Label="for SRG parameters"/>
##
##  <Description>
##  Given a regular graph <C>gamma</C>, this function returns the Hoffman coclique 
##  bound of <C>gamma</C>.
##  <P/>
##  Given a list <C>list</C>, this function will check if <C>list</C> is a
##  feasible strongly regular graph parameter tuple. If so, this function 
##  returns the Hoffman coclique bound of a strongly regular graph with 
##  parameters <C>list</C>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
##gap> HoffmanCocliqueBound(gamma);
##2
##gap> HoffmanCocliqueBound([5,2,0,1]);
##2
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
##  <Oper Name="HoffmanCliqueBound"
##   Arg="gamma"/>
##  <Oper Name="HoffmanCliqueBound"
##   Arg="list" Label="for SRG parameters"/>
##
##  <Description>
##  Given a regular graph <C>gamma</C>, this function returns the Hoffman clique 
##  bound of <C>gamma</C> (i.e the Hoffman coclique bound of the complement of 
##  <C>gamma</C>).
##  <P/>
##  Given a list <C>list</C>, this function will check if <C>list</C> is a
##  feasible strongly regular graph parameter tuple. If so, this function 
##  returns the Hoffman clique bound of a strongly regular graph with 
##  parameters <C>list</C>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
##gap> HoffmanCliqueBound(gamma);
##2
##gap> HoffmanCliqueBound([5,2,0,1]);
##2
##      ]]>
##    </Example>
##  </Description>
##
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
##  <Oper Name="DelsarteCliqueBound"
##   Arg="gamma"/>
##  <Oper Name="DelsarteCliqueBound"
##   Arg="list" Label="for SRG parameters"/>
##
##  <Description>
##  Given a strongly regular graph <C>gamma</C>, this function returns the 
##  Delsarte clique bound of <C>gamma</C>.
##  <P/>
##  Given a list <C>list</C>, this function will check if <C>list</C> is a
##  feasible strongly regular graph parameter tuple. If so, this function 
##  returns the Delsarte clique bound of a strongly regular graph with 
##  parameters <C>list</C>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
##gap> DelsarteCliqueBound(gamma);
##2
##gap> DelsarteCliqueBound([5,2,0,1]);
##2
##      ]]>
##    </Example>
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "DelsarteCliqueBound" , [IsRecord] );
DeclareOperation( "DelsarteCliqueBound" , [IsList] );
DeclareSynonym( "HoffmanColouringBound" , DelsarteCliqueBound);
DeclareSynonym( "HoffmanColoringBound" , DelsarteCliqueBound);

#############################################################################
##
#F  CliqueAdjacencyPolynomial( [ <v>, <k>, <l> ], x, y )
##  
##  <#GAPDoc Label="CliqueAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="CliqueAdjacencyPolynomial"
##   Arg='parms,x,y'/>
##
##  <Description>
##  Given a list of edge-regular graph parameters <C>parms</C> and strings 
##  <C>x,y</C> the desired variable names, this function returns the Clique Adjacency 
##  Polynomial  with respect to the parameters <C>parms</C>, defined in Soicher
##  REF. The variables are defined over the field of rationals.
##    <Example>
##      <![CDATA[
##gap> CliqueAdjacencyPolynomial([16,9,4],"x","y");
##-x^2*y-y^3+16*x^2-x*y+9*y^2+16*x-26*y
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
##   Arg='parms'/>
##
##  <Description>
##  Given edge-regular graph parameters <C>parms</C>, this function 
##  returns the Clique Adjacency Bound  with respect to the parameters 
##  <C>parms</C>, defined in Soicher REF.
##    <Example>
##      <![CDATA[
##gap> CliqueAdjacencyBound([21,7,3]);
##5
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CliqueAdjacencyBound" );

#############################################################################
##
#F  RegularCliqueERGParameters( [ <v>, <k>, <l> ] )
##  
##  <#GAPDoc Label="RegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="RegularCliqueERGParameters"
##   Arg='parms'/>
##
##  <Description>
##  Given edge-regular graph parameters <C>parms</C>, this function 
##  returns the possible pairs <C>[s,m]</C>, where <C>s</C> are the orders and 
##  <C>m</C> are the nexi of a regular clique of a graph with these parameters.
##  Note that the function will return a list of pairs if and only if 
##  <C>parms</C> corresponds to a complete graph.
##    <Example>
##      <![CDATA[
##gap> RegularCliqueERGParameters([8,7,6]);
##[ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 4 ], [ 5, 5 ], [ 6, 6 ], [ 7, 7 ] ]
##gap> RegularCliqueERGParameters([8,6,4]);
##[ 4, 3 ]
##gap> RegularCliqueERGParameters([16,9,4]);
##[ 4, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularCliqueERGParameters" );

#############################################################################
##
#F  IsFeasibleRegularCliqueERGParameters( [ <v>, <k>, <l> ] )
##  
##  <#GAPDoc Label="IsFeasibleRegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleRegularCliqueERGParameters"
##   Arg='[v,k,l]'/>
##
##  <Description>
##  Given edge-regular graph parameters <M>(v,k,l)</M>, this function 
##  returns <C>true</C> if there exists positive integers <M>s,m</M>, such that
##  <M>(v,k,l;s,m)</M> are feasible Nuemaier graph parameters.
##    <Example>
##      <![CDATA[
##gap> IsFeasibleRegularCliqueERGParameters([5,4,3]); 
##true
##gap> IsFeasibleRegularCliqueERGParameters([16,9,4]);
##true
##gap> IsFeasibleRegularCliqueERGParameters([21,7,3]);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleRegularCliqueERGParameters" );

#############################################################################
##
#F  RegularAdjacencyPolynomial( [ <v>, <k>, <l>, <m> ], x, y, d )
##  
##  <#GAPDoc Label="RegularAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="RegularAdjacencyPolynomial"
##   Arg='parms,x,y,d'/>
##
##  <Description>
##  Given strongly regular graph parameters <C>parms</C> and strings 
##  <C>x,y,d</C> the desired variable names, this function returns the Regular Adjacency 
##  Polynomial  with respect to the parameters <C>parms</C>, defined in Evans
##  REF. The variables are defined over the field of rationals.
##    <Example>
##      <![CDATA[
##RegularAdjacencyPolynomial([16,6,2,2],"x","y","d");
##-x^2*y+2*x*y*d-y*d^2+16*x^2-x*y+2*y^2+y*d+4*x-2*y
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
##  Given strongly regular graph parameters <C>parms</C>, this function 
##  returns a list containing the Regular Adjacency upper and lower bounds with respect to the parameters 
##  <C>parms</C>, defined in Evans REF.
##    <Example>
##      <![CDATA[
##gap> RegularAdjacencyBounds([16,6,2,2],4);
##[ 8, 12 ]
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
##  Given strongly regular graph parameters <C>parms</C>, this function 
##  returns the possible pairs <C>[s,m]</C>, where <C>s</C> are the orders and 
##  <C>m</C> are the nexi of a regular set of a graph with these parameters.
##  Note that the function will return a list of pairs.
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
#E
