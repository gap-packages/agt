#############################################################################
##
#W  gencon.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct general graphs. 
##

#############################################################################
##
#F  AdjFunGraph( <vertices>, <function> )
##  
##  <#GAPDoc Label="AdjFunGraph">
##  <ManSection>
##  <Func Name="AdjFunGraph"
##   Arg='V, func'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a list <A>V</A> and a boolean function <A>func</A> defining a relation
##  on <A>V</A>, this function returns the graph with vertex-set <A>V</A>,
##  and edge set consisting of all pairs of distinct vertices <C>x,y</C>, 
##  such that <C>func(x,y)=true</C> 
##    <Example>
##      <![CDATA[
##gap> AdjFunGraph([24..33],function(x,y) return Gcd(x,y)=1; end);
##rec( adjacencies := [ [ 2, 6, 8 ], [ 1, 3, 4, 5, 6, 8, 9, 10 ], 
##                [ 2, 4, 6, 8, 10 ], [ 2, 3, 5, 6, 8, 9 ], [ 2, 4, 6, 8, 10 ], 
##                [ 1, 2, 3, 4, 5, 7, 8, 9, 10 ], [ 6, 8 ], 
##                [ 1, 2, 3, 4, 5, 6, 7, 9, 10 ], [ 2, 4, 6, 8, 10 ], 
##                [ 2, 3, 5, 6, 8, 9 ] ], 
##     group := Group(()), isGraph := true, names := [ 24 .. 33 ], 
##     order := 10, representatives := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ], 
##     schreierVector := [ -1, -2, -3, -4, -5, -6, -7, -8, -9, -10 ] 
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AdjFunGraph" );

# A generic product graph.
#############################################################################
##
#F  ProductGraph( [<filter>, ]<graphs>, <function> )
##  
##  <#GAPDoc Label="ProductGraph">
##  <ManSection>
##  <Func Name="ProductGraph"
##   Arg='[fil, ]Gs, func'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This is a general function to construct a graph with vertices consisting
##  of the cartesian product of vertices from a list of graphs.
##  <P/>
##  The input <A>Gs</A> should be a list of graphs and <A>func</A> should be a 
##  boolean function defining a relation on the cartesian product of the lists 
##  <C>[1..Gs[i].order]</C>. Then this function returns the graph with 
##  vertex-set the cartesian product of the vertices of the graphs in <A>Gs</A>, 
##  and vertices <C>x,y</C> are adjacent if and only if <C>func(x,y)=true</C>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##    <Example>
##      <![CDATA[
##gap> g:=CompleteGraph(SymmetricGroup(3));;
##gap> h:=HammingGraph(2,2);;
##gap> ProductGraph([g,h],function(x,y) return (x<>y) and 
##>                                            (x[1]=y[1] or x[2]=y[2]); 
##>                       end);
##rec( adjacencies := [ [ 2, 3, 4, 5, 9 ] ], 
##     group := Group([ (1,5,9)(2,6,10)(3,7,11)(4,8,12), (1,5)(2,6)(3,7)(4,8),
##                      (1,3)(2,4)(5,7)(6,8)(9,11)(10,12), 
##                      (1,2)(3,4)(5,6)(7,8)(9,10)(11,12), (2,3)(6,7)(10,11) ]), 
##     isGraph := true, 
##     names := [ [ 1, [ 1, 1 ] ], [ 1, [ 1, 2 ] ], [ 1, [ 2, 1 ] ], 
##                [ 1, [ 2, 2 ] ], [ 2, [ 1, 1 ] ], [ 2, [ 1, 2 ] ], 
##                [ 2, [ 2, 1 ] ], [ 2, [ 2, 2 ] ], [ 3, [ 1, 1 ] ], 
##                [ 3, [ 1, 2 ] ], [ 3, [ 2, 1 ] ], [ 3, [ 2, 2 ] ] ], 
##     order := 12, representatives := [ 1 ], 
##     schreierVector := [ -1, 4, 3, 4, 1, 4, 3, 4, 1, 4, 3, 4 ] 
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("ProductGraphCons", [IsObject, IsList, IsFunction]);
DeclareGlobalFunction( "ProductGraph" );

