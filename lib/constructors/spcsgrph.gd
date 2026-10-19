#############################################################################
##
#W  spcsgrph.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct subspace graphs. 
##

#############################################################################
##
#F  GrassmannGraph( [<filter>, ]<integer>, <integer>, <integer> )
##  
##  <#GAPDoc Label="GrassmannGraph">
##  <ManSection>
##  <Func Name="GrassmannGraph"
##   Arg='[fil, ]q, n, d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integers <C><A>n</A>,<A>d</A></C> 
##  where <C><A>n</A>&gt;<A>d</A></C>, this function returns the Grassmann graph 
##  <M>J(<A>q</A>,<A>n</A>,<A>d</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power and <M>n,d</M> be positive integers, 
##  <M>n&gt;d</M>. The <E>Grassmann graph</E> <M>J(q,n,d)</M>
##  <Alt Not='Text'>(more commonly written as <M>J_q(n,d)</M>)</Alt>
##  has vertex-set the <M>d</M>-dimensional subspaces of <M>GF(q)^n</M>. Two 
##  distinct vertices <M>U,V</M> are adjacent if and only if <M>U\cap V</M> has 
##  dimension <M>d-1</M>. This graph has <M>G(n,d)</M> vertices and is 
##  distance-regular with diameter <M>e = min(d,n-d)</M> and intersection 
##  array given by 
##  <Display Mode="M">
##     b_j = q^{{2j+1}}G(d - j, 1)G(n - d - j, 1),
##     c_j = G(j, 1)^2 
##  </Display>
##  for <M>0 \leq j \leq e</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.3"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GrassmannGraph(4,4,2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 100 ], [ 1, 35, 64 ], [ 25, 75, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "GrassmannGraphCons", [IsObject, IsInt, IsInt, IsInt]);
DeclareGlobalFunction( "GrassmannGraph" );

#############################################################################
##
#F  DoubledGrassmannGraph( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="DoubledGrassmannGraph">
##  <ManSection>
##  <Func Name="DoubledGrassmannGraph"
##   Arg='[fil, ]q, d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this 
##  function returns the doubled Grassmann graph 
##  <M>2J(<A>q</A>,2<A>d</A>+1,<A>d</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power and <M>d</M> be a positive integer. 
##  The <E>doubled Grassmann graph</E> <M>2J(q,n,d)</M> 
##  <Alt Not='Text'>(more commonly written as <M>2J_q(n,d)</M>)</Alt>
##  has vertex-set the <M>d</M>-dimensional and <M>(d+1)</M>-dimensional 
##  subspaces of <M>GF(q)^n</M>. Two distinct vertices <M>U,V</M> are adjacent 
##  if and only if <M>U \subseteq V</M> or <M>V \subseteq U</M>. This graph is 
##  isomorphic to the bipartite double of the Grassmann graph 
##  <M>J(q,2d+1,d)</M> (see <Ref Func="BipartiteDoubleGraph"/> and 
##  <Ref Func="GrassmannGraph"/>). This graph has <M>2G(2d+1,d)</M> vertices 
##  and is distance-regular with diameter <M>e = 2d+1</M> and intersection 
##  array given by 
##  <Display Mode="M">
##     b_{{2j}} = b_{{2j-1}} = q^{j}G(d +1 - j, 1),
##     c_{{2j}} = c_{{2j-1}} = G(j, 1)
##  </Display>
##  for <M>0 \leq j \leq e/2</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.3C"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=DoubledGrassmannGraph(3,1);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 4 ], [ 1, 0, 3 ], [ 1, 0, 3 ], [ 4, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DoubledGrassmannGraphCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "DoubledGrassmannGraph" );

