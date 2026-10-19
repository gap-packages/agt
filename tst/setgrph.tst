#############################################################################
##
#W  setgrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct graphs on sets. 
##
gap> START_TEST("AGT package: setgrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# KnerserGraph2 
gap> KneserGraph2(6,2);
rec( adjacencies := [ [ 10, 11, 12, 13, 14, 15 ] ], 
  group := Group([ (1,6,10,13,15,5)(2,7,11,14,4,9)(3,8,12), (2,6)(3,7)(4,8)
      (5,9) ]), isGraph := true, 
  names := [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 2, 3 ], 
      [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], [ 4, 5 ], 
      [ 4, 6 ], [ 5, 6 ] ], order := 15, representatives := [ 1 ], 
  schreierVector := [ -1, 2, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1 ] )

# OddGraph2
gap> OddGraph2(2);
rec( adjacencies := [ [ 3, 5, 8 ] ], 
  group := Group([ (1,2,3,5,7)(4,6,8,9,10), (2,4)(6,9)(7,10) ]), 
  isGraph := true, 
  names := [ [ 1, 2 ], [ 2, 3 ], [ 3, 4 ], [ 1, 3 ], [ 4, 5 ], [ 2, 4 ], 
      [ 1, 5 ], [ 3, 5 ], [ 1, 4 ], [ 2, 5 ] ], order := 10, 
  representatives := [ 1 ], schreierVector := [ -1, 1, 1, 2, 1, 1, 1, 1, 2, 2 
     ] )

# DoubledOddGraph
gap> DoubledOddGraph(2);
rec( adjacencies := [ [ 2, 3, 4 ] ], 
  group := Group([ (1,11,17,20,10)(2,12,18,9,4)(3,13,6,15,7)(5,14,19,8,16), 
      (5,11)(6,12)(7,13)(8,14)(9,15)(10,16), (1,18)(2,20)(3,19)(4,17)(5,15)
      (6,16)(7,14)(8,13)(9,11)(10,12) ]), isGraph := true, 
  names := [ [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 4 ], [ 1, 2, 5 ], [ 1, 3 ], 
      [ 1, 3, 4 ], [ 1, 3, 5 ], [ 1, 4 ], [ 1, 4, 5 ], [ 1, 5 ], [ 2, 3 ], 
      [ 2, 3, 4 ], [ 2, 3, 5 ], [ 2, 4 ], [ 2, 4, 5 ], [ 2, 5 ], [ 3, 4 ], 
      [ 3, 4, 5 ], [ 3, 5 ], [ 4, 5 ] ], order := 20, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 3, 3, 3, 2, 3, 3, 2, 3, 1, 1, 3, 3, 1, 3, 2, 1, 3, 
      1, 1 ] )

# TriangularGraph
gap> TriangularGraph(6);
rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7, 8, 9 ] ], 
  group := Group([ (1,6,10,13,15,5)(2,7,11,14,4,9)(3,8,12), (2,6)(3,7)(4,8)
      (5,9) ]), isGraph := true, isSimple := true, 
  names := [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 2, 3 ], 
      [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], [ 4, 5 ], 
      [ 4, 6 ], [ 5, 6 ] ], order := 15, representatives := [ 1 ], 
  schreierVector := [ -1, 2, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1 ] )

# FoldedJohnsonGraph
gap> FoldedJohnsonGraph(3);
rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7, 8, 9, 10 ] ], 
  group := Group([ (1,2,3)(4,5,6,8,9,7), (2,4)(5,7)(8,10) ]), isGraph := true,
  names := [ [ [ 1, 2, 3 ], [ 4, 5, 6 ] ], [ [ 1, 5, 6 ], [ 2, 3, 4 ] ], 
      [ [ 1, 2, 6 ], [ 3, 4, 5 ] ], [ [ 1, 3, 4 ], [ 2, 5, 6 ] ], 
      [ [ 1, 3, 6 ], [ 2, 4, 5 ] ], [ [ 1, 2, 4 ], [ 3, 5, 6 ] ], 
      [ [ 1, 4, 5 ], [ 2, 3, 6 ] ], [ [ 1, 4, 6 ], [ 2, 3, 5 ] ], 
      [ [ 1, 2, 5 ], [ 3, 4, 6 ] ], [ [ 1, 3, 5 ], [ 2, 4, 6 ] ] ], 
  order := 10, representatives := [ 1 ], 
  schreierVector := [ -1, 1, 1, 2, 1, 1, 2, 1, 1, 2 ] )

# ChangGraph
gap> ChangGraph(1);
rec( 
  adjacencies := [ [ 2, 3, 5, 6, 7, 8, 9, 10, 12, 13, 17, 22 ], 
      [ 8, 9, 12, 13, 14, 16, 18, 20, 21, 26, 27, 28 ] ], 
  group := <permutation group of size 384 with 6 generators>, isGraph := true,
  isSimple := true, 
  names := [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ], 
      [ 1, 8 ], [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 2, 7 ], [ 2, 8 ], 
      [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], [ 3, 7 ], [ 3, 8 ], [ 4, 5 ], [ 4, 6 ], 
      [ 4, 7 ], [ 4, 8 ], [ 5, 6 ], [ 5, 7 ], [ 5, 8 ], [ 6, 7 ], [ 6, 8 ], 
      [ 7, 8 ] ], order := 28, representatives := [ 1, 4 ], 
  schreierVector := [ -1, 5, 6, -2, 2, 5, 6, 1, 5, 3, 1, 1, 1, 1, 5, 2, 1, 4, 
      6, 1, 4, 6, 3, 3, 3, 4, 5, 6 ] )

# End test
gap> STOP_TEST("AGT package: setgrph.tst",0);  