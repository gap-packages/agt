#############################################################################
##
#W  vctgrph.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct vector graphs. 
##

#############################################################################
##
#F  HammingGraph2( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="HammingGraph2">
##  <ManSection>
##  <Func Name="HammingGraph2"
##   Arg='[fil, ]d, e'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given positive integers <A>d,e</A>, this function returns the Hamming 
##  graph <M>H(<A>d</A>,<A>e</A>)</M>. This function constructs the same 
##  graph as <Ref BookName="Grape" Label="HammingGraph"/>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>d,e</M> be positive integers. The <E>Hamming graph</E> 
##  <M>H(d,e)</M> is the graph with vertex-set <M>\{1,..., e\}^d</M>, and
##  distinct vertices <M>x,y</M> are adjacent if and only if they differ 
##  in exactly one coordinate. This graph has <M>e^d</M> vertices and is 
##  distance-regular with diameter <M>d</M> and intersection array given by 
##  <Display Mode="M">
##     b_j = (d-j)(e-1),
##     c_j = j 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 9.2"/>.
##    <Example>
##      <![CDATA[
##gap> HammingGraph2(4,2);
##rec( adjacencies := [ [ 2, 3, 5, 9 ] ], 
##  group := <permutation group with 6 generators>, isGraph := true, 
##  names := [ [ 1, 1, 1, 1 ], [ 1, 1, 1, 2 ], [ 1, 1, 2, 1 ], [ 1, 1, 2, 2 ], 
##      [ 1, 2, 1, 1 ], [ 1, 2, 1, 2 ], [ 1, 2, 2, 1 ], [ 1, 2, 2, 2 ], 
##      [ 2, 1, 1, 1 ], [ 2, 1, 1, 2 ], [ 2, 1, 2, 1 ], [ 2, 1, 2, 2 ], 
##      [ 2, 2, 1, 1 ], [ 2, 2, 1, 2 ], [ 2, 2, 2, 1 ], [ 2, 2, 2, 2 ] ], 
##  order := 16, representatives := [ 1 ], 
##  schreierVector := [ -1, 4, 3, 4, 2, 4, 3, 4, 1, 4, 3, 4, 2, 4, 3, 4 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "HammingGraphCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "HammingGraph2" );

#############################################################################
##
#F  SquareLatticeGraph( <int> )
##  
##  <#GAPDoc Label="SquareLatticeGraph">
##  <ManSection>
##  <Func Name="SquareLatticeGraph"
##   Arg='n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an integer <A>n</A>, where <M><A>n</A> \geq 2</M>, this function 
##  returns the square lattice graph on <M>n^2</M> points.
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
##  <E>Shrikhande graph</E> (see <Ref Label="ShrikhandeGraph"/>).
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


# In BH_20?? 12.3.1 not specific # In BCN_1989 1.2 1.3 not specific
#############################################################################
##
#F  HypercubeGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="HypercubeGraph">
##  <ManSection>
##  <Func Name="HypercubeGraph2"
##   Arg='[fil, ]d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>d</A>, this function returns the 
##  <A>d</A>-dimensional hypercube graph.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>d</M> be a positive integer. The <E><M>d</M>-dimensional hypercube
##  graph</E> is the graph with vertex-set <M>\{1,2\}^d</M>, and
##  distinct vertices <M>x,y</M> are adjacent if and only if they differ 
##  in exactly one coordinate. This is exactly the Hamming graph <M>H(d,2)</M> 
##  (see <Ref Func="HammingGraph2"/>).
##    <Example>
##      <![CDATA[
##gap> HypercubeGraph2(3);
##rec( adjacencies := [ [ 2, 3, 5 ] ], 
##  group := Group([ (1,5)(2,6)(3,7)(4,8), (1,3)(2,4)(5,7)(6,8), (1,2)(3,4)(5,6)
##      (7,8), (2,5,3)(4,6,7), (3,5)(4,6) ]), isGraph := true, 
##  names := [ [ 1, 1, 1 ], [ 1, 1, 2 ], [ 1, 2, 1 ], [ 1, 2, 2 ], [ 2, 1, 1 ], 
##      [ 2, 1, 2 ], [ 2, 2, 1 ], [ 2, 2, 2 ] ], order := 8, 
##  representatives := [ 1 ], schreierVector := [ -1, 3, 2, 3, 1, 3, 2, 3 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HypercubeGraph2" );

