#############################################################################
##
#W  srglib.gd         Algebraic Graph Theory package         Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving strongly regular graphs.
##


#############################################################################
##
#F  ComplementSRGParameters( <parms> )
##  
##  <#GAPDoc Label="ComplementSRGParameters">
##  <ManSection>
##  <Func Name="ComplementSRGParameters"
##   Arg='parms'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, this 
##  function returns the complement parameters of <A>parms</A>.
##  <P/>
##  Suppose <M>\Gamma</M> is a strongly regular graph with parameters 
##  <M>(v,k,a,b)</M>. Then the complement of <M>\Gamma</M> is a strongly 
##  regular graph with parameters <M>(v,v-k-1,v-2-2k+b,v-2k+a)</M> (see <Cite Key="BCN_1989"/>).
##  We define the <E>complement parameters</E> of the feasible strongly regular
##  graph parameter tuple <M>(v,k,a,b)</M> as the tuple <M>(v,v-k-1,v-2-2k+b,v-2k+a)</M>. 
##    <Example>
##      <![CDATA[
##gap> ComplementSRGParameters([16,9,4,6]);
##[ 16, 6, 2, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ComplementSRGParameters" );

#############################################################################
##
#F  IsPrimitiveSRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsPrimitiveSRGParameters">
##  <ManSection>
##  <Func Name="IsPrimitiveSRGParameters"
##   Arg='[ v, k, a, b ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a list of integers of length 4, <A>[v,k,a,b]</A>, this 
##  function returns <K>true</K> if <M>(<A>v,k,a,b</A>)</M> is a feasible
##  parameter tuple for a primitive strongly regular graph. Otherwise, this
##  function returns <K>false</K>. 
##  <P/>
##  Let <M>(v,k,a,b)</M> be feasible strongly regular parameters with 
##  complement parameters <M>(v',k',a',b')</M>. Then the parameter tuple
##  <M>(v,k,a,b)</M> is called <E>primitive</E> if <M>b\not= 0</M> and <M>b'\not= 0</M>. 
##  <P/>
##  A strongly regular graph <M>\Gamma</M> is called <E>primitive</E> if 
##  <M>\Gamma</M> and its complement is connected. It is known that a 
##  non-primitive strongly regular graph is a union of cliques, or the 
##  complement of a union of cliques. From our definition, it follows that a 
##  strongly regular graph <M>\Gamma</M> is primitive if and only if 
##  <M>\Gamma</M> has primitive strongly regular graph parameters (see <Cite Key="BCN_1989"/>).  
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
#F  IsTypeISRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsTypeISRGParameters">
##  <ManSection>
##  <Func Name="IsTypeISRGParameters"
##   Arg='[ v, k, a, b ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a list of integers of length 4, <A>[v,k,a,b]</A>, this 
##  function returns <K>true</K> if <M>(<A>v,k,a,b</A>)</M> is a feasible
##  parameter tuple for a type I strongly regular graph. Otherwise, this
##  function returns <K>false</K>. 
##  <P/>
##  A feasible strongly regular parameter tuple <M>(v,k,a,b)</M> is of 
##  <E>type I</E> (or a <E>conference graph</E>) if there exists a positive integer <M>t</M> such that 
##  <M>v=4t+1,k=2t,a=t-1,b=t</M>.
##  <P/>
##  There are two types of strongly regular graphs, called type I and 
##  type II (see <Cite Key="BCN_1989"/>). Let <M>\Gamma</M> be a 
##  strongly regular graph with parameters <M>(v,k,a,b)</M>. Then <M>\Gamma</M>
##  is of <E>type I</E> if and only if <M>(v,k,a,b)</M> is of type I.
##    <Example>
##      <![CDATA[
##gap> IsTypeISRGParameters([5,2,0,1]);                              
##true
##gap> IsTypeISRGParameters([9,4,1,2]);
##true
##gap> IsTypeISRGParameters([10,3,0,1]); 
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsTypeISRGParameters" );

