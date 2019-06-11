#############################################################################
##
#W  srglib.gd          Algebraic Graph Theory package             Rhys Evans
##
##
#Y  Copyright (C) ????????????????????????????????????TODO
##
##  Explanation of file????????????????????????????????????TODO
##

######################
## GLOBAL VARIABLES ##
######################
##---------------------------------------------------------------------------------------------


#############################################################################
##
#V  AGT_Brouwer_Parameters  
##
##  <#GAPDoc Label="AGT_Brouwer_Parameters">
##  <ManSection>
##  <Var Name="AGT_Brouwer_Parameters"/>
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
##
##  <Description>
##  Given parameters <C>parms</C>, this function returns <C>true</C> if there is a
##  strongly regular graph with parameters <C>parms</C> stored in this package.
##  If <C>parms</C> is a feasible parameter list but there is not any strongly
##  regular graphs with these parameters available, the function returns <C>false</C>.
##  If <C>parms</C> is not a feasible parameter list, this function returns <C>fail</C>.
##    <Example>
##      <![CDATA[
##gap> IsSRGAvailable([28,12,6,4]);
##true
##gap> IsSRGAvailable([28,9,0,4]); 
##false
##gap> IsSRGAvailable([28,6,0,4]);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsSRGAvailable" );

#############################################################################
##
#F  SRG( <parms> , <n> )
##  
##  <#GAPDoc Label="SRG">
##  <ManSection>
##  <Func Name="SRG"
##   Arg='parms, n'/>
##
##  <Description>
##  Given parameters <C>parms</C> and positive integer <C>n</C>, this function 
##  returns the <C>n</C>th strongly regular graph with parameters <C>parms</C> that 
##  is stored in this package. If <C>parms</C> is a feasible parameter list but 
##  there is not any strongly regular graphs with these parameters available, 
##  the function returns <C>false</C>. If <C>parms</C> is not a feasible 
##  parameter list, this function returns <C>fail</C>.
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
##gap> SRG([16,5,2,2],2);
##fail
##gap> SRG([28,9,0,4],1);      
##false
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
##
##  <Description>
##  Given parameters <C>parms</C>, this function returns the number of non-isomorphic
##  strongly regular graphs with parameters <C>parms</C> that are currently stored
##  in this package. If <C>parms</C> is a feasible parameter list but 
##  there is not any strongly regular graphs with these parameters available, 
##  the function returns <C>false</C>. If <C>parms</C> is not a feasible 
##  parameter list, this function returns <C>fail</C>.
##    <Example>
##      <![CDATA[
##gap> NrSRGs([36,15,6,6]);   
##32548
##gap> NrSRGs([28,9,0,4]); 
##false
##gap> NrSRGs([27,9,0,4]);
##fail
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
##
##  <Description>
##  Given parameters <C>parms</C>, this function 
##  returns a strongly regular graph with parameters <C>parms</C> that 
##  is stored in this package. If <C>parms</C> is a feasible parameter list but 
##  there is not any strongly regular graphs with these parameters available, 
##  the function returns <C>false</C>. If <C>parms</C> is not a feasible 
##  parameter list, this function returns <C>fail</C>.
##    <Example>
##      <![CDATA[
##gap> OneSRG([16,9,4,6]); 
##rec( adjacencies := [ [ 8, 9, 10, 11, 12, 13, 14, 15, 16 ] ], 
##  group := Group([ (6,7)(9,10)(12,13)(15,16), (5,6)(8,9)(11,12)(14,15), (2,5)
##  (3,6)(4,7)(9,11)(10,14)(13,15), (1,2)(5,8)(6,9)(7,10) ]), isGraph := true, 
##  names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
##  schreierVector := [ -1, 4, 3, 3, 3, 2, 1, 4, 4, 4, 3, 2, 1, 3, 2, 1 ] )
##gap> OneSRG([28,9,0,4]); 
##false
##gap> OneSRG([21,9,0,4]);
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
##
##  <Description>
##  Given parameters <C>parms</C>, this function returns a list of all non-isomorphic
##   strongly regular graph with parameters <C>parms</C> that 
##  are stored in this package. If <C>parms</C> is a feasible parameter list but 
##  there is not any strongly regular graphs with these parameters available, 
##  the function returns <C>false</C>. If <C>parms</C> is not a feasible 
##  parameter list, this function returns <C>fail</C>.
##    <Example>
##      <![CDATA[
##TODO
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
##
##  <Description>
##  Given parameters <C>parms</C>, this function returns an iterator of all non-isomorphic
##  strongly regular graph with parameters <C>parms</C> that 
##  are stored in this package. If <C>parms</C> is a feasible parameter list but 
##  there is not any strongly regular graphs with these parameters available, 
##  the function returns <C>false</C>. If <C>parms</C> is not a feasible 
##  parameter list, this function returns <C>fail</C>.
##    <Example>
##      <![CDATA[
##gap> SRGIterator([16,6,2,2]);
##<iterator>
##TODO
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
##
##  <Description>
##  Given an integer <C>v</C>, this function returns a list of all feasible parameter tuples
##  with at most <C>v</C> vertices, according to the list of Brouwer [REF]. The list
##  goes up to 1300 vertices.
##    <Example>
##      <![CDATA[
##gap>SmallFeasibleSRGParameterTuples(16);
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
#F  IsEnumeratedSRGParameterTuple( [ <v>, <k>, <l>, <m> ] )
##  
##  <#GAPDoc Label="IsEnumeratedSRGParameterTuple">
##  <ManSection>
##  <Func Name="IsEnumeratedSRGParameterTuple"
##   Arg='[ v, k, l, m ]'/>
##
##  <Description>
##  Given parameters <C>parms</C>, this function returns <C>true</C> if the 
##  strongly regular graphs with parameters <C>parms</C> have been enumerated. 
##  according to the list of Brouwer [REF]. The list
##  goes up to 1300 vertices.
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
#F  DisjointUnionOfCliques( <n1> , <n2>, ... )
##  
##  <#GAPDoc Label="DisjointUnionOfCliques">
##  <ManSection>
##  <Func Name="DisjointUnionOfCliques"
##   Arg='n1, n2, ... '/>
##
##  <Description>
##  Given integers n1, n2,..., this function returns the graph consisting of
##  the disjoint union of cliques with orders n1, n2,....  
##    <Example>
##      <![CDATA[
##gap>DisjointUnionOfCliques(3,5,7);            
##rec( adjacencies := [ [ 2, 3 ], [ 5, 6, 7, 8 ], [ 10, 11, 12, 13, 14, 15 ] ], 
##  group := Group([ (1,2,3), (1,2), (4,5,6,7,8), (4,5), (9,10,11,12,13,14,15),
##    (9,10) ]), isGraph := true, isSimple := true, order := 15, 
##  representatives := [ 1, 4, 9 ], 
##  schreierVector := [ -1, 1, 1, -2, 3, 3, 3, 3, -3, 5, 5, 5, 5, 5, 5 ] )
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
##  Given integers n1, n2,..., this function returns the complete multipartite
##  graph with parts of orders n1, n2,....  
##    <Example>
##      <![CDATA[
##gap> CompleteMultipartiteGraph(4,2,1);
##rec( adjacencies := [ [ 5, 6, 7 ], [ 1, 2, 3, 4, 7 ], [ 1, 2, 3, 4, 5, 6 ] ], 
##  group := Group([ (1,2,3,4), (1,2), (5,6) ]), isGraph := true, 
##  isSimple := true, order := 7, representatives := [ 1, 5, 7 ], 
##  schreierVector := [ -1, 1, 1, 1, -2, 3, -3 ] )
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
##  Given an integer n, this function returns the triangular graph on n points.
##    <Example>
##      <![CDATA[
##gap>TriangularGraph(7); 
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
##
##  <Description>
##  Given an integer n, this function returns the square lattice graph on <M>n^{2}</M> points.
##    <Example>
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
##
##  <Description>
##  This function returns the Hoffman-Singleton graph. 
##    <Example>
##      <![CDATA[
##gap> gamma:=HoffmanSingletonGraph();
##rec( 
##  adjacencies := [ [ 2, 5, 28, 34, 40, 41, 47 ], [ 1, 3, 29, 35, 36, 42, 48 ],
##      [ 2, 4, 30, 31, 37, 43, 49 ], [ 3, 5, 26, 32, 38, 44, 50 ], 
##      [ 1, 4, 27, 33, 39, 45, 46 ], [ 7, 10, 29, 31, 38, 45, 47 ], 
##      [ 6, 8, 30, 32, 39, 41, 48 ], [ 7, 9, 26, 33, 40, 42, 49 ], 
##      [ 8, 10, 27, 34, 36, 43, 50 ], [ 6, 9, 28, 35, 37, 44, 46 ], 
##      [ 12, 15, 30, 33, 36, 44, 47 ], [ 11, 13, 26, 34, 37, 45, 48 ], 
##      [ 12, 14, 27, 35, 38, 41, 49 ], [ 13, 15, 28, 31, 39, 42, 50 ], 
##      [ 11, 14, 29, 32, 40, 43, 46 ], [ 17, 20, 26, 35, 39, 43, 47 ], 
##      [ 16, 18, 27, 31, 40, 44, 48 ], [ 17, 19, 28, 32, 36, 45, 49 ], 
##      [ 18, 20, 29, 33, 37, 41, 50 ], [ 16, 19, 30, 34, 38, 42, 46 ], 
##      [ 22, 25, 27, 32, 37, 42, 47 ], [ 21, 23, 28, 33, 38, 43, 48 ], 
##      [ 22, 24, 29, 34, 39, 44, 49 ], [ 23, 25, 30, 35, 40, 45, 50 ], 
##      [ 21, 24, 26, 31, 36, 41, 46 ], [ 4, 8, 12, 16, 25, 28, 29 ], 
##      [ 5, 9, 13, 17, 21, 29, 30 ], [ 1, 10, 14, 18, 22, 26, 30 ], 
##      [ 2, 6, 15, 19, 23, 26, 27 ], [ 3, 7, 11, 20, 24, 27, 28 ], 
##      [ 3, 6, 14, 17, 25, 33, 34 ], [ 4, 7, 15, 18, 21, 34, 35 ], 
##      [ 5, 8, 11, 19, 22, 31, 35 ], [ 1, 9, 12, 20, 23, 31, 32 ], 
##      [ 2, 10, 13, 16, 24, 32, 33 ], [ 2, 9, 11, 18, 25, 38, 39 ], 
##      [ 3, 10, 12, 19, 21, 39, 40 ], [ 4, 6, 13, 20, 22, 36, 40 ], 
##      [ 5, 7, 14, 16, 23, 36, 37 ], [ 1, 8, 15, 17, 24, 37, 38 ], 
##      [ 1, 7, 13, 19, 25, 43, 44 ], [ 2, 8, 14, 20, 21, 44, 45 ], 
##      [ 3, 9, 15, 16, 22, 41, 45 ], [ 4, 10, 11, 17, 23, 41, 42 ], 
##      [ 5, 6, 12, 18, 24, 42, 43 ], [ 5, 10, 15, 20, 25, 48, 49 ], 
##      [ 1, 6, 11, 16, 21, 49, 50 ], [ 2, 7, 12, 17, 22, 46, 50 ], 
##      [ 3, 8, 13, 18, 23, 46, 47 ], [ 4, 9, 14, 19, 24, 47, 48 ] ], 
##  autGroup := <permutation group with 7 generators>, group := Group(()), 
##  isGraph := true, isSimple := true, order := 50, 
##  representatives := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 
##      17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 
##      35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50 ], 
##  schreierVector := [ -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, 
##      -14, -15, -16, -17, -18, -19, -20, -21, -22, -23, -24, -25, -26, -27, 
##      -28, -29, -30, -31, -32, -33, -34, -35, -36, -37, -38, -39, -40, -41, 
##      -42, -43, -44, -45, -46, -47, -48, -49, -50 ] )
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
##  This function returns the Higman-Sims graph.
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
##
##  <Description>
##  This function returns the Sims-Gerwitz graph.
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
