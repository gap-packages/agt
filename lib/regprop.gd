#############################################################################
##
#W  regprop.gd            Algebraic Graph Theory package        Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving regularity properties of graphs.
##


#############################################################################
##
#F  RGParameters( <gamma> )
##  
##  <#GAPDoc Label="RGParameters">
##  <ManSection>
##  <Func Name="RGParameters"
##   Arg='gamma'/>
##  <Returns>A list or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the regular graph
##  parameters of <A>gamma</A>. If <A>gamma</A> is not a regular graph,
##  the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(Group((2,3,4,5)),[[1,2],[2,1]]);;
##gap> RGParameters(gamma);
##fail
##gap> gamma:=HammingGraph(3,4);;                              
##gap> RGParameters(gamma);
##[ 64, 9 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RGParameters" );

#############################################################################
##
#F  IsRG( <gamma> )
##  
##  <#GAPDoc Label="IsRG">
##  <ManSection>
##  <Func Name="IsRG"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns <K>true</K> if 
##  <A>gamma</A> is a regular graph, and <K>false</K> otherwise.
##    <Example>
##      <![CDATA[
##gap> gamma:=NullGraph(Group(()),5);;
##gap> IsRG(gamma);
##true
##gap> gamma:=EdgeOrbitsGraph(Group((2,3,4,5)),[[1,2],[2,1]]);;
##gap> IsRG(gamma);
##false
##gap> gamma:=TriangularGraph(6);;                             
##gap> IsRG(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonym( "IsRG", IsRegularGraph );

#############################################################################
##
#F  IsFeasibleRGParameters( [ <v>, <k> ] )
##  
##  <#GAPDoc Label="IsFeasibleRGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleRGParameters"
##   Arg='[ v, k ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a list of integers of length 2, <A>[v,k]</A>, this 
##  function returns <K>true</K> if <M>( <A>v</A>, <A>k</A> )</M> is a feasible
##  parameter tuple for a regular graph. Otherwise, the function 
##  returns <K>false</K>.
##  <P/>
##  The tuple <M>(v, k)</M> is a <E>feasible</E>
##  parameter tuple for a regular graph if it satisfies the following
##  well-known conditions:
##  <List>
##  <Item><M>v>k\geq 0</M>;</Item>
##  <Item><M>2</M> divides <M>vk</M>.</Item>
##  </List> 
##  Any regular graph must have parameters that satisfy these 
##  conditions (see <Cite Key="BCN_1989"/>). 
##    <Example>
##      <![CDATA[
##gap> IsFeasibleRGParameters([15,9]);
##false
##gap> IsFeasibleRGParameters([16,9]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleRGParameters" );

#############################################################################
##
#F  ERGParameters( <gamma> )
##  
##  <#GAPDoc Label="ERGParameters">
##  <ManSection>
##  <Func Name="ERGParameters"
##   Arg='gamma'/>
##  <Returns>A list or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the edge-regular graph
##  parameters of <A>gamma</A>. If <A>gamma</A> is not an edge-regular graph,
##  the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> gamma:=NullGraph(Group(()),5);;
##gap> ERGParameters(gamma);
##fail
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
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns <K>true</K> if 
##  <A>gamma</A> is an edge-regular graph, and <K>false</K> otherwise.
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
#F  IsFeasibleERGParameters( [ <v>, <k>, <a> ] )
##  
##  <#GAPDoc Label="IsFeasibleERGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleERGParameters"
##   Arg='[ v, k, a ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a list of integers of length 3, <A>[v,k,a]</A>, this 
##  function returns <K>true</K> if <M>( <A>v, k, a</A> )</M> is a feasible
##  parameter tuple for an edge-regular graph. Otherwise, the function 
##  returns <K>false</K>.
##  <P/>
##  The tuple <M>( v, k, a )</M> is a <E>feasible</E>
##  parameter tuple for an edge-regular graph if it satisfies the following
##  well-known conditions:
##  <List>
##  <Item><M>(v,k)</M> is a feasible regular graph parameter tuple;</Item> 
##  <Item><M>k>a\geq 0</M>;</Item>
##  <Item><M>2</M> divides <M>ka</M> and <M>6</M> 
##        divides <M>vka</M>;</Item>
##  <Item><M>v-2k+a \geq 0</M>.</Item>
##  </List> 
##  Any edge-regular graph must have parameters which satisfy these 
##  conditions (see <Cite Key="BCN_1989"/>). 
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
##  <Returns>A list or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the strongly regular 
##  graph parameters of <A>gamma</A>. If <A>gamma</A> is not a strongly 
##  regular graph, the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteGraph(Group(()),5);;
##gap> SRGParameters(gamma);
##fail
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
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns <K>true</K> if 
##  <A>gamma</A> is a strongly regular graph, and <K>false</K> otherwise.
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
#F  IsFeasibleSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsFeasibleSRGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleSRGParameters"
##   Arg='[ v, k, a, b ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a list of integers of length 4, <A>[v,k,a,b]</A>, this 
##  function returns <K>true</K> if <M>( <A>v, k, a, b</A> )</M> is a feasible
##  parameter tuple for a strongly regular graph. Otherwise, this function 
##  returns <K>false</K>. 
##  <P/>
##  The tuple <M>(v,k,a,b)</M> is a <E>feasible</E>
##  parameter tuple for a strongly regular graph if it satisfies the following
##  well-known conditions:
##  <List>
##  <Item><M>(v,k,a)</M> is a feasible edge-regular graph parameter tuple;</Item> 
##  <Item><M>k\geq b</M>;</Item>
##  <Item><M>(v-k-1)b = k(k-a-1)</M>;</Item>
##  <Item><M>v-2-2k+b \geq 0</M>;</Item>
##  <Item>the formulae for the multiplicities of the eigenvalues of a strongly
##        regular graph with these parameters evaluate to positive integers 
##        (see <Cite Key="BH_2011"/>).</Item>
##  </List> 
##  Any strongly regular graph must have parameters which satisfy these 
##  conditions (see <Cite Key="BCN_1989"/>). 
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
#E
