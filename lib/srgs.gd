#############################################################################
##
#W  srgs.gd           Strongly regular graph library               Rhys Evans
##
##
#Y  Copyright (C) ????????????????????????????????????TODO
##
##  Explanation of file????????????????????????????????????TODO
##

#############################################################################
##
#F  EdgeRegularGraphParameters( <gamma> )
##  
##  <#GAPDoc Label="EdgeRegularGraphParameters">
##  <ManSection>
##  <Func Name="EdgeRegularGraphParameters"
##   Arg='gamma'/>
##
##  <Description>
##  If the graph <A>gamma</A> is edge-regular, this function returns the 
##  edge-regular graph parameters of <A>gamma</A>. Otherwise, it returns
##  false.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "EdgeRegularGraphParameters" );

#############################################################################
##
#F  IsEdgeRegularGraph( <gamma> )
##  
##  <#GAPDoc Label="IsEdgeRegularGraph">
##  <ManSection>
##  <Func Name="IsEdgeRegularGraph"
##   Arg='gamma'/>
##
##  <Description>
##  This function returns true if the graph <A>gamma</A> is an edge-regular
##  graph, and false otherwise.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsEdgeRegularGraph" );

#############################################################################
##
#F  StronglyRegularGraphParameters( <gamma> )
##  
##  <#GAPDoc Label="StronglyRegularGraphParameters">
##  <ManSection>
##  <Func Name="StronglyRegularGraphParameters"
##   Arg='gamma'/>
##
##  <Description>
##  If the graph <A>gamma</A> is strongly regular, this function returns  
##  the strongly regular graph parameters of <A>gamma</A>. Otherwise, it 
##  returns false.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraphParameters" );

#############################################################################
##
#F  IsStronglyRegularGraph( <gamma> )
##  
##  <#GAPDoc Label="IsStronglyRegularGraph">
##  <ManSection>
##  <Func Name="IsStronglyRegularGraph"
##   Arg='gamma'/>
##
##  <Description>
##  This function returns true if the graph <A>gamma</A> is a strongly
##  regular graph, and false otherwise.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsStronglyRegularGraph" );

#############################################################################
##
#F  FeasibleSRGParameterTuples( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="FeasibleSRGParameterTuples">
##  <ManSection>
##  <Func Name="FeasibleSRGParameterTuples"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>TODO
##  This function will give all feasible parameter tuples with certain fixed
##  values, according to the feasiblity conditions used in IsFeasible function. TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "FeasibleSRGParameterTuples" );

#############################################################################
##
#F  IsFeasibleSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="IsFeasibleSRGParameterTuple">
##  <ManSection>
##  <Func Name="IsFeasibleSRGParameterTuple"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  This function returns true if <M>( v, k, \lambda, \mu )</M> is a feasible
##  parameter tuple for a strongly regular graph, according to the following 
##  well known necessary conditions;
##  <List>
##  <Item><M>v,k,\lambda,\mu</M> are integers.</Item> 
##  <Item><M>v>k>\lambda\geq 0,k\geq\mu</M></Item>
##  <Item><M>2</M> divides <M>vk</M> and <M>k\lambda</M>, and <M>6</M> 
##        divides <M>vk\lambda</M>.</Item>
##  <Item><M>(v-k-1)\mu = k(k-\lambda -1).</M></Item>
##  <Item><M>v-2k+\lambda \geq 0</M> and <M>v-2-2k+\mu \geq 0</M>.</Item>
##  <Item>The formulae for the multiplicities of the eigenvalues of a strongly
##        regular graph with these parameters must be integer.</Item>
##  </List> 
##  Otherwise, it returns false. TODO reference etc.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleSRGParameterTuple" );

#############################################################################
##
#F  KreinParameters( TODO )
##  
##  <#GAPDoc Label="KreinParameters">
##  <ManSection>
##  <Func Name="KreinParameters"
##   Arg='TODO'/>
##
##  <Description>
##  TODO This function will return the Krein parameters. 
##  Input graph/parameters? DRG? SRG? how to calculate.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "KreinParameters" );

#############################################################################
##
#F  KreinConditionsCheck( TODO )
##  
##  <#GAPDoc Label="KreinConditionsCheck">
##  <ManSection>
##  <Func Name="KreinConditionsCheck"
##   Arg='TODO'/>
##
##  <Description>
##  TODO This function will check the Krein conditions. 
##  Input graph/parameters? DRG? SRG? how to calculate.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "KreinConditionsCheck" );

