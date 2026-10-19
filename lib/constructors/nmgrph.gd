#############################################################################
##
#W  nmgrph.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct named graphs. 
##

#############################################################################
##
#F  TetrahedronGraph(  )
##  
##  <#GAPDoc Label="TetrahedronGraph">
##  <ManSection>
##  <Func Name="TetrahedronGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Tetrahedron graph.
##  <P/>
##  The <E>Tetrahedron graph</E> is the skeleton of the tetrahedron. This
##  graph is isomorphic to the complete graph with 4 vertices.
##    <Example>
##      <![CDATA[
##gap> TetrahedronGraph();
##rec( adjacencies := [ [ 2, 3, 4 ] ], group := Sym( [ 1 .. 4 ] ), 
##  isGraph := true, isSimple := true, order := 4, representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 1, 1 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "TetrahedronGraph" );

#############################################################################
##
#F  OctahedronGraph(  )
##  
##  <#GAPDoc Label="OctahedronGraph">
##  <ManSection>
##  <Func Name="OctahedronGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Octahedron graph.
##  <P/>
##  The <E>Octahedron graph</E> is the skeleton of the tetrahedron. This
##  graph is isomorphic to the Cocktail party graph with 6 vertices, and is 
##  strongly regular with parameters <M>(6,4,2,4)</M> (see 
##  <Ref Func="CocktailPartyGraph"/>).
##    <Example>
##      <![CDATA[
##gap> OctahedronGraph();
##rec( adjacencies := [ [ 3, 4, 5, 6 ] ], 
##  group := Group([ (1,2), (1,3)(2,4), (1,3,5)(2,4,6) ]), isGraph := true, 
##  names := [ [ 1, 1 ], [ 1, 2 ], [ 2, 1 ], [ 2, 2 ], [ 3, 1 ], [ 3, 2 ] ], 
##  order := 6, representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 2, 2, 3, 3 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "OctahedronGraph" );

#TODO conflict with digraphs
#############################################################################
##
#F  PetersenGraph2(  )
##  
##  <#GAPDoc Label="PetersenGraph2">
##  <ManSection>
##  <Func Name="PetersenGraph2"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Petersen graph.
##  <P/>
##  The <E>Petersen graph</E> has vertex-set the <M>2</M>-subsets of 
##  <M>\{1,..., 5\}</M>, and distinct vertices are adjacent if and only if their 
##  intersection is empty. By definition, this is exactly the Odd graph 
##  <M>O_3</M> and the Kneser graph <M>K(5,2)</M> (see <Ref Func="OddGraph2"/> 
##  and <Ref Func="KneserGraph"/>). This graph is strongly regular with 
##  parameters <M>(10,3,0,1)</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.3"/> or 
##  <Cite Key="BCN_1989" Where="Section 3.11"/>.
##    <Example>
##      <![CDATA[
##gap> PetersenGraph2();
##rec( adjacencies := [ [ 3, 5, 8 ] ], 
##  group := Group([ (1,2,3,5,7)(4,6,8,9,10), (2,4)(6,9)(7,10) ]), 
##  isGraph := true, 
##  names := [ [ 1, 2 ], [ 2, 3 ], [ 3, 4 ], [ 1, 3 ], [ 4, 5 ], [ 2, 4 ], 
##      [ 1, 5 ], [ 3, 5 ], [ 1, 4 ], [ 2, 5 ] ], order := 10, 
##  representatives := [ 1 ], schreierVector := [ -1, 1, 1, 2, 1, 1, 1, 1, 2, 2 
##     ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "PetersenGraph2" );

#############################################################################
##
#F  ShrikhandeGraph(  )
##  
##  <#GAPDoc Label="ShrikhandeGraph">
##  <ManSection>
##  <Func Name="ShrikhandeGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Shrikhande graph.
##  <P/>
##  The <E>Shrikhande graph</E> is the complement graph of the Latin square
##  graph of the group <M>&ZZ;_4</M> (see <Ref Func="LatinSquareGraph"/>). This
##  graph is strongly regular with parameters <M>(16,6,2,2)</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.6"/> or 
##  <Cite Key="BCN_1989" Where="Section 3.11"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=ShrikhandeGraph();;
##gap> SRGParameters(gamma);
##[ 16, 6, 2, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("ShrikhandeGraphCons", [IsObject]);
DeclareGlobalFunction( "ShrikhandeGraph" );