#############################################################################
##
#F  DoobGraph( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="DoobGraph">
##  <ManSection>
##  <Func Name="DoobGraph"
##   Arg='[fil, ]n, d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,d</A>, this function returns the Doob graph
##  <M>D(<A>n</A>,<A>d</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>n,d</M> be positive integers. The <E>Doob graph</E> <M>D(n,d)</M>
##  is the graph box product of <M>n</M> copies of the Shrikhande graph, and
##  the Hamming graph <M>H(d,4)</M> (see <Ref Func="BoxProductGraph"/>, 
##  <Ref Func="ShrikhandeGraph"/> and <Ref Func="HammingGraph2"/>). This graph 
##  has <M>4^{{d+2n}}</M> vertices and is distance-regular with diameter 
##  <M>d+2n</M> and the same intersection array as the Hamming graph
##  <M>H(d+2n,4)</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.2B"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=DoobGraph(2,1);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 15 ], [ 1, 2, 12 ], [ 2, 4, 9 ], [ 3, 6, 6 ], [ 4, 8, 3 ], 
##  [ 5, 10, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DoobGraphCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "DoobGraph" );

#############################################################################
##
#F  HalvedCubeGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="HalvedCubeGraph">
##  <ManSection>
##  <Func Name="HalvedCubeGraph2"
##   Arg='[fil, ]d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>d</A>, this function returns the halved 
##  <A>d</A>-cube graph.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>d</M> be a positive integer. The <E>halved <M>d</M>-cube</E> is
##  the halved graph of the <M>d</M>-dimensional hypercube graph (see  
##  <Ref Func="HalvedGraph"/> and <Ref Func="HypercubeGraph2"/>). This graph has 
##  <M>2^{{d-1}}</M> vertices, and for <M>d \geq 3 </M>, this graph is 
##  distance-regular with diameter <M>\lfloor d/2 \rfloor</M> and intersection 
##  array given by
##  <Display Mode="M">
##     b_j = (d-2j)(d-2j-1)/2,
##     c_j = j(2j-1) 
##  </Display>
##  for <M>0 \leq j \leq d/2</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.2D"/>.
##    <Example>
##      <![CDATA[
##gap> HalvedCubeGraph2(4);
##rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], 
##  group := Group([ (3,5)(4,6), (2,5,3)(4,6,7), (2,7)(4,5), (2,7)(3,6), 
##      (1,2,5,8,7,4)(3,6) ]), isGraph := true, isSimple := true, 
##  names := [ [ 1, 1, 1, 1 ], [ 1, 1, 2, 2 ], [ 1, 2, 1, 2 ], [ 1, 2, 2, 1 ], 
##      [ 2, 1, 1, 2 ], [ 2, 1, 2, 1 ], [ 2, 2, 1, 1 ], [ 2, 2, 2, 2 ] ], 
##  order := 8, representatives := [ 1 ], 
##  schreierVector := [ -1, 5, 1, 3, 2, 4, 3, 5 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "HalvedCubeGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "HalvedCubeGraph2" );

