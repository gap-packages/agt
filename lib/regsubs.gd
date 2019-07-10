#############################################################################
##
#W  regsubs.gd           Algebraic Graph Theory package         Rhys J. Evans
##
##
#Y  Copyright (C) ????????????????????????????????????TODO
##
##  Explanation of file????????????????????????????????????TODO
##

######################
## GLOBAL FUNCTIONS ##
######################
##---------------------------------------------------------------------------------------------


#############################################################################
##
#O  HoffmanCocliqueBound( <gamma> )
##  
##  <#GAPDoc Label="HoffmanCocliqueBound">
##  <ManSection>
##  <Oper Name="HoffmanCocliqueBound"
##   Arg="gamma"/>
##  <Oper Name="HoffmanCocliqueBound"
##   Arg="parms" Label="for SRG parameters"/>
##  <Returns>an integer.</Returns>
##
##  <Description>
##  Given a non-null regular graph <A>gamma</A>, this function returns the 
##  Hoffman coclique bound of <A>gamma</A>.
##  <P/>
##  Given feasible strongly regular graph parameters <A>parms</A>, this 
##  function returns the Hoffman coclique bound of a strongly regular graph
##  with parameters <A>parms</A>. 
##  <P/>
##  Let <M>\Gamma</M> be a non-null, regular graph with parameters <M>(v,k)</M> and least 
##  eigenvalue <M>s</M>. The <E>Hoffman coclique bound</E>, or <E>ratio bound</E> of <M>\Gamma</M>, is defined as
##  <Display>\delta=\lfloor\left(\frac{v}{k-s}\right)\rfloor.</Display>
##  It is known that any colique in <M>\Gamma</M> must contain at most <M>\delta</M>
##  vertices (see <Cite Key="BH_2011"/>).
##    <Example>
##      <![CDATA[
##gap> gamma:=HammingGraph(3,5);;
##gap> HoffmanCocliqueBound(gamma);
##25
##gamma:=HammingGraph(2,5);;
##gap> HoffmanCocliqueBound(gamma);               
##5
##gap> parms:=SRGParameters(gamma);
##[ 25, 8, 3, 2 ]
##gap> HoffmanCocliqueBound(parms);
##5
##      ]]>
##    </Example>
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "HoffmanCocliqueBound" , [IsRecord] );
DeclareOperation( "HoffmanCocliqueBound" , [IsList] );

#############################################################################
##
#O  HoffmanCliqueBound( <gamma> )
##  
##  <#GAPDoc Label="HoffmanCliqueBound">
##  <ManSection>
##  <Oper Name="HoffmanCliqueBound"
##   Arg="gamma"/>
##  <Oper Name="HoffmanCliqueBound"
##   Arg="parms" Label="for SRG parameters"/>
##  <Returns>an integer.</Returns>
##
##  <Description>
##  Given a non-null, non-complete regular graph <A>gamma</A>, this function returns the
##  Hoffman clique bound of <A>gamma</A> (i.e the Hoffman coclique bound of
##  the complement of <A>gamma</A>).
##  <P/>
##  Given feasible strongly regular graph parameters <A>parms</A>, this 
##  function returns the Hoffman clique bound of a strongly regular graph
##  with parameters <A>parms</A>. 
##  <P/>
##  Let <M>\Gamma</M> be a non-null, non-complete regular graph. The 
##  <E>Hoffman clique bound</E> of <M>\Gamma</M>, is defined as the Hoffman 
##  coclique bound of its complement (see <Ref Func="HoffmanCocliqueBound"/>).
##  It is known that the Hoffman clique bound is an upper bound on the number 
##  of vertices in any clique of <M>\Gamma</M> (see <Cite Key="BH_2011"/>).
##  Note that in the case that <M>\Gamma</M> is a strongly regular graph, this
##  function returns the value of the well-known <E>Delsarte-Hoffman clique bound</E>
##  (see <Cite Key="D_1975"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=EdgeOrbitsGraph(CyclicGroup(IsPermGroup,15),[[1,2],[2,1]]);;
##gap> HoffmanCliqueBound(gamma);
##2
##gap> gamma:=JohnsonGraph(7,2);;
##gap> HoffmanCliqueBound(gamma);
##6
##gap> parms:=SRGParameters(gamma);
##[ 21, 10, 5, 4 ]
##gap> HoffmanCliqueBound(parms);
##6
##      ]]>
##    </Example>
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "HoffmanCliqueBound" , [IsRecord] );
DeclareOperation( "HoffmanCliqueBound" , [IsList] );