#############################################################################
##
#F  ClebschGraph(  )
##  
##  <#GAPDoc Label="ClebschGraph">
##  <ManSection>
##  <Func Name="ClebschGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Clebsch graph.
##  <P/>
##  The <E>Clebsch graph</E> is the halved graph of the <M>5</M>-dimensional
##  hypercube graph (see <Ref Func="HalvedCubeGraph2"/>, 
##  <Ref Func="HypercubeGraph2"/> and <Ref Func="HalvedGraph"/>). This graph
##  is strongly regular with parameters <M>(16,10,6,6)</M>.
##  <P/>
##  For more information on this, see 
##  <Cite Key="BV_2022" Where="Section 10.7"/> or 
##  <Cite Key="BCN_1989" Where="Section 3.11"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=ClebschGraph();;
##gap> SRGParameters(gamma);
##[ 16, 10, 6, 6 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ClebschGraph" );

#TODO not full automorphism group
#############################################################################
##
#F  SchlaefliGraph(  )
##  
##  <#GAPDoc Label="SchlaefliGraph">
##  <ManSection>
##  <Func Name="SchlaefliGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Schläfli graph.
##  <P/>
##  Let 
##  <M>e = (-3, -3, 1, 1, 1, 1, 1, 1), f = (3, -1, -1, -1, -1, -1, -1, 3)</M>.
##  The <E>Schläfli graph</E> has vertex-set the vectors obtained from 
##  permuting the first 6 and last 2 entries of <M>e</M> and <M>f</M>. Distinct
##  vertices <M>a,b</M> are adjacent if <M>a . b = 8</M> (where <M>.</M> is the
##  standard dot product). This graph is strongly regular with parameters
##  <M>(27,16,10,8)</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.10"/> or 
##  <Cite Key="BCN_1989" Where="Section 3.11"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=SchlaefliGraph();;
##gap> SRGParameters(gamma);
##[ 27, 16, 10, 8 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SchlaefliGraph" );

#TODO implementation list use? not full auto, might want to explain vertices
#############################################################################
##
#F  HoffmanSingletonGraph(  )
##  
##  <#GAPDoc Label="HoffmanSingletonGraph">
##  <ManSection>
##  <Func Name="HoffmanSingletonGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Hoffman-Singleton graph.
##  <P/>
##  The <E>Hoffman-Singleton graph</E> can be constructed as follows. Let 
##  <M>P_h</M> be a pentagon and <M>Q_i</M> be a pentagram for 
##  <M>h,i \in \{1,..., 5\}</M>, and consider the union of these graphs. Then 
##  add an edge between <M>j \in P_h</M> and <M>hi+j\in Q_i</M> (modulo 5) for 
##  each <M>j \in P_h</M> and <M>i \in \{1,..., 5\}</M>. The resulting graph is 
##  the Hoffman-Singleton graph, which is strongly regular with parameters
##  <M>(50,7,0,1)</M>. 
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.19"/> or 
##  <Cite Key="BCN_1989" Where="Section 13.1"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=HoffmanSingletonGraph();;                                 
##gap> SRGParameters(gamma);
##[ 50, 7, 0, 1 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HoffmanSingletonGraph" );

# TODO full auto
#############################################################################
##
#F  GewirtzGraph(  )
##  
##  <#GAPDoc Label="GewirtzGraph">
##  <ManSection>
##  <Func Name="GewirtzGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Gewirtz graph (also known as the Sims-Gewirtz
##  graph).
##  <P/>
##  The <E>Gewirtz graph</E> has vertex-set the blocks of the unique Steiner 
##  system in <M>S(3,6,22)</M> which do not contain a fixed point. Distinct 
##  vertices are adjacent if and only if their intersection is empty. This graph 
##  is strongly regular with parameters <M>(56,10,0,2)</M>. 
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.20"/> or 
##  <Cite Key="BCN_1989" Where="Section 11.4G"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=GewirtzGraph();;
##gap> SRGParameters(gamma);
##[ 56, 10, 0, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GewirtzGraph" );
DeclareSynonym( "SimsGewirtzGraph", GewirtzGraph );

#TODO full auto
#############################################################################
##
#F  WittStronglyRegularGraph(  )
##  
##  <#GAPDoc Label="WittStronglyRegularGraph">
##  <ManSection>
##  <Func Name="WittStronglyRegularGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Witt strongly regular graph (also known as 
##  the <M>M_{{22}}</M> graph).
##  <P/>
##  The <E>Witt strongly regular graph</E> has vertex-set the blocks of the 
##  unique Steiner system in <M>S(3,6,22)</M>. Distinct vertices are adjacent if 
##  and only if their intersection is empty. This graph is strongly regular with 
##  parameters <M>(77,16,0,4)</M>. 
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.27"/> or 
##  <Cite Key="BCN_1989" Where="Section 11.4C"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=WittStronglyRegularGraph();;
##gap> SRGParameters(gamma);
##[ 77, 16, 0, 4 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "WittStronglyRegularGraph" );