#############################################################################
##
#F  FoldedCubeGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="FoldedCubeGraph">
##  <ManSection>
##  <Func Name="FoldedCubeGraph"
##   Arg='[fil, ]d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>d</A>, this function returns the folded 
##  <A>d</A>-cube graph.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>d</M> be a positive integer. The <E>folded <M>d</M>-cube</E> is
##  the antipodal quotient graph of the <M>d</M>-dimensional hypercube graph  
##  (see <Ref Func="AntipodalQuotientGraph"/> and 
##  <Ref Func="HypercubeGraph2"/>). This graph has <M>2^{{d-1}}</M> vertices 
##  and for <M>d \geq 3 </M>, this graph is distance-regular with diameter 
##  <M>\lfloor d/2 \rfloor</M> and intersection array given by
##  <Display Mode="M">
##     b_j = d-j,
##     c_j = j 
##  </Display>
##  for <M>0 \leq j \leq d/2</M>, except for <M>c_{{d/2}} = d</M> when <M>d</M> 
##  is even.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.2D"/>
##    <Example>
##      <![CDATA[
##gap> FoldedCubeGraph(4);
##rec( adjacencies := [ [ 2, 3, 5, 8 ] ], 
##  group := Group([ (1,2)(3,4)(5,6)(7,8), (1,3)(2,4)(5,7)(6,8), (1,5)(2,6)(3,7)
##      (4,8), (2,3)(6,7), (2,3,5)(4,7,6), (2,8)(3,5), (2,5)(3,8), (1,8)(2,7)
##      (3,6)(4,5) ]), isGraph := true, 
##  names := [ [ [ 1, 1, 1, 1 ], [ 2, 2, 2, 2 ] ], 
##      [ [ 1, 2, 2, 2 ], [ 2, 1, 1, 1 ] ], [ [ 1, 2, 1, 1 ], [ 2, 1, 2, 2 ] ], 
##      [ [ 1, 1, 2, 2 ], [ 2, 2, 1, 1 ] ], [ [ 1, 1, 2, 1 ], [ 2, 2, 1, 2 ] ], 
##      [ [ 1, 2, 1, 2 ], [ 2, 1, 2, 1 ] ], [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], 
##      [ [ 1, 1, 1, 2 ], [ 2, 2, 2, 1 ] ] ], order := 8, 
##  representatives := [ 1 ], schreierVector := [ -1, 1, 2, 2, 3, 3, 8, 8 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "FoldedCubeGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "FoldedCubeGraph" );

#############################################################################
##
#F  FoldedHalvedCubeGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="FoldedHalvedCubeGraph">
##  <ManSection>
##  <Func Name="FoldedHalvedCubeGraph"
##   Arg='[fil, ]d'/>
##  <Func Name="HalvedFoldedCubeGraph"
##   Arg='[fil, ]d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a integer <A>d</A> with <C><A>d</A>&gt;2</C>, this function returns 
##  the folded halved <M>2<A>d</A></M>-cube graph.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>d</M> be a positive integer. The <E>folded halved 
##  <M>d</M>-cube</E> is the antipodal quotient of the halved graph of the
##  <M>d</M>-dimensional hypercube graph (see 
##  <Ref Func="AntipodalQuotientGraph"/>, <Ref Func="HalvedGraph"/> and 
##  <Ref Func="HypercubeGraph2"/>). This graph has <M>2^{{d-1}}</M> vertices and 
##  for <M>d \geq 3 </M>, this graph is distance-regular with diameter 
##  <M>\lfloor d/2 \rfloor</M> and intersection array given by
##  <Display Mode="M">
##     b_j = (d-j)(d-2j-1),
##     c_j = j(2j-1) 
##  </Display>
##  for <M>0 \leq j \leq d/2</M>, except for <M>c_{{d/2}} = d(d-1)</M> when
##  <M>d</M> is even.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.2D"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=FoldedHalvedCubeGraph(4);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 28 ], [ 1, 12, 15 ], [ 12, 16, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "FoldedHalvedCubeGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "FoldedHalvedCubeGraph" );
DeclareSynonym("HalvedFoldedCubeGraph", FoldedHalvedCubeGraph);

#############################################################################
##
#F  BrouwerGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="BrouwerGraph">
##  <ManSection>
##  <Func Name="BrouwerGraph"
##   Arg='[fil, ]q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, this function returns the Brouwer-Pasechnik 
##  graph <M>Br(q)</M> of diameter 3.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power. The <E>Brouwer graph</E> <M>Br(q)</M>
##  is the graph with vertex-set <M>GF(q)^3 \times GF(q)^3</M>,
##  and distinct vertices <M>(x_1,y_2),(x_2,y_2)</M> are adjacent if and 
##  only if <M>x_1 - y_1 = x_2 \times y_2</M> (where <M>\times</M> is the cross
##  product of vectors). This graph has <M>q^6</M> vertices and is 
##  distance-regular with diameter 3 and intersection array 
##  <M>\{q^3 − 1, q^3 − q, q^3 − q^2 + 1; 1, q, q^2 − 1\}</M>. 
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BP_2012" Where="Section 3"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=BrouwerGraph(2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 2, 0, 5 ], [ 3, 4, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "BrouwerGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "BrouwerGraph" );