#############################################################################
##
#F  IsTypeIISRGParameters( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsTypeIISRGParameters">
##  <ManSection>
##  <Func Name="IsTypeIISRGParameters"
##   Arg='[ v, k, a, b ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a list of integers of length 4, <A>[v,k,a,b]</A>, this 
##  function returns <K>true</K> if <M>(<A>v,k,a,b</A>)</M> is a feasible
##  parameter tuple for a type II strongly regular graph. Otherwise, this
##  function returns <K>false</K>.  
##  <P/>
##  A feasible strongly regular parameter tuple <M>(v,k,a,b)</M> is of 
##  <E>type II</E> if the polynomial <M>x^{2}-(a-b)x+b-k</M> has integer zeros.
##  <P/>
##  There are two types of strongly regular graphs, called type I and 
##  <E>type II</E> (see <Cite Key="BCN_1989"/>). Let <M>\Gamma</M> be a 
##  strongly regular graph with parameters <M>(v,k,a,b)</M>. Then <M>\Gamma</M> 
##  is of <E>type II</E> if and only if all of its eigenvalues are integer. 
##  The eigenvalues of <M>\Gamma</M> are <M>k</M> and the zeros of the 
##  polynomial <M>x^{2}-(a-b)x+b-k</M> (see <Cite Key="BCN_1989"/>). From our 
##  definition, it follows that <M>\Gamma</M> is of type II if and only if 
##  <M>(v,k,a,b)</M> is of type II. 
##    <Example>
##      <![CDATA[
##gap> IsTypeIISRGParameters([5,2,0,1]); 
##false
##gap> IsTypeIISRGParameters([9,4,1,2]); 
##true
##gap> IsTypeIISRGParameters([10,3,0,1]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsTypeIISRGParameters" );

#############################################################################
##
#F  SRGToGlobalParameters( <parms> )
##  
##  <#GAPDoc Label="SRGToGlobalParameters">
##  <ManSection>
##  <Func Name="SRGToGlobalParameters"
##   Arg='parms'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, this 
##  function returns the global parameters of a graph with strongly regular
##  graph parameters <A>parms</A>. For information on global parameters of a
##  graph, see <Cite Key="GRAPE_2018"/>.
##    <Example>
##      <![CDATA[
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
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given the global parameters <A>parms</A> of a connected strongly regular graph, 
##  this function returns the strongly regular graph parameters of the graph.
##  For information on global parameters of a graph, see <Cite Key="GRAPE_2018"/>.
##    <Example>
##      <![CDATA[
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
#O  KreinParameters( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="KreinParameters">
##  <ManSection>
##  <Oper Name="KreinParameters"
##   Arg='[ v, k, a, b ]'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>[v, k, a, b]</A>, 
##  this function returns a list of  (non-trivial) Krein parameters of a 
##  strongly regular graph with parameters <M>(<A>v,k,a,b</A>)</M>.
##  <P/>
##  If the eigenvalues of a strongly regular graph are integer, the object
##  returned is a list of integers. If the eigenvalues are irrational, the 
##  object returned will be a list of cyclotomic numbers.
##  <P/> 
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>
##  and eigenvalues <M>k\geq r &gt; s</M>. Then the <E>Krein parameters</E> of 
##  <M>\Gamma</M> are the numbers
##  <Display>K_{1}=(k+r)(s+1)^{2} - (r+1)(k+r+2rs),</Display><Display>K_{2}=(k+s)(r+1)^{2} - (s+1)(k+s+2rs).</Display>
##  For information on the Krein parameters of strongly regular graphs, see <Cite Key="BCN_1989"/>.
##    <Example>
##      <![CDATA[
##gap> KreinParameters([10,6,3,4]);
##[ 1, 16 ]
##gap> KreinParameters([13,6,2,3]);
##[ -14*E(13)-12*E(13)^2-14*E(13)^3-14*E(13)^4-12*E(13)^5-12*E(13)^6-12*E(13)^7
##     -12*E(13)^8-14*E(13)^9-14*E(13)^10-12*E(13)^11-14*E(13)^12, 
##  -12*E(13)-14*E(13)^2-12*E(13)^3-12*E(13)^4-14*E(13)^5-14*E(13)^6-14*E(13)^7
##     -14*E(13)^8-12*E(13)^9-12*E(13)^10-14*E(13)^11-12*E(13)^12 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "KreinParameters" , [IsList]);