#############################################################################
##
#F  CliqueAdjacencyPolynomial( <parms>, <x>, <y> )
##  
##  <#GAPDoc Label="CliqueAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="CliqueAdjacencyPolynomial"
##   Arg='parms,x,y'/>
##  <Returns>a polynomial.</Returns>
##
##  <Description>
##  Given feasible edge-regular graph parameters <A>parms</A> and indeterminates 
##  <A>x,y</A>, this function returns the Clique Adjacency Polynomial with
##  respect to the parameters <A>parms</A> and indeterminates <A>x,y</A>, defined
##  in Soicher <Cite Key="S_2015"/>.
##  <P/>
##  Let <M>\Gamma</M> be an edge-regular graph with parameters <M>(v,k,a)</M>. 
##  The <E>clique adjacency polynomial</E> of <M>\Gamma</M> is defined as
##  <Display>C(x,y):=x(x+1)(v-y)-2xy(k-y+1)+y(y-1)(a-y+2).</Display>
##  For the properties of the clique adjacency polynomial, see <Cite Key="S_2010"/>
##  and <Cite Key="S_2015"/>.
##    <Example>
##      <![CDATA[
##gap> x:=Indeterminate(Rationals,"x");
##x
##gap> y:=Indeterminate(Rationals,"y");
##y
##gap> CliqueAdjacencyPolynomial([21,8,3],x,y);
##-x^2*y-y^3+21*x^2-x*y+8*y^2+21*x-23*y
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CliqueAdjacencyPolynomial" );

#############################################################################
##
#F  CliqueAdjacencyBound( <parms> )
##  
##  <#GAPDoc Label="CliqueAdjacencyBound">
##  <ManSection>
##  <Func Name="CliqueAdjacencyBound"
##   Arg='parms'/>
##  <Returns>an integer.</Returns>
##
##  <Description>
##  Given feasible edge-regular graph parameters <A>parms</A>, this function 
##  returns the Clique Adjacency Bound  with respect to the parameters 
##  <A>parms</A>, defined in Soicher <Cite Key="S_2010"/>.
##  <P/>
##  Let <M>\Gamma</M> be an edge-regular graph with parameters <M>(v,k,a)</M>,
##  and let <M>C</M> be its corresponding clique adjacency poylnomial (see 
##  <Ref Func="CliqueAdjacencyPolynomial"/>). The <E>clique adjacency bound</E>
##  of <M>\Gamma</M>, is defined as the smallest integer <M>y\geq 2</M> such 
##  that there exists an integer <M>m</M> for which <M>C(m,y+1) &lt; 0</M>.
##  It is known that the clique adjacency bound is an upper bound on the number 
##  of vertices in any clique of <M>\Gamma</M> (see <Cite Key="S_2010"/>).
##    <Example>
##      <![CDATA[
##gap> CliqueAdjacencyBound([16,6,2]);
##4
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CliqueAdjacencyBound" );

#############################################################################
##
#F  NGParameters( <gamma> )
##  
##  <#GAPDoc Label="NGParameters">
##  <ManSection>
##  <Func Name="NGParameters"
##   Arg='gamma'/>
##  <Returns>a list or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the Neumaier graph
##  parameters of <A>gamma</A>. If <A>gamma</A> is not a Neumaier graph,
##  the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NGParameters" );

#############################################################################
##
#F  IsNG( <gamma> )
##  
##  <#GAPDoc Label="IsNG">
##  <ManSection>
##  <Func Name="IsNG"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns <K>true</K> if 
##  <A>gamma</A> is a Neumaier graph, and <K>false</K> otherwise.
##    <Example>
##      <![CDATA[
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsNG" );

#############################################################################
##
#F  IsFeasibleNGParameters( [ <v>, <k>, <a>, <s>, <m> ] )
##  
##  <#GAPDoc Label="IsFeasibleNGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleNGParameters"
##   Arg='[ v, k, a, s, m ]'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a list of integers of length 5, <A>[v,k,a,s,m]</A>, this 
##  function returns <K>true</K> if <M>( v, k, a; s, m )</M> is a feasible
##  parameter tuple for a Neumaier graph. Otherwise, the function 
##  returns <K>false</K>.
##  <P/>
##  The tuple <M>( v, k, a; s, m )</M> is a <E>feasible</E>
##  parameter tuple for a Neumaier graph if it satisfies the following
##  conditions:
##  <List>
##  <Item><M>(v,k,a)</M> is a feasible edge-regular graph parameter tuple;</Item> 
##  <Item><M>0&lt;m\leq s</M> and <M>2\leq s\leq a+2</M>;</Item>
##  <Item><M>(v-s)m=(k-s+1)s</M>;</Item>
##  <Item><M>(k-s+1)(m-1)=(a-s+2)(s-1)</M>.</Item>
##  </List> 
##  Any Neumaier graph must have parameters which satisfy these 
##  conditions (see <Cite Key="E_2020"/>). 
##    <Example>
##      <![CDATA[
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleNGParameters" );

