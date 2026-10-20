#############################################################################
##
#W  frmgrph.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions that construct forms graphs. 
##

#############################################################################
##
#F  BilinearFormsGraph( [<filter>, ]<integer>, <integer>, <integer> )
##  
##  <#GAPDoc Label="BilinearFormsGraph">
##  <ManSection>
##  <Func Name="BilinearFormsGraph"
##   Arg='[fil, ]q, d, e'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>q</A> and positive integers <A>d,e</A>, this 
##  function returns the bilinear forms graph 
##  <M>H(<A>q</A>,<A>d</A>,<A>e</A>)</M>.
##  <P/>
##  The optional argument <A>fil</A>, if used, should only take the value 
##  <C>FullAutomorphismGroup</C>. Then this function behaves as 
##  described in <Ref Filt="FullAutomorphismGroup"/>.
##  <P/>
##  Let <M>q</M> be a prime power and <M>d,e</M> be positive integers, where 
##  <M>d \leq e</M>. The <E>bilinear forms graph</E> <M>H(q,d,e)</M>
##  <Alt Not='Text'>(more commonly written as <M>H_q(d,e)</M>)</Alt>
##  has vertex-set the <M>d \times e</M> matrices over <M>GF(q)</M>. Two
##  distinct vertices <M>A,B</M> are adjacent if and only if the rank of 
##  <M>A-B</M> is 1. This graph has <M>q^{{de}}</M> vertices and is 
##  distance-regular with diameter <M>d</M> and intersection array given by 
##  <Display Mode="M">
##     b_j = q^{{2j}}(q - 1)G(d - j, 1)G(e - j, 1),
##     c_j = q^{{j-1}}G(j, 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.5A"/> or
##  <Cite Key="BV_2022" Where="Section 3.4.1"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=BilinearFormsGraph(2,2,2);;
##gap> SRGParameters(gamma);
##[ 16, 9, 4, 6 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "BilinearFormsGraphCons", [IsObject, IsInt, IsInt, IsInt]);
DeclareGlobalFunction( "BilinearFormsGraph" );

#############################################################################
##
#F  HermiteanFormsGraph( [<filter>, ]<integer>, <integer> )
##  
##  <#GAPDoc Label="HermiteanFormsGraph">
##  <ManSection>
##  <Func Name="HermiteanFormsGraph"
##   Arg='[fil, ]d, r'/>
##  <Returns>A graph.</Returns>
##
##  <Description>
##  Given a prime power <A>r</A> and positive integer <A>d</A>, this 
##  function returns the hermitean forms graph 
##  <M>Q(<A>d</A>,<A>r</A>)</M>.
##  <P/>
##  Let <M>r</M> be a prime power, <M>d</M> be a positive integer and set 
##  <M>q = r^2</M>. The <E>hermitean forms graph</E> <M>Q(d,r)</M>
##  <Alt Not='Text'>(more commonly written as <M>Q_{r}(d)</M>)</Alt>
##  has vertex-set the <M>d \times d</M> hermitean matrices over 
##  <M>GF(q)</M>. Two distinct vertices <M>A,B</M> are adjacent if and only if 
##  the rank of <M>A-B</M> is 1. This graph has <M>r^{({d}^2)}</M> vertices and is 
##  distance-regular with diameter <M>d</M> and intersection array given by 
##  <Display Mode="M">
##     b_j = (q^d - q^j)/(r + 1),
##     c_j = r^{{j-1}}(r^j - (-1)^j)/(r + 1) 
##  </Display>
##  for <M>0 \leq j \leq d</M>.
##  <P/>
##  For more information on this graph, see
##  <Cite Key="BCN_1989" Where="Section 9.5C"/> or
##  <Cite Key="BV_2022" Where="Section 3.4.4"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=HermiteanFormsGraph(2,3);;
##gap> GlobalParameters(gamma);
##[ [ 0, 0, 20 ], [ 1, 1, 18 ], [ 6, 14, 0 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareConstructor( "HermiteanFormsGraphCons", [IsObject, IsInt, IsInt]);
DeclareGlobalFunction( "HermiteanFormsGraph" );

#############################################################################
##
#E