#############################################################################
##
#F  AbsoluteBoundCheck( TODO )
##  
##  <#GAPDoc Label="AbsoluteBoundCheck">
##  <ManSection>
##  <Func Name="AbsoluteBoundCheck"
##   Arg='TODO'/>
##
##  <Description>
##  TODO This function will check the Absolute Bound. 
##  Input graph/parameters? DRG? SRG? how to calculate.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AbsoluteBoundCheck" );

#############################################################################
##
#F  SRGToGlobalParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="SRGToGlobalParameters">
##  <ManSection>
##  <Func Name="SRGToGlobalParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO If <M>( v, k, \lambda, \mu )</M> is the strongly regular parameters 
##  of a graph, this function
##  returns the global parameters of the graph (see [REF] TODO).
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SRGToGlobalParameters" );

#############################################################################
##
#F  GlobalToSRGParameters( <parms> )
##  
##  <#GAPDoc Label="GlobalToSRGParameters">
##  <ManSection>
##  <Func Name="GlobalToSRGParameters"
##   Arg='parms'/>
##
##  <Description>
##  TODO If parms is the global parameters of a strongly regular graph (see 
##  [REF] TODO), this function returns the strongly regular graph parameters
##  of the graph.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GlobalToSRGParameters" );

#############################################################################
##
#F  SmallestEigenvalueInterval( <gamma> )
##  
##  <#GAPDoc Label="SmallestEigenvalueInterval">
##  <ManSection>
##  <Func Name="SmallestEigenvalueInterval"
##   Arg='gamma'/>
##
##  <Description>
##  TODO This function will calculate an interval containing the smallest
##  eigenvalue of a graph.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallestEigenvalueInterval" );

#############################################################################
##
#F  LargestEigenvalueInterval( <gamma> )
##  
##  <#GAPDoc Label="LargestEigenvalueInterval">
##  <ManSection>
##  <Func Name="LargestEigenvalueInterval"
##   Arg='gamma'/>
##
##  <Description>
##  TODO This function will calculate an interval containing the second largest
##  eigenvalue of a graph.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "LargestEigenvalueInterval" );

#############################################################################
##
#F  SmallestEigenvalueIntervalFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="SmallestEigenvalueIntervalFromSRGParameters">
##  <ManSection>
##  <Func Name="SmallestEigenvalueIntervalFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will calculate an interval containing the smallest
##  eigenvalue of a graph with SRG parameters given.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallestEigenvalueIntervalFromSRGParameters" );

#############################################################################
##
#F  LargestEigenvalueIntervalFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="LargestEigenvalueIntervalFromSRGParameters">
##  <ManSection>
##  <Func Name="LargestEigenvalueIntervalFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will calculate an interval containing the second
##  largest eigenvalue of a graph with SRG parameters given.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "LargestEigenvalueIntervalFromSRGParameters" );

#############################################################################
##
#F  SmallestEigenvalueFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="SmallestEigenvalueFromSRGParameters">
##  <ManSection>
##  <Func Name="SmallestEigenvalueFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will possibly calculate the smallest eigenvalue of
##  a graph with SRG parameters given. May return a member of field ext. or
##  normal float approximation TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallestEigenvalueFromSRGParameters" );

#############################################################################
##
#F  LargestEigenvalueFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="LargestEigenvalueFromSRGParameters">
##  <ManSection>
##  <Func Name="LargestEigenvalueFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will possibly calculate the second largest eigenvalue of
##  a graph with SRG parameters given. May return a member of field ext. or
##  normal float approximation TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "LargestEigenvalueFromSRGParameters" );

#############################################################################
##
#F  SmallestEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="SmallestEigenvalueMultiplicityFromSRGParameters">
##  <ManSection>
##  <Func Name="SmallestEigenvalueMultiplicityFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will calculate the multiplicity of the smallest eigenvalue of
##  a graph with SRG parameters given. TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallestEigenvalueMultiplicityFromSRGParameters" );

#############################################################################
##
#F  LargestEigenvalueMultiplicityFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="LargestEigenvalueMultiplicityFromSRGParameters">
##  <ManSection>
##  <Func Name="LargestEigenvalueMultiplicityFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will calculate the multiplicity of the second largest eigenvalue of
##  a graph with SRG parameters given. 
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "LargestEigenvalueMultiplicityFromSRGParameters" );

#############################################################################
##
#F  HoffmanCocliqueBound( <gamma> )
##  
##  <#GAPDoc Label="HoffmanCocliqueBound">
##  <ManSection>
##  <Func Name="HoffmanCocliqueBound"
##   Arg='gamma'/>
##
##  <Description>
##  TODO This function will calculate the Hoffman coclique bound of a graph.
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HoffmanCocliqueBound" );

