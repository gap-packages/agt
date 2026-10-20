#############################################################################
##
#W  setgrph.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct set graphs. 
##

# In BCN_1989 9.1A not specific
#############################################################################
##
#F  KneserGraph2( [<filter>, ]<integer> <integer>[, <bool>] )
##  
##  <#GAPDoc Label="KneserGraph">
##  <ManSection>
##  <Func Name="KneserGraph"
##   Arg='[fil, ]n, k[, invt]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,k</A>, with <A>k&lt;n</A>, this function 
##  returns the Kneser graph on the <A>k</A>-subsets of <C>[1..<A>n</A>]</C>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  If the optional argument <A>invt</A> exists, it should only take the value
##  <K>true</K>. Then this function behaves as described in Section
##  <Ref Subsect="The invariant vertex-set option of Graph"/>.
##  <P/>
##  Let <M>n,k</M> be positive integers where <M>k &lt; n</M>. The 
##  <E>Kneser graph</E> <M>K(n,k)</M> has vertex-set the <M>k</M>-subsets
##  of <M>\{1,..., n\}</M>, and distinct vertices <M>X,Y</M> are adjacent
##  if and only if <M>X \cap Y = \emptyset.</M> This graph is edge-regular with
##  parameters <M>(C(n,k),C(n-k,k),C(n-2k,k))</M>.
##    <Example>
##      <![CDATA[
##gap> KneserGraph2(6,2);
##rec( adjacencies := [ [ 10, 11, 12, 13, 14, 15 ] ], 
##  group := Group([ (1,6,10,13,15,5)(2,7,11,14,4,9)(3,8,12), (2,6)(3,7)(4,8)
##      (5,9) ]), isGraph := true, 
##  names := [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 2, 3 ], 
##      [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], 
##      [ 4, 5 ], [ 4, 6 ], [ 5, 6 ] ], order := 15, 
##  representatives := [ 1 ], 
##  schreierVector := [ -1, 2, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "KneserGraphCons", [IsObject, IsInt, IsInt, IsBool]);
DeclareGlobalFunction( "KneserGraph2" );

#############################################################################
##
#F  OddGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="OddGraph">
##  <ManSection>
##  <Func Name="OddGraph2"
##   Arg='[fil, ]d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>d</A>, this function returns the Odd graph 
##  of diameter <A>d</A>
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>d</M> be a positive integer. The <E>Odd graph</E> <M>O_{{d+1}}</M>
##  is the graph <M>K(2d+1,d)</M>. (see <Ref Func="KneserGraph"/>). This graph 
##  has <M>C(2d+1,d)</M> vertices and is distance-regular with intersection 
##  array given by
##  <Display Mode="M">
##     b_j = d+1 - \lfloor (j+1)/2 \rfloor,
##     c_j = \lfloor (j+1)/2 \rfloor 
##  </Display>
##  for <M>0 \leq j \leq d</M>, except for <M>b_d = 0</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 9.1D"/>. 
##    <Example>
##      <![CDATA[
##gap> OddGraph2(2);
##rec( adjacencies := [ [ 3, 5, 8 ] ], 
##  group := Group([ (1,2,3,5,7)(4,6,8,9,10), (2,4)(6,9)(7,10) ]), 
##  isGraph := true, 
##  names := [ [ 1, 2 ], [ 2, 3 ], [ 3, 4 ], [ 1, 3 ], [ 4, 5 ], [ 2, 4 ], 
##      [ 1, 5 ], [ 3, 5 ], [ 1, 4 ], [ 2, 5 ] ], order := 10, 
##  representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 1, 2, 1, 1, 1, 1, 2, 2 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "OddGraph2" );