#TODO full auto
# In BVM_2022 Sec 10.31
#############################################################################
##
#F  HigmanSimsGraph(  )
##  
##  <#GAPDoc Label="HigmanSimsGraph">
##  <ManSection>
##  <Func Name="HigmanSimsGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Higman-Sims graph.
##  <P/>
##  The <E>Higman-Sims graph</E> has vertex-set the cocliques of the 
##  Hoffman-Singleton graph of size <M>15</M> (see 
##  <Ref Func="HoffmanSingletonGraph"/>). Distinct vertices <M>A,B</M> are 
##  adjacent if and only if <M>|A\cap B|\in \{0,8\}</M>. This graph is the
##  unique strongly regular graph with parameters <M>(100,22,0,6)</M>. 
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.31"/>. 
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
#F  KlinGraph(  )
##  
##  <#GAPDoc Label="KlinGraph">
##  <ManSection>
##  <Func Name="KlinGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Klin graph.
##  <P/>
##  The <E>Klin graph</E> can be constructed as follows. Let <M>G = S_7</M>
##  and <M>H = \langle (1,2,3,4,5,6), (1,4) \rangle</M> be a subgroup of 
##  <M>G</M>. The vertex-set of the Klin graph is the set of right cosets of 
##  <M>H</M> in <M>G</M>. Distinct vertices <M>Ha,Hb</M> 
##  are adjacent if and if <M>ab^{{-1}}</M> is in 
##  <Display Mode="M"> \{(3,4,5,6,7), (2,4,6,3,5,7), (3,5,6,7), (2,4,5,6,7,3),
##              (2,3,5,6,7), (2,4,5,6), (2,3,5,6)\}.</Display>
##  This graph is strongly regular with parameters <M>(210,99,48,45)</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.53"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=KlinGraph();;
##gap> SRGParameters(gamma);
##[ 210, 99, 48, 45 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "KlinGraph" );

# TODO Full aut
#############################################################################
##
#F  McLaughlinGraph(  )
##  
##  <#GAPDoc Label="McLaughlinGraph">
##  <ManSection>
##  <Func Name="McLaughlinGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the McLaughlin graph.
##  <P/>
##  The <E>McLaughlin graph</E> can be constructed as follows. Consider the 
##  Hoffman-Singleton graph <M>H</M> with edge-set <M>E</M> and set <M>C</M> of 
##  cocliques of size <M>15</M>. The vertex-set of the McLaughlin graph is 
##  the union <M>E\cup C</M>. Distinct vertices <M>U,W</M> are adjacent if 
##  and only if one of the following is true. 
##  <List>
##    <Item><M>U,W \in E</M> are disjoint edges which lie in the same 5-cycle
##          of <M>H</M>, or 
##    </Item>
##    <Item><M>U \in E, W \in C</M> and <M>U\cap W= \emptyset</M>, or
##    </Item>
##    <Item><M>U,W \in C</M> and <M>|U \cap W|\in \{0,3\}</M>.
##    </Item>
##  </List> 
##  This graph is the unique strongly regular with parameters <M>(275,112,30,56)</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 10.61"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=McLaughlinGraph();;
##gap> SRGParameters(gamma);
##[ 275, 112, 30, 56 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "McLaughlinGraph" );

#############################################################################
##
#F  CubeGraph(  )
##  
##  <#GAPDoc Label="CubeGraph">
##  <ManSection>
##  <Func Name="CubeGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Cube graph.
##  <P/>
##  The <E>Cube graph</E> is the skeleton of the cube. This graph is 
##  isomorphic to the 3-dimensional hypercube graph and the Hamming graph
##  <M>H(3,2)</M> (see <Ref Func="HypercubeGraph2"/> and 
##  <Ref Func="HammingGraph2"/>). This graph has 8 vertices and is 
##  distance-regular with intersection array <M>\{3, 2, 1; 1, 2, 3\}</M>.
##    <Example>
##      <![CDATA[
##gap> CubeGraph();
##rec( adjacencies := [ [ 2, 3, 5 ] ], 
##  group := Group([ (1,5)(2,6)(3,7)(4,8), (1,3)(2,4)(5,7)(6,8), (1,2)(3,4)
##      (5,6)(7,8), (2,5,3)(4,6,7), (3,5)(4,6) ]), isGraph := true, 
##  names := [ [ 1, 1, 1 ], [ 1, 1, 2 ], [ 1, 2, 1 ], [ 1, 2, 2 ], 
##      [ 2, 1, 1 ], [ 2, 1, 2 ], [ 2, 2, 1 ], [ 2, 2, 2 ] ], order := 8, 
##  representatives := [ 1 ], schreierVector := [ -1, 3, 2, 3, 1, 3, 2, 3 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CubeGraph" );