#############################################################################
##
#F  TwistedGrassmannGraph( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="TwistedGrassmannGraph">
##  <ManSection>
##  <Func Name="TwistedGrassmannGraph"
##   Arg='[fil, ]q, d'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this 
##  function returns the twisted Grassmann graph 
##  <M>Jtld(<A>q</A>,2<A>d</A>+1,<A>d</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, can only take value 
##  <C>FullAutomorphismGroup</C>. The vertex naming of this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power, <M>d</M> be a positive integer and 
##  <M>H</M> be a fixed hyperplane in <M>V = GF(q)^{{2d+1}}</M>. Let <M>A</M> 
##  be the set of <M>(d+1)</M>-dimensional subspaces not contained in <M>H</M>, 
##  and <M>B</M> be all <M>(d-1)</M>-dimensional subspaces in <M>V</M>. 
##  <P/>
##  The <E>twisted Grassmann graph</E> <M>Jtld(q,2d+1,d)</M> 
##  <Alt Not='Text'>(more commonly written as <M>\tilde{J}_q(n,d)</M>)</Alt>
##  has vertex-set <M>A \cup B</M>. Distinct vertices <M>U,W</M> are adjacent 
##  if and only if one of the following is true. 
##  <List>
##    <Item><M>U,W \in A</M> and <M>U \cap W</M> has dimension <M>d</M>, or 
##    </Item>
##    <Item><M>U \in A, W \in B</M> and <M>B \subset A</M>, or</Item>
##    <Item><M>U,W \in B</M> and <M>U \cap W</M> has dimension <M>d-2</M>.
##    </Item>
##  </List>
##  This graph has <M>G(2d+1,d)</M> vertices and is distance-regular with 
##  diameter <M>d</M> and intersection array given by
##  <Display Mode="M">
##     b_j = q^{{2j+1}}G(d - j, 1)G(d + 1 - j, 1),
##     c_j = G(j, 1)^2 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="DK_2005"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=TwistedGrassmannGraph(2,2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 42 ], [ 1, 17, 24 ], [ 9, 33, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "TwistedGrassmannGraphCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "TwistedGrassmannGraph" );

#  TODO use InvariantBilinearForm? Q and B name?
#############################################################################
##
#F  PolarGraphO( [<filter>, <integer>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="PolarGraphO">
##  <ManSection>
##  <Func Name="PolarGraphO"
##   Arg='[e, ]d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this function 
##  returns the polar graph <M>O(<A>d</A>, <A>q</A>)</M>. If 
##  <A>e</A> is given and lies in <C>[0,-1,1]</C>, then this function returns
##  the affine polar graph <M>O(<A>e</A>,<A>d</A>,<A>q</A>)</M>. If <A>e</A> is
##  not given, the function works as if <A>e</A> is <C>0</C>.
##  <P/>
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>Q</M> be a nondegenerate quadratic form acting on <M>GF(q)^d</M>, and
##  <M>e</M> be the type of <M>Q</M>. Note that this means <M>d</M> is odd if
##  and only if <M>e=0</M>. Further, let <M>B</M> be the bilinear form 
##  associated with the quadratic form <M>Q</M>.
##  <P/>
##  The <E>polar graph</E> <M>O(e,d,q)</M> 
##  <Alt Not='Text'>(more commonly written as <M>O_{d}^{e}(q)</M> or 
##  <M>O^{e}(d,q)</M>)</Alt>
##  has vertex-set the 1-dimensional subspaces <M>U</M> of <M>GF(q)^d</M> such 
##  that <M>Q(u)=0</M> for all <M>u\in U</M> (i.e. the totally singular 1-spaces 
##  in <M>GF(q)^d</M>). Distinct vertices <M>U,W</M> are adjacent if and only if 
##  <M>B(u,w)=0</M> for all <M>u\in U,w\in W</M>. 
##  <P/>
##  If <M>d = 2m</M> is even and <M>e \in \{1, -1\}</M>, this graph is strongly 
##  regular with parameters
##  <Table Align='ccc'>
##    <Row><Item><M>v</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^m - e)(q^{{m-1}} + e)/(q - 1)</M></Item></Row>
##    <Row><Item><M>k</M></Item><Item><M>=</M></Item>
##      <Item><M>q(q^{{m-1}} - e)(q^{{m-2}} + e)/(q - 1)</M></Item></Row>
##    <Row><Item><M>\lambda</M></Item><Item><M>=</M></Item>
##      <Item><M>q^2(q^{{m-2}} - e)(q^{{m-3}} + e)/(q - 1) + q - 1</M></Item>
##    </Row>
##    <Row><Item><M>\mu</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^{{m-1}} - e)(q^{{m-2}} + e)/(q - 1)</M></Item></Row>
##  </Table>
##  If <M>d = 2m+1</M> is odd and <M>e = 0</M>, this graph is strongly regular 
##  with parameters
##  <Table Align='ccc'>
##    <Row><Item><M>v</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^{{2m}} - 1)/(q - 1)</M></Item></Row>
##    <Row><Item><M>k</M></Item><Item><M>=</M></Item>
##      <Item><M>q(q^{{2m-2}} - 1)/(q - 1)</M></Item></Row>
##    <Row><Item><M>\lambda</M></Item><Item><M>=</M></Item>
##      <Item><M>q^2(q^{{2m-4}} - 1)/(q - 1) + q - 1</M></Item></Row>
##    <Row><Item><M>\mu</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^{{2m-2}} - 1)/(q - 1)</M></Item></Row>
##  </Table>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BV_2022" Where="Section 2.6"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=PolarGraphO(5,3);;
##gap> SRGParameters(gamma);
##[ 40, 12, 2, 4 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "PolarGraphOCons", [IsObject, IsInt, IsInt, IsInt]);
DeclareGlobalFunction( "PolarGraphO" );

