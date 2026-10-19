#############################################################################
##
#W  nmgrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct named graphs. 
##
gap> START_TEST("AGT package: nmgrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# TetrahedronGraph
gap> TetrahedronGraph();
rec( adjacencies := [ [ 2, 3, 4 ] ], group := Sym( [ 1 .. 4 ] ), 
  isGraph := true, isSimple := true, order := 4, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 1, 1 ] )

# OctahedronGraph
gap> OctahedronGraph();
rec( adjacencies := [ [ 3, 4, 5, 6 ] ], 
  group := Group([ (1,2), (1,3)(2,4), (1,3,5)(2,4,6) ]), isGraph := true, 
  names := [ [ 1, 1 ], [ 1, 2 ], [ 2, 1 ], [ 2, 2 ], [ 3, 1 ], [ 3, 2 ] ], 
  order := 6, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 2, 2, 3, 3 ] )

# PetersenGraph2
gap> PetersenGraph2();
rec( adjacencies := [ [ 3, 5, 8 ] ], 
  group := Group([ (1,2,3,5,7)(4,6,8,9,10), (2,4)(6,9)(7,10) ]), 
  isGraph := true, 
  names := [ [ 1, 2 ], [ 2, 3 ], [ 3, 4 ], [ 1, 3 ], [ 4, 5 ], [ 2, 4 ], 
      [ 1, 5 ], [ 3, 5 ], [ 1, 4 ], [ 2, 5 ] ], order := 10, 
  representatives := [ 1 ], schreierVector := [ -1, 1, 1, 2, 1, 1, 1, 1, 2, 2 
     ] )

# ShrikhandeGraph
gap> gamma:=ShrikhandeGraph();;
gap> SRGParameters(gamma);
[ 16, 6, 2, 2 ]

# ClebschGraph
gap> gamma:=ClebschGraph();;
gap> SRGParameters(gamma);
[ 16, 10, 6, 6 ]

# SchlaefliGraph
gap> gamma:=SchlaefliGraph();;
gap> SRGParameters(gamma);
[ 27, 16, 10, 8 ]

# HoffmanSingletonGraph
gap> gamma:=HoffmanSingletonGraph();;                                 
gap> SRGParameters(gamma);
[ 50, 7, 0, 1 ]

# GewirtzGraph
gap> gamma:=GewirtzGraph();;
gap> SRGParameters(gamma);
[ 56, 10, 0, 2 ]

# WittStronglyRegularGraph
gap> gamma:=WittStronglyRegularGraph();;
gap> SRGParameters(gamma);
[ 77, 16, 0, 4 ]

# HigmanSimsGraph
gap> gamma:= HigmanSimsGraph();;
gap> SRGParameters(gamma);
[ 100, 22, 0, 6 ]

# KlinGraph
gap> gamma:=KlinGraph();;
gap> SRGParameters(gamma);
[ 210, 99, 48, 45 ]

# McLaughlinGraph
gap> gamma:=McLaughlinGraph();;
gap> SRGParameters(gamma);
[ 275, 112, 30, 56 ]

# CubeGraph
gap> gamma:= CubeGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 2, 0, 1 ], [ 3, 0, 0 ] ]

# HeawoodGraph
#TODO

# IcosahedronGraph
gap> gamma:=IcosahedronGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 5 ], [ 1, 2, 2 ], [ 2, 2, 1 ], [ 5, 0, 0 ] ]

# SylvesterGraph
gap> gamma:=SylvesterGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 5 ], [ 1, 0, 4 ], [ 1, 2, 2 ], [ 4, 1, 0 ] ]

# PerkelGraph
gap> gamma:=PerkelGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 6 ], [ 1, 0, 5 ], [ 1, 3, 2 ], [ 3, 3, 0 ] ]

# GossetGraph
gap> gamma:=GossetGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 27 ], [ 1, 16, 10 ], [ 10, 16, 1 ], [ 27, 0, 0 ] ]

# Witt23Graph
gap> gamma:=Witt23Graph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 15 ], [ 1, 0, 14 ], [ 1, 2, 12 ], [ 9, 6, 0 ] ]

# Witt24Graph
gap> gamma:=Witt24Graph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 30 ], [ 1, 1, 28 ], [ 3, 3, 24 ], [ 15, 15, 0 ] ]

# HigmanGraph
gap> gamma:=HigmanGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 50 ], [ 1, 0, 49 ], [ 14, 0, 36 ], [ 50, 0, 0 ] ]

# CoxeterGraph
gap> gamma:=CoxeterGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 1, 1, 1 ], [ 2, 1, 0 ] ]

# Witt22Graph
gap> gamma:=Witt22Graph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 1, 2, 4 ], [ 1, 2, 4 ], [ 6, 1, 0 ] ]

# UnitalGraph
gap>  gamma:=UnitalGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 9 ], [ 1, 0, 8 ], [ 1, 2, 6 ], [ 3, 3, 3 ], [ 8, 1, 0 ] ]

# DodecahedronGraph
gap> gamma:=DodecahedronGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 1, 1 ], [ 1, 1, 1 ], [ 2, 0, 1 ], 
  [ 3, 0, 0 ] ]

# DesarguesGraph
gap> gamma:=DesarguesGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 2, 0, 1 ], [ 2, 0, 1 ], 
  [ 3, 0, 0 ] ]

# BiggsSmithGraph
gap> gamma:=BiggsSmithGraph();;
gap> GlobalParameters(gamma);
[ [ 0, 0, 3 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 1, 0, 2 ], [ 1, 1, 1 ], 
  [ 1, 1, 1 ], [ 1, 1, 1 ], [ 3, 0, 0 ] ]

# End test
gap> STOP_TEST("AGT package: nmgrph.tst",0);  