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
gap> gamma:=GeneralizedQuadrangleT(ClassicalConicProjectivePlane(3));;
gap> SRGParameters(gamma);
[ 40, 12, 2, 4 ]

# GeneralizedQuadrangleTstar
gap> gamma:=GeneralizedQuadrangleTstar(HyperconicProjectivePlane(2));;
gap> SRGParameters(gamma);
[ 64, 18, 2, 6 ]

# GeneralizedQuadrangleP
gap> gamma:=GeneralizedQuadrangleQ(4,4);;    
gap> delta:=GeneralizedQuadrangleP(gamma,3);;
gap> SRGParameters(delta);                   
[ 64, 18, 2, 6 ]

# GeneralizedQuadrangleAS
gap> gamma:=GeneralizedQuadrangleAS(5);;
gap> SRGParameters(gamma);              
[ 125, 28, 3, 7 ]

# Further coverage
gap> GeneralizedQuadrangleT(EllipticQuadricProjectiveSpace(2)).order;
27
gap> HughesPlaneIncidenceGraph(3).order;
182

# Graphs from files
gap> inc:=Filename(DirectoryTemporary(),"inc");;
gap> aut:=Filename(DirectoryTemporary(),"aut");;
gap> FileString(inc,"0 1 3\n1 2 4\n2 3 5\n3 4 6\n4 5 0\n5 6 1\n6 0 2\n");;
gap> FileString(aut,"1 2 3 4 5 6 0 8 9 10 11 12 13 7\n");;
gap> IncidenceGraphFromFile(inc).order;
14
gap> Size(IncidenceGraphFromFile(inc,aut).group);
7
gap> CollinearityGraphFromFile(inc).order;
7
gap> Size(CollinearityGraphFromFile(inc,aut).group);
7
gap> IncidenceGraphFromFile();
Error, at least one argument expected
gap> CollinearityGraphFromFile();
Error, at least one argument expected

# End test
gap> STOP_TEST("AGT package: geogrph.tst",0);  