# TODO : :
# In BVM_2022 3.1.2 not the same as this function
# The polar graph NO^{+/-}orth(d, q) of nonisotropic lines of F_q^d
# with respect to a nondegenerate quadratic form.
# help: 7.1.9D - this is not what Brouwer defines this graph as: checked for
# q=5. only for q=2,3 would it coincide, but there is a definition for further
# q 
#############################################################################
##
#F  PolarGraphNOorth( [<filter>, ]<integer>, <integer>, <integer> )
##  
##  <#GAPDoc Label="PolarGraphNOorth">
##  <ManSection>
##  <Func Name="PolarGraphNOorth"
##   Arg='e, d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, positive integer <A>d</A> and <A>e</A> in
##  <C>[-1,1]</C>, this function returns the polar graph 
##  <M>NO^{<A>e</A>}(<A>d</A>, <A>q</A>)</M>.
##  <P/>
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>Q</M> be a nondegenerate quadratic form acting on <M>GF(q)^d</M>, and
##  <M>e</M> be the type of <M>Q</M>, <M>e \in \{1, -1\}</M>. Note that this 
##  means <M>d</M> is odd if
##  and only if <M>e=0</M>. Further, let <M>B</M> be the bilinear form 
##  associated with the quadratic form <M>Q</M> and 
##  <M>z \in GF(q)  \{0\}</M>.
##  <P/>
##  The <E>polar graph</E> <M>NO^{e}(d,q)</M> has vertex-set consisting of the
##  1-dimensional subspaces <M>U</M> of <M>GF(q)^d</M> such that 
##  <M>Q(u)=z</M> for some <M>u\in U</M> (so are nonisotropic lines in 
##  <M>GF(q)^d</M>). Any two distinct vertices <M>U,W</M>
##  are adjacent if and only if <M>B(u,w)=0</M> for all <M>u\in U,w\in W</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=PolarGraphNOorth(1,5,3);;
##gap> SRGParameters(gamma);
##[ 45, 12, 3, 3 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "PolarGraphNOorthCons", [IsObject, IsInt, IsInt, IsInt]);
DeclareGlobalFunction( "PolarGraphNOorth" );