#############################################################################
##
#F  RegularCliqueERGParameters( <parms> )
##  
##  <#GAPDoc Label="RegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="RegularCliqueERGParameters"
##   Arg='parms'/>
##  <Returns>a list.</Returns>
##
##  <Description>
##  Given feasible edge-regular graph parameters <A>parms</A><C>=[v,k,a]</C>, this function 
##  returns a list of pairs <C>[s,m]</C>, such that
##  <M>(v,k,l;s,m)</M> are feasible Neumaier graph parameters.
##  If there exist no such pairs, this function returns <C>fail</C>.
##    <Example>
##      <![CDATA[
##gap> RegularCliqueERGParameters([8,7,6]);
##[ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 4 ], [ 5, 5 ], [ 6, 6 ], [ 7, 7 ] ]
##gap> RegularCliqueERGParameters([8,6,4]);
##[ [ 4, 3 ] ]
##gap> RegularCliqueERGParameters([16,9,4]);
##[ [ 4, 2 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularCliqueERGParameters" );

#############################################################################
##
#F  RegularAdjacencyPolynomial( <parms>, <x>, <y>, <d> )
##  
##  <#GAPDoc Label="RegularAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="RegularAdjacencyPolynomial"
##   Arg='parms,x,y,d'/>
##  <Returns>a polynomial.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> and indeterminates 
##  <A>x,y,d</A>, this function returns the Regular Adjacency Polynomial with
##  respect to the parameters <A>parms</A> and indeterminates <A>x,y,d</A>, as 
##  defined in Evans <Cite Key="E_2020"/>.
##  <P/>
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>. 
##  The <E>regular adjacency polynomial</E> of <M>\Gamma</M> is defined as
##  <Display>R(x,y,d):=x(x+1)(v-y)-2xyk+(2x+a-b+1)yd+y(y-1)b-yd^{2}.</Display>
##  For the properties of the regular adjacency polynomial, see <Cite Key="E_2020"/>.
##    <Example>
##      <![CDATA[
##RegularAdjacencyPolynomial([16,6,2,2],"x","y","d");
##-x^2*y+2*x*y*d-y*d^2+16*x^2-x*y+2*y^2+y*d+4*x-2*y
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularAdjacencyPolynomial" );

#############################################################################
##
#F  RegularAdjacencyUpperBound( <parms>, <d> )
##  
##  <#GAPDoc Label="RegularAdjacencyUpperBound">
##  <ManSection>
##  <Func Name="RegularAdjacencyUpperBound"
##   Arg='parms,d'/>
##  <Returns>an integer.</Returns>
##
##  <Description>
##  Given strongly regular graph parameters <A>parms</A> and non-negative 
##  integer <A>d</A>, this function returns the Regular Adjacency upper bound
##  with respect to the parameters <A>parms</A> and integer <A>d</A>, defined
##  in Evans <Cite Key="E_2020"/>.
##  <P/>
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>,
##  and let <M>R</M> be its corresponding regular adjacency poylnomial (see 
##  <Ref Func="RegularAdjacencyPolynomial"/>). For fixed <M>d</M>, the <E>regular adjacency upper bound</E>
##  of <M>\Gamma</M> is defined as the largest integer <M>1\leq y\leq v</M> such 
##  that for all integers <M>m</M>, we have <M>R(m,y) \geq 0</M>.
##  It is known that the regular adjacency upper bound is an upper bound on the number 
##  of vertices in any <M>d</M>-regular induced subgraph of <M>\Gamma</M> (see <Cite Key="E_2020"/>).
##    <Example>
##      <![CDATA[
##gap> RegularAdjacencyUpperBound([16,6,2,2],4);
##12
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularAdjacencyUpperBound" );