#############################################################################
##
#F  PasechnikGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="PasechnikGraph">
##  <ManSection>
##  <Func Name="PasechnikGraph"
##   Arg='[fil, ]q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, this function returns the Brouwer-Pasechnik 
##  graph <M>Pa(q)</M> of diameter 4.
##  <P/>
##  Let <M>q</M> be a prime power. The <E>Pasechnik graph</E> <M>Pa(q)</M>
##  can be constructed as the extended bipartite double of the Brouwer-Pasechnik
##  graph <M>Br(q)</M> (see <Ref Func="ExtendedBipartiteDoubleGraph"/>
##  and <Ref Func="BrouwerGraph"/>). This graph has <M>2q^6</M> vertices and is
##  distance-regular with intersection array 
##  <M>\{q^3, q^3 − 1, q^3 − q, q^3 − q^2 + 1; 1, q, q^2 − 1, q^3\}</M>. 
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BP_2012" Where="Section 3"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=PasechnikGraph(3);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 27 ], [ 1, 0, 26 ], [ 3, 0, 24 ], [ 8, 0, 19 ], [ 27, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "PasechnikGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "PasechnikGraph" );

# The additive symplectic cover of the complete graph on q^{2n} vertices.
# TODO to include second usage: Arg='[fil, ]gamma[, h]' Label="for a graph"
#############################################################################
##
#F  AdditiveSymplecticCoverGraph( [<filter>, ]<integer>, <integer>
##                                                            [, <integer>] )
#F  AdditiveSymplecticCoverGraph( [<filter>, ]<graph>[, <integer>] )
##  
##  <#GAPDoc Label="AdditiveSymplecticCoverGraph">
##  <ManSection>
##  <Func Name="AdditiveSymplecticCoverGraph"
##   Arg='[fil, ]q, n[, h]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>n</A>, this function 
##  returns the additive symplectic cover graph associated with the vector space
##  <M>GF(<A>q</A>)^{{2<A>n</A>}}</M>. If <A>h</A> is a non-negative integer,
##  this function returns the additive symplectic cover graph defined as above, 
##  but with respect to a <A>h</A>-dimensional subspace of <M>GF(<A>q</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>q</M> be a prime power and <M>n</M> and positive integer. Let
##  <M>K</M> be a <M>h</M>-dimensional subspace of <M>GF(q)</M>, <M>&Kbar;</M> 
##  be the cosets of <M>K</M> in <M>GF(q)</M>, with order <M>r = q/|K|</M>.
##  Let <M>B</M> be the symplectic invariant bilinear form acting on 
##  <M>GF(q)^{{2n}}</M>. 
##  <P/>
##  Then the <E>additive symplectic cover graph</E> with respect to <M>q,n</M> 
##  and <M>K</M> has vertex-set <M>&Kbar; \times GF(q)^{{2n}}</M>. Two distinct 
##  vertices <M>(a+K,x),(b+K,y)</M> are adjacent if and only if 
##  <M>B(x,y) \in a - b + K</M>. This graph has <M>rq^{{2n}}</M> vertices, and 
##  is distance regular with intersection array 
##  <M>\{q^{{2n}} - 1, q^{{2n}} - q^{{2n-1}}, 1; 1, q^{{2n}} - q^{{2n-1}}, 
##                                                           q^{{2n}} - 1\}.</M>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 12.5"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=AdditiveSymplecticCoverGraph(2,2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 15 ], [ 1, 6, 8 ], [ 8, 6, 1 ], [ 15, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("AdditiveSymplecticCoverGraphCons",
                    [IsObject, IsInt, IsInt, IsInt]);
DeclareGlobalFunction( "AdditiveSymplecticCoverGraph" );