#############################################################################
##
#F  PolarGraphSp( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="PolarGraphSp">
##  <ManSection>
##  <Func Name="PolarGraphSp"
##   Arg='d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this function 
##  returns the polar graph <M>Sp(<A>d</A>, <A>q</A>)</M>.
##  <P/>
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>B</M> be a nondegenerate symplectic bilinear form acting on  
##  <M>GF(q)^d</M>. Note that this means <M>d</M> is even.
##  <P/>
##  The <E>polar graph</E> <M>Sp(d,q)</M> 
##  <Alt Not='Text'>(more commonly written as <M>Sp_{d}(q)</M> or 
##  <M>W_{{d-1}}(q)</M>)</Alt>
##  has vertex-set the 1-dimensional subspaces <M>U</M> of <M>GF(q)^d</M> such 
##  that <M>B(u,w)=0</M> for all <M>u,w \in U</M> (i.e. the totally isotropic 
##  1-spaces in <M>GF(q)^d</M>). Distinct vertices <M>U,W</M> are adjacent if 
##  and only if <M>B(u,w)=0</M> for all <M>u \in U, w \in W</M>.
##  <P/>
##  If <M>d = 2m</M> for some <M>m &gt; 2</M>, this graph is strongly regular 
##  with parameters
##  <Table Align='ccc'>
##    <Row><Item><M>v</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^{{2m}} - 1)/(q - 1)</M></Item></Row>
##    <Row><Item><M>k</M></Item><Item><M>=</M></Item>
##      <Item><M>q(q^{{2m-2}} - 1)/(q - 1)</M></Item></Row>
##    <Row><Item><M>\lambda</M></Item><Item><M>=</M></Item>
##      <Item><M>q^2(q^{{2m-4}} - 1)/(q - 1) + q - 1</M></Item></Row>
##    <Row><Item><M>\mu</M></Item><Item><M>=</M></Item>
##      <Item><M>(q^{{2m-2}} - 1)/(q - 1)</M></Item></Row>
##  </Table>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BV_2022" Where="Section 2.5"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=PolarGraphSp(4,5);;
##gap> SRGParameters(gamma);
##[ 156, 30, 4, 6 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "PolarGraphSpCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "PolarGraphSp" );

##TODO In function, seems to calculate unnecessary things?
#############################################################################
##
#F  PolarGraphU( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="PolarGraphU">
##  <ManSection>
##  <Func Name="PolarGraphU"
##   Arg='d, r'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>r</A> and positive integer <A>d</A>, this function 
##  returns the polar graph <M>U(<A>d</A>, <A>r</A>)</M>.
##  <P/>
##  Let <M>r</M> be a prime power, <M>d</M> be a positive integer and set 
##  <M>q = r^2</M>. Let <M>B</M> be a nondegenerate hermitean form acting on  
##  <M>GF(q)^d</M>.
##  <P/>
##  The <E>polar graph</E> <M>U(d,r)</M> 
##  <Alt Not='Text'>(more commonly written as <M>U_{d}(r)</M> or 
##  <M>H_{{d-1}}(r^2)</M>)</Alt>
##  has vertex-set the 1-dimensional subspaces <M>U</M> of <M>GF(q)^d</M> such 
##  that <M>B(u,w)=0</M> for all <M>u,w \in U</M> (i.e. the totally isotropic 
##  1-spaces in <M>GF(q)^d</M>). Distinct vertices <M>U,W</M> are adjacent if 
##  and only if <M>B(u,w)=0</M> for all <M>u \in U, w \in W</M>.
##  <P/>
##  For <M>d \geq 4</M> and <M>e = (-1)^d</M>, this graph is strongly regular 
##  with parameters
##  <Table Align='ccc'>
##    <Row><Item><M>v</M></Item><Item><M>=</M></Item>
##      <Item><M>(r^d - e)(r^{{d-1}} + e)/(r^2 - 1)</M></Item></Row>
##    <Row><Item><M>k</M></Item><Item><M>=</M></Item>
##      <Item><M>r^2(r^{{d-2}} - e)(r^{{d-3}} + e)/(r^2 - 1)</M></Item></Row>
##    <Row><Item><M>\lambda</M></Item><Item><M>=</M></Item>
##      <Item><M>r^4(r^{{d-4}} - e)(r^{{d-5}} + e)/(r^2 - 1) + r^2 - 1</M>
##      </Item></Row>
##    <Row><Item><M>\mu</M></Item><Item><M>=</M></Item>
##      <Item><M>(r^{{d-2}} - e)(r^{{d-3}} + e)/(r^2 - 1)</M></Item></Row>
##  </Table>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BV_2022" Where="Section 2.7"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=PolarGraphU(4,2);;
##gap> SRGParameters(gamma);    
##[ 45, 12, 3, 3 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "PolarGraphUCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "PolarGraphU" );