#############################################################################
##
#F  HoffmanCliqueBound( <gamma> )
##  
##  <#GAPDoc Label="HoffmanCliqueBound">
##  <ManSection>
##  <Func Name="HoffmanCliqueBound"
##   Arg='gamma'/>
##
##  <Description>
##  TODO This function will calculate the Hoffman clique bound of a graph
##  blah de blah TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HoffmanCliqueBound" );

#############################################################################
##
#F  DelsarteCliqueBound( <gamma> )
##  
##  <#GAPDoc Label="DelsarteCliqueBound">
##  <ManSection>
##  <Func Name="DelsarteCliqueBound"
##   Arg='gamma'/>
##
##  <Description>
##  TODO This function will calculate the Delsarte clique bound of a graph
##  TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "DelsarteCliqueBound" );


#############################################################################
##
#F  HoffmanCocliqueBoundFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="HoffmanCocliqueBoundFromSRGParameters">
##  <ManSection>
##  <Func Name="HoffmanCocliqueBoundFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will calculate the Hoffman coclique bound of a graph
##  from SRG parameters TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HoffmanCocliqueBoundFromSRGParameters" );

#############################################################################
##
#F  HoffmanCliqueBoundFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="HoffmanCliqueBoundFromSRGParameters">
##  <ManSection>
##  <Func Name="HoffmanCliqueBoundFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will calculate the Hoffman clique bound of a graph
##  from SRG parameters TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HoffmanCliqueBoundFromSRGParameters" );

#############################################################################
##
#F  DelsarteCliqueBoundFromSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="DelsarteCliqueBoundFromSRGParameters">
##  <ManSection>
##  <Func Name="DelsarteCliqueBoundFromSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will calculate the Delsarte clique bound of a graph
##  from SRG parameters TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "DelsarteCliqueBoundFromSRGParameters" );

#############################################################################
##
#F  CliqueAdjacencyPolynomial( [ <v>, <k>, <lambda> ] )
##  
##  <#GAPDoc Label="CliqueAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="CliqueAdjacencyPolynomial"
##   Arg='[ v, k, lambda ]'/>
##
##  <Description>
##  TODO This function will return the Clique Adjacency Polynomial of a graph
##  from ERG parameters TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CliqueAdjacencyPolynomial" );

#############################################################################
##
#F  CliqueAdjacencyBound( [ <v>, <k>, <lambda> ] )
##  
##  <#GAPDoc Label="CliqueAdjacencyBound">
##  <ManSection>
##  <Func Name="CliqueAdjacencyBound"
##   Arg='[ v, k, lambda ]'/>
##
##  <Description>
##  TODO This function will return the Clique Adjacency Bound of a graph
##  from ERG parameters TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CliqueAdjacencyBound" );

#############################################################################
##
#F  IsFeasibleRegularCliqueERGParameters( [ <v>, <k>, <lambda> ])
##  
##  <#GAPDoc Label="IsFeasibleRegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleRegularCliqueERGParameters"
##   Arg='[ v, k, lambda ]'/>
##
##  <Description>
##  TODO This function will return true if an ERG with these parameters
##  has feasible parameters for a regular clique TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleRegularCliqueERGParameters" );

#############################################################################
##
#F  IsFeasibleQuasiRegularCliqueERGParameters( [ <v>, <k>, <lambda> ] )
##  
##  <#GAPDoc Label="IsFeasibleQuasiRegularCliqueERGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleQuasiRegularCliqueERGParameters"
##   Arg='[ v, k, lambda ]'/>
##
##  <Description>
##  TODO This function will return true if an ERG with these parameters
##  has feasible parameters for a quasi-regular clique TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleQuasiRegularCliqueERGParameters" );

#############################################################################
##
#F  RegularAdjacencyPolynomial( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="RegularAdjacencyPolynomial">
##  <ManSection>
##  <Func Name="RegularAdjacencyPolynomial"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will return the Regular Adjacency Polynomial of a 
##  graph with strongly regular graph parameters TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularAdjacencyPolynomial" );

#############################################################################
##
#F  RegularAdjacencyBounds( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="RegularAdjacencyBounds">
##  <ManSection>
##  <Func Name="RegularAdjacencyBounds"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will return the Regular Adjacency Bounds of a 
##  graph with strongly regular graph parameters TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "RegularAdjacencyBounds" );

#############################################################################
##
#F  IsFeasibleRegularSetSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="IsFeasibleRegularSetSRGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleRegularSetSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will return true if an SRG with these parameters
##  has feasible parameters for a regular set TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleRegularSetSRGParameters" );