#############################################################################
##
#O  IsKreinConditionsSatisfied( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsKreinConditionsSatisfied">
##  <ManSection>
##  <Oper Name="IsKreinConditionsSatisfied"
##   Arg='[ v, k, a, b ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>[v, k, a, b]</A>, 
##  this function returns <K>true</K> if the parameters satisfy the Krein 
##  conditions. Otherwise, this function returns <K>false</K>.
##  <P/> 
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>
##  and Krein parameters <M>K_{1},K_{2}</M> (see <Ref Func="KreinParameters"/>.
##  The <E>Krein conditions</E> of <M>\Gamma</M> are the inequalities
##  <Display>K_{1}\geq 0, K_{2}\geq 0.</Display>
##  It is known that any strongly regular graph must have parameters that satisfy the Krein conditions.
##  For information on the Krein conditions of strongly regular graphs, see <Cite Key="BCN_1989"/>.
##    <Example>
##      <![CDATA[
##gap> IsKreinConditionsSatisfied([28,9,0,4]);
##false
##gap> IsKreinConditionsSatisfied([13,6,2,3]);
##true
##gap> IsKreinConditionsSatisfied([10,6,3,4]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "IsKreinConditionsSatisfied" , [IsList]);

#############################################################################
##
#F  IsAbsoluteBoundSatisfied( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsAbsoluteBoundSatisfied">
##  <ManSection>
##  <Func Name="IsAbsoluteBoundSatisfied"
##   Arg='[ v, k, a, b ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given primitive strongly regular graph parameters <A>[v, k, a, b]</A>, 
##  this function returns <K>true</K> if the parameters satisfy the absolute 
##  bound. Otherwise, this function returns <K>false</K>.
##  <P/> 
##  Let <M>\Gamma</M> be a primitive strongly regular graph with parameters <M>(v,k,a,b)</M>
##  and eigenvalues <M>k\geq r &gt; s</M>, with multiplicities <M>1,f,g</M>.
##  The <E>absolute bound</E> for the number of vertices of <M>\Gamma</M> is 
##  <Display>v\leq f(f+3)/2, v\leq g(g+3)/2.</Display>
##  For information on the absolute bound of strongly regular graphs, see <Cite Key="BCN_1989"/>.
##    <Example>
##      <![CDATA[
##gap> IsAbsoluteBoundSatisfied([13,6,3,4]);
##false
##gap> IsAbsoluteBoundSatisfied([50,21,4,12]);
##false
##gap> IsAbsoluteBoundSatisfied([50,21,8,9]); 
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsAbsoluteBoundSatisfied" );

######################
## GLOBAL VARIABLES ##
######################
##---------------------------------------------------------------------------------------------

#############################################################################
##
#V  AGT_Brouwer_Parameters_MAX  
##
##  <#GAPDoc Label="AGT_Brouwer_Parameters_MAX">
##  <ManSection>
##  <Var Name="AGT_Brouwer_Parameters_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>v</M> for which the current 
##  package contains information about the parameters of all strongly regular
##  graphs with at most <M>v</M> vertices. This information is stored in the 
##  list <Ref Var="AGT_Brouwer_Parameters"/>.  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##DeclareGlobalVariable("AGT_Brouwer_Parameters_MAX","SRG Parameters maximum order from Brouwer");