#############################################################################
##
#F  RegularAdjacencyLowerBound( <parms>, <d> )
##  
##  <#GAPDoc Label="RegularAdjacencyLowerBound">
##  <ManSection>
##  <Func Name="RegularAdjacencyLowerBound"
##   Arg='parms'/>
##  <Returns>an integer.</Returns>
##
##  <Description>
##  Given strongly regular graph parameters <A>parms</A> and non-negative 
##  integer <A>d</A>, this function returns the Regular Adjacency lower bound
##  with respect to the parameters <A>parms</A> and integer <A>d</A>, defined
##  in Evans <Cite Key="E_2020"/>.
##  <P/>
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>,
##  and let <M>R</M> be its corresponding regular adjacency poylnomial (see 
##  <Ref Func="RegularAdjacencyPolynomial"/>). For fixed <M>d</M>, the <E>regular adjacency lower bound</E>
##  of <M>\Gamma</M> is defined as the smallest integer <M>1\leq y\leq v</M> such 
##  that for all integers <M>m</M>, we have <M>R(m,y) \geq 0</M>.
##  It is known that the regular adjacency lower bound is a lower bound on the number 
##  of vertices in any <M>d</M>-regular induced subgraph of <M>\Gamma</M> (see <Cite Key="E_2020"/>).
##    <Example>
##      <![CDATA[
##gap> RegularAdjacencyLowerBound([16,6,2,2],4);
##8
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularAdjacencyLowerBound" );

#############################################################################
##
#F  Nexus( <gamma>, <U> )
##  
##  <#GAPDoc Label="Nexus">
##  <ManSection>
##  <Func Name="Nexus"
##   Arg='gamma,U'/>
##  <Returns>an integer or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and a subset <A>U</A> of its vertices, this
##  function returns the nexus of <A>U</A>. If <A>U</A> is not an <M>m</M>-regular
##  set for some <M>m</M>, the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Nexus" );

#############################################################################
##
#F  RegularSetParameters( <gamma>, <U> )
##  
##  <#GAPDoc Label="RegularSetParameters">
##  <ManSection>
##  <Func Name="RegularSetParameters"
##   Arg='gamma,U'/>
##  <Returns>a list.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and a subset <A>U</A> of its vertices, this
##  function returns a list <C>[d,m]</C> such that <A>U</A> is a <M>(d,m)</M>
##  -regular set. If <A>U</A> is not an <M>(d,m)</M>-regular
##  set for some <M>d,m</M>, the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularSetParameters" );

#############################################################################
##
#F  IsRegularSet( <gamma>, <U>, <opt> )
##  
##  <#GAPDoc Label="IsRegularSet">
##  <ManSection>
##  <Func Name="IsRegularSet"
##   Arg='gamma,U,opt'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and a subset <A>U</A> of its vertices, this 
##  function returns <K>true</K> if <A>U</A> is a regular set, and <K>false</K>
##  otherwise. 
##  <P/> 
##  The input <A>opt</A> should take a boolean value <K>true</K> or <K>false</K>.
##  This option effects the output of the function in the following way.
##  <List>
##    <Mark><K>true</K></Mark>
##    <Item> this function will return <K>true</K> if and only if
##          <A>U</A> is a <M>(d,m)</M>-regular set for some <M>d,m</M>.</Item>
##    <Mark><K>false</K></Mark>
##    <Item> this function will return <K>true</K> if and only if
##          <A>U</A> is a <M>m</M>-regular set for some <M>m</M>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsRegularSet" );

#############################################################################
##
#F  RegularSetSRGParameters( <parms> )
##  
##  <#GAPDoc Label="RegularSetSRGParameters">
##  <ManSection>
##  <Func Name="RegularSetSRGParameters"
##   Arg='parms,d'/>
##  <Returns>a list.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> and non-negative
##  integer <M>d</M>, this function returns a list of pairs <C>[s,m]</C> with 
##  the following properties:
##  <List>
##  <Item><M>(d,m)</M> are feasible regular set parameters for a strongly regular graph
##  with parameters <A>parms</A>.</Item>
##  <Item><M>s</M> is the order of any <M>(d,m)</M>-regular set in a strongly regular graph
##  with parameters <A>parms</A>.</Item>
##  </List> 
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>
##  and let <M>R</M> be its corresponding regular adjacency polynomial 
##  (see <Ref Label="RegularAdjacencyPolynomial"/>).
##  Then the tuple <M>(d,m)</M> is a <E>feasible regular set parameter tuple</E>
##  for <M>\Gamma</M> if <M>d,m</M> are non-negative integers and there exists a
##  positive integer <M>s</M> such that 
##  <Display>R(m-1,s,d)=R(m,s,d)=0.</Display>
##  It is known that any <M>(d,m)</M>-regular set of order <M>s</M> in <M>\Gamma</M>
##  must have satisfy the above conditions (see <Cite Key="E_2020"/>).
##    <Example>
##      <![CDATA[
##gap> RegularSetSRGParameters([16,6,2,2],4);
##[ [ 8, 2 ], [ 12, 6 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularSetSRGParameters" );

#############################################################################
##
#E