# In BCN_1989 6.9 not specific
#############################################################################
##
#F  HeawoodGraph(  )
##  
##  <#GAPDoc Label="HeawoodGraph">
##  <ManSection>
##  <Func Name="HeawoodGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Heawood graph.
##  <P/>
##  The <E>Heawood graph</E> is the incidence graph of the Desarguesian 
##  plane <M>PG(2,2)</M> (see <Ref Func="DesarguesianPlaneIncidenceGraph"/>).
##  This graph has 14 vertices and is distance-regular with intersection array 
##  <M>\{3, 2, 2; 1, 1, 3\}</M>.
##    <Example>
##      <![CDATA[
##gap> AdjFunGraph(arg);
##[ 16, 6, 2, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HeawoodGraph" );

# TODO explain vertices?
#############################################################################
##
#F  IcosahedronGraph(  )
##  
##  <#GAPDoc Label="IcosahedronGraph">
##  <ManSection>
##  <Func Name="IcosahedronGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Icosahedron graph.
##  <P/>
##  The <E>Icosahedron graph</E> is the skeleton of the icosahedron. This 
##  graph has 12 vertices and is distance-regular with intersection array 
##  <M>\{5, 2, 1; 1, 2, 5\}</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=IcosahedronGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 5 ], [ 1, 2, 2 ], [ 2, 2, 1 ], [ 5, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IcosahedronGraph" );

#TODO full auto PGammaO(3,9) Aut(S_6)
#############################################################################
##
#F  SylvesterGraph(  )
##  
##  <#GAPDoc Label="SylvesterGraph">
##  <ManSection>
##  <Func Name="SylvesterGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Sylvester graph (a.k.a. Sylvester's double six
##  graph).
##  <P/>
##  Let <M>\Omega = \{1, 2,..., 6\}</M>. The generalized quadrangle
##  <M>GQ(2,2)</M> can be constructed as having points 
##  <M>P = \{p \subset \Omega: |p| = 2\}</M> and lines <M>L</M> being the set of 
##  partitions of <M>\Omega</M> by points in <M>P</M>.
##  <P/>
##  Let <M>O_a = \{p \in P: a \in p\}</M> for each <M>a \in \Omega</M> (the
##  ovoids of <M>GQ(2,2)</M>). Let <M>\Sigma</M> be the set of spreads of
##  <M>GQ(2,2)</M>.
##  <P/>
##  The <E>Sylvester graph</E> has vertex-set <M>\Omega \times \Sigma</M>. 
##  Distinct vertices <M>(a,S),(b,T)</M> are adjacent if and only if 
##  <M>a&neq;b, S&neq;T</M>, and the unique point in <M>O_a \cap O_b</M> lies on 
##  the unique line in <M>S \cap T</M>. This graph has 36 vertices and is 
##  distance-regular with intersection array <M>\{5, 4, 2; 1, 1, 4\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 13.1A"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=SylvesterGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 5 ], [ 1, 0, 4 ], [ 1, 2, 2 ], [ 4, 1, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SylvesterGraph" );

#############################################################################
##
#F  PerkelGraph(  )
##  
##  <#GAPDoc Label="PerkelGraph">
##  <ManSection>
##  <Func Name="PerkelGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Perkel graph.
##  <P/>
##  The <E>Perkel graph</E> has vertex-set a conjugacy class in <M>PSL(2,19)</M> 
##  of a subgroup isomorphic to <M>Alt(5)</M>. Distinct vertices <M>A,B</M> are 
##  adjacent if and only if <M>A \cap B</M> contains an element of order 5. This 
##  graph has 57 vertices and is distance-regular with intersection array 
##  <M>\{6, 5, 2; 1, 1, 3\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 13.3"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=PerkelGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 6 ], [ 1, 0, 5 ], [ 1, 3, 2 ], [ 3, 3, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "PerkelGraphCons", [IsObject]);
DeclareGlobalFunction( "PerkelGraph" );

