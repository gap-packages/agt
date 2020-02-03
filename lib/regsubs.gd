#############################################################################
##
#W  regsubs.gd           Algebraic Graph Theory package         Rhys J. Evans
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving regular subgraphs of graphs.
##


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
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given a non-null regular graph <A>gamma</A>, this function returns the 
##  Hoffman coclique bound of <A>gamma</A>.
##  <P/>
##  Given feasible strongly regular graph parameters <A>parms</A>, this 
##  function returns the Hoffman coclique bound of a strongly regular graph
##  with parameters <A>parms</A>. 
##  <P/>
##  Let <M>\Gamma</M> be a non-null regular graph with parameters <M>(v,k)</M> and least 
##  eigenvalue <M>s</M>. The <E>Hoffman coclique bound</E>, or 
##  <E>ratio bound</E> of <M>\Gamma</M>, is defined as
##  <Display>\delta=\lfloor\left(\frac{v}{k-s}\right)\rfloor.</Display>
##  It is known that any coclique in <M>\Gamma</M> must contain at most <M>\delta</M>
##  vertices (see <Cite Key="BH_2011"/>).
##    <Example>
##      <![CDATA[
##gap> HoffmanCocliqueBound(HammingGraph(3,5));
##25
##gap> HoffmanCocliqueBound(HammingGraph(2,5));               
##5
##gap> parms:=SRGParameters(HammingGraph(2,5));
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
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given a non-null, non-complete regular graph <A>gamma</A>, this function returns the
##  Hoffman clique bound of <A>gamma</A>.
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
##  (see <Cite Key="D_1975"/>).
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
#O  HaemersRegularUpperBound( <gamma> , <d> )
##  
##  <#GAPDoc Label="HaemersRegularUpperBound">
##  <ManSection>
##  <Oper Name="HaemersRegularUpperBound"
##   Arg="gamma,d"/>
##  <Oper Name="HaemersRegularUpperBound"
##   Arg="parms,d" Label="for SRG parameters"/>
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given a non-null regular graph <A>gamma</A> and non-negative integer <A>d</A>, this function returns the 
##  Haemers upper bound on <A>d</A>-regular induced subgraphs of <A>gamma</A>.
##  <P/>
##  Given feasible strongly regular graph parameters <A>parms</A> and non-negative integer <A>d</A>, this 
##  function returns the Haemers upper bound on <A>d</A>-regular induced subgraphs of a strongly regular graph
##  with parameters <A>parms</A>. 
##  <P/>
##  Let <M>\Gamma</M> be a non-null regular graph with parameters <M>(v,k)</M> and least 
##  eigenvalue <M>s</M> and let <M>d</M> be a non-negative integer. The
##  <E>Haemers upper bound</E> on <M>d</M>-regular induced subgraphs of <M>\Gamma</M>, is defined as
##  <Display>\delta=\lfloor\left(\frac{v(d-s)}{k-s}\right)\rfloor.</Display>
##  It is known that any <M>d</M>-regular induced subgraph in <M>\Gamma</M> has order at most <M>\delta</M>
##  (see <Cite Key="E_2020"/>).
##    <Example>
##      <![CDATA[
##gap> HaemersRegularUpperBound(SimsGerwitzGraph(),3);
##28
##gap> HaemersRegularUpperBound([56,10,0,2],0);       
##16
##      ]]>
##    </Example>
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "HaemersRegularUpperBound" , [IsRecord, IsInt] );
DeclareOperation( "HaemersRegularUpperBound" , [IsList, IsInt] );

#############################################################################
##
#O  HaemersRegularLowerBound( <gamma> , <d> )
##  
##  <#GAPDoc Label="HaemersRegularLowerBound">
##  <ManSection>
##  <Oper Name="HaemersRegularLowerBound"
##   Arg="gamma,d"/>
##  <Oper Name="HaemersRegularLowerBound"
##   Arg="parms,d" Label="for SRG parameters"/>
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given a connected regular graph <A>gamma</A> and non-negative integer <A>d</A>, this function returns the 
##  Haemers lower bound on <A>d</A>-regular induced subgraphs of <A>gamma</A>.
##  <P/>
##  Given the parameters of a connected strongly regular graph, <A>parms</A>, and non-negative integer <A>d</A>, this 
##  function returns the Haemers lower bound on <A>d</A>-regular induced subgraphs of a strongly regular graph
##  with parameters <A>parms</A>. 
##  <P/>
##  Let <M>\Gamma</M> be a connected regular graph with parameters <M>(v,k)</M> and second 
##  eigenvalue <M>r</M> and let <M>d</M> be a non-negative integer. The
##  <E>Haemers lower bound</E> on <M>d</M>-regular induced subgraphs of <M>\Gamma</M>, is defined as
##  <Display>\delta=\lfloor\left(\frac{v(d-r)}{k-r}\right)\rfloor.</Display>
##  It is known that any <M>d</M>-regular induced subgraph in <M>\Gamma</M> has order at least <M>\delta</M>
##  (see <Cite Key="E_2020"/>).
##    <Example>
##      <![CDATA[
##gap> HaemersRegularLowerBound(HoffmanSingletonGraph(),4);
##20
##gap> HaemersRegularLowerBound([50,7,0,1],3);             
##10
##      ]]>
##    </Example>
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "HaemersRegularLowerBound" , [IsRecord, IsInt] );
DeclareOperation( "HaemersRegularLowerBound" , [IsList, IsInt] );