#############################################################################
##
#F  IsFeasibleQuasiRegularSetSRGParameters( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="IsFeasibleQuasiRegularSetSRGParameters">
##  <ManSection>
##  <Func Name="IsFeasibleQuasiRegularSetSRGParameters"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>
##  TODO This function will return true if an ERG with these parameters
##  has feasible parameters for a quasi-regular set TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsFeasibleQuasiRegularSetSRGParameters" );

#############################################################################
##
#F  BasicEdgeSwitching( <gamma> , <list1> , <list2> )
##  
##  <#GAPDoc Label="BasicEdgeSwitching">
##  <ManSection>
##  <Func Name="BasicEdgeSwitching"
##   Arg='gamma, list1, list2'/>
##
##  <Description>
##  TODO This function will switch edges relative to the vertex sets 
##  list1 and list2
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "BasicEdgeSwitching" );

#############################################################################
##
#F  GodsilMcKaySwitching( <gamma> , <partition> )
##  
##  <#GAPDoc Label="GodsilMcKaySwitching">
##  <ManSection>
##  <Func Name="GodsilMcKaySwitching"
##   Arg='gamma, partition'/>
##
##  <Description>
##  TODO This function will switch edges relative to the Godsil-McKay  
##  partition.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GodsilMcKaySwitching" );

#############################################################################
##
#F  IsGodsilMcKayPartition( <gamma> , <partition> )
##  
##  <#GAPDoc Label="IsGodsilMcKayPartition">
##  <ManSection>
##  <Func Name="IsGodsilMcKayPartition"
##   Arg='gamma, partition'/>
##
##  <Description>
##  TODO This function will return true if the partition is a Godsil-McKay  
##  partition.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsGodsilMcKayPartition" );

#############################################################################
##
#F  DisjointUnionOfCliques( <n1> , <n2>, ... )
##  
##  <#GAPDoc Label="DisjointUnionOfCliques">
##  <ManSection>
##  <Func Name="DisjointUnionOfCliques"
##   Arg='n1, n2, ... '/>
##
##  <Description>
##  TODO This function will return the disjoint union of cliques with sizes
##  n1, n2, ...TODO Note that the ordering of the sizes greater than 1 are
##  fixed, parts of size 1 are moved to the 'end' 
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "DisjointUnionOfCliques" );

#############################################################################
##
#F  CompleteMultipartiteGraph( <n1> , <n2>, ... )
##  
##  <#GAPDoc Label="CompleteMultipartiteGraph">
##  <ManSection>
##  <Func Name="CompleteMultipartiteGraph"
##   Arg='n1, n2, ... '/>
##
##  <Description>
##  TODO This function will return the complete multipartite graph with parts
##  of size n1, n2, ...TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CompleteMultipartiteGraph" );

#############################################################################
##
#F  TriangularGraph( <n> )
##  
##  <#GAPDoc Label="TriangularGraph">
##  <ManSection>
##  <Func Name="TriangularGraph"
##   Arg='n'/>
##
##  <Description>
##  TODO This function will return the triangular graph on n points.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "TriangularGraph" );

#############################################################################
##
#F  SquareLatticeGraph( <n> )
##  
##  <#GAPDoc Label="SquareLatticeGraph">
##  <ManSection>
##  <Func Name="SquareLatticeGraph"
##   Arg='n'/>
##
##  <Description>
##  TODO This function will return the square lattice graph on n points.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SquareLatticeGraph" );

#############################################################################
##
#F  HoffmanSingletonGraph(  )
##  
##  <#GAPDoc Label="HoffmanSingletonGraph">
##  <ManSection>
##  <Func Name="HoffmanSingletonGraph"
##   Arg=''/>
##
##  <Description>
##  TODO This function will return the Hoffman-Singleton graph. This function
##  constructs the graph through the use of a simple combinatorial 
##  description found in Brouwer [REF]TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HoffmanSingletonGraph" );

#############################################################################
##
#F  HigmanSimsGraph(  )
##  
##  <#GAPDoc Label="HigmanSimsGraph">
##  <ManSection>
##  <Func Name="HigmanSimsGraph"
##   Arg=''/>
##
##  <Description>
##  TODO This function will return the Higman-Sims graph. This function
##  constructs the graph through the use of a combinatorial 
##  description found in Brouwer [REF]TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HigmanSimsGraph" );

#############################################################################
##
#F  SimsGerwitzGraph(  )
##  
##  <#GAPDoc Label="SimsGerwitzGraph">
##  <ManSection>
##  <Func Name="SimsGerwitzGraph"
##   Arg=''/>
##
##  <Description>
##  TODO This function will return the Sims-Gerwitz graph.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SimsGerwitzGraph" );