#############################################################################
##
#F  DualPolarGraphB( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="DualPolarGraphB">
##  <ManSection>
##  <Func Name="DualPolarGraphB"
##   Arg='[fil, ]d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this function 
##  returns the dual polar graph <M>B(<A>d</A>,<A>q</A>)</M>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>Q</M> be a nondegenerate parabolic quadratic form acting on  
##  <M>GF(q)^{{2d+1}}</M>.
##  <P/>
##  The <E>dual polar graph</E> <M>B(d,q)</M> 
##  <Alt Not='Text'>(more commonly written as <M>B_{d}(q)</M>)</Alt>
##  has vertex-set the <M>d</M>-dimensional subspaces <M>U</M> of 
##  <M>GF(q)^{{2d+1}}</M> such that <M>Q(u)=0</M> for all <M>u\in U</M> (i.e.
##  the totally singular <M>d</M>-spaces in <M>GF(q)^{{2d+1}}</M>). Distinct 
##  vertices <M>U,W</M> are adjacent if and only if <M>U\cap W</M> has dimension 
##  <M>d-1</M>. 
##  <P/>
##  This graph has
##  <Display Mode="M">
##    \prod_{{i=0}}^{{d-1}} (q^{{d-i}} + 1)
##  </Display>
##  vertices, and is distance-regular with diameter <M>d</M> and intersection 
##  array given by
##  <Display Mode="M">
##     b_j = q^{{j+1}}G(d - j, 1),
##     c_j = G(j, 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.4"/>.   
##    <Example>
##      <![CDATA[
##gap> gamma:=DualPolarGraphB(2,4);;
##gap> SRGParameters(gamma);
##[ 85, 20, 3, 5 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DualPolarGraphBCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "DualPolarGraphB" );

#############################################################################
##
#F  DualPolarGraphC( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="DualPolarGraphC">
##  <ManSection>
##  <Func Name="DualPolarGraphC"
##   Arg='[fil, ]d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this function 
##  returns the dual polar graph <M>C(<A>d</A>,<A>q</A>)</M>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>B</M> be a nondegenerate symplectic bilinear form acting on  
##  <M>GF(q)^{{2d}}</M>.
##  <P/>
##  The <E>dual polar graph</E> <M>C(d,q)</M> 
##  <Alt Not='Text'>(more commonly written as <M>C_{d}(q)</M>)</Alt>
##  has vertex-set the <M>d</M>-dimensional subspaces <M>U</M> of 
##  <M>GF(q)^{{2d}}</M> such that <M>B(u,w)=0</M> for all <M>u,w \in U</M> 
##  (i.e. the totally singular <M>d</M>-spaces in <M>GF(q)^{{2d}}</M>). 
##  Distinct vertices <M>U,W</M> are adjacent if and only if <M>U\cap W</M> has 
##  dimension <M>d-1</M>. 
##  <P/>
##  This graph has
##  <Display Mode="M">
##    \prod_{{i=0}}^{{d-1}} (q^{{d-i}} + 1)
##  </Display>
##  vertices, and is distance-regular with diameter <M>d</M> and intersection 
##  array given by
##  <Display Mode="M">
##     b_j = q^{{j+1}}G(d - j, 1),
##     c_j = G(j, 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.4"/>.   
##    <Example>
##      <![CDATA[
##gap> gamma:=DualPolarGraphC(2,5);;
##gap> SRGParameters(gamma);        
##[ 156, 30, 4, 6 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DualPolarGraphCCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "DualPolarGraphC" );

#############################################################################
##
#F  DualPolarGraphD( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="DualPolarGraphD">
##  <ManSection>
##  <Func Name="DualPolarGraphD"
##   Arg='[fil, ]d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this function 
##  returns the dual polar graph <M>D(<A>d</A>,<A>q</A>)</M>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>Q</M> be a nondegenerate hyperbolic quadratic form acting on  
##  <M>GF(q)^{{2d}}</M>.
##  <P/>
##  The <E>dual polar graph</E> <M>D(d,q)</M> 
##  <Alt Not='Text'>(more commonly written as <M>D_{d}(q)</M>)</Alt>
##  has vertex-set the <M>d</M>-dimensional subspaces <M>U</M> of 
##  <M>GF(q)^{{2d}}</M> such that <M>B(u,w)=0</M> for all <M>u,w \in U</M> 
##  (i.e. the totally singular <M>d</M>-spaces in <M>GF(q)^{{2d}}</M>). 
##  Distinct vertices <M>U,W</M> are adjacent if and only if <M>U\cap W</M> has 
##  dimension <M>d-1</M>. 
##  <P/>
##  This graph has
##  <Display Mode="M">
##    \prod_{{i=0}}^{{d-1}} (q^{{d-i-1}} + 1)
##  </Display>
##  vertices, and is distance-regular with diameter <M>d</M> and intersection 
##  array given by
##  <Display Mode="M">
##     b_j = q^{{j}}G(d - j, 1),
##     c_j = G(j, 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.4"/>.   
##    <Example>
##      <![CDATA[
##gap> gamma:=DualPolarGraphD(4,2);;
##gap> GlobalParameters(gamma);     
##[ [ 0, 0, 15 ], [ 1, 0, 14 ], [ 3, 0, 12 ], [ 7, 0, 8 ], [ 15, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DualPolarGraphDCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "DualPolarGraphD" );

