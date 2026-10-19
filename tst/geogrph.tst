#############################################################################
##
#W  geogrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct graphs on geometrical structures. 
##
gap> START_TEST("AGT package: geogrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# DesarguesianPlaneIncidenceGraph
gap> gamma:=DesarguesianPlaneIncidenceGraph(4);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 5 ], [ 1, 0, 4 ], [ 1, 0, 4 ], [ 5, 0, 0 ] ]

# HallPlaneIncidenceGraph
gap> gamma:=HallPlaneIncidenceGraph(2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 5 ], [ 1, 0, 4 ], [ 1, 0, 4 ], [ 5, 0, 0 ] ]

# HughesPlaneIncidenceGraph
gap> gamma:=HughesPlaneIncidenceGraph(5);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 26 ], [ 1, 0, 25 ], [ 1, 0, 25 ], [ 26, 0, 0 ] ]

# GeneralizedQuadrangleQ
gap> gamma:=GeneralizedQuadrangleQ(3,5);;                             
gap> SRGParameters(gamma);
[ 36, 10, 4, 2 ]

# GeneralizedQuadrangleH
gap>  gamma:=GeneralizedQuadrangleH(3,2);;
gap> SRGParameters(gamma);               
[ 45, 12, 3, 3 ]

# GeneralizedQuadrangleW
gap> gamma:=GeneralizedQuadrangleW(4);;                               
gap> SRGParameters(gamma);
[ 85, 20, 3, 5 ]

# GeneralizedQuadrangleT
# TODO 

# GeneralizedQuadrangleTstar
# TODO 

# GeneralizedQuadrangleP
gap> gamma:=GeneralizedQuadrangleQ(4,4);;    
gap> delta:=GeneralizedQuadrangleP(gamma,3);;
gap> SRGParameters(delta);                   
[ 64, 18, 2, 6 ]

# GeneralizedQuadrangleAS
gap> gamma:=GeneralizedQuadrangleAS(5);;
gap> SRGParameters(gamma);              
[ 125, 28, 3, 7 ]

# End test
gap> STOP_TEST("AGT package: geogrph.tst",0);  