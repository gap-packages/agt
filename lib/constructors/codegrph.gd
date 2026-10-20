#############################################################################
##
#W  codegrph.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct code graphs. 
##

# In BCN_1989 11.1D not specific
# De Caen, Mathon and Moorhouse's Preparata graph Pr(t, e)
# TODO add ref, and other input type as cover
#############################################################################
##
#F  PreparataGraph( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="PreparataGraph">
##  <ManSection>
##  <Func Name="PreparataGraph"
##   Arg='[fil, ]t, e'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given positive integers <A>t,e</A> such that 
##  <M>gcd(2<A>t</A>-1,<A>e</A>)=1</M>, this function returns the Preparata 
##  graph <M>Pr(<A>t</A>,<A>e</A>)</M>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, can only take value 
##  <C>FullAutomorphismGroup</C>. The vertex naming of this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>t,e</M> be positive integer such that <M>gcd(2t-1,e)=1</M>. Let 
##  <M>q=2^{2t-1},s=2^e</M>. 
##  <P/>
##  The <E>Preparata graph</E> <M>Pr(t,e)</M> has vertex-set 
##  <M>GF(q) \times GF(2) \times GF(q)</M>. Any two distinct 
##  vertices <M>(a,i,\alpha),(b,j,\beta)</M> are adjacent if and only if 
##  <M>\alpha+\beta=a^sb+ab^s+(i+j)(a^{s+1}+b^{s+1})</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=PreparataGraph(2,2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 15 ], [ 1, 0, 14 ], [ 2, 12, 1 ], [ 15, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "PreparataGraphCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "PreparataGraph" );

# In BCN_1989 11.2 not specific
# The coset graph of a Kasami code over an odd power extension
# of a binary field.
# TODO ref and code def, gcd(m,2j+1)=1 condition?
#############################################################################
##
#F  KasamiGraph( <integer>, <integer>, <integer> )
##  
##  <#GAPDoc Label="KasamiGraph">
##  <ManSection>
##  <Func Name="KasamiGraph"
##   Arg='i, j, m'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given positive integers <A>i,j,m</A>, this function returns the Kasami 
##  graph on <M>GF(q^{2<A>j</A>+1})^2</M> with adjacency parameter 
##  <A>m</A>, where <M>q=2^{<A>i</A>}</M>. 
##  <P/>
##  Let <M>i,j,m</M> be positive integers and let 
##  <M>q=2^i,t=2^m+1</M>. 
##  <P/>
##  The <E>Kasami graph</E> <M>Kas(i,j,m)</M> has vertex-set 
##  <M>GF(q^{2j+1})^2</M>. Any two distinct 
##  vertices <M>(a,\alpha),(b,\beta)</M> are adjacent if and only if 
##  <M>a+b=(\alpha+\beta)^t</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=KasamiGraph(1,1,2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 2, 0, 5 ], [ 3, 4, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "KasamiGraph" );

# In BCN_1989 11.2 not specific
#############################################################################
##
#F  ExtendedKasamiGraph( <integer>, <integer>, <integer> )
##  
##  <#GAPDoc Label="ExtendedKasamiGraph">
##  <ManSection>
##  <Func Name="ExtendedKasamiGraph"
##   Arg='i, j, m'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given positive integers <A>i,j,m</A>, this function returns the 
##  extended Kasami graph on <M>GF(q^{2<A>j</A>+1})^2</M> with 
##  adjacency parameter <A>m</A>, where <M>q=2^{<A>i</A>}</M>. 
##  <P/>
##  Let <M>i,j,m</M> be positive integers and let 
##  <M>q=2^i,t=2^m+1</M>. 
##  <P/>
##  The <E>extended Kasami graph</E> is the extended bipartite double graph
##  of the Kasami graph (see <Ref Func="KasamiGraph"/>).
##    <Example>
##      <![CDATA[
##gap> gamma:=ExtendedKasamiGraph(1,1,2);;
##gap> GlobalParameters(gamma); 
##[ [ 0, 0, 8 ], [ 1, 0, 7 ], [ 2, 0, 6 ], [ 3, 0, 5 ], [ 8, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ExtendedKasamiGraph" );

# The coset graph of a Kasami code over a quadratic extension
# of a binary field.
#############################################################################
##
#F  QuadraticKasamiGraph( <integer> )
##  
##  <#GAPDoc Label="QuadraticKasamiGraph">
##  <ManSection>
##  <Func Name="QuadraticKasamiGraph"
##   Arg='i'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>i</A>, this function returns the quadratic 
##  Kasami graph on <M>GF(q) \times GF(q^2)</M>,  where 
##  <M>q=2^{<A>i</A>}</M>. 
##  <P/>
##  Let <M>i</M> be a positive integer and let 
##  <M>q=2^i,t=q+1</M>. 
##  <P/>
##  The <E>quadratic Kasami graph</E> <M>QKas(i)</M> has vertex-set 
##  <M>GF(q) \times GF(q^2)</M>. Any two distinct 
##  vertices <M>(a,\alpha),(b,\beta)</M> are adjacent if and only if 
##  <M>a+b=(\alpha+\beta)^t</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=QuadraticKasamiGraph(2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 15 ], [ 1, 2, 12 ], [ 4, 10, 1 ], [ 15, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "QuadraticKasamiGraph" );

#############################################################################
##
#F  ExtendedQuadraticKasamiGraph( <integer> )
##  
##  <#GAPDoc Label="ExtendedQuadraticKasamiGraph">
##  <ManSection>
##  <Func Name="ExtendedQuadraticKasamiGraph"
##   Arg='i'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a positive integer <A>i</A>, this function returns the extended 
#   quadratic Kasami graph on <M>GF(q) \times GF(q^2)</M>,  
##  where <M>q=2^{<A>i</A>}</M>. 
##  <P/>
##  Let <M>i</M> be a positive integer and let 
##  <M>q=2^i,t=q+1</M>. 
##  <P/>
##  The <E>extended quadratic Kasami graph</E> is the extended bipartite 
##  double graph of the quadratic Kasami graph 
##  (see <Ref Func="KasamiGraph"/>).
##    <Example>
##      <![CDATA[
##gap> gamma:=ExtendedQuadraticKasamiGraph(2);;
##gap> GlobalParameters(gamma);                
##[ [ 0, 0, 16 ], [ 1, 0, 15 ], [ 4, 0, 12 ], [ 15, 0, 1 ], [ 16, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ExtendedQuadraticKasamiGraph" );

#############################################################################
##
#E