#############################################################################
##
#F  DualPolarGraph2D( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="DualPolarGraph2D">
##  <ManSection>
##  <Func Name="DualPolarGraph2D"
##   Arg='[fil, ]d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integer <A>d</A>, this function 
##  returns the dual polar graph <M>2D(<A>d</A>+1,<A>q</A>)</M>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power and <M>d</M> and positive integer. Let
##  <M>Q</M> be a nondegenerate elliptic quadratic form acting on  
##  <M>GF(q)^{{2d+2}}</M>.
##  <P/>
##  The <E>dual polar graph</E> <M>2D(d+1,q)</M> 
##  <Alt Not='Text'>(more commonly written as <M>^2D_{d+1}(q)</M>)</Alt>
##  has vertex-set the <M>d</M>-dimensional subspaces <M>U</M> of 
##  <M>GF(q)^{{2d+2}}</M> such that <M>B(u,w)=0</M> for all <M>u,w \in U</M> 
##  (i.e. the totally singular <M>d</M>-spaces in <M>GF(q)^{{2d+2}}</M>). 
##  Distinct vertices <M>U,W</M> are adjacent if and only if <M>U\cap W</M> has 
##  dimension <M>d-1</M>. 
##  <P/>
##  This graph has
##  <Display Mode="M">
##    \prod_{{i=0}}^{{d-1}} (q^{{d-i+1}} + 1)
##  </Display>
##  vertices, and is distance-regular with diameter <M>d</M> and intersection 
##  array given by
##  <Display Mode="M">
##     b_j = q^{{j+2}}G(d - j, 1),
##     c_j = G(j, 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.4"/>.   
##    <Example>
##      <![CDATA[
##gap> gamma:=DualPolarGraph2D(2,2);;
##gap> SRGParameters(gamma);
##[ 45, 12, 3, 3 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DualPolarGraph2DCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "DualPolarGraph2D" );

#############################################################################
##
#F  DualPolarGraph2A( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="DualPolarGraph2A">
##  <ManSection>
##  <Func Name="DualPolarGraph2A"
##   Arg='[fil, ]e, r'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>r</A> and positive integer <A>e</A>, this function 
##  returns the dual polar graph <M>2A(<A>e</A>-1,<A>r</A>)</M>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>r</M> be a prime power, <M>e</M> be a positive integer, and set 
##  <M>q = r^2</M> and <M>d = \lfloor e/2 \rfloor</M>. Let <M>B</M> be a 
##  nondegenerate hermitean form acting on <M>GF(q)^e</M>.
##  <P/>
##  The <E>dual polar graph</E> <M>2A(e-1,r)</M> 
##  <Alt Not='Text'>(more commonly written as <M>^2D_{e-1}(r)</M>)</Alt>
##  has vertex-set the <M>d</M>-dimensional subspaces <M>U</M> of 
##  <M>GF(q)^e</M> such that <M>B(u,w)=0</M> for all <M>u,w \in U</M> 
##  (i.e. the totally singular <M>d</M>-spaces in <M>GF(q)^e</M>). 
##  Distinct vertices <M>U,W</M> are adjacent if and only if <M>U\cap W</M> has 
##  dimension <M>d-1</M>. 
##  <P/>
##  If <M>e</M> is odd, this graph has
##  <Display Mode="M">
##    \prod_{{i=0}}^{{d-1}} (q^{{d-i+1/2}} + 1)
##  </Display>
##  vertices, and is distance-regular with diameter <M>d</M> and intersection 
##  array given by
##  <Display Mode="M">
##     b_j = q^{{j+3/2}}G(d - j, 1),
##     c_j = G(j, 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  If <M>e</M> is even, this graph has
##  <Display Mode="M">
##    \prod_{{i=0}}^{{d-1}} (q^{{d-i-1/2}} + 1)
##  </Display>
##  vertices, and is distance-regular with diameter <M>d</M> and intersection 
##  array given by
##  <Display Mode="M">
##     b_j = q^{{j+1/2}}G(d - j, 1),
##     c_j = G(j, 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.4"/>.   
##    <Example>
##      <![CDATA[
##gap> gamma:=DualPolarGraph2A(4,3);;
##gap> SRGParameters(gamma);
##[ 112, 30, 2, 10 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DualPolarGraph2ACons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "DualPolarGraph2A" );

