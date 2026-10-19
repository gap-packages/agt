#############################################################################
##
#W  basic.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct basic graphs. 
##

#############################################################################
##
#F  CompleteMultipartiteGraph( [<filter>, ]<list>  )
#F  CompleteMultipartiteGraph( [<filter>, ]<integer>, <integer>  )
##  
##  <#GAPDoc Label="CompleteMultipartiteGraph">
##  <ManSection>
##  <Func Name="CompleteMultipartiteGraph"
##   Arg='[fil, ]sizes'/>
##  <Func Name="CompleteMultipartiteGraph"
##   Arg='[fil, ]nparts, size' Label="for parts of equal sizes"/>
##  <Returns>A graph.</Returns>
##	
##  <Description>
##  Given a list of positive integers <A>sizes</A>, this function returns the
##  complete multipartite graph with part sizes <A>sizes</A>. Given positive
##  integers <A>nparts,size</A>, this function returns the complete
##  multipartite graph with <A>nparts</A> parts, each of size <A>size</A>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>n_{1}, n_{2},..., n_{t}</M> be positive integers. The <E>complete
##  multipartite graph</E>, <M>K_{{n_{1}, n_{2},..., n_{t}}}</M>, has vertex-set 
##  the union of <M>t</M> disjoint sets <M>X_{1}, X_{2},..., X_{t}</M> of sizes 
##  <M>n_{1}, n_{2},..., n_{t}</M> respectively. Two distinct vertices are 
##  adjacent if and only if they belong to different parts <M>X_{i}</M>. If for
##  some <M>n</M> we have <M>n_{i} = n</M> for all <M>i</M>, we denote the graph
##  by <M>K_{{t \times n}}</M>, which is strongly regular with parameters 
##  <M>(tn,(t-1)n,(t-2)n,(t-1)n)</M>.
##  <P/>
##  This function will give a graph with <C>Sum(sizes)</C> or 
##  <C>nparts*size</C> vertices. Each vertex is a pair of positive integers,
##  with first entry denoting the part the vertex is contained in, and the
##  second entry denoting the number of the vertex in its part. 
##    <Example>
##      <![CDATA[
##gap> CompleteMultipartiteGraph(3,4);
##rec( adjacencies := [ [ 5, 6, 7, 8, 9, 10, 11, 12 ] ], 
##  group := Group([ (1,2,3,4), (1,2), (1,5)(2,6)(3,7)(4,8), (1,5,9)
##      (2,6,10)(3,7,11)(4,8,12) ]), isGraph := true, 
##  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], 
##      [ 2, 2 ], [ 2, 3 ], [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], 
##      [ 3, 4 ] ], order := 12, representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 1, 1, 3, 3, 3, 3, 4, 4, 4, 4 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "CompleteMultipartiteGraphCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "CompleteMultipartiteGraph" );

#############################################################################
##
#F  CycleGraph2( <integer> )
##  
##  <#GAPDoc Label="CycleGraph">
##  <ManSection>
##  <Func Name="CycleGraph2"
##   Arg='n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an integer <A>n</A> where <C><A>n</A>&gt;1</C>, this function returns 
##  the cycle graph of order <A>n</A>.
##  <P/>
##  Let <M>n</M> be an integer, <M>n&gt;1</M>. The <E>cycle graph</E> of 
##  order <M>n</M> has vertex-set <M>\{1,..., n\}</M>, and two distinct vertices
##  <M>x,y</M> are adjacent if and only if <M>x-y \equiv \pm 1\;(mod\; n)</M>.
##    <Example>
##      <![CDATA[
##gap> CycleGraph2(5);
##rec( adjacencies := [ [ 2, 5 ] ], 
##  group := Group([ (1,2,3,4,5), (2,5)(3,4) ]), isGraph := true, 
##  names := [ 1 .. 5 ], order := 5, representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 1, 1, 2 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CycleGraph2" );

# In BVM_2022 1.1.3 not specific
#############################################################################
##
#F  CocktailPartyGraph( <integer> )
##  
##  <#GAPDoc Label="CocktailPartyGraph">
##  <ManSection>
##  <Func Name="CocktailPartyGraph"
##   Arg='n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this graph returns the cocktail 
##  party graph with <A>n</A> parts. 
##  <P/>
##  Let <M>n</M> be a positive integer. The <E>cocktail party graph</E> with
##  <M>n</M> parts is the complete multipartite graph <M>K_{{n \times 2}}</M> 
##  (see <Ref Func="CompleteMultipartiteGraph"/>). This graph is strongly 
##  regular with parameters <M>(2n,2(n-1),2(n-2),2(n-1))</M>.
##    <Example>
##      <![CDATA[
##gap> CocktailPartyGraph(4);
##rec( adjacencies := [ [ 3, 4, 5, 6, 7, 8 ] ], 
##  group := Group([ (1,2), (1,3)(2,4), (1,3,5,7)(2,4,6,8) ]), 
##  isGraph := true, 
##  names := [ [ 1, 1 ], [ 1, 2 ], [ 2, 1 ], [ 2, 2 ], [ 3, 1 ], 
##      [ 3, 2 ], [ 4, 1 ], [ 4, 2 ] ], order := 8, 
##  representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 2, 2, 3, 3, 3, 3 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CocktailPartyGraph" );