#############################################################################
##
#V  AGT_Brouwer_Parameters  
##
##  <#GAPDoc Label="AGT_Brouwer_Parameters">
##  <ManSection>
##  <Var Name="AGT_Brouwer_Parameters"/>
##
##  <Description>
##  This variable stores information about the feasible strongly regular 
##  graph parameters found in Brouwer <Cite Key="B_2018"/> and the available strongly regular graphs. 
##  <A>AGT_Brouwer_Parameters</A> is a list, each element of which is 
##  a list of length <M>4</M>. For an element <C>[parms,status,stored,num]</C>,
##  each entry denotes the following;
##  <List>
##  <Mark><C>parms</C></Mark>
##  <Item>A feasible strongly regular graph parameter
##  tuple <C>[v,k,a,b]</C>, where <A>v</A> is less than <Ref Var="AGT_Brouwer_Parameters_MAX"/>.
##  </Item>
##  <Mark><C>status</C></Mark>
##  <Item>the status of the known strongly regular 
##  graphs with parameters <C>parms</C>. This entry is
##    <List> 
##    <Item><M>0</M> if there exists a strongly regular graph with parameters 
##          <C>parms</C>, and all such graphs have been enumerated,</Item>
##    <Item><M>1</M> if there exists a strongly regular graph with parameters 
##          <C>parms</C>, but all such graphs have not been enumerated,</Item>
##    <Item><M>2</M> if it is not known if a strongly regular graph with
##          parameters <C>parms</C> exists, </Item>
##    <Item><M>3</M> if it has been proven that no strongly regular graph with 
##          parameters <C>parms</C> exists.</Item>
##    </List> 
##  </Item> 
##  <Mark><C>stored</C></Mark>
##  <Item>the number of non-isomoprhic 
##        strongly regular graphs with parameters <C>parms</C> that are 
##        available in the current package.</Item>
##  <Mark><C>num</C></Mark>
##  <Item>
##        the number of non-isomorphic 
##        strongly regular graphs with parameters <C>parms</C> that exist. If this
##        has not been determined, the value of <C>num</C> is set to <C>-1</C>.
##  </Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> AGT_Brouwer_Parameters[34];  
##[ [ 36, 20, 10, 12 ], 0, 32548, 32548 ]
##gap> AGT_Brouwer_Parameters[35];  
##[ [ 37, 18, 8, 9 ], 1, 6760, -1 ]
##gap> AGT_Brouwer_Parameters[2530];
##[ [ 765, 176, 28, 44 ], 2, 0, -1 ]
##gap> AGT_Brouwer_Parameters[4530];
##[ [ 1293, 646, 322, 323 ], 3, 0, 0 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("AGT_Brouwer_Parameters","SRG Parameters from Brouwer");

######################
## GLOBAL FUNCTIONS ##
######################

#############################################################################
##
#F  IsSRGAvailable( <parms> )
##  
##  <#GAPDoc Label="IsSRGAvailable">
##  <ManSection>
##  <Func Name="IsSRGAvailable"
##   Arg='parms'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, this 
##  function returns <K>true</K> if there is a strongly regular graph with 
##  parameters <A>parms</A> stored in this package. If <A>parms</A> is a 
##  feasible parameter tuple but there is no strongly regular graphs with
##  parameters <A>parms</A> available, the function returns <K>false</K>.
##    <Example>
##      <![CDATA[
##gap> IsSRGAvailable([28,12,6,4]);
##true
##gap> IsSRGAvailable([28,9,0,4]); 
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsSRGAvailable" );

#############################################################################
##
#F  SRGLibraryInfo( <parms> )
##
##  <#GAPDoc Label="SRGLibraryInfo">
##  <ManSection>
##  <Func Name="SRGLibraryInfo"
##   Arg='parms'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, with first
##  parameter <A>v</A> at most <Ref Var="AGT_Brouwer_Parameters_MAX"/>, this 
##  function returns the element of <Ref Var="AGT_Brouwer_Parameters"/> 
##  corresponding to <A>parms</A>. 
##    <Example>
##      <![CDATA[
##gap> SRGLibraryInfo([37,18,8,9]); 
##[ [ 37, 18, 8, 9 ], 1, 6760, -1 ]
##gap> SRGLibraryInfo([36,15,6,6]);
##[ [ 36, 15, 6, 6 ], 0, 32548, 32548 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SRGLibraryInfo" );

