#############################################################################
##
#W  geogrph.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct geometry graphs. 
##

# In BVM_2022 6.2 not specific # In BCN_1989 A.6 not specific 
# TODO check parameters and find reference REF
#############################################################################
##
#F  DesarguesianPlaneIncidenceGraph( <integer> )
##  
##  <#GAPDoc Label="DesarguesianPlaneIncidenceGraph">
##  <ManSection>
##  <Func Name="DesarguesianPlaneIncidenceGraph"
##   Arg='q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, this function returns the incidence graph 
##  of the Desarguesian plane <M>PG(2,<A>q</A>)</M>. 
##  <P/>  
##  Let <M>q</M> be a prime power. The 
##  <E>Desarguesian plane incidence graph</E> has vertex-set the 1-dimensional
##  and 2-dimensional subspaces <M>GF(q)^{3}</M>. Distinct vertices <M>U,W</M> 
##  are adjacent if and only if <M>U \cap W \in \{U, W\}</M> (they are incident
##  in the projective space <M>PG(2,q)</M>).
##  <P/>
##  This graph has <M>2(q^3 - 1)/(q - 1)</M> vertices, and is bipartite and 
##  distance-regular with intersection array 
##  <M>\{q + 1, q, q; 1, 1, q + 1\}</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=DesarguesianPlaneIncidenceGraph(4);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 5 ], [ 1, 0, 4 ], [ 1, 0, 4 ], [ 5, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "DesarguesianPlaneIncidenceGraph" );

#TODO ref to Hall plane, inefficient: ok for q<4
#############################################################################
##
#F  HallPlaneIncidenceGraph( <integer> )
##  
##  <#GAPDoc Label="HallPlaneIncidenceGraph">
##  <ManSection>
##  <Func Name="HallPlaneIncidenceGraph"
##   Arg='q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, this function returns the incidence graph 
##  of the Hall plane of order <M><A>q</A>^2</M>. 
##  <P/>  
##  Let <M>q</M> be a prime power. The <E>Hall plane incidence graph</E> has 
##  vertex-set the points and lines of the Hall plane of order <M>q^2</M> (see 
##  REF). Distinct vertices <M>U,W</M> are adjacent if and only if they are
##  incident in the Hall plane of order <M>q^2</M>.
##  <P/>
##  This graph has <M>2(q^6 - 1)/(q^2 - 1)</M> vertices, and is bipartite and 
##  distance-regular with intersection array 
##  <M>\{q^2 + 1, q^2, q^2; 1, 1, q^2 + 1\}</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=HallPlaneIncidenceGraph(2);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 5 ], [ 1, 0, 4 ], [ 1, 0, 4 ], [ 5, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HallPlaneIncidenceGraph" );

#inefficient? need def and REF
#############################################################################
##
#F  HughesPlaneIncidenceGraph( <integer>[, <integer>] )
##  
##  <#GAPDoc Label="HughesPlaneIncidenceGraph">
##  <ManSection>
##  <Func Name="HughesPlaneIncidenceGraph"
##   Arg='q[, n]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an odd prime power <A>q</A>, this function returns the incidence 
##  graph of the Hughes plane of order <M><A>q</A>^2</M>. 
##  <P/>
##  If <A>n</A> is not given or equal to 0, the Hughes plane is associated 
##  with the Dickson semifield of order <M><A>q</A>^2</M>. If <A>n</A> is 1,
##  the Hughes plane is associated with an exceptional near-field of order 
##  <M><A>q</A>^2</M>, so <A>q</A> must be in <C>[5,7,11,23,29,59]</C>. If
##  <A>q</A> is 11, <A>n</A> can take the value 2, for which this function
##  constructs a graph associated with the second exceptional near-field of 
##  order <M>11^2</M>.
##  <P/>  
##  Let <M>q</M> be an odd prime power. The <E>Hughes plane incidence graph</E> 
##  has vertex-set the points and lines of the Hughes plane of order <M>q^2</M> 
##  (see REF). Distinct vertices <M>U,W</M> are adjacent if and only if they are
##  incident in the Hughes plane of order <M>q^2</M>. 
##  <P/>
##  This graph has <M>2(q^6 - 1)/(q^2 - 1)</M> vertices, and is bipartite and 
##  distance-regular with intersection array 
##  <M>\{q^2 + 1, q^2, q^2; 1, 1, q^2 + 1\}</M>.
##    <Example>
##      <![CDATA[
##gap> gamma:=HughesPlaneIncidenceGraph(5);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 26 ], [ 1, 0, 25 ], [ 1, 0, 25 ], [ 26, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HughesPlaneIncidenceGraph" );