#############################################################################
##
#F  PowerGraph( [<filter>, ]<graph>, <integer>, <function> )
##  
##  <#GAPDoc Label="PowerGraph">
##  <ManSection>
##  <Func Name="PowerGraph"
##   Arg='[fil, ]gamma, n, func'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This is a general function to construct a graph with vertices consisting
##  of the <A>n</A>-tuples of vertices from of a graph.
##  <P/>
##  The input <A>gamma</A> should be a graph, and <A>func</A> should be a 
##  boolean function defining a relation on the <A>n</A>-tuples of elements of 
##  <C>[1..gamma.order]</C>. Then this function returns the graph with 
##  vertex-set consisting of the <A>n</A>-tuples of elements of vertices of 
##  <A>gamma</A>, and vertices <C>x,y</C> are adjacent if and only if 
##  <C>func(x,y)=true</C>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> PowerGraph(h,2,function(x,y) return (x<>y) and (x[1]=y[1] or x[2]=y[2]); 
##>                   end);
##rec( adjacencies := [ [ 2, 3, 4, 5, 9, 13 ] ], 
##     group := <permutation group with 7 generators>, 
##     isGraph := true, 
##     names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
##                [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], 
##                [ [ 1, 2 ], [ 1, 1 ] ], [ [ 1, 2 ], [ 1, 2 ] ], 
##                [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ],
##                [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], 
##                [ [ 2, 1 ], [ 2, 1 ] ], [ [ 2, 1 ], [ 2, 2 ] ], 
##                [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ],
##                [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], 
##     order := 16, representatives := [ 1 ], 
##     schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] 
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("PowerGraphCons", [IsObject, IsRecord, IsInt, IsFunction]);
DeclareGlobalFunction( "PowerGraph" );

#############################################################################
##
#F  BoxProductGraph( [<filter>, ]<graphs> )
##  
##  <#GAPDoc Label="BoxProductGraph">
##  <ManSection>
##  <Func Name="BoxProductGraph"
##   Arg='[fil, ]G1,G2,...'/>
##  <Func Name="BoxProductGraph"
##   Arg='[fil, ]Gs' Label="for a list"/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given graphs <A>G1,G2,...</A> or list of graphs <A>Gs</A>, this function 
##  returns the box product of the given graphs. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma,\Delta</M> be graphs. The <E>box product</E> of <M>\Gamma</M>
##  and <M>\Delta</M>, <M>\Gamma \Box \Delta</M>, has vertex-set 
##  <M>V(\Gamma) \times V(\Delta)</M>. Distinct vertices 
##  <M>(a,x),(b,y)</M> are adjacent if and only if either
##  <List>
##    <Item><M>a=b</M> and <M>x,y</M> are adjacent vertices in <M>\Delta</M>, or
##    </Item>
##    <Item><M>x=y</M> and <M>a,b</M> are adjacent vertices in <M>\Gamma</M>.
##    </Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> BoxProductGraph(h,h);
##rec( adjacencies := [ [ 2, 3, 5, 9 ] ], 
##     group := <permutation group with 6 generators>, isGraph := true, 
##     names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
##                [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], 
##                [ [ 1, 2 ], [ 1, 1 ] ], [ [ 1, 2 ], [ 1, 2 ] ], 
##                [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
##                [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], 
##                [ [ 2, 1 ], [ 2, 1 ] ], [ [ 2, 1 ], [ 2, 2 ] ], 
##                [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
##                [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], 
##     order := 16, representatives := [ 1 ], 
##     schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ]
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "BoxProductGraph" );

#############################################################################
##
#F  BoxPowerGraph( [<filter>, ]<graph>, <integer> )
##  
##  <#GAPDoc Label="BoxPowerGraph">
##  <ManSection>
##  <Func Name="BoxPowerGraph"
##   Arg='[fil, ]gamma, n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and positive integer <A>n</A>, this function 
##  returns <M><A>n</A>^{th}</M> power of <A>gamma</A>, with respect to the box 
##  product operation (see <Ref Func="BoxProductGraph"/>). 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> BoxPowerGraph(h,2);
##rec( adjacencies := [ [ 2, 3, 5, 9 ] ], 
##     group := <permutation group with 7 generators>, isGraph := true, 
##     names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
##                [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], 
##                [ [ 1, 2 ], [ 1, 1 ] ], [ [ 1, 2 ], [ 1, 2 ] ], 
##                [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
##                [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], 
##                [ [ 2, 1 ], [ 2, 1 ] ], [ [ 2, 1 ], [ 2, 2 ] ], 
##                [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
##                [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], 
##     order := 16, representatives := [ 1 ], 
##     schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ]
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "BoxPowerGraph" );