#############################################################################
##
#F  DoubledOddGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="DoubledOddGraph">
##  <ManSection>
##  <Func Name="DoubledOddGraph"
##   Arg='[fil, ]d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>d</A>, this function returns the bipartite 
##  double of the Odd graph of diameter <A>d</A>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>d</M> be a positive integer. The <E>doubled odd graph</E>  has
##  vertex-set consisting of all subsets of <M>\{1,..., n\}</M> with sizes 
##  in <M>\{d,d+1\}</M>, and distinct vertices <M>X,Y</M> are 
##  adjacent if and only if <M>X \subset Y</M> or <M>Y \subset X</M>.
##  This gives a graph isomorphic to the bipartite double of the Odd
##  graph given by <Ref Func="OddGraph2"/> and
##  <Ref Func="BipartiteDoubleGraph"/>. This graph has <M>C(2d+1,d)</M> 
##  vertices, and is distance-regular with diameter <M>2d+1</M> and 
##  intersection array given by
##  <Display Mode="M">
##     b_j = 2d+2 - \lfloor (j+1)/2 \rfloor,
##     c_j = \lfloor (j+1)/2 \rfloor 
##  </Display>
##  for <M>0 \leq j \leq 2d+1</M>, except for <M>b_{{2d+1}} = 0</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 9.1D"/>. 
##    <Example>
##      <![CDATA[
##gap> DoubledOddGraph(2);
##rec( adjacencies := [ [ 2, 3, 4 ] ], 
##  group := Group([ (1,11,17,20,10)(2,12,18,9,4)(3,13,6,15,7)
##      (5,14,19,8,16), (5,11)(6,12)(7,13)(8,14)(9,15)(10,16), (1,18)(2,20)
##      (3,19)(4,17)(5,15)(6,16)(7,14)(8,13)(9,11)(10,12) ]), 
##  isGraph := true, 
##  names := [ [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 4 ], [ 1, 2, 5 ], [ 1, 3 ], 
##      [ 1, 3, 4 ], [ 1, 3, 5 ], [ 1, 4 ], [ 1, 4, 5 ], [ 1, 5 ], [ 2, 3 ], 
##      [ 2, 3, 4 ], [ 2, 3, 5 ], [ 2, 4 ], [ 2, 4, 5 ], [ 2, 5 ], [ 3, 4 ], 
##      [ 3, 4, 5 ], [ 3, 5 ], [ 4, 5 ] ], order := 20, 
##  representatives := [ 1 ], 
##  schreierVector := [ -1, 3, 3, 3, 2, 3, 3, 2, 3, 1, 1, 3, 3, 1, 3, 2, 1, 
##      3, 1, 1 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DoubledOddGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "DoubledOddGraph" );

