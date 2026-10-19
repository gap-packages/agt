#############################################################################
##
#W  spcsgrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct graphs on subspaces. 
##
gap> START_TEST("AGT package: spcsgrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# GrassmannGraph
gap> gamma:=GrassmannGraph(4,4,2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 100 ], [ 1, 35, 64 ], [ 25, 75, 0 ] ]

# DoubledGrassmannGraph
gap> gamma:=DoubledGrassmannGraph(3,1);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 4 ], [ 1, 0, 3 ], [ 1, 0, 3 ], [ 4, 0, 0 ] ]

# TwistedGrassmannGraph
gap> gamma:=TwistedGrassmannGraph(2,2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 42 ], [ 1, 17, 24 ], [ 9, 33, 0 ] ]

# PolarGraphO
gap> gamma:=PolarGraphO(5,3);;
gap> SRGParameters(gamma);
[ 40, 12, 2, 4 ]

# PolarGraphNOorth
gap> gamma:=PolarGraphNOorth(1,5,3);;
gap> SRGParameters(gamma);
[ 45, 12, 3, 3 ]

# PolarGraphSP
gap> gamma:=PolarGraphSp(4,5);;
gap> SRGParameters(gamma);
[ 156, 30, 4, 6 ]

# PolarGraphU
gap> gamma:=PolarGraphU(4,2);;
gap> SRGParameters(gamma);    
[ 45, 12, 3, 3 ]

# DualPolarGraphB
gap> gamma:=DualPolarGraphB(2,4);;
gap> SRGParameters(gamma);
[ 85, 20, 3, 5 ]

# DualPolarGraphC
gap> gamma:=DualPolarGraphC(2,5);;
gap> SRGParameters(gamma);        
[ 156, 30, 4, 6 ]

# DualPolarGraphD
gap> gamma:=DualPolarGraphD(4,2);;
gap> GlobalParameters(gamma);     
[ [ 0, 0, 15 ], [ 1, 0, 14 ], [ 3, 0, 12 ], [ 7, 0, 8 ], [ 15, 0, 0 ] ]

# DualPolarGraph2D
gap> gamma:=DualPolarGraph2D(2,2);;
gap> SRGParameters(gamma);
[ 45, 12, 3, 3 ]

# DualPolarGraph2A
gap> gamma:=DualPolarGraph2A(4,3);;
gap> SRGParameters(gamma);
[ 112, 30, 2, 10 ]

# DoroGraph
gap> gamma:=DoroGraph(4);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 12 ], [ 1, 1, 10 ], [ 3, 6, 3 ], [ 8, 4, 0 ] ]

# UnitaryNonisotropicsGraph
gap> gamma:=UnitaryNonisotropicsGraph(3);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 6 ], [ 1, 1, 4 ], [ 1, 1, 4 ], [ 3, 3, 0 ] ]

# Further coverage
gap> PolarGraphO(IsObject,5,3).order;
40
gap> PolarGraphNOorth(IsObject,1,5,3).order;
45
gap> PolarGraphSp(IsObject,4,5).order;
156
gap> PolarGraphU(IsObject,4,2).order;
45
gap> UnitaryNonisotropicsGraph(IsObject,3).order;
63
gap> gam:=GrassmannGraph(2,4,2);;
gap> Dimension(gam.duality([gam.names[1],gam.names[2]]));
1
gap> Dimension(gam.duality([gam.names[1]]));
2
gap> DualPolarGraphB(IsSpacesGraph and FullAutomorphismGroup,1,3).order;
4
gap> DualPolarGraphC(IsSpacesGraph and FullAutomorphismGroup,1,3).order;
4
gap> DualPolarGraphD(IsSpacesGraph and FullAutomorphismGroup,1,3).order;
2
gap> DualPolarGraph2D(IsSpacesGraph and FullAutomorphismGroup,1,3).order;
10
gap> GrassmannGraph(IsSpacesGraph and FullAutomorphismGroup,2,3,3).order;
1
gap> GrassmannGraph(IsSpacesGraph and FullAutomorphismGroup,2,3,1).order;
7