#############################################################################
##
#F  CrossProductGraph( [<filter>, ]<graphs> )
##  
##  <#GAPDoc Label="CrossProductGraph">
##  <ManSection>
##  <Func Name="CrossProductGraph"
##   Arg='[fil, ]G1, G2,...'/>
##  <Func Name="CrossProductGraph"
##   Arg='[fil, ]Gs' Label="for a list"/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given graphs <A>G1,G2,...</A> or list of graphs <A>Gs</A>, this function 
##  returns the cross product of the given graphs. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma,\Delta</M> be graphs. The <E>cross product</E> of 
##  <M>\Gamma</M> and <M>\Delta</M> (also known as the tensor product),
##  <M>\Gamma \times \Delta</M>, has vertex-set 
##  <M>V(\Gamma) \times V(\Delta)</M>. Distinct vertices 
##  <M>(a,x),(b,y)</M> are adjacent if and only if <M>a,b</M> are adjacent in 
##  <M>\Gamma</M> and <M>x,y</M> are adjacent in <M>\Delta</M>.
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> CrossProductGraph(h,h);
##rec( adjacencies := [ [ 6, 7, 10, 11 ] ], 
##     group := <permutation group with 6 generators>, isGraph := true, 
##     names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
##                [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], 
##                [ [ 1, 2 ], [ 1, 1 ] ], [ [ 1, 2 ], [ 1, 2 ] ], 
##                [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
##                [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], 
##                [ [ 2, 1 ], [ 2, 1 ] ], [ [ 2, 1 ], [ 2, 2 ] ], 
##                [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
##                [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], 
##     order := 16, representatives := [ 1 ], 
##     schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ]
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CrossProductGraph" );

#############################################################################
##
#F  CrossPowerGraph( [<filter, ]<graph>, <integer> )
##  
##  <#GAPDoc Label="CrossPowerGraph">
##  <ManSection>
##  <Func Name="CrossPowerGraph"
##   Arg='[fil, ]gamma, n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and positive integer <A>n</A>, this function 
##  returns the <M><A>n</A>^{th}</M> power of <A>gamma</A>, with respect to the 
##  cross product operation (see <Ref Func="CrossProductGraph"/>). 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> CrossPowerGraph(h,2);
##rec( adjacencies := [ [ 6, 7, 10, 11 ] ], 
##     group := <permutation group with 7 generators>, isGraph := true, 
##     names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
##                [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], 
##                [ [ 1, 2 ], [ 1, 1 ] ], [ [ 1, 2 ], [ 1, 2 ] ], 
##                [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
##                [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], 
##                [ [ 2, 1 ], [ 2, 1 ] ], [ [ 2, 1 ], [ 2, 2 ] ], 
##                [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
##                [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], 
##     order := 16, representatives := [ 1 ], 
##     schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ]
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CrossPowerGraph" );

