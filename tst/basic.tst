#############################################################################
##
#W  basic.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that basic graphs. 
##
gap> START_TEST("AGT package: basic.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# CompleteMultipartiteGraph
gap> CompleteMultipartiteGraph(3,4);
rec( adjacencies := [ [ 5, 6, 7, 8, 9, 10, 11, 12 ] ], 
  group := Group([ (1,2,3,4), (1,2), (1,5)(2,6)(3,7)(4,8), (1,5,9)(2,6,10)
      (3,7,11)(4,8,12) ]), isGraph := true, 
  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], 
      [ 2, 3 ], [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ], 
  order := 12, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 1, 1, 3, 3, 3, 3, 4, 4, 4, 4 ] )

# CycleGraph2
gap> CycleGraph2(5);
rec( adjacencies := [ [ 2, 5 ] ], group := Group([ (1,2,3,4,5), (2,5)(3,4) ]),
  isGraph := true, names := [ 1 .. 5 ], order := 5, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 1, 1, 2 ] )

# CocktailPartyGraph
gap> CocktailPartyGraph(4);
rec( adjacencies := [ [ 3, 4, 5, 6, 7, 8 ] ], 
  group := Group([ (1,2), (1,3)(2,4), (1,3,5,7)(2,4,6,8) ]), isGraph := true, 
  names := [ [ 1, 1 ], [ 1, 2 ], [ 2, 1 ], [ 2, 2 ], [ 3, 1 ], [ 3, 2 ], 
      [ 4, 1 ], [ 4, 2 ] ], order := 8, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 2, 2, 3, 3, 3, 3 ] )

# PaleyGraph 
gap> PaleyGraph(9);
rec( adjacencies := [ [ 2, 3, 5, 8 ] ], 
  group := Group([ (1,2,3)(4,5,9)(6,8,7), (1,4,7)(2,5,6)(3,9,8), (2,5,3,8)
      (4,6,7,9), (4,6)(5,8)(7,9) ]), isGraph := true, 
  names := [ 0*Z(3), Z(3)^0, Z(3), Z(3^2), Z(3^2)^2, Z(3^2)^3, Z(3^2)^5, 
      Z(3^2)^6, Z(3^2)^7 ], order := 9, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 1, 2, 2, 3, 2, 3, 2 ] )

# LatinSquareGraph
gap> LatinSquareGraph(CyclicGroup(4));
rec( adjacencies := [ [ 2, 3, 4, 5, 6, 9, 12, 13, 15 ] ], 
  group := <permutation group with 8 generators>, isGraph := true, 
  names := [ [ <identity> of ..., <identity> of ... ], 
      [ <identity> of ..., f2 ], [ <identity> of ..., f1 ], 
      [ <identity> of ..., f1*f2 ], [ f2, <identity> of ... ], [ f2, f2 ], 
      [ f2, f1 ], [ f2, f1*f2 ], [ f1, <identity> of ... ], [ f1, f2 ], 
      [ f1, f1 ], [ f1, f1*f2 ], [ f1*f2, <identity> of ... ], [ f1*f2, f2 ], 
      [ f1*f2, f1 ], [ f1*f2, f1*f2 ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 4, 3, 8, 2, 4, 3, 8, 1, 4, 3, 7, 2, 4, 7, 8 ] )

# CompleteTaylorGraph
gap> CompleteTaylorGraph(3);
rec( adjacencies := [ [ 5, 6 ] ], 
  group := Group([ (1,2)(4,5), (1,2,3)(4,5,6), (1,4)(2,5)(3,6) ]), 
  isGraph := true, isSimple := true, 
  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ] ], 
  order := 6, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 2, 3, 3, 3 ] )

# HaarGraph2
gap> HaarGraph2(11);
rec( adjacencies := [ [ 5, 6, 8 ] ], 
  group := Group([ (1,2,3,4)(5,6,7,8), (1,5)(2,8)(3,7)(4,6) ]), 
  isGraph := true, 
  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], 
      [ 2, 3 ], [ 2, 4 ] ], order := 8, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 1, 1, 2, 1, 2, 2 ] )

# End test
gap> STOP_TEST("AGT package: basic.tst",0);  