#TODO full aut 
#############################################################################
##
#F  GossetGraph(  )
##  
##  <#GAPDoc Label="GossetGraph">
##  <ManSection>
##  <Func Name="GossetGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Gosset graph.
##  <P/>
##  Let <M>e=(-3,-3,1,1,1,1,1,1)</M>. The <E>Gosset graph</E> has vertex-set the 
##  vectors obtained from permuting coordinates and/or taking opposite vectors
##  of <M>e</M>. Distinct vectors <M>u,w</M> are adjacent if and only if 
##  <M>u.w = 8</M> (the standard inner product). This graph has 56 vertices and
##  is distance-regular with intersection array <M>\{27, 10, 1; 1, 10, 27\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 3.11"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=GossetGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 27 ], [ 1, 16, 10 ], [ 10, 16, 1 ], [ 27, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GossetGraph" );

#############################################################################
##
#F  Witt23Graph(  )
##  
##  <#GAPDoc Label="Witt23Graph">
##  <ManSection>
##  <Func Name="Witt23Graph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the truncated Witt graph.
##  <P/>
##  The <E>truncated Witt graph</E> has vertex-set the blocks of a Steiner 
##  system <M>S(5,8,24)</M> that do not contain a fixed symbol. Distinct 
##  vertices <M>A,B</M> are adjacent if and only if <M>A cap B = \emptyset</M>. 
##  This graph has 506 vertices and is distance-regular with intersection array 
##  <M>\{15, 14, 12; 1, 1, 9\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 11.4B"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=Witt23Graph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 15 ], [ 1, 0, 14 ], [ 1, 2, 12 ], [ 9, 6, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Witt23Graph" );

#############################################################################
##
#F  Witt24Graph(  )
##  
##  <#GAPDoc Label="Witt24Graph">
##  <ManSection>
##  <Func Name="Witt24Graph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the large Witt graph.
##  <P/>
##  The <E>large Witt graph</E> has vertex-set the blocks of a Steiner 
##  system <M>S(5,8,24)</M>. Distinct vertices <M>A,B</M> are adjacent if and 
##  only if <M>A cap B = \emptyset</M>. This graph has 759 vertices and is
##  distance-regular with intersection array <M>\{30, 28, 24; 1, 3, 15\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 11.4A"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=Witt24Graph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 30 ], [ 1, 1, 28 ], [ 3, 3, 24 ], [ 15, 15, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Witt24Graph" );

#TODO full aut
#############################################################################
##
#F  HigmanGraph(  )
##  
##  <#GAPDoc Label="HigmanGraph">
##  <ManSection>
##  <Func Name="HigmanGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Higman graph. 
##  <P/>
##  Let <M>\Sigma = \{1, 2,..., 24\}</M> and <M>i,j \in \Sigma</M>be distinct. 
##  The <E>Higman graph</E> has vertex-set the blocks of a Steiner system 
##  <M>S(5,8,24)</M> which contain exactly one of the symbols <M>i,j</M>. 
##  Distinct vertices <M>A,B</M> are adjacent if and only if 
##  <M>|(A \cap B) \setminus \{i,j\}| \in \{0, 4\}</M>. This definition results 
##  in a graph isomorphic to the incidence graph of Higman's symmetric design.
##  This graph has 352 vertices and is distance-regular with intersection array 
##  <M>\{50, 49, 36; 1, 14, 50\}</M>.
##  <P/>
##  For more information on this graph, see  
##  <Cite Key="BCN_1989" Where="Section 11.4E"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=HigmanGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 50 ], [ 1, 0, 49 ], [ 14, 0, 36 ], [ 50, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HigmanGraph" );

#############################################################################
##
#F  CoxeterGraph(  )
##  
##  <#GAPDoc Label="CoxeterGraph">
##  <ManSection>
##  <Func Name="CoxeterGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Coxeter graph.
##  <P/>
##  The <E>Coxeter graph</E> is the polar graph <M>NOorth(1,3,7)</M> (see 
##  <Ref Func="PolarGraphNOorth"/>). This graph has 28 vertices and is 
##  distance-regular with intersection array <M>\{3, 2, 2, 1; 1, 1, 1, 2\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 12.3"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=CoxeterGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 1, 1, 1 ], [ 2, 1, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CoxeterGraph" );