#############################################################################
##
#F  StrongProductGraph( [<filter>, ]<graphs> )
##  
##  <#GAPDoc Label="StrongProductGraph">
##  <ManSection>
##  <Func Name="StrongProductGraph"
##   Arg='[fil, ]G1, G2,...'/>
##  <Func Name="StrongProductGraph"
##   Arg='[fil, ]Gs' Label="for a list"/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given graphs <A>G1,G2,...</A> or list of graphs <A>Gs</A>, this function 
##  returns the strong product of the given graphs. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma,\Delta</M> be graphs. The <E>strong product</E> of 
##  <M>\Gamma</M> and <M>\Delta</M>, <M>\Gamma \boxtimes \Delta</M>, has
##  vertex-set <M>V(\Gamma) \times V(\Delta)</M>. Distinct vertices
##  <M>(a,x),(b,y)</M> are adjacent if and only if either
##  <List>
##    <Item><M>a=b</M> and <M>x,y</M> are adjacent vertices in <M>\Delta</M>, or
##    </Item>
##    <Item><M>x=y</M> and <M>a,b</M> are adjacent vertices in <M>\Gamma</M>, or
##    </Item>
##    <Item><M>a,b</M> are adjacent in <M>\Gamma</M> and <M>x,y</M> are adjacent
##          in <M>\Delta</M>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> StrongProductGraph(h,h);
##rec( adjacencies := [ [ 2, 3, 5, 6, 7, 9, 10, 11 ] ], 
##     group := <permutation group with 6 generators>, isGraph := true, 
##     names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
##                [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], 
##                [ [ 1, 2 ], [ 1, 1 ] ], [ [ 1, 2 ], [ 1, 2 ] ], 
##                [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
##                [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], 
##                [ [ 2, 1 ], [ 2, 1 ] ], [ [ 2, 1 ], [ 2, 2 ] ], 
##                [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
##                [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], 
##     order := 16, representatives := [ 1 ], 
##     schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ]
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StrongProductGraph" );

#############################################################################
##
#F  StrongPowerGraph( [<filter, ]<graph>, <integer> )
##  
##  <#GAPDoc Label="StrongPowerGraph">
##  <ManSection>
##  <Func Name="StrongPowerGraph"
##   Arg='[fil, ]gamma, n'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A> and positive integer <A>n</A>, this function 
##  returns <M><A>n</A>^{th}</M> power of <A>gamma</A>, with respect to the 
##  strong product operation (see <Ref Func="StrongProductGraph"/>). 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> StrongPowerGraph(h,2);
##rec( adjacencies := [ [ 2, 3, 5, 6, 7, 9, 10, 11 ] ], 
##     group := <permutation group with 7 generators>, isGraph := true, 
##     names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
##                [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], 
##                [ [ 1, 2 ], [ 1, 1 ] ], [ [ 1, 2 ], [ 1, 2 ] ], 
##                [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
##                [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], 
##                [ [ 2, 1 ], [ 2, 1 ] ], [ [ 2, 1 ], [ 2, 2 ] ], 
##                [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
##                [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], 
##     order := 16, representatives := [ 1 ], 
##     schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ]
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StrongPowerGraph" );

#############################################################################
##
#F  GraphJoin( [<filter>, ]<graphs> )
##  
##  <#GAPDoc Label="GraphJoin">
##  <ManSection>
##  <Func Name="GraphJoin"
##   Arg='[fil, ]G1, G2,...'/>
##  <Func Name="GraphJoin"
##   Arg='[fil, ]Gs' Label="for a list"/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given graphs <A>G1,G2,...</A> or list of graphs <A>Gs</A>, this function 
##  returns the graph join of the given graphs. 
##  <P/>
##  Each vertex of the resulting graph will correspond to a unique vertex from 
##  the union of vertex-sets of the given graphs. The vertex corresponding to a 
##  vertex <C>name</C> in <A>Gi</A> will be named <C>[i,name]</C> in our new 
##  graph. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma,\Delta</M> be graphs. The <E>graph join</E> of <M>\Gamma</M>
##  and <M>\Delta</M>, <M>\Gamma + \Delta</M>, has vertex-set 
##  <M>V(\Gamma) \cup V(\Delta)</M>. Distinct vertices <M>x,y</M> are adjacent 
##  if and only if either
##  <List>
##    <Item><M>x</M> and <M>y</M> are vertices from different graphs, or </Item>
##    <Item><M>x</M> and <M>y</M> are vertices from the same graph, and are
##          adjacent in that graph.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> GraphJoin(h,h);
##rec( adjacencies := [ [ 2, 3, 5, 6, 7, 8 ], [ 1, 2, 3, 4, 6, 7 ] ], 
##     group := Group([ (1,3)(2,4), (1,2)(3,4), (2,3), (5,7)(6,8), (5,6)(7,8),
##                      (6,7) ]), 
##     isGraph := true, 
##     names := [ [ 1, [ 1, 1 ] ], [ 1, [ 1, 2 ] ], [ 1, [ 2, 1 ] ], 
##                [ 1, [ 2, 2 ] ], [ 2, [ 1, 1 ] ], [ 2, [ 1, 2 ] ], 
##                [ 2, [ 2, 1 ] ], [ 2, [ 2, 2 ] ] ], 
##     order := 8, representatives := [ 1, 5 ], 
##     schreierVector := [ -1, 2, 1, 2, -2, 5, 4, 5 ] 
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("GraphJoinCons", [IsObject, IsList]);
DeclareGlobalFunction( "GraphJoin" );