# Filter variants
gap> GrassmannGraph(IsSpacesGraph and FullAutomorphismGroup,2,4,2).order;
35
gap> GrassmannGraph(FullAutomorphismGroup,2,4,2).order;
35
gap> DoubledGrassmannGraph(IsSpacesGraph and FullAutomorphismGroup,2,2).order;
310
gap> DoubledGrassmannGraph(FullAutomorphismGroup,2,2).order;
310
gap> TwistedGrassmannGraph(IsSpacesGraph,2,2).order;
155
gap> DualPolarGraphB(IsSpacesGraph and FullAutomorphismGroup,2,2).order;
15
gap> DualPolarGraphB(FullAutomorphismGroup,2,2).order;
15
gap> DualPolarGraphC(IsSpacesGraph and FullAutomorphismGroup,2,2).order;
15
gap> DualPolarGraphC(FullAutomorphismGroup,2,2).order;
15
gap> DualPolarGraphD(IsSpacesGraph and FullAutomorphismGroup,2,2).order;
6
gap> DualPolarGraphD(FullAutomorphismGroup,2,2).order;
6
gap> DualPolarGraph2D(IsSpacesGraph and FullAutomorphismGroup,2,2).order;
45
gap> DualPolarGraph2D(FullAutomorphismGroup,2,2).order;
45
gap> DualPolarGraph2A(IsSpacesGraph and FullAutomorphismGroup,4,3).order;
112
gap> DualPolarGraph2A(FullAutomorphismGroup,4,3).order;
112
gap> DoroGraph(IsSpacesGraph and FullAutomorphismGroup,2).order;
10
gap> DoroGraph(FullAutomorphismGroup,2).order;
10

# Usage errors
gap> DoroGraph(1,1,1,1,1,1,1);
Error, usage: DoroGraph( [<filter>, ]<int> )
gap> DoubledGrassmannGraph(1,1,1,1,1,1,1);
Error, usage: DoubledGrassmannGraph( [<filter>, ]<int>, <int> )
gap> DualPolarGraph2A(1,1,1,1,1,1,1);
Error, usage: DualPolarGraph2A( [<filter>, ]<int>, <int> )
gap> DualPolarGraph2D(1,1,1,1,1,1,1);
Error, usage: DualPolarGraph2D( [<filter>, ]<int>, <int> )
gap> DualPolarGraphB(1,1,1,1,1,1,1);
Error, usage: DualPolarGraphB( [<filter>, ]<int>, <int> )
gap> DualPolarGraphC(1,1,1,1,1,1,1);
Error, usage: DualPolarGraphC( [<filter>, ]<int>, <int> )
gap> DualPolarGraphD(1,1,1,1,1,1,1);
Error, usage: DualPolarGraphD( [<filter>, ]<int>, <int> )
gap> GrassmannGraph(1,1,1,1,1,1,1);
Error, usage: GrassmannGraph( [<filter>, ]<int>, <int>, <int> )
gap> PolarGraphNOorth(1,1,1,1,1,1,1);
Error, usage: PolarGraphNOorth( [<filter>, ]<int>, <int>, <int> )
gap> PolarGraphO(1,1,1,1,1,1,1);
Error, usage: PolarGraphO( [<filter>, ][<int>, ]<int>, <int> )
gap> PolarGraphSp(1,1,1,1,1,1,1);
Error, usage: PolarGraphSp( [<filter>, ]<int>, <int> )
gap> PolarGraphU(1,1,1,1,1,1,1);
Error, usage: PolarGraphU( [<filter>, ]<int>, <int> )
gap> TwistedGrassmannGraph(1,1,1,1,1,1,1);
Error, usage: TwistedGrassmannGraph( [<filter>, ]<int>, <int> )
gap> UnitaryNonisotropicsGraph(1,1,1,1,1,1,1);
Error, usage: UnitaryNonisotropicsGraph( [<filter>, ]<int> )

# End test
gap> STOP_TEST("AGT package: spcsgrph.tst",0);  