# In BCN_1989 1.3 not specific BVM_2022 1.1.9 not specific 
#############################################################################
##
#F  PaleyGraph( <integer> )
##  
##  <#GAPDoc Label="PaleyGraph">
##  <ManSection>
##  <Func Name="PaleyGraph"
##   Arg='q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an odd prime power <A>q</A>, this function returns the  
##  Paley graph of order <A>q</A>.
##  <P/>
##  Let <M>q</M> be a positive power of an odd prime number. Then the   
##  <E>Paley graph</E> of order <M>q</M>, <M>P(q)</M>, is the graph with 
##  vertex-set <M>GF(q)</M>, and distinct vertices <M>x,y</M> are adjacent if 
##  and only if <M>x-y</M> is a square. Therefore, this graph is undirected
##  if and only if <M>q\equiv 1\;(mod\; 4)</M>. When 
##  <M>q\equiv 1\;(mod\; 4)</M>, <M>P(q)</M> is strongly regular with parameters
##  <M>(q,(q-1)/2,(q-5)/4,(q-1)/4)</M>. 
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BV_2022" Where="Section 7.4.4"/> or
##  <Cite Key="J_2016"/>.
##    <Example>
##      <![CDATA[
##gap> PaleyGraph(9);
##rec( adjacencies := [ [ 2, 3, 5, 8 ] ], 
##  group := Group([ (1,2,3)(4,5,9)(6,8,7), (1,4,7)(2,5,6)(3,9,8), 
##      (2,5,3,8)(4,6,7,9), (4,6)(5,8)(7,9) ]), isGraph := true, 
##  names := [ 0*Z(3), Z(3)^0, Z(3), Z(3^2), Z(3^2)^2, Z(3^2)^3, 
##      Z(3^2)^5, Z(3^2)^6, Z(3^2)^7 ], order := 9, 
##  representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 1, 2, 2, 3, 2, 3, 2 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "PaleyGraph" );

#TODO LatinSquareAdjacency not used?
#############################################################################
##
#F  LatinSquareGraph( <matrix> )
#F  LatinSquareGraph( [<filter>, ]<group>[, <bool>] )
##  
##  <#GAPDoc Label="LatinSquareGraph">
##  <ManSection>
##  <Func Name="LatinSquareGraph"
##   Arg='mat'/>
##  <Func Name="LatinSquareGraph"
##   Arg='[fil, ]grp' Label="for groups"/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a matrix <A>mat</A>, this function returns the Latin square graph
##  associated to <A>mat</A>. Given a group <A>grp</A>, this function 
##  returns the Latin square graph associated to the Cayley table of 
##  <A>grp</A>.
##  <P/>
##  If the optional argument <A>fil</A> exists, it should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as described in 
##  <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  If the optional argument <A>invt</A> exists, it should only take the value
##  <K>true</K>. Then this function behaves as described in Section
##  <Ref Subsect="The invariant vertex-set option of Graph"/>.
##  <P/>
##  Let <M>M</M> be an <M>n \times m</M> matrix. The <E>Latin square graph</E>
##  associated with <M>M</M> is the graph with vertex-set 
##  <M>\{1,..., n\} \times \{1,..., m\}</M>, and distinct vertices 
##  <M>(i,j),(k,\ell)</M> are adjcacent if and only if either
##  <List>
##    <Item><M>i=k</M>, or </Item>
##    <Item><M>j=\ell</M>, or</Item>
##    <Item><M>M_{i,j}=M_{k,\ell}</M>.</Item>
##  </List>
##  <P/>
##  Let <M>G</M> be a group. The <E>Latin square graph</E> of <M>G</M> is the 
##  Latin square graph associated with the Cayley table of <M>G</M>. The matrix
##  is then indexed by <M>G</M> and the vertex-set of the graph is 
##  <M>G \times G</M>.
##  <P/>
##  If the matrix is a latin square of order <M>n</M> in the above (e.g. a 
##  Cayley table of a group), the resulting graph will be strongly regular with 
##  parameters <M>(n^2,3(n-1),n,6)</M>.
##  <P/>
##  This function will give a graph with <C>Product(DimensionsMat(mat))</C> or 
##  <C>Order(grp)^2</C> vertices. Each vertex is a pair of indices of the matrix
##  the graph is defined on.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BV_2022" Where="Section 8.4"/>.
##    <Example>
##      <![CDATA[
##gap> LatinSquareGraph(CyclicGroup(4));
##rec( adjacencies := [ [ 2, 3, 4, 5, 6, 9, 12, 13, 15 ] ], 
##  group := <permutation group with 8 generators>, isGraph := true, 
##  names := [ [ <identity> of ..., <identity> of ... ], 
##      [ <identity> of ..., f2 ], [ <identity> of ..., f1 ], 
##      [ <identity> of ..., f1*f2 ], [ f2, <identity> of ... ], 
##      [ f2, f2 ], [ f2, f1 ], [ f2, f1*f2 ], [ f1, <identity> of ... ], 
##      [ f1, f2 ], [ f1, f1 ], [ f1, f1*f2 ], [ f1*f2, <identity> of ... ],
##      [ f1*f2, f2 ], [ f1*f2, f1 ], [ f1*f2, f1*f2 ] ], order := 16, 
##  representatives := [ 1 ], 
##  schreierVector := [ -1, 4, 3, 8, 2, 4, 3, 8, 1, 4, 3, 7, 2, 4, 7, 8 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "LatinSquareGraphCons", [IsObject, IsObject, IsBool]);
DeclareGlobalFunction( "LatinSquareGraph" );