#TODO duality functions
#############################################################################
##
#F  BipartiteDoubleGraph( <graph> )
##  
##  <#GAPDoc Label="BipartiteDoubleGraph">
##  <ManSection>
##  <Func Name="BipartiteDoubleGraph"
##   Arg='gamma'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the bipartite double cover
##  of <A>gamma</A>. 
##  <P/>
##  Let <M>\Gamma</M> be a graph. The <E>bipartite double cover</E> of 
##  <M>\Gamma</M> has vertex-set <M>V(\Gamma) \times \{-,+\}</M>. Distinct 
##  vertices <M>(x,\circ),(y,\ast)</M> are adjacent if and only if 
##  <M>\circ \neq \ast</M> and <M>x,y</M> are adjacent in <M>\Gamma.</M> 
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 1.11"/>. 
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> BipartiteDoubleGraph(h);
##rec( adjacencies := [ [ 6, 7 ] ], 
##     group := Group([ (1,3)(2,4)(5,7)(6,8), (1,2)(3,4)(5,6)(7,8), (2,3)(6,7),
##                      (1,5)(2,6)(3,7)(4,8) ]), 
##     halfDuality := function( x ) ... end, 
##     halfPrimality := function( x ) ... end, isGraph := true, 
##     names := [ [ [ 1, 1 ], "+" ], [ [ 1, 2 ], "+" ], [ [ 2, 1 ], "+" ],
##                [ [ 2, 2 ], "+" ], [ [ 1, 1 ], "-" ], [ [ 1, 2 ], "-" ], 
##                [ [ 2, 1 ], "-" ], [ [ 2, 2 ], "-" ] ], 
##     order := 8, representatives := [ 1 ], 
##     schreierVector := [ -1, 2, 1, 2, 4, 4, 4, 4 ] 
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "BipartiteDoubleGraph" );

#TODO duality functions
#############################################################################
##
#F  ExtendedBipartiteDoubleGraph( [<filter, ]<graph> )
##  
##  <#GAPDoc Label="ExtendedBipartiteDoubleGraph">
##  <ManSection>
##  <Func Name="ExtendedBipartiteDoubleGraph"
##   Arg='[fil, ]gamma'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the extended 
##  bipartite double cover of <A>gamma</A>. 
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma</M> be a graph. The <E>extended bipartite double cover</E> of 
##  <M>\Gamma</M> has vertex-set <M>V(\Gamma) \times \{-,+\}</M>. Distinct 
##  vertices <M>(x,\circ),(y,\ast)</M> are adjacent if and only if
##  <M>\circ = \ast</M> or <M>x,y</M> are adjacent in <M>\Gamma.</M> 
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 1.11"/>.
##    <Example>
##      <![CDATA[
##gap> h:=HammingGraph(2,2);;
##gap> ExtendedBipartiteDoubleGraph(h);
##rec( adjacencies := [ [ 5, 6, 7 ] ], 
##     group := Group([ (1,2)(3,4)(5,6)(7,8), (1,3)(2,4)(5,7)(6,8), (2,3)(6,7),
##                      (1,5)(2,6)(3,7)(4,8) ]), 
##     halfDuality := function( x ) ... end, 
##     halfPrimality := function( x ) ... end, isGraph := true, 
##     names := [ [ [ 1, 1 ], "+" ], [ [ 2, 1 ], "+" ], [ [ 1, 2 ], "+" ],
##                [ [ 2, 2 ], "+" ], [ [ 1, 1 ], "-" ], [ [ 2, 1 ], "-" ], 
##                [ [ 1, 2 ], "-" ], [ [ 2, 2 ], "-" ] ], 
##     order := 8, representatives := [ 1 ], 
##     schreierVector := [ -1, 1, 2, 2, 4, 4, 4, 4 ]
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("ExtendedBipartiteDoubleGraphCons", [IsObject, IsRecord]);
DeclareGlobalFunction( "ExtendedBipartiteDoubleGraph" );