#BVM_2022 pp40 for further referenes on GQs

# The collinearity graph of the generalized quadrangle Q(d, q)
# of order (q, q^{d-3}).
#############################################################################
##
#F  GeneralizedQuadrangleQ( <integer>, <integer> )
##  
##  <#GAPDoc Label="GeneralizedQuadrangleQ">
##  <ManSection>
##  <Func Name="GeneralizedQuadrangleQ"
##   Arg='d, q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and <A>d</A> in <C>[3,4,5]</C>, this 
##  function returns the collinearity graph of the generalized quadrangle
##  <M>Q(<A>d</A>,<A>q</A>)</M> of order 
##  <M>(<A>q</A>,<A>q</A>^{{<A>d</A>-3}})</M>. 
##  <P/>  
##  Let <M>q</M> be a prime power, <M>d</M> be in <M>\{3,4,5\}</M> and 
##  <M>e=4-d</M>. The <E>generalised quadrangle</E> <M>Q(d,q)</M> has points the 
##  vertices of the polar graph <M>O(e,d+1,q)</M>, and collinearity corresponds 
##  to adjacency in <M>O(e,d+1,q)</M> (see <Ref Func="PolarGraphO"/>). 
##  <P/>
##  The <E>collinearity graph</E> of <M>Q(d,q)</M> has vertices the points of
##  <M>Q(d,q)</M>, and distinct vertices are adjacent if they are collinear in
##  <M>Q(d,q)</M>. By the above, this graph is exactly <M>O(e,d+1,q)</M>. 
##  <P/>
##  This graph is strongly regular with the following parameters, depending on 
##  the value of <M>d</M>.
##  <Table Align='ccccccc'>
##    <Row><Item><M>d = 3: </M></Item>
##         <Item><M>(</M></Item>
##         <Item><M>(q + 1)^2, </M></Item>
##         <Item><M>2q, </M></Item>
##         <Item><M>q - 1, </M></Item> 
##         <Item><M>2</M></Item>
##         <Item><M>)</M></Item>
##    </Row>
##    <Row><Item><M>d = 4: </M></Item>
##         <Item><M>(</M></Item>
##         <Item><M>q^3 + q^2 + q + 1, </M></Item>
##         <Item><M>q(q + 1), </M></Item>
##         <Item><M>q - 1, </M></Item> 
##         <Item><M>q + 1</M></Item>
##         <Item><M>)</M></Item>
##    </Row>
##    <Row><Item><M>d = 5: </M></Item>
##         <Item><M>(</M></Item>
##         <Item><M>(q^3 + 1)(q + 1), </M></Item>
##         <Item><M>q(q^2 + 1), </M></Item>
##         <Item><M>q - 1, </M></Item> 
##         <Item><M>q^2 + 1</M></Item>
##         <Item><M>)</M></Item>
##    </Row>
##  </Table>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="PT_2009" Where="Section 3.1"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GeneralizedQuadrangleQ(3,5);;                             
##gap> SRGParameters(gamma);
##[ 36, 10, 4, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GeneralizedQuadrangleQ" );

#############################################################################
##
#F  GeneralizedQuadrangleH( <integer>, <integer> )
##  
##  <#GAPDoc Label="GeneralizedQuadrangleH">
##  <ManSection>
##  <Func Name="GeneralizedQuadrangleH"
##   Arg='d, r'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>r</A> and <A>d</A> in <C>[3,4]</C>, this 
##  function returns the collinearity graph of the generalized quadrangle
##  <M>H(<A>d</A>,<A>r</A>^2)</M> of order 
##  <M>(<A>r</A>^2,<A>r</A>^{<A>d</A>-5/2})</M>.
##  <P/>  
##  Let <M>r</M> be a prime power, <M>d</M> be in <M>\{3,4\}</M> and set 
##  <M>q = r^2</M>. The <E>generalised quadrangle</E> <M>H(d,q)</M> has points 
##  the vertices of the polar graph <M>U(d+1,r)</M>, and collinearity 
##  corresponds to adjacency in <M>U(d+1,r)</M> (see <Ref Func="PolarGraphU"/>). 
##  <P/>
##  The <E>collinearity graph</E> of <M>H(d,q)</M> has vertices the points of
##  <M>H(d,q)</M>, and distinct vertices are adjacent if they are collinear in
##  <M>H(d,q)</M>. By the above, this graph is exactly <M>U(d+1,q)</M>. 
##  <P/>
##  This graph is strongly regular with the following parameters, depending on 
##  the value of <M>d</M>.
##  <Table Align='lllllll'>
##    <Row><Item><M>d = 3: </M></Item>
##         <Item><M>(</M></Item>
##         <Item><M>(r^3 + 1)(r^2 + 1), </M></Item>
##         <Item><M>r^2(r + 1), </M></Item>
##         <Item><M>r^2 - 1, </M></Item> 
##         <Item><M>r + 1</M></Item>
##         <Item><M>)</M></Item>
##    </Row>
##    <Row><Item><M>d = 4: </M></Item>
##         <Item><M>(</M></Item>
##         <Item><M>(r^5 + 1)(r^2 + 1), </M></Item>
##         <Item><M>r^2(r^3 + 1), </M></Item>
##         <Item><M>r^2 - 1, </M></Item> 
##         <Item><M>r^3 + 1</M></Item>
##         <Item><M>)</M></Item>
##    </Row>
##  </Table>
##  <P/>
##  For more information on this graph, see
##  <Cite Key="PT_2009" Where="Section 3.1"/>.
##    <Example>
##      <![CDATA[
##gap>  gamma:=GeneralizedQuadrangleH(3,2);;
##gap> SRGParameters(gamma);               
##[ 45, 12, 3, 3 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GeneralizedQuadrangleH" );

# The collinearity graph of the generalized quadrangle W(q) of order (q, q).
#############################################################################
##
#F  GeneralizedQuadrangleW( <integer> )
##  
##  <#GAPDoc Label="GeneralizedQuadrangleW">
##  <ManSection>
##  <Func Name="GeneralizedQuadrangleW"
##   Arg='q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, this function returns the collinearity graph 
##  of the generalized quadrangle <M>W(<A>d</A>,<A>q</A>)</M> of order 
##  <M>(<A>q</A>,<A>q</A>)</M>. 
##  <P/>  
##  Let <M>q</M> be a prime power. The <E>generalised quadrangle</E> 
##  <M>W(q)</M> has points the vertices of the polar graph <M>Sp(4,q)</M>, and 
##  collinearity corresponds to adjacency in <M>Sp(4,q)</M> (see 
##  <Ref Func="PolarGraphSp"/>). 
##  <P/>
##  The <E>collinearity graph</E> of <M>W(q)</M> has vertices the points of
##  <M>W(q)</M>, and distinct vertices are adjacent if they are collinear in
##  <M>W(q)</M>. By the above, this graph is exactly <M>Sp(4,q)</M>. 
##  <P/>
##  This graph is strongly regular with parameters 
##  <M>(q^3 + q^2 + q + 1, q(q + 1), q - 1, q + 1)</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="PT_2009" Where="Section 3.1"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GeneralizedQuadrangleW(4);;                               
##gap> SRGParameters(gamma);
##[ 85, 20, 3, 5 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GeneralizedQuadrangleW" );

# The collinearity graph of the generalized quadrangle T_d(O) of order
# (q, q^{d-1}) derived from the projective space PG(d+1, q) containing the
# oval or ovoid O in a hyperplane.
#TODO example and use of group G
#############################################################################
##
#F  GeneralizedQuadrangleT( <integer>, <integer>, <list>[, <group>] )
##  
##  <#GAPDoc Label="GeneralizedQuadrangleT">
##  <ManSection>
##  <Func Name="GeneralizedQuadrangleT"
##   Arg='d, q, O[, G]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A>, <A>d</A> in <C>[2,3]</C> and <A>O</A> an 
##  oval/ovoid in <M>PG(<A>d</A>,<A>q</A>)</M> (as a list of subspaces of
##  <C>GF(<A>q</A>)^{<A>d</A>+1}</C>), this  function returns the collinearity 
##  graph of  the generalized quadrangle <M>T(<A>d</A>,<A>O</A>)</M> of 
##  order <M>(<A>q</A>,<A>q</A>^{<A>d</A>-1})</M>.
##  <P/>  
##  Let <M>q</M> be a prime power, <M>d</M> be in <M>\{2,3\}</M> and 
##  <M>O</M> be an oval/ovoid in <M>PG(d,q)</M>. The 
##  <E>generalised quadrangle</E> <M>T(d,O)</M> 
##  <Alt Not='Text'>(more commonly written as <M>T_{d}(O)</M>)</Alt>
##  is defined as in <Cite Key="PT_2009" Where="Section 3.1.2"/>. 
##  <P/>
##  The <E>collinearity graph</E> of <M>T(d,O)</M> has vertices the points of
##  <M>T(d,O)</M>, and distinct vertices are adjacent if they are collinear in
##  <M>T(d,O)</M>.
##  <P/>
##  This graph is strongly regular with the following parameters, depending on 
##  the value of <M>d</M>.
##  <Table Align='lllllll'>
##    <Row><Item><M>d = 2: </M></Item>
##         <Item><M>(</M></Item>
##         <Item><M>(q^2 + 1)(q + 1), </M></Item>
##         <Item><M>q(q + 1), </M></Item>
##         <Item><M>q - 1, </M></Item> 
##         <Item><M>q + 1</M></Item>
##         <Item><M>)</M></Item>
##    </Row>
##    <Row><Item><M>d = 3: </M></Item>
##         <Item><M>(</M></Item>
##         <Item><M>(q^3 + 1)(q + 1), </M></Item>
##         <Item><M>q(q^2 + 1), </M></Item>
##         <Item><M>q - 1, </M></Item> 
##         <Item><M>q^2 + 1</M></Item>
##         <Item><M>)</M></Item>
##    </Row>
##  </Table>
##  For more information on this graph, see
##  <Cite Key="PT_2009" Where="Section 3.1"/>.
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
DeclareGlobalFunction( "GeneralizedQuadrangleT" );

# The collinearity graph of the generalized quadrangle T*(O) of order
# (2^h-1, 2^h+1) derived from the projective space PG(3, 2^h) containing the
# hyperoval O in a hyperplane.
#TODO example and use of group G
#############################################################################
##
#F  GeneralizedQuadrangleTstar( <integer>, <list>[, <group>] )
##  
##  <#GAPDoc Label="GeneralizedQuadrangleTstar">
##  <ManSection>
##  <Func Name="GeneralizedQuadrangleTstar"
##   Arg='q, O[, G]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given <A>q</A> a power of 2, and <A>O</A> a hyperoval in 
##  <M>PG(<A>2</A>,<A>q</A>)</M> (as a list of subspaces of
##  <C>GF(<A>q</A>)^{3}</C>), this  function returns the collinearity 
##  graph of  the generalized quadrangle <M>T_{2}^*(<A>O</A>)</M> of 
##  order <M>(<A>q</A>-1,<A>q</A>+1)</M>.
##  <P/>  
##  Let <M>q</M> be a power of 2 and <M>O</M> be a hyperoval in 
##  <M>PG(2,q)</M>. The <E>generalised quadrangle</E> <M>Tstar(2,O)</M> 
##  <Alt Not='Text'>(more commonly written as <M>T_2^*(O)</M>)</Alt>
##  is defined as in <Cite Key="PT_2009" Where="Section 3.1.3"/>. 
##  <P/>
##  The <E>collinearity graph</E> of <M>Tstar(2,O)</M> has vertices the points 
##  of <M>Tstar(2,O)</M>, and distinct vertices are adjacent if they are 
##  collinear in <M>Tstart(2,O)</M>.
##  <P/>
##  This graph is strongly regular with parameters 
##  <M>(q^3, (q - 1)(q + 2), q - 2, q + 2)</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="PT_2009" Where="Section 3.1"/>.
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
DeclareGlobalFunction( "GeneralizedQuadrangleTstar" );