#TODO full aut
#############################################################################
##
#F  Witt22Graph(  )
##  
##  <#GAPDoc Label="Witt22Graph">
##  <ManSection>
##  <Func Name="Witt22Graph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the doubly truncated Witt graph.
##  <P/>
##  Let <M>i,j \in \{1, 2,..., 24\}</M> be distinct. The 
##  <E>doubly truncated Witt graph</E> has vertex-set the blocks of a Steiner 
##  system <M>S(5,8,24)</M> which do not contain <M>i</M> or <M>j</M>. Distinct 
##  vertices <M>A,B</M> are adjacent if and only if <M>A \cap B = \emptyset</M>. 
##  This graph has 330 vertices and is distance-regular with intersection array 
##  <M>\{7, 6, 4, 4; 1, 1, 1, 6\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 11.4C"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=Witt22Graph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 1, 2, 4 ], [ 1, 2, 4 ], [ 6, 1, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Witt22Graph" );

#TODO full aut, check def
#############################################################################
##
#F  UnitalGraph(  )
##  
##  <#GAPDoc Label="UnitalGraph">
##  <ManSection>
##  <Func Name="UnitalGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Unital graph.
##  <P/>
##  The <E>Unital graph</E> has vertex-set the subplanes in <M>PG(2,4)</M> 
##  isomorphic to <M>AG(2,3)</M>. Distinct vertices <M>U,W</M> are 
##  adjacent if and only if they intersect in one point. This graph has 280 
##  vertices and is distance-regular with intersection array 
##  <M>\{9, 8, 6, 3; 1, 1, 3, 8\}</M>.
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 11.3G"/>. 
##    <Example>
##      <![CDATA[
##gap>  gamma:=UnitalGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 9 ], [ 1, 0, 8 ], [ 1, 2, 6 ], [ 3, 3, 3 ], [ 8, 1, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("UnitalGraphCons", [IsObject]);
DeclareGlobalFunction( "UnitalGraph" );

#TODO explain vertices
#############################################################################
##
#F  DodecahedronGraph(  )
##  
##  <#GAPDoc Label="DodecahedronGraph">
##  <ManSection>
##  <Func Name="DodecahedronGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Dodecahedron graph.
##  <P/>
##  The <E>Dodecahedron graph</E> is the skeleton of the dodecahedron. This 
##  graph has 20 vertices and is distance-regular with parameters 
##  <M>\{3, 2, 1, 1, 1; 1, 1, 1, 2, 3\}</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=DodecahedronGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 1, 1 ], [ 1, 1, 1 ], [ 2, 0, 1 ], 
##  [ 3, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "DodecahedronGraph" );

#TODO Ref?
#############################################################################
##
#F  DesarguesGraph(  )
##  
##  <#GAPDoc Label="DesarguesGraph">
##  <ManSection>
##  <Func Name="DesarguesGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Desargues graph.
##  <P/>
##  The <E>Desargues graph</E> is the bipartite double of the Petersen 
##  graph (see <Ref Func="PetersenGraph2"/> and 
##  <Ref Func="DoubledOddGraph"/>). This graph has 20 vertices and is 
##  distance-regular with intersection array 
##  <M>\{3, 2, 2, 1, 1; 1, 1, 2, 2, 3\}</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=DesarguesGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 2, 0, 1 ], [ 2, 0, 1 ], 
##  [ 3, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "DesarguesGraph" );

#############################################################################
##
#F  BiggsSmithGraph(  )
##  
##  <#GAPDoc Label="BiggsSmithGraph">
##  <ManSection>
##  <Func Name="BiggsSmithGraph"
##   Arg=''/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This function returns the Biggs-Smith graph.
##  <P/>
##  The <E>Biggs-Smith graph</E> has vertex-set a conjugacy class of a subgroup
##  of <M>PSL(2,17)</M> which is isomorphic to <M>Sym(4)</M>. Distinct vertices
##  are adjacent if and only if their intersection is isomorphic to the dihedral
##  group of order 8. This graph has 102 vertices and is distance-regular with 
##  intersection array <M>\{3, 2, 2, 2, 1, 1, 1; 1, 1, 1, 1, 1, 1, 3\}</M>. 
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section 13.4"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=BiggsSmithGraph();;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 1, 1, 1 ], 
##  [ 1, 1, 1 ], [ 1, 1, 1 ], [ 3, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "BiggsSmithGraphCons", [IsObject]);
DeclareGlobalFunction( "BiggsSmithGraph" );

#############################################################################
##
#E