#############################################################################
##
#F  HalvedGraph( <graph>[, <integer>] )
##  
##  <#GAPDoc Label="HalvedGraph">
##  <ManSection>
##  <Func Name="HalvedGraph"
##   Arg='gamma[, n]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a connected bipartite graph <A>gamma</A>, this function returns a 
##  halved graph of <A>gamma</A>. The optional input <A>n</A> should take a 
##  value in <C>[1,2]</C>, and determines the part of the bipartition for which
##  the halved graph is defined on.
##  <P/>
##  Let <M>\Gamma</M> be a connected bipartite graph with bipartition 
##  <M>U,W</M>. The <E>halved graph</E> of <M>\Gamma</M> with respect to <M>U</M> 
##  has vertex-set <M>U</M>, and distinct vertices <M>x,y</M> are adjacent
##  if and only if <M>x,y</M> are at graph distance 2 in <M>\Gamma.</M> 
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 4.2"/>.
##    <Example>
##      <![CDATA[
##gap> h:=CycleGraph2(8);;
##gap> HalvedGraph(h);
##rec( adjacencies := [ [ 2, 4 ] ], group := Group([ (2,4), (1,2)(3,4) ]),
##     isGraph := true, isSimple := true, names := [ 1, 3, 5, 7 ], order := 4, 
##     representatives := [ 1 ], schreierVector := [ -1, 2, 2, 1 ] 
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HalvedGraph" );

#############################################################################
##
#F  AntipodalQuotientGraph( [<filter>, ]<graph> )
##  
##  <#GAPDoc Label="AntipodalQuotientGraph">
##  <ManSection>
##  <Func Name="AntipodalQuotientGraph"
##   Arg='[fil, ]gamma'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a distance-regular graph <A>gamma</A> which is an antipodal cover, 
##  this function returns the anitpodal quotient graph of <A>gamma</A>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma</M> be a distance-regular graph with <M>v</M> vertices, 
##  diameter <M>d</M> and intersection array 
##  <M>\{B_0,...,B_{{D-1}};C_1,...,C_D\}</M>. For any <M>u \in V(\Gamma)</M>, 
##  let <M>\Gamma_D\left[u\right]</M> be the set of vertices at distance 
##  <M>D</M> from <M>u</M>, and <M>u</M> itself. The graph <M>\Gamma</M> is 
##  <E>antipodal</E> if for all <M>u \in V(\Gamma)</M>, the set 
##  <M>\Gamma_D\left[u\right]</M> consists of vertices which are pairwise at 
##  distance <M>D</M>. Let <M>d = \lfloor D/2 \rfloor</M> and 
##  <M>r = 1 + B_d/C_{{D-d}}</M>.
##  <P/>
##  Then, the <E>antipodal quotient</E> of <M>\Gamma</M> is 
##  the graph with vertex-set 
##  <M>\{\Gamma_d\left[u\right]: u \in V(\Gamma)\}</M>, and distinct vertices
##  are adjacent if there is an edge between them in <M>\Gamma</M>. This graph
##  has <M>v/r</M> vertices and if <M>D &gt; 2</M>, it is distance-regular with 
##  intersection array given by <M>b_j = B_j, c_j = C_j</M> for 
##  <M>0 \leq j \leq d-1</M>, and <M>c_d = rC_d</M> if <M>D</M> is even, 
##  <M>c_d = C_d</M> if <M>D</M> is odd.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 4.2"/>.
##    <Example>
##      <![CDATA[
##gap> h:=CycleGraph(8);;
##gap> AntipodalQuotientGraph(h);
##rec( adjacencies := [ [ 2, 4 ] ], group := Group([ (1,2,3,4), (2,4) ]), 
##     isGraph := true, names := [ [ 1, 5 ], [ 2, 6 ], [ 3, 7 ], [ 4, 8 ] ], 
##     order := 4, representatives := [ 1 ], schreierVector := [ -1, 1, 1, 2 ] 
##   )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("AntipodalQuotientGraphCons", [IsObject, IsRecord]);
DeclareGlobalFunction( "AntipodalQuotientGraph" );