# The multiplicative symplectic cover of the complete graph on q+1 vertices.
# TODO as a cover graph?
#############################################################################
##
#F  MultiplicativeSymplecticCoverGraph( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="MultiplicativeSymplecticCoverGraph">
##  <ManSection>
##  <Func Name="MultiplicativeSymplecticCoverGraph"
##   Arg='[fil, ]q, m'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>m</A>, this function 
##  returns a multiplicative symplectic cover graph associated with the vector 
##  space <M>GF(<A>q</A>)^2</M> and a multiplicative subgroup of order <A>m</A>
##  in <M>GF(<A>q</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>q</M> be a prime power and <M>m,r</M> be positive integers such that
##  <M>q = rm + 1</M>. Let <M>K</M> be a multiplicative subgroup of <M>GF(q)</M> 
##  of order <M>m</M>. Let <M>B</M> be the symplectic invariant bilinear form 
##  acting on <M>GF(q)^2</M>. 
##  <P/>
##  The <E>multiplicative symplectic cover graph</E> with respect to <M>q</M> 
##  and <M>K</M> has vertex-set <M>\{Ku : u \in GF(q)^2 \setminus \{0\}\}</M>. 
##  Two distinct vertices <M>Kx,Ky</M> are adjacent if and only if 
##  <M>B(x,y) \in K</M>. This graph has <M>r(q + 1)</M> vertices and is 
##  distance-regular if either <M>q</M> or <M>r</M> is even. In this case, the 
##  graph has intersection array <M>\{q, q - m - 1, 1; 1, m, q\}</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 12.5"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=MultiplicativeSymplecticCoverGraph(9,4);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 9 ], [ 1, 4, 4 ], [ 4, 4, 1 ], [ 9, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("MultiplicativeSymplecticCoverGraphCons",
                    [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "MultiplicativeSymplecticCoverGraph" );

## TODO q even e=0 drg of diameter 3 array 
##  {q^{d-1}-1,q^{d-1}-q^{d-2},1;1,q^{d-2},q^{d-1}-1} (symplectic cover? 12,5)
## TODO shorten notation explanation i.e take e out to definition somewhere
#############################################################################
##
#F  AffinePolarGraphVO( [<integer>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="AffinePolarGraphVO">
##  <ManSection>
##  <Func Name="AffinePolarGraphVO"
##   Arg='[e, ]d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>       
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this function 
##  returns the affine polar graph <M>VO(<A>d</A>,<A>q</A>)</M>. If <A>e</A> is
##  given and lies in <C>[0,-1,1]</C>, this function returns the affine polar 
##  graph <M>VO(<A>e</A>,<A>d</A>,<A>q</A>)</M>. If <A>e</A> is not given, the 
##  function works as if <A>e</A> is <C>0</C>.
##  <P/>
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>Q</M> be a nondegenerate quadratic form acting on <M>GF(q)^d</M>, and
##  <M>e</M> be the type of <M>Q</M>. Note that this means <M>d</M> is odd if
##  and only if <M>e=0</M>.
##  <P/>
##  The <E>affine polar graph</E> <M>VO(e,d,q)</M> is the graph with 
##  vertex-set <M>GF(q)^d</M>, and distinct vertices <M>x,y</M>
##  are adjacent if and only if <M>Q(x-y)=0</M>. 
##  <Alt Not='Text'>Variations in notation found in the literature include 
##  <M>VO_{d}^{e}(q),VO^{e}(d,q)</M>, and <M>e</M> taking values in 
##  <M>\{+,-\}</M>.</Alt> 
##  This graph has <M>q^d</M> vertices and is strongly regular if 
##  <M>e \in \{1,-1\}</M>. In this case we have an integer <M>m</M> such that 
##  <M>d = 2m</M> and the graph has strongly regular parameters 
##  <Table Align='ccc'>
##    <Row><Item><M>v</M></Item><Item><M>=</M></Item>
##      <Item><M>q^{{2m}}</M></Item></Row>
##    <Row><Item><M>k</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^m - e)(q^{{m-1}} + e)</M></Item></Row>
##    <Row><Item><M>\lambda</M></Item><Item><M>=</M></Item>
##      <Item><M>q(q^{{m-1}} - e)(q^{{m-2}} + e) + q - 2</M></Item></Row>
##    <Row><Item><M>\mu</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^{{m-1}} + e)q^{{m-1}}</M></Item></Row>
##  </Table>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BV_2022" Where="Section 3.3.1"/>
##    <Example>
##      <![CDATA[
##gap> AffinePolarGraphVO(1,2,4);
##rec( adjacencies := [ [ 2, 3, 4, 5, 9, 13 ] ], 
##  group := <permutation group with 7 generators>, isGraph := true, 
##  names := [ [ 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0 ], [ 0*Z(2), Z(2^2) ], 
##      [ 0*Z(2), Z(2^2)^2 ], [ Z(2)^0, 0*Z(2) ], [ Z(2)^0, Z(2)^0 ], 
##      [ Z(2)^0, Z(2^2) ], [ Z(2)^0, Z(2^2)^2 ], [ Z(2^2), 0*Z(2) ], 
##      [ Z(2^2), Z(2)^0 ], [ Z(2^2), Z(2^2) ], [ Z(2^2), Z(2^2)^2 ], 
##      [ Z(2^2)^2, 0*Z(2) ], [ Z(2^2)^2, Z(2)^0 ], [ Z(2^2)^2, Z(2^2) ], 
##      [ Z(2^2)^2, Z(2^2)^2 ] ], order := 16, representatives := [ 1 ], 
##  schreierVector := [ -1, 6, 7, 1, 4, 6, 7, 7, 5, 6, 7, 1, 5, 6, 7, 1 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AffinePolarGraphVO" );