#############################################################################
##
#F  SRG( <parms> , <n> )
##  
##  <#GAPDoc Label="SRG">
##  <ManSection>
##  <Func Name="SRG"
##   Arg='parms, n'/>
##  <Returns>A record or <K>fail</K>.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> and positive
##  integer <A>n</A>, this function returns the <A>n</A>th strongly regular 
##  graph with parameters <A>parms</A> available in this package. If there
##  there is no <A>n</A>th strongly regular 
##  graph with parameters <A>parms</A> available, the function returns
##  <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> SRG([16,6,2,2],1);
##rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], 
##  group := <permutation group with 6 generators>, isGraph := true, 
##  names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
##  schreierVector := [ -1, 6, 4, 3, 5, 5, 5, 6, 6, 6, 4, 4, 4, 3, 3, 3 ] )
##gap> SRG([16,6,2,2],2);
##rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], group := Group([ (3,4)(5,6)(8,9)
##  (11,14)(12,13)(15,16), (2,3)(4,5)(6,7)(9,11)(10,12)(14,15), (1,2)(5,8)(6,9)
##  (7,10)(11,12)(13,14) ]), isGraph := true, names := [ 1 .. 16 ], 
##  order := 16, representatives := [ 1 ], 
##  schreierVector := [ -1, 3, 2, 1, 2, 1, 2, 3, 3, 3, 2, 2, 1, 1, 2, 1 ] )
##gap> SRG([28,9,0,4],1);      
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SRG" );

##---------------------------------------------------------------------------------------------
#############################################################################
##
#F  NrSRGs( <parms> )
##  
##  <#GAPDoc Label="NrSRGs">
##  <ManSection>
##  <Func Name="NrSRGs"
##   Arg='parms'/>
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, this function
##  returns the number of pairwise non-isomorphic strongly regular graphs with parameters
##  <A>parms</A> currently stored in this package.
##    <Example>
##      <![CDATA[
##gap> NrSRGs([36,15,6,6]);   
##32548
##gap> NrSRGs([28,9,0,4]); 
##0
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrSRGs" );

#############################################################################
##
#F  OneSRG( <parms> )
##  
##  <#GAPDoc Label="OneSRG">
##  <ManSection>
##  <Func Name="OneSRG"
##   Arg='parms'/>
##  <Returns>A record or <K>fail</K>.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, this function
##  returns one strongly regular graph with parameters <A>parms</A>. If there
##  there is no strongly regular 
##  graph with parameters <A>parms</A> available, the function returns
##  <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> OneSRG([16,9,4,6]); 
##rec( adjacencies := [ [ 8, 9, 10, 11, 12, 13, 14, 15, 16 ] ], 
##  group := Group([ (6,7)(9,10)(12,13)(15,16), (5,6)(8,9)(11,12)(14,15), (2,5)
##  (3,6)(4,7)(9,11)(10,14)(13,15), (1,2)(5,8)(6,9)(7,10) ]), isGraph := true, 
##  names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
##  schreierVector := [ -1, 4, 3, 3, 3, 2, 1, 4, 4, 4, 3, 2, 1, 3, 2, 1 ] )
##gap> OneSRG([28,9,0,4]); 
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "OneSRG" );

#############################################################################
##
#F  AllSRGs( <parms> )
##  
##  <#GAPDoc Label="AllSRGs">
##  <ManSection>
##  <Func Name="AllSRGs"
##   Arg='parms'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, this function
##  returns a list of all pairwise non-isomorphic
##   strongly regular graphs with parameters <A>parms</A> available in this package.
##    <Example>
##      <![CDATA[
##gap> AllSRGs([16,6,2,2]);
##[ rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], 
##    group := <permutation group with 6 generators>, isGraph := true, 
##    names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
##    schreierVector := [ -1, 6, 4, 3, 5, 5, 5, 6, 6, 6, 4, 4, 4, 3, 3, 3 ] ),
##  rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], group := Group([ (3,4)(5,6)
##    (8,9)(11,14)(12,13)(15,16), (2,3)(4,5)(6,7)(9,11)(10,12)(14,15), (1,2)
##    (5,8)(6,9)(7,10)(11,12)(13,14) ]), isGraph := true, 
##    names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
##    schreierVector := [ -1, 3, 2, 1, 2, 1, 2, 3, 3, 3, 2, 2, 1, 1, 2, 1 ] )]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllSRGs" );