#TODO duality functions
#TODO only spcsgrph? make more general?
#############################################################################
##
#F  SubspaceGraph( <mtrxgrp>, <subspcs>, <vctspc>, <integer>[, <action>,
##                                                                  <invt>] )
##  
##  <#GAPDoc Label="SubspaceGraph">
##  <ManSection>
##  <Func Name="SubspaceGraph"
##   Arg='G, S, V, d[, A, invt]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  This is a general function to construct a graph with vertex-set
##  a subset of <A>d</A>-dimensional subspaces <A>S</A> of a vector space 
##  <A>V</A>, and distinct vertices are adjacent if and only if their 
##  intersection has dimension <M><A>d</A>-1</M>.
##  <P/>
##  This function accepts the following arguments.
##  <List>
##    <Mark><A>G</A></Mark>
##    <Item>If <A>A</A> is not given, <A>G</A> should be a subgroup of the 
##          matrix group of invertible linear transformations acting on 
##          <A>V</A>. If <A>A</A> is given, this group should act on <A>V</A> 
##          by the action <A>A</A>.</Item>
##    <Mark><A>S</A></Mark>
##    <Item>This argument can be either
##      <List>
##        <Item>a list of <A>d</A>-dimensional subspaces of <A>V</A>, or</Item>
##        <Item>a function which acts as a filter on the domain of 
##              <A>d</A>-dimensional subspaces of <A>V</A>, 
##              <C>Subspaces(V,d)</C>.</Item>
##      </List>
##    </Item>
##    <Mark><A>V</A></Mark>
##    <Item>A finite vector space.</Item>
##    <Mark><A>d</A></Mark>
##    <Item>A positive integer of size at most the dimension of <A>V</A>.</Item>
##    <Mark><A>A</A></Mark>
##    <Item>If <A>A</A> is given, it must define a group action of <A>G</A> on 
##          the subspaces <A>S</A>. The resulting graph will be defined by this
##          action. If <A>A</A> is not given, the action of <A>G</A> on 
##          the subspaces <A>S</A> is assumed to be the natural action of a 
##          matrix group.</Item>
##    <Mark><A>invt</A></Mark>
##    <Item>If <A>invt</A> is given, it must be <K>true</K> or <K>false</K>. 
##          Then this function behaves as described in Section
##          <Ref Sect="The invariant vertex-set option of Graph"/>.
##    </Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> q:=2;; n:=4;; d:=2;; V:=GF(q)^n;; S:=Elements;; G:=GL(n,q);;
##gap> gamma:=SubspaceGraph(G,S,V,d);;
##gap> SRGParameters(gamma);
##[ 35, 18, 9, 9 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SubspaceGraph" );