# The collinearity graph of the generalized quadrangle P(G, z) of
# order (s-1, s+1) derived by removing the neighbourhood of a regular point z
# of a generalized quadrangle G of order (s, s).
#############################################################################
##
#F  GeneralizedQuadrangleP( <graph>, <vertex> )
##  
##  <#GAPDoc Label="GeneralizedQuadrangleP">
##  <ManSection>
##  <Func Name="GeneralizedQuadrangleP"
##   Arg='gamma, z'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a collinearity graph <A>gamma</A> of a generalized quadrangle 
##  <M>Q</M> of order <M>(s,s)</M> and a regular point <A>z</A> in <A>Q</A>, 
##  this function returns the collinearity graph of the generalized quadrangle 
##  <M>P(<A>Q</A>,<A>z</A>)</M> of order <M>(s-1,s+1)</M>.
##  <P/>  
##  Let <M>Q</M> a generalized quadrangle of order <M>(s,s)</M> and <M>z</M> be 
##  a regular point of <M>Q</M>. The <E>generalised quadrangle</E> <M>P(Q,z)</M> 
##  is defined as in <Cite Key="PT_2009" Where="Section 3.1.4"/>. 
##  <P/>
##  The <E>collinearity graph</E> of <M>P(Q,z)</M> has vertices the points of
##  <M>P(Q,z)</M>, and distinct vertices are adjacent if they are collinear 
##  in <M>P(Q,z)</M>.
##  <P/>
##  This graph is strongly regular with parameters 
##  <M>(s^3, (s - 1)(s + 2), s - 2, s + 2)</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="PT_2009" Where="Section 3.1"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GeneralizedQuadrangleQ(4,4);;    
##gap> delta:=GeneralizedQuadrangleP(gamma,3);;
##gap> SRGParameters(delta);                   
##[ 64, 18, 2, 6 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GeneralizedQuadrangleP" );

# The collinearity graph of the generalized quadrangle AS(q)
# of order (q-1, q+1).
# TODO check: function does not use definition directly
#############################################################################
##
#F  GeneralizedQuadrangleAS( <integer> )
##  
##  <#GAPDoc Label="GeneralizedQuadrangleAS">
##  <ManSection>
##  <Func Name="GeneralizedQuadrangleAS"
##   Arg='q'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given an odd prime power <A>q</A>, this function returns the collinearity 
##  graph of the generalized quadrangle <M>AS(q)</M> of order 
##  <M>(<A>q</A>-1,<A>q</A>+1)</M>.
##  <P/>  
##  Let <M>q</M> be an odd prime power. The <E>generalised quadrangle</E> 
##  <M>AS(q)</M> is defined as in <Cite Key="PT_2009" Where="Section 3.1.5"/>.
##  <P/>
##  The <E>collinearity graph</E> of <M>AS(q)</M> has vertices the points of
##  <M>AS(q)</M>, and distinct vertices are adjacent if they are collinear in
##  <M>AS(q)</M>.
##  <P/>
##  This graph is strongly regular with parameters 
##  <M>(q^3, (q - 1)(q + 2), q - 2, q + 2)</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="PT_2009" Where="Section 3.1"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GeneralizedQuadrangleAS(5);;
##gap> SRGParameters(gamma);              
##[ 125, 28, 3, 7 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GeneralizedQuadrangleAS" );

# The incidence graph of a projective plane read from a file as on
#   http://www.uwyo.edu/moorhouse/pub/planes/       or
#   http://www.uwyo.edu/moorhouse/pub/genpoly/
# The optional second parameter is a file containing generators of the
# automorphism group.
#############################################################################
##
#F  AdjFunGraph( <parms> )
##  
##  <#GAPDoc Label="IncidenceGraphFromFile">
##  <ManSection>
##  <Func Name="IncidenceGraphFromFile"
##   Arg='arg'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  para1
## 
##  <P/>
##  para2
## 
## 
## 
## 
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

DeclareGlobalFunction( "IncidenceGraphFromFile" );

# The collinearity graph of a projective plane read from a file as on
#   http://www.uwyo.edu/moorhouse/pub/genpoly/
# The optional second parameter is a file containing generators of the
# automorphism group.
#############################################################################
##
#F  AdjFunGraph( <parms> )
##  
##  <#GAPDoc Label="ColinearityGraphFromFile">
##  <ManSection>
##  <Func Name="ColinearityGraphFromFile"
##   Arg='arg'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  para1
## 
##  <P/>
##  para2
## 
## 
## 
## 
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

DeclareGlobalFunction( "CollinearityGraphFromFile" );

#############################################################################
##
#E