#############################################################################
##
#F  TriangularGraph( <int> )
##  
##  <#GAPDoc Label="TriangularGraph">
##  <ManSection>
##  <Func Name="TriangularGraph"
##   Arg='n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an integer <A>n</A>, where <M><A>n</A> \geq 3</M>, this function 
##  returns the triangular graph on <A>n</A> points.
##  <P/>
##  Let <M>n</M> be an integer, where <M>n\geq 3</M>. The <E>triangular graph</E>
##  <M>T(n)</M> has vertex set consisting of the subsets of <M>\{1,2,...,n\}</M> 
##  of size <M>2</M>, and two distinct vertices <M>A,B</M> are joined by an edge
##  precisely when <M>|A\cap B|=1</M>. In other words, <M>T(n)</M> is the Johnson 
##  graph <M>J(n,2)</M> (see <Ref BookName="GRAPE" Label="JohnsonGraph"/>).
##  <P/>
##  The graph <M>T(n)</M> is strongly regular with parameters <M>({n \choose 2},2(n-2),n-2,4)</M>.
##  For <M>n\not= 8</M>, <M>T(n)</M> is the unique strongly regular graph with its
##  parameters. There are four pairwise non-isomomorphic strongly regular graphs that have the same
##  parameters as <M>T(8)</M>, which are the triangular graph <M>T(8)</M> and the
##  <E>Chang graphs</E> (see <Cite Key="C_1958"/> and <Cite Key="C_1959"/>). 
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
#F  FoldedJohnsonGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="FoldedJohnsonGraph">
##  <ManSection>
##  <Func Name="FoldedJohnsonGraph"
##   Arg='[fil, ]d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an integer <A>d</A> where <C><A>d</A>&gt;2</C>, this function 
##  returns the folded Johnson graph defined on the Johnson graph 
##  <M>J(2<A>d</A>,<A>d</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>d</M> be an integer where <M>d&gt;2</M>. The <E>folded Johnson
##  graph</E> <M>&Jbar;(2d,d)</M> is the antipodal quotient of the
##  Johnson graph <M>J(2d,d)</M> (see <Ref Func="AntipodalQuotientGraph"/>). 
##  This graph has <M>C(2d,d)/2</M> vertices, and is distance-regular with 
##  diameter <M>\lfloor d/2 \rfloor</M> and intersection array given by
##  <Display Mode="M">
##     b_j = (d-j)^2,
##     c_j = j^2 
##  </Display>
##  for <M>0 \leq j \leq d/2</M>, except for <M>c_{{d/2}} = 2d^2</M> if 
##  <M>d</M> is even.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 9.1C"/>. 
##    <Example>
##      <![CDATA[
##gap> FoldedJohnsonGraph(3);
##rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ], 
##  group := Group([ (1,2,3)(4,5,6,8,9,7), (2,4)(5,7)(8,10) ]), 
##  isGraph := true, 
##  names := [ [ [ 1, 2, 3 ], [ 4, 5, 6 ] ], [ [ 1, 5, 6 ], [ 2, 3, 4 ] ], 
##      [ [ 1, 2, 6 ], [ 3, 4, 5 ] ], [ [ 1, 3, 4 ], [ 2, 5, 6 ] ], 
##      [ [ 1, 3, 6 ], [ 2, 4, 5 ] ], [ [ 1, 2, 4 ], [ 3, 5, 6 ] ], 
##      [ [ 1, 4, 5 ], [ 2, 3, 6 ] ], [ [ 1, 4, 6 ], [ 2, 3, 5 ] ], 
##      [ [ 1, 2, 5 ], [ 3, 4, 6 ] ], [ [ 1, 3, 5 ], [ 2, 4, 6 ] ] ], 
##  order := 10, representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 1, 2, 1, 1, 2, 1, 1, 2 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("JohnsonGraphCons", [IsObject, IsInt, IsInt]);
DeclareConstructor("FoldedJohnsonGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "FoldedJohnsonGraph" );

#############################################################################
##
#F  ChangGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="ChangGraph">
##  <ManSection>
##  <Func Name="ChangGraph"
##   Arg='[fil, ]i'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an integer <A>i</A> in <C>[1,2,3]</C>, this function returns the 
##  <M><A>i</A>^{th}</M> Chang graph.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>i \in \{1, 2, 3\}</M> and consider the triangular graph <M>T(8)</M> 
##  as the line graph of the complete graph <M>K_8</M>. Further, consider the 
##  edges of the following graphs as vertices of <M>T(8)</M>:
##  <Enum>
##    <Item> 
##      Four pairwise disjoint edges.
##    </Item>
##    <Item> 
##      An 8-cycle, <M>C_8</M>.
##    </Item>
##    <Item> 
##      The disjoint union of a 3-cycle and a 5-cycle, <M>C_3</M> and 
##      <M>C_5</M>.
##    </Item>
##  </Enum>
##  The <M>i^{th}</M> <E>Chang graph</E> can be constructed by a Seidel
##  switching in <M>T(8)</M> with respect to the <M>i^{th}</M> subset of 
##  vertices above. These graphs are strongly regular with parameters 
##  <M>(28,12,6,4)</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.11"/> or 
##  <Cite Key="BCN_1989" Where="Section 3.11"/>. 
##    <Example>
##      <![CDATA[
##gap> ChangGraph(1);
##rec( 
##  adjacencies := [ [ 2, 3, 5, 6, 7, 8, 9, 10, 12, 13, 17, 22 ], 
##      [ 8, 9, 12, 13, 14, 16, 18, 20, 21, 26, 27, 28 ] ], 
##  group := <permutation group of size 384 with 6 generators>, 
##  isGraph := true, isSimple := true, 
##  names := [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ], 
##      [ 1, 8 ], [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 2, 7 ], 
##      [ 2, 8 ], [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], [ 3, 7 ], [ 3, 8 ], 
##      [ 4, 5 ], [ 4, 6 ], [ 4, 7 ], [ 4, 8 ], [ 5, 6 ], [ 5, 7 ], 
##      [ 5, 8 ], [ 6, 7 ], [ 6, 8 ], [ 7, 8 ] ], order := 28, 
##  representatives := [ 1, 4 ], 
##  schreierVector := [ -1, 5, 6, -2, 2, 5, 6, 1, 5, 3, 1, 1, 1, 1, 5, 2, 1, 
##      4, 6, 1, 4, 6, 3, 3, 3, 4, 5, 6 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ChangGraph" );
DeclareConstructor("ChangGraphCons", [IsObject, IsInt]);

#############################################################################
##
#E
