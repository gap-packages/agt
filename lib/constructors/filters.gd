#############################################################################
##
#W  filters.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving filters for graphs. 
##

#############################################################################
##
#F  NoVertexNames
##  
##  <#GAPDoc Label="NoVertexNames">
##  <ManSection>
##  <Filt Name="NoVertexNames" Type="Representation"/>
##  <Description>
##  This filter is used as an optional argument in many graph constructors in 
##  the &AGT; package.
##  <P/>
##  Suppose a constructor has optional filter argument for which 
##  <K>NoVertexNames</K> is a valid option. Such constructors will return a 
##  graph with vertices defined by another object or list. If this 
##  constructor is not given <K>NoVertexNames</K>, the vertex names in the 
##  resulting graph will keep the naming found in the input object(s).
##  <P/>
##  If the constructor is given <K>NoVertexNames</K>, the vertex names in 
##  the resulting graph will not keep the naming found in the input 
##  object(s). Instead, the original names will be changed to some 
##  arbitrary numbering of the individual objects. 
##  <P/>
##  Graphs constructed by functions available in the &AGT; package use the 
##  &GRAPE; package. A graph in &GRAPE; has an internal representation and 
##  a separate list of names for its vertices.
##    <Example>
##      <![CDATA[
##gap> gamma:=PaleyGraph(5);;
##gap> CrossProductGraph(gamma,gamma);              
##rec( adjacencies := [ [ 7, 9, 17, 19 ] ], 
##  group := <permutation group with 6 generators>, isGraph := true, 
##  names := [ [ 0*Z(5), 0*Z(5) ], [ 0*Z(5), Z(5)^0 ], [ 0*Z(5), Z(5) ], 
##      [ 0*Z(5), Z(5)^2 ], [ 0*Z(5), Z(5)^3 ], [ Z(5)^0, 0*Z(5) ], 
##      [ Z(5)^0, Z(5)^0 ], [ Z(5)^0, Z(5) ], [ Z(5)^0, Z(5)^2 ], 
##      [ Z(5)^0, Z(5)^3 ], [ Z(5), 0*Z(5) ], [ Z(5), Z(5)^0 ], [ Z(5), Z(5) ], 
##      [ Z(5), Z(5)^2 ], [ Z(5), Z(5)^3 ], [ Z(5)^2, 0*Z(5) ], 
##      [ Z(5)^2, Z(5)^0 ], [ Z(5)^2, Z(5) ], [ Z(5)^2, Z(5)^2 ], 
##      [ Z(5)^2, Z(5)^3 ], [ Z(5)^3, 0*Z(5) ], [ Z(5)^3, Z(5)^0 ], 
##      [ Z(5)^3, Z(5) ], [ Z(5)^3, Z(5)^2 ], [ Z(5)^3, Z(5)^3 ] ], 
##  order := 25, representatives := [ 1 ], 
##  schreierVector := [ -1, 4, 4, 5, 4, 1, 4, 4, 5, 4, 1, 4, 4, 5, 4, 2, 4, 4, 
##      5, 4, 1, 4, 4, 5, 4 ] )
##gap> CrossProductGraph(NoVertexNames,gamma,gamma);
##rec( adjacencies := [ [ 7, 9, 17, 19 ] ], 
##  group := <permutation group with 6 generators>, isGraph := true, 
##  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 2, 1 ], 
##      [ 2, 2 ], [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], 
##      [ 3, 4 ], [ 3, 5 ], [ 4, 1 ], [ 4, 2 ], [ 4, 3 ], [ 4, 4 ], [ 4, 5 ], 
##      [ 5, 1 ], [ 5, 2 ], [ 5, 3 ], [ 5, 4 ], [ 5, 5 ] ], order := 25, 
##  representatives := [ 1 ], 
##  schreierVector := [ -1, 4, 4, 5, 4, 1, 4, 4, 5, 4, 1, 4, 4, 5, 4, 2, 4, 4, 
##      5, 4, 1, 4, 4, 5, 4 ] )
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareFilter("NoVertexNames");

#############################################################################
##
#F  FullAutomorphismGroup
##  
##  <#GAPDoc Label="FullAutomorphismGroup">
##  <ManSection>
##  <Filt Name="FullAutomorphismGroup" Type="Representation"/>
##  <Description>
##  This filter is used as an optional argument in many graph constructors 
##  in the &AGT; package.
##  <P/>
##  Suppose a constructor has optional filter argument for which 
##  <K>FullAutomorphismGroup</K> is a valid option. Then if this 
##  constructor is given <K>FullAutomorphismGroup</K>, the function
##  will calculate the full automorphism group and use it to construct the 
##  graph. Also, the graph will have associated group equal to the full 
##  automorphism group.
##  <P/>
##  If this constructor is not given <K>FullAutomorphismGroup</K>,  the 
##  resulting graph may not have been constructed using its full 
##  automorphism group, and its associated group may be a strict subgroup 
##  of the automorphism group. 
##  <P/>
##  Graphs constructed by functions available in the &AGT; package use the 
##  &GRAPE; package. When constructing and storing a graph, &GRAPE; uses 
##  knowledge of the automorphisms of the graph to make computations and 
##  storage more efficient. 
##    <Example>
##      <![CDATA[
##gap> gamma:=ChangGraph(2);;
##gap> delta:=ChangGraph(FullAutomorphismGroup,2);;
##gap> IsIsomorphicGraph(gamma,delta);
##true
##gap> AutGroupGraph(gamma)=gamma.group;
##false
##gap> AutGroupGraph(gamma)=delta.group;
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareFilter("FullAutomorphismGroup");

#############################################################################
##
#F  IsSetGraph
##  
##  <#GAPDoc Label="IsSetGraph">
##  <ManSection>
##  <Filt Name="IsSetGraph" Type="Category"/>
##  <Description>
##
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
DeclareFilter("IsSetGraph");

#############################################################################
##
#F  IsVectorGraph
##  
##  <#GAPDoc Label="IsVectorGraph">
##  <ManSection>
##  <Filt Name="IsVectorGraph" Type="Category"/>
##  <Description>
##
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
DeclareFilter("IsVectorGraph");

#############################################################################
##
#F  IsFormsGraph
##  
##  <#GAPDoc Label="IsFormsGraph">
##  <ManSection>
##  <Filt Name="IsFormsGraph" Type="Category"/>
##  <Description>
##
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
DeclareFilter("IsFormsGraph");

#############################################################################
##
#F  IsSpacesGraph
##  
##  <#GAPDoc Label="IsSpacesGraph">
##  <ManSection>
##  <Filt Name="IsSpacesGraph" Type="Category"/>
##  <Description>
##
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
DeclareFilter("IsSpacesGraph");

#############################################################################
##
#F  IsCodeGraph
##  
##  <#GAPDoc Label="IsCodeGraph">
##  <ManSection>
##  <Filt Name="IsCodeGraph" Type="Category"/>
##  <Description>
##
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
DeclareFilter("IsCodeGraph");

#############################################################################
##
#F  IsConjugacyClassGraph
##  
##  <#GAPDoc Label="IsConjugacyClassGraph">
##  <ManSection>
##  <Filt Name="IsConjugacyClassGraph" Type="Category"/>
##  <Description>
##
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
DeclareFilter("IsConjugacyClassGraph");