#############################################################################
##
#F  SRGIterator( <parms> )
##  
##  <#GAPDoc Label="SRGIterator">
##  <ManSection>
##  <Func Name="SRGIterator"
##   Arg='parms'/>
##  <Returns>An iterator.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A>, this function
##  returns an iterator of all pairwise non-isomorphic
##  strongly regular graph with parameters <A>parms</A> that 
##  are stored in this package.
##    <Example>
##      <![CDATA[
##gap> SRGIterator([16,6,2,2]);
##<iterator>
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SRGIterator" );

#############################################################################
##
#F  SmallFeasibleSRGParameterTuples( <v> )
##  
##  <#GAPDoc Label="SmallFeasibleSRGParameterTuples">
##  <ManSection>
##  <Func Name="SmallFeasibleSRGParameterTuples"
##   Arg='v'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given an integer <A>v</A>, this function returns a list of all feasible parameter tuples
##  with at most <A>v</A> vertices, according to the list of Brouwer <Cite Key="B_2018"/>. The list
##  contains parameter tuples with first parameter at most <Ref Var="AGT_Brouwer_Parameters_MAX"/>.
##    <Example>
##      <![CDATA[
##gap> SmallFeasibleSRGParameterTuples(16);
##[ [ 5, 2, 0, 1 ], [ 9, 4, 1, 2 ], [ 10, 3, 0, 1 ], [ 10, 6, 3, 4 ], 
##  [ 13, 6, 2, 3 ], [ 15, 6, 1, 3 ], [ 15, 8, 4, 4 ], [ 16, 5, 0, 2 ], 
##  [ 16, 10, 6, 6 ], [ 16, 6, 2, 2 ], [ 16, 9, 4, 6 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallFeasibleSRGParameterTuples" );

#############################################################################
##
#F  IsEnumeratedSRGParameterTuple( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsEnumeratedSRGParameterTuple">
##  <ManSection>
##  <Func Name="IsEnumeratedSRGParameterTuple"
##   Arg='parms'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> with first
##  parameter <A>v</A> at most <Ref Var="AGT_Brouwer_Parameters_MAX"/>, this 
##  function returns <K>true</K> if the 
##  strongly regular graphs with parameters <A>parms</A> have been enumerated, 
##  according to the list of Brouwer <Cite Key="B_2018"/>. Otherwise, this function returns
##  <K>false</K>.
##    <Example>
##      <![CDATA[
##gap> IsEnumeratedSRGParameterTuple([37,18,8,9]);
##false
##gap> IsEnumeratedSRGParameterTuple([56,10,0,2]);
##true
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
##   Arg='parms'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> with first
##  parameter <A>v</A> at most <Ref Var="AGT_Brouwer_Parameters_MAX"/>, this 
##  function returns <K>true</K> if it is known that there exists a strongly
##  regular graph with parameters <A>parms</A>, according to the list of Brouwer <Cite Key="B_2018"/>.
##  Otherwise, this function returns <K>false</K>.
##    <Example>
##      <![CDATA[
##gap> IsKnownSRGParameterTuple([64,28,12,12]);
##true
##gap> IsKnownSRGParameterTuple([64,30,18,10]);
##false
##gap> IsKnownSRGParameterTuple([65,32,15,16]);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsKnownSRGParameterTuple" );

#############################################################################
##
#F  IsAllSRGsStored( [ <v>, <k>, <a>, <b> ] )
##  
##  <#GAPDoc Label="IsAllSRGsStored">
##  <ManSection>
##  <Func Name="IsAllSRGsStored"
##   Arg='parms'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> with first
##  parameter <A>v</A> at most <Ref Var="AGT_Brouwer_Parameters_MAX"/>, this 
##  function returns <K>true</K> if all pairwise non-isomorphic  
##  strongly regular graphs with parameters <A>parms</A> are stored in the package. 
##  Otherwise, this function returns
##  <K>false</K>.
##    <Example>
##      <![CDATA[
##gap> IsAllSRGsStored([37,18,8,9]);
##false
##gap> IsAllSRGsStored([36,15,6,6]);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsAllSRGsStored" );