#############################################################################
##
#F  AffinePolarGraph( <q> , <e> , <epsilon> )
##  
##  <#GAPDoc Label="AffinePolarGraph">
##  <ManSection>
##  <Func Name="AffinePolarGraph"
##   Arg='q, e, epsilon'/>
##
##  <Description>
##  TODO This function will return the Affine polar graph over <M>F_{q}</M>
##  of dimension <M>2e</M> with type <M>\epsilon</M>.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AffinePolarGraph" );

#############################################################################
##
#F  StronglyRegularGraphAvailable( <parms>  )
##  
##  <#GAPDoc Label="StronglyRegularGraphAvailable">
##  <ManSection>
##  <Func Name="StronglyRegularGraphAvailable"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return true if an srg with parameters parms
##  has been stored in the library. TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraphAvailable" );

#############################################################################
##
#F  StronglyRegularGraph( <parms> , <nr> )
##  
##  <#GAPDoc Label="StronglyRegularGraph">
##  <ManSection>
##  <Func Name="StronglyRegularGraph"
##   Arg='parms, nr'/>
##
##  <Description>
##  TODO This function will return the strongly regular graph with parameters
##  <A>parms</A> and index <A>nr</A> in the stored list. TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraph" );

#############################################################################
##
#F  NrStronglyRegularGraphs( <parms> )
##  
##  <#GAPDoc Label="NrStronglyRegularGraphs">
##  <ManSection>
##  <Func Name="NrStronglyRegularGraphs"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return the number of strongly regular graphs
##  with parameters <A>parms</A>. It may accept subsets of fixed parms.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrStronglyRegularGraphs" );

#############################################################################
##
#F  OneStronglyRegularGraph( <parms> )
##  
##  <#GAPDoc Label="OneStronglyRegularGraph">
##  <ManSection>
##  <Func Name="OneStronglyRegularGraph"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return one strongly regular graph 
##  with parameters <A>parms</A>. It may accept subsets of fixed parms.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "OneStronglyRegularGraph" );

#############################################################################
##
#F  AllStronglyRegularGraphs( <parms> )
##  
##  <#GAPDoc Label="AllStronglyRegularGraphs">
##  <ManSection>
##  <Func Name="AllStronglyRegularGraphs"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return a list of all strongly regular graphs 
##  with parameters <A>parms</A>. It may accept subsets of fixed parms.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllStronglyRegularGraphs" );

#############################################################################
##
#F  StronglyRegularGraphsIterator( <parms> )
##  
##  <#GAPDoc Label="StronglyRegularGraphIterator">
##  <ManSection>
##  <Func Name="StronglyRegularGraphIterator"
##   Arg='parms'/>
##
##  <Description>
##  TODO This function will return an iterator of all strongly regular graphs 
##  with parameters <A>parms</A>. It may accept subsets of fixed parms.TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "StronglyRegularGraphIterator" );



#############################################################################
##
#F  SmallFeasibleSRGParameterTuples( [ <v>, <k>, <lambda>, <mu> ], <opt> )
##  
##  <#GAPDoc Label="SmallFeasibleSRGParameterTuples">
##  <ManSection>
##  <Func Name="SmallFeasibleSRGParameterTuples"
##   Arg='[ v, k, lambda, mu ], opt'/>
##
##  <Description>TODO
##  This function will give all feasible parameter tuples with certain fixed
##  values with <A>v</A> in the list of Brouwer. Options will include
##  looking at parameters in which graphs have been enumerated, proven to
##  exist, not disproven to exist and all 'feasible' parameters.  TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallFeasibleSRGParameterTuples" );

#############################################################################
##
#F  IsEnumeratedSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="IsEnumeratedSRGParameterTuple">
##  <ManSection>
##  <Func Name="IsEnumeratedSRGParameterTuple"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>TODO
##  This function will return true if srgs with parameters parms have been 
##  completely enumerated (v is small enough).  TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsEnumeratedSRGParameterTuple" );

#############################################################################
##
#F  IsKnownSRGParameterTuple( [ <v>, <k>, <lambda>, <mu> ] )
##  
##  <#GAPDoc Label="IsKnownSRGParameterTuple">
##  <ManSection>
##  <Func Name="IsKnownSRGParameterTuple"
##   Arg='[ v, k, lambda, mu ]'/>
##
##  <Description>TODO
##  This function will return true if there is an srg with parameters parms  
##  (v is small enough).  TODO
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IsKnownSRGParameterTuple" );

#############################################################################
##
#E