#TODO duality functions, explain connected component?
# The clique (dual geometry) graph of a collinearity graph pg. The optional second
# argument allows choosing a connected component of the resulting graph.
#############################################################################
##
#F  CliqueGraph( [<filter>, ]<graph>[, <list>] )
##  
##  <#GAPDoc Label="CliqueGraph">
##  <ManSection>
##  <Func Name="CliqueGraph"
##   Arg='[fil, ]gamma[, ls]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the clique graph of
##  <A>gamma</A>.
##  <P/>
##  If <A>ls</A> is not given, the resulting graph will have vertex-set the 
##  union of orbits of the maximal cliques <C>Cliques(<A>gamma</A>)</C> under the 
##  action of <C><A>gamma</A>.group</C>. If <A>ls</A> is given, it must be a 
##  positive integer or list of positive integers. Then, the resulting graph will 
##  have vertex-set the union of orbits of the maximal cliques 
##  <C>Cliques(gamma){ls}</C> under the action of <C><A>gamma</A>.group</C>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma</M> be a graph and <M>S</M> be a set of maximal cliques in 
##  <M>\Gamma</M>. The <E>clique graph</E> of <M>\Gamma</M> on the cliques 
##  <M>S</M> has vertex-set <M>S</M>. Distinct vertices <M>A,B</M> are adjacent 
##  if and only if <M>|A \cap B| = 1</M>.
##  <P/>
##  If <M>\Gamma</M> is the point graph (a.k.a. the collinearity graph) of a 
##  partial geometry <M>PG</M>, the clique graph of <M>\Gamma</M> is then the 
##  <E>line graph</E> of the partial geometry <M>PG</M>. If <M>PG</M> has 
##  parameters <M>(s,t,\alpha)</M>, then its point graph is strongly regular 
##  with parameters 
##  <M>((s+1)(st+\alpha)/\alpha, s(t+1), s-1 + t(\alpha-1), \alpha(t+1))</M> 
##  and its line graph is strongly regular with parameters 
##  <M>((t+1)(st+\alpha)/\alpha, t(s+1), t-1 + s(\alpha-1), \alpha(s+1))</M>. 
##    <Example>
##      <![CDATA[
##gap> K7:=CompleteGraph(SymmetricGroup(7));;
##gap> P:=PartialLinearSpaces(K7,2,2)[1];;
##gap> gamma:=CliqueGraph(P);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 4 ], [ 1, 1, 2 ], [ 1, 1, 2 ], [ 2, 2, 0 ] ] 
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("CliqueGraphCons", [IsObject, IsRecord, IsList]);
DeclareGlobalFunction( "CliqueGraph" );

#TODO duality functions, explain connected component?
# TODO this is in conflict with fining package. Not good as use of both packages
# quite likely.
# The incidence graph of a collinearity graph.
#############################################################################
##
#F  IncidenceGraph( [<filter>, ]<graph>[, <list>] )
##  
##  <#GAPDoc Label="AGT_IncidenceGraph">
##  <ManSection>
##  <Func Name="AGT_IncidenceGraph"
##   Arg='[fil, ]gamma[, ls]'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a graph <A>gamma</A>, this function returns the incidence graph of 
##  <A>gamma</A>.
##  <P/>
##  If <A>ls</A> is not given, the resulting graph will have vertex-set the 
##  union of <C>Vertices(<A>gamma</A>)</C> and each orbit of the maximal cliques 
##  <C>Cliques(<A>gamma</A>)</C> under the action of <C><A>gamma</A>.group</C>. 
##  If <A>ls</A> is given, it must be a positive integer or list of positive 
##  integers. Then, the resulting graph will have vertex-set the union of 
##  <C>Vertices(<A>gamma</A>)</C> and each orbit of the maximal cliques 
##  <C>Cliques(gamma){ls}</C> under the action of <C><A>gamma</A>.group</C>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>NoVertexNames</C>. Then this function behaves as described in 
##  <Ref Filt="NoVertexNames"/>.
##  <P/>
##  Let <M>\Gamma</M> be a graph and <M>S</M> be a set of maximal cliques in 
##  <M>\Gamma</M>. The <E>incidence graph</E> of <M>\Gamma</M> on the cliques 
##  <M>S</M> has vertex-set <M>V(\Gamma) \cup S</M>. Distinct vertices 
##  <M>u,w</M> are adjacent if and only if <M>u \subseteq w</M> or 
##  <M>w \subseteq u</M>.
##  <P/>
##  If <M>\Gamma</M> is the point graph (a.k.a. the collinearity graph) of a 
##  partial geometry <M>PG</M>, the incidence graph of <M>\Gamma</M> is the 
##  <E>incidence graph</E> of the partial geometry <M>PG</M>. 
##    <Example>
##      <![CDATA[
##gap> pg:=GeneralizedQuadrangleQ(4,3);;
##gap> gamma:=AGT_IncidenceGraph(pg);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 4 ], [ 1, 0, 3 ], [ 1, 0, 3 ], [ 1, 0, 3 ], [ 4, 0, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor("IncidenceGraphCons", [IsObject, IsRecord, IsList]);
DeclareGlobalFunction( "AGT_IncidenceGraph" );

#############################################################################
##
#E