#############################################################################
##
#F  CompleteTaylorGraph( <integer> )
##  
##  <#GAPDoc Label="CompleteTaylorGraph">
##  <ManSection>
##  <Func Name="CompleteTaylorGraph"
##   Arg='n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an integer <A>n</A> where <C><A>n</A>&gt;1</C>, this function returns 
##  the complete Taylor graph with <C>2*<A>n</A></C> vertices.
##  <P/>
##  Let <M>n</M> be an integer, <M>n&gt;1</M>. The <E>complete Taylor graph</E>
##  with parts of size <M>n</M> (a.k.a the <M>n</M>-crown graph) is the
##  bipartite graph with parts <M>\{x_1,..., x_n\},\{y_1,..., y_n\}</M>,
##  and vertices <M>x_i,y_j</M> are adjacent if and only if <M>i&neq;j</M>.
##  This graph is distance-regular with intersection array 
##  <M>\{n-1,n-2,1;1,n-2,n-1\}</M>.
##  <P/>
##  This function will return a graph for which each vertex is a pair of 
##  integers. For a given vertex, the first entry denotes the part the vertex is
##  contained in, and the second entry denotes the number of the vertex in its 
##  part. 
##  <P/>
##  For more information on this graph, see 
##  <Cite Key="BCN_1989" Where="Section1.5"/>
##    <Example>
##      <![CDATA[
##gap> CompleteTaylorGraph(3);
##rec( adjacencies := [ [ 5, 6 ] ], 
##  group := Group([ (1,2)(4,5), (1,2,3)(4,5,6), (1,4)(2,5)(3,6) ]), 
##  isGraph := true, isSimple := true, 
##  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ] ], 
##  order := 6, representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 2, 3, 3, 3 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CompleteTaylorGraph" );

#TODO why have a filter?
#############################################################################
##
#F  HaarGraph2( <integer>[, <list>] )
##  
##  <#GAPDoc Label="HaarGraph">
##  <ManSection>
##  <Func Name="HaarGraph2"
##   Arg='k[, list]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an integer <A>k</A>, this graph returns the Haar graph of <A>k</A>. 
##  If <A>list</A> is given, this function returns the cyclic Haar graph with 
##  symbol <A>list</A>.
##  <P/>
##  Let <M>k</M> be an integer and <M>A</M> be a list of elements in the group
##  <M>&ZZ;_k</M>. The <E>cyclic Haar graph</E> with symbol <M>A</M>, 
##  <M>H(&ZZ;_k,A)</M>, has vertex-set <M>\{1, 2\} \times \{1,..., k\}</M>. Two 
##  distinct vertices <M>(i,x),(j,y)</M> are adjacent if and only if 
##  <M>(x-y)(-1)^i\;(mod\; k)</M> is in <M>A</M>. 
##  <P/>
##  Now let <M>n</M> be an integer with binary length 
##  <M>k=1+\lfloor log_2(n) \rfloor</M> and binary vector
##  <M>b(n)=(b_{{k-1}},..., b_0)</M>. The <E>Haar graph</E> of <M>n</M> is the 
##  graph <M>H(&ZZ;_k,B(n))</M>, where <M>B(n)=\{i\in &ZZ;_k: b_i=1\}</M>.
##  <P/>
##  For more information on this graph, see <Cite Key="HMP_2002"/>.
##    <Example>
##      <![CDATA[
##gap> HaarGraph2(11);
##rec( adjacencies := [ [ 5, 6, 8 ] ], 
##  group := Group([ (1,2,3,4)(5,6,7,8), (1,5)(2,8)(3,7)(4,6) ]), 
##  isGraph := true, 
##  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], 
##      [ 2, 3 ], [ 2, 4 ] ], order := 8, representatives := [ 1 ], 
##  schreierVector := [ -1, 1, 1, 1, 2, 1, 2, 2 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "HaarGraphCons", [IsObject, IsInt, IsList]);
DeclareGlobalFunction( "HaarGraph2" );

#############################################################################
##
#E