#############################################################################
##
#F  CliqueAdjacencyPolynomial( <parms>, <x>, <y> )
##  
##  <#GAPDoc Label="CliqueAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="CliqueAdjacencyPolynomial"
##   Arg='parms,x,y'/>
##  <Returns>A polynomial.</Returns>
##
##  <Description>
##  Given feasible edge-regular graph parameters <A>parms</A> and indeterminates 
##  <A>x,y</A>, this function returns the clique adjacency polynomial with
##  respect to the parameters <A>parms</A> and indeterminates <A>x,y</A>, defined
##  in <Cite Key="S_2015"/>.
##  <P/>
##  Let <M>\Gamma</M> be an edge-regular graph with parameters <M>(v,k,a)</M>. 
##  The <E>clique adjacency polynomial</E> of <M>\Gamma</M> is defined as
##  <Display>C(x,y):=x(x+1)(v-y)-2xy(k-y+1)+y(y-1)(a-y+2).</Display>
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
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given feasible edge-regular graph parameters <A>parms</A>, this function 
##  returns the clique adjacency bound  with respect to the parameters 
##  <A>parms</A>, defined in <Cite Key="S_2010"/>.
##  <P/>
##  Let <M>\Gamma</M> be an edge-regular graph with parameters <M>(v,k,a)</M>,
##  and let <M>C</M> be its corresponding clique adjacency poylnomial (see 
##  <Ref Func="CliqueAdjacencyPolynomial"/>). The <E>clique adjacency bound</E>
##  of <M>\Gamma</M> is defined as the smallest integer <M>y\geq 2</M> such 
##  that there exists an integer <M>m</M> for which <M>C(m,y+1) &lt; 0</M>.
##  It is known that the clique adjacency bound is an upper bound on the number 
##  of vertices in any clique of <M>\Gamma</M>.
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
##  <Returns>A list or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the Neumaier graph
##  parameters of <A>gamma</A>. If <A>gamma</A> is not a Neumaier graph,
##  the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> NGParameters(HigmanSimsGraph());                    
##fail
##gap> NGParameters(TriangularGraph(10));
##[ [ 45, 16, 8, 9, 2 ] ]
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
##gap> IsNG(HammingGraph(3,7));
##false
##gap> IsNG(HammingGraph(2,7));
##true
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
##  function returns <K>true</K> if <M>( <A>v,k,a;s,m</A> )</M> is a feasible
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
##gap> IsFeasibleNGParameters([35,16,6,5,2]);
##true
##gap> IsFeasibleNGParameters([37,18,8,5,2]);
##false
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
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given feasible edge-regular graph parameters <A>parms</A><C>=[v,k,a]</C>, this function 
##  returns a list of pairs <C>[s,m]</C>, such that
##  <M>(<A>v,k,a;s,m</A>)</M> are feasible Neumaier graph parameters (as defined in
##  <Ref Func="IsFeasibleNGParameters"/>).
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
##  <Returns>A polynomial.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> and indeterminates 
##  <A>x,y,d</A>, this function returns the regular adjacency polynomial with
##  respect to the parameters <A>parms</A> and indeterminates <A>x,y,d</A>, as 
##  defined in <Cite Key="E_2020"/>.
##  <P/>
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>. 
##  The <E>regular adjacency polynomial</E> of <M>\Gamma</M> is defined as
##  <Display>R(x,y,d):=x(x+1)(v-y)-2xyk+(2x+a-b+1)yd+y(y-1)b-yd^{2}.</Display>
##    <Example>
##      <![CDATA[
##gap> RegularAdjacencyPolynomial([16,6,2,2],"x","y","d");
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
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given strongly regular graph parameters <A>parms</A> and non-negative 
##  integer <A>d</A>, this function returns the regular adjacency upper bound
##  with respect to the parameters <A>parms</A> and integer <A>d</A>, defined
##  in <Cite Key="E_2020"/>.
##  <P/>
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>,
##  and let <M>R</M> be its corresponding regular adjacency poylnomial (see 
##  <Ref Func="RegularAdjacencyPolynomial"/>). For fixed <M>d</M>, the <E>regular adjacency upper bound</E>
##  of <M>\Gamma</M> is defined as the largest integer <M>d+1\leq y\leq v</M> such 
##  that for all integers <M>m</M>, we have <M>R(m,y,d) \geq 0</M> if such a <M>y</M> exists, and 0 otherwise.
##  It is known that the regular adjacency upper bound is an upper bound on the number 
##  of vertices in any <M>d</M>-regular induced subgraph of <M>\Gamma</M>.
##    <Example>
##      <![CDATA[
##gap> RegularAdjacencyUpperBound([56,10,0,2],3);
##28
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
##   Arg='parms,d'/>
##  <Returns>An integer.</Returns>
##
##  <Description>
##  Given the parameters of a connected strongly regular graph, <A>parms</A>, and non-negative 
##  integer <A>d</A>, this function returns the regular adjacency lower bound
##  with respect to the parameters <A>parms</A> and integer <A>d</A>, defined
##  in <Cite Key="E_2020"/>.
##  <P/>
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>,
##  and let <M>R</M> be its corresponding regular adjacency poylnomial (see 
##  <Ref Func="RegularAdjacencyPolynomial"/>). For fixed <M>d</M>, the <E>regular adjacency lower bound</E>
##  of <M>\Gamma</M> is defined as the smallest integer <M>d+1\leq y\leq v</M> such 
##  that for all integers <M>m</M>, we have <M>R(m,y,d) \geq 0</M> if such a <M>y</M>, and <M>v+1</M> otherwise.
##  It is known that the regular adjacency lower bound is a lower bound on the number 
##  of vertices in any <M>d</M>-regular induced subgraph of <M>\Gamma</M>.
##    <Example>
##      <![CDATA[
##gap> RegularAdjacencyLowerBound([50,7,0,1],2);
##5
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
##  <Returns>An integer or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and a subset <A>U</A> of its vertices, this
##  function returns the nexus of <A>U</A>. If <A>U</A> is not an <M>m</M>-regular
##  set for some <M>m>0</M>, the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> Nexus(SquareLatticeGraph(5),[1,2,3,4,6]);
##fail
##gap> Nexus(SquareLatticeGraph(5),[1,2,3,4,5]);
##1
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
##  <Returns>A list or <K>fail</K>.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and a subset <A>U</A> of its vertices, this
##  function returns a list <A>[d,m]</A> such that <A>U</A> is a <M>(<A>d,m</A>)</M>-regular set.
##  If <A>U</A> is not an <M>(d,m)</M>-regular
##  set for some <M>d,m</M>, the function returns <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> RegularSetParameters(SquareLatticeGraph(5),[6,11,16,21]);  
##fail
##gap> RegularSetParameters(SquareLatticeGraph(5),[1,6,11,16,21]);
##[ 4, 1 ]
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
##gap> IsRegularSet(HoffmanSingletonGraph(),[11..50],false);
##true
##gap> IsRegularSet(HoffmanSingletonGraph(),[11..50],true); 
##false
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
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given feasible strongly regular graph parameters <A>parms</A> and non-negative
##  integer <A>d</A>, this function returns a list of pairs <A>[s,m]</A> with 
##  the following properties:
##  <List>
##  <Item><M>(<A>d,m</A>)</M> are feasible regular set parameters for a strongly regular graph
##  with parameters <A>parms</A>.</Item>
##  <Item><A>s</A> is the order of any <M>(<A>d,m</A>)</M>-regular set in a strongly regular graph
##  with parameters <A>parms</A>.</Item>
##  </List> 
##  Let <M>\Gamma</M> be a strongly regular graph with parameters <M>(v,k,a,b)</M>
##  and let <M>R</M> be its corresponding regular adjacency polynomial 
##  (see <Ref Func="RegularAdjacencyPolynomial"/>).
##  Then the tuple <M>(d,m)</M> is a <E>feasible regular set parameter tuple</E>
##  for <M>\Gamma</M> if <M>d,m</M> are non-negative integers and there exists a
##  positive integer <M>s</M> such that 
##  <Display>R(m-1,s,d)=R(m,s,d)=0.</Display>
##  It is known that any <M>(d,m)</M>-regular set of size <M>s</M> in <M>\Gamma</M>
##  must satisfy the above conditions (see <Cite Key="E_2020"/>).
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