#############################################################################
##
#F  DisjointUnionOfCliques( <n1> , <n2>, ... )
##  
##  <#GAPDoc Label="DisjointUnionOfCliques">
##  <ManSection>
##  <Func Name="DisjointUnionOfCliques"
##   Arg='n1, n2, ... '/>
##  <Returns>A record.</Returns>
##
##  <Description>
##  Given positive integers <A>n1, n2,...</A>, this function returns the graph consisting of
##  the disjoint union of cliques with orders <A>n1, n2,...</A>.  
##    <Example>
##      <![CDATA[
##gap> DisjointUnionOfCliques(3,5,7);            
##rec( adjacencies := [ [ 2, 3 ], [ 5, 6, 7, 8 ], [ 10, 11, 12, 13, 14, 15 ] ], 
##  autGroup := <permutation group with 12 generators>, 
##  group := <permutation group with 12 generators>, isGraph := true, 
##  isSimple := true, order := 15, representatives := [ 1, 4, 9 ], 
##  schreierVector := [ -1, 12, 11, -2, 10, 9, 8, 7, -3, 6, 5, 4, 3, 2, 1 ] )
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
##  <Returns>A record.</Returns>
##
##  <Description>
##  Given positive integers <A>n1, n2,...</A>, this function returns the complete multipartite
##  graph with parts of orders <A>n1, n2,...</A>. 
##  <P/>
##  Let <M>n_{1},n_{2},\dots,n_{t}</M> be positive integers. Then the <E>complete
##  multipartite graph</E>, <M>K_{n_{1},n_{2},\dots,n_{t}}</M>, has vertex set that
##  can be partitioned into <M>t</M> disjoint sets <M>X_{1},X_{2},\dots,X_{t}</M> of sizes <M>n_{1},n_{2},\dots,n_{t}</M>
##  such that distinct vertices are adjacent if and only if they belong to different
##  <M>X_{i}</M>.
##    <Example>
##      <![CDATA[
##gap> CompleteMultipartiteGraph(4,2,1);
##rec( adjacencies := [ [ 5, 6, 7 ], [ 1, 2, 3, 4, 7 ], [ 1, 2, 3, 4, 5, 6 ] ], 
##  autGroup := Group([ (5,6), (3,4), (2,3), (1,2) ]), group := Group([ (5,6),
##    (3,4), (2,3), (1,2) ]), isGraph := true, isSimple := true, order := 7, 
##  representatives := [ 1, 5, 7 ], 
##  schreierVector := [ -1, 4, 3, 2, -2, 1, -3 ] )
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
##  <Returns>A record.</Returns>
##
##  <Description>
##  Given an integer <A>n</A>, where <M><A>n</A>\geq 3</M>, this function 
##  returns the triangular graph on <A>n</A> points.
##  <P/>
##  Let <M>n</M> be an integer, where <M>n\geq 3</M>. The <E>triangular graph</E>
##  , <M>T(n)</M>, has vertex set consisting of the subsets of <M>\{1,2,...,n\}</M> 
##  of size <M>2</M>, and two distinct vertices <M>A,B</M> are joined by an edge
##  precisely when <M>|A\cap B|=1</M>. 
##  <P/>
##  The graph <M>T(n)</M> is strongly regular with parameters <M>({n \choose 2},2(n-2),n-2,4)</M>.
##  For <M>n\not= 8</M>, <M>T(n)</M> is the unique strongly regular graph with its
##  parameters. There are four pairwise non-isomomorphic strongly regular graphs that have the same
##  parameters as <M>T(8)</M>, which are the triangular graph <M>T(8)</M> and the
##  <E>Chang graphs</E> (see <Cite Key="C_1958"/> and <Cite Key="C_1959"/>).
##  
##    <Example>
##      <![CDATA[
##gap> TriangularGraph(7); 
##rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ] ], 
##  group := Group([ (1,7,12,16,19,21,6)(2,8,13,17,20,5,11)(3,9,14,18,4,10,15),
##    (2,7)(3,8)(4,9)(5,10)(6,11) ]), isGraph := true, isSimple := true, 
##  names := [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ], 
##      [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 2, 7 ], [ 3, 4 ], [ 3, 5 ], 
##      [ 3, 6 ], [ 3, 7 ], [ 4, 5 ], [ 4, 6 ], [ 4, 7 ], [ 5, 6 ], [ 5, 7 ], 
##      [ 6, 7 ] ], order := 21, representatives := [ 1 ], 
##  schreierVector := [ -1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 
##      1, 1, 1 ] )
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
##  <Returns>A record.</Returns>
##
##  <Description>
##  Given an integer <A>n</A>, where <M><A>n</A>\geq 2</M>, this function 
##  returns the square lattice graph on <M>n^{2}</M> points.
##  <P/>
##  Let <M>n</M> be an integer, where <M>n\geq 2</M>. The <E>square lattice
##  graph</E>, <M>L_{2}(n)</M>, has vertex set <M>\{1,2,...,n\}\times\{1,2,...,n\}</M>, and two 
##  distinct vertices are joined by an edge precisely when they have the same 
##  value at one coordinate. 
##  <P/>
##  The graph <M>L_{2}(n)</M> is strongly regular with parameters <M>(n^{2},2(n-1),n-2,2)</M>.
##  For <M>n\not= 4</M>, <M>L_{2}(n)</M> is the unique strongly regular graph with its
##  parameters. There are two pairwise non-isomomorphic strongly regular graphs that have the same
##  parameters as <M>L_{2}(4)</M>, which are the square lattice graph graph <M>L_{2}(4)</M> and the
##  <E>Shrikhande graph</E> (see <Cite Key="S_1959b"/>).
##   <Example>
##      <![CDATA[
##gap> SquareLatticeGraph(6);
##rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7, 13, 19, 25, 31 ] ], 
##  group := <permutation group with 5 generators>, isGraph := true, 
##  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], 
##      [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 3, 1 ], 
##      [ 3, 2 ], [ 3, 3 ], [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], [ 4, 1 ], [ 4, 2 ], 
##      [ 4, 3 ], [ 4, 4 ], [ 4, 5 ], [ 4, 6 ], [ 5, 1 ], [ 5, 2 ], [ 5, 3 ], 
##      [ 5, 4 ], [ 5, 5 ], [ 5, 6 ], [ 6, 1 ], [ 6, 2 ], [ 6, 3 ], [ 6, 4 ], 
##      [ 6, 5 ], [ 6, 6 ] ], order := 36, representatives := [ 1 ], 
##  schreierVector := [ -1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 
##      1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3 ] )
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
##  <Returns>A record.</Returns>
##
##  <Description>
##  This function returns the Hoffman-Singleton graph.
##  <P/>
##  The <E>Hoffman-Singleton graph</E> is the unique strongly regular graph with
##  parameters <M>(50,7,0,1)</M>. For more information on this graph, see <Cite Key="B_2018b"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=HoffmanSingletonGraph();;
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
##  <Returns>A record.</Returns>
##
##  <Description>
##  This function returns the Higman-Sims graph.
##  <P/>
##  The <E>Higman-Sims graph</E> is the unique strongly regular graph with
##  parameters <M>(100,22,0,6)</M>. For more information on this graph, see <Cite Key="B_2018b"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=HigmanSimsGraph();;
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
##  <Returns>A record.</Returns>
##
##  <Description>
##  This function returns the Sims-Gerwitz graph.
##  <P/>
##  The <E>Sims-Gerwitz graph</E> is the unique strongly regular graph with
##  parameters <M>(56,10,0,2)</M>. For more information on this graph, see <Cite Key="B_2018b"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=SimsGerwitzGraph();;
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SimsGerwitzGraph" );

#############################################################################
##
#E