# In BCN_1989 12.1
#TODO  :  : 
#  unsure of the definition (elliptic, hyperbolic line)
# implemented uses {[4]} is garunteed Nonisotropic?
# full automorphism group not fully implemented
#############################################################################
##
#F  DoroGraph( [<filter>, ]q )
##  
##  <#GAPDoc Label="DoroGraph">
##  <ManSection>
##  <Func Name="DoroGraph"
##   Arg='[fil, ]q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, this function returns the Doro graoh 
##  <M>Doro(<A>q</A>)</M>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>  
##  Let <M>q</M> be a prime power and <M>Q</M> be a nondegenerate elliptic 
##  quadratic form acting on <M>GF(q)^4</M>.
##  <P/>
##  The <E>Doro graph</E> <M>Doro(q)</M> has vertex-set the 1-dimensional 
##  subspaces <M>U</M> of <M>GF(q)^4</M> such that <M>Q(u)&neq;0</M> for all
##  non-zero <M>u\in U</M> (i.e. nonisotropic 1-spaces in <M>GF(q)^4</M>). 
##  Distinct vertices <M>U,W</M> are adjacent if and only if <M>U + W</M> is a 
##  hyperbolic line.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 12.1"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=DoroGraph(4);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 12 ], [ 1, 1, 10 ], [ 3, 6, 3 ], [ 8, 4, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "DoroGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "DoroGraph" );

#############################################################################
##
#F  UnitaryNonisotropicsGraph( [<filter>, ]<integer> )
##  
##  <#GAPDoc Label="UnitaryNonisotropicsGraph">
##  <ManSection>
##  <Func Name="UnitaryNonisotropicsGraph"
##   Arg='r'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>r</A>, this function returns the unitary 
##  nonisotropics graph on <M>GF(<A>r</A>^2)^3</M>. 
##  <P/>  
##  Let <M>r</M> be a prime power, and set <M>q = r^2</M>. Let <M>B</M> be a 
##  nondegenerate hermitean form acting on <M>GF(q)^3</M>. 
##  <P/>
##  The <E>unitary nonisotropics graph</E> on <M>GF(q)^3</M> has 
##  vertex-set consisting of the 1-dimensional subspaces <M>U</M> of 
##  <M>GF(q)^3</M> such that <M>B(u,w)&neq;0</M> for all <M>u,w \in U</M> (i.e.
##  nonisotropic subspaces in <M>GF(q)^3</M>). Distinct vertices <M>U,W</M> are 
##  adjacent if and only if <M>B(u,w)=0</M> for all <M>u \in U, w \in W</M>.
##  <P/>
##  This graph has <M>r^2(r^2 - r + 1)</M> vertices, and for <M>r &gt; 2</M> it
##  is distance-regular with intersection array 
##  <M>\{q^2 - q, q^2 - q - 2, q + 1; 1, 1, q^2 - 2q\}</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 12.4"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=UnitaryNonisotropicsGraph(3);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 6 ], [ 1, 1, 4 ], [ 1, 1, 4 ], [ 3, 3, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "UnitaryNonisotropicsGraphCons", [IsObject, IsInt]);
DeclareGlobalFunction( "UnitaryNonisotropicsGraph" );

#############################################################################
##
#E