# TODO shorten notation explanation i.e take e out to definition somewhere
# TODO q even handling
#############################################################################
##
#F  AffinePolarGraphVNO( [<integer>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="AffinePolarGraphVNO">
##  <ManSection>
##  <Func Name="AffinePolarGraphVNO"
##   Arg='[e, ]d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an odd prime power <A>q</A> and positive integer <A>d</A>, this
##  function returns the affine polar graph <M>VNO(<A>d</A>,<A>q</A>)</M>. If 
##  <A>e</A> is given and lies in <C>[0,-1,1]</C>, this function returns the 
##  affine polar graph <M>VNO(<A>e</A>,<A>d</A>,<A>q</A>)</M>. If <A>e</A> is not 
##  given, the function works as if <A>e</A> is <C>0</C>.
##  <P/>
##  Let <M>q</M> be an odd prime power and <M>d</M> and positive integer. Let
##  <M>Q</M> be a nondegenerate quadratic form acting on <M>GF(q)^d</M>, and
##  <M>e</M> be the type of <M>Q</M>. Note that this means <M>d</M> is odd if
##  and only if <M>e=0</M>.
##  <P/>
##  The <E>affine polar graph</E> <M>VNO(e,d,q)</M> is the graph with 
##  vertex-set <M>GF(q)^d</M>, and distinct vertices <M>x,y</M>
##  are adjacent if and only if <M>Q(x-y)</M> is a nonzero square. 
##  <Alt Not='Text'>Variations in notation found in the literature include 
##  <M>VNO_{d}^{e}(q),VNO^{e}(d,q)</M>, and <M>e</M> taking values in 
##  <M>\{+,-\}</M>.</Alt> 
##  This graph has <M>q^d</M> vertices and is strongly regular if 
##  <M>e \in \{1,-1\}</M>. In this case we have an integer <M>m</M> such that 
##  <M>d = 2m</M> and the graph has strongly regular parameters 
##  <Table Align='ccc'>
##    <Row><Item><M>v</M></Item><Item><M>=</M></Item>
##      <Item><M>q^{{2m}}</M></Item></Row>
##    <Row><Item><M>k</M></Item><Item><M>=</M></Item>
##      <Item><M>(q - 1)(q^m - e)q^{{m-1}}/2</M></Item></Row>
##    <Row><Item><M>\lambda</M></Item><Item><M>=</M></Item>
##      <Item><M>\mu + eq^{{m-1}}</M></Item></Row>
##    <Row><Item><M>\mu</M></Item><Item><M>=</M></Item>
##      <Item><M>(q - 1)(q^m - q^{{m-1}} - 2e)q^{{m-1}}/4</M></Item></Row>
##  </Table>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 3.3.2"/>
##    <Example>
##      <![CDATA[
##gap> gamma:=AffinePolarGraphVNO(1,4,3);;
##gap> SRGParameters(gamma);
##[ 81, 24, 9, 6 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AffinePolarGraphVNO" );

#############################################################################
##
#E
