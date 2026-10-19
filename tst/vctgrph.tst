#############################################################################
##
#W  vctgrph.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct graphs on vectors. 
##
gap> START_TEST("AGT package: vctgrph.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# HammingGraph2
gap> HammingGraph2(4,2);
rec( adjacencies := [ [ 2, 3, 5, 9 ] ], group := <permutation group with 
    6 generators>, isGraph := true, 
  names := [ [ 1, 1, 1, 1 ], [ 1, 1, 1, 2 ], [ 1, 1, 2, 1 ], [ 1, 1, 2, 2 ], 
      [ 1, 2, 1, 1 ], [ 1, 2, 1, 2 ], [ 1, 2, 2, 1 ], [ 1, 2, 2, 2 ], 
      [ 2, 1, 1, 1 ], [ 2, 1, 1, 2 ], [ 2, 1, 2, 1 ], [ 2, 1, 2, 2 ], 
      [ 2, 2, 1, 1 ], [ 2, 2, 1, 2 ], [ 2, 2, 2, 1 ], [ 2, 2, 2, 2 ] ], 
  order := 16, representatives := [ 1 ], 
  schreierVector := [ -1, 4, 3, 4, 2, 4, 3, 4, 1, 4, 3, 4, 2, 4, 3, 4 ] )

# SquareLatticeGraph
gap> SquareLatticeGraph(4);
rec( adjacencies := [ [ 2, 3, 4, 5, 9, 13 ] ], 
  group := Group([ (1,5,9,13)(2,6,10,14)(3,7,11,15)(4,8,12,16), (1,5)(2,6)
      (3,7)(4,8), (1,2,3,4)(5,6,7,8)(9,10,11,12)(13,14,15,16), (1,2)(5,6)
      (9,10)(13,14), (2,5)(3,9)(4,13)(7,10)(8,14)(12,15) ]), isGraph := true, 
  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], 
      [ 2, 3 ], [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ], [ 4, 1 ], 
      [ 4, 2 ], [ 4, 3 ], [ 4, 4 ] ], order := 16, representatives := [ 1 ], 
  schreierVector := [ -1, 3, 3, 3, 1, 3, 3, 3, 1, 3, 3, 3, 1, 3, 3, 3 ] )

# HypercubeGraph2
gap> HypercubeGraph2(3);
rec( adjacencies := [ [ 2, 3, 5 ] ], 
  group := Group([ (1,5)(2,6)(3,7)(4,8), (1,3)(2,4)(5,7)(6,8), (1,2)(3,4)(5,6)
      (7,8), (2,5,3)(4,6,7), (3,5)(4,6) ]), isGraph := true, 
  names := [ [ 1, 1, 1 ], [ 1, 1, 2 ], [ 1, 2, 1 ], [ 1, 2, 2 ], [ 2, 1, 1 ], 
      [ 2, 1, 2 ], [ 2, 2, 1 ], [ 2, 2, 2 ] ], order := 8, 
  representatives := [ 1 ], schreierVector := [ -1, 3, 2, 3, 1, 3, 2, 3 ] )

# DoobGraph
gap> gamma:=DoobGraph(2,1);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 15 ], [ 1, 2, 12 ], [ 2, 4, 9 ], [ 3, 6, 6 ], [ 4, 8, 3 ], 
  [ 5, 10, 0 ] ]

# HalvedCubeGraph
gap> HalvedCubeGraph2(4);
rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], 
  group := Group([ (3,5)(4,6), (2,5,3)(4,6,7), (2,7)(4,5), (2,7)(3,6), 
      (1,2,5,8,7,4)(3,6) ]), isGraph := true, isSimple := true, 
  names := [ [ 1, 1, 1, 1 ], [ 1, 1, 2, 2 ], [ 1, 2, 1, 2 ], [ 1, 2, 2, 1 ], 
      [ 2, 1, 1, 2 ], [ 2, 1, 2, 1 ], [ 2, 2, 1, 1 ], [ 2, 2, 2, 2 ] ], 
  order := 8, representatives := [ 1 ], 
  schreierVector := [ -1, 5, 1, 3, 2, 4, 3, 5 ] )

# FoldedCubeGraph
gap> FoldedCubeGraph(4);
rec( adjacencies := [ [ 2, 3, 5, 8 ] ], 
  group := Group([ (1,2)(3,4)(5,6)(7,8), (1,3)(2,4)(5,7)(6,8), (1,5)(2,6)(3,7)
      (4,8), (2,3)(6,7), (2,3,5)(4,7,6), (2,8)(3,5), (2,5)(3,8), (1,8)(2,7)
      (3,6)(4,5) ]), isGraph := true, 
  names := [ [ [ 1, 1, 1, 1 ], [ 2, 2, 2, 2 ] ], 
      [ [ 1, 2, 2, 2 ], [ 2, 1, 1, 1 ] ], [ [ 1, 2, 1, 1 ], [ 2, 1, 2, 2 ] ], 
      [ [ 1, 1, 2, 2 ], [ 2, 2, 1, 1 ] ], [ [ 1, 1, 2, 1 ], [ 2, 2, 1, 2 ] ], 
      [ [ 1, 2, 1, 2 ], [ 2, 1, 2, 1 ] ], [ [ 1, 2, 2, 1 ], [ 2, 1, 1, 2 ] ], 
      [ [ 1, 1, 1, 2 ], [ 2, 2, 2, 1 ] ] ], order := 8, 
  representatives := [ 1 ], schreierVector := [ -1, 1, 2, 2, 3, 3, 8, 8 ] )

# FoldedHalvedCubeGraph
gap> gamma:=FoldedHalvedCubeGraph(4);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 28 ], [ 1, 12, 15 ], [ 12, 16, 0 ] ]

# BrouwerGraph
gap> gamma:=BrouwerGraph(2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 2, 0, 5 ], [ 3, 4, 0 ] ]

# PasechnikGraph
gap> gamma:=PasechnikGraph(3);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 27 ], [ 1, 0, 26 ], [ 3, 0, 24 ], [ 8, 0, 19 ], [ 27, 0, 0 ] ]

# AdditiveSymplecticCoverGraph
gap> gamma:=AdditiveSymplecticCoverGraph(2,2);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 15 ], [ 1, 6, 8 ], [ 8, 6, 1 ], [ 15, 0, 0 ] ]

# MultiplcativeSymplectiveCoverGraph
gap> gamma:=MultiplicativeSymplecticCoverGraph(9,4);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 9 ], [ 1, 4, 4 ], [ 4, 4, 1 ], [ 9, 0, 0 ] ]

# AffinePolarGraphVO
gap> AffinePolarGraphVO(1,2,4);
rec( adjacencies := [ [ 2, 3, 4, 5, 9, 13 ] ], 
  group := <permutation group with 7 generators>, isGraph := true, 
  names := [ [ 0*Z(2), 0*Z(2) ], [ 0*Z(2), Z(2)^0 ], [ 0*Z(2), Z(2^2) ], 
      [ 0*Z(2), Z(2^2)^2 ], [ Z(2)^0, 0*Z(2) ], [ Z(2)^0, Z(2)^0 ], 
      [ Z(2)^0, Z(2^2) ], [ Z(2)^0, Z(2^2)^2 ], [ Z(2^2), 0*Z(2) ], 
      [ Z(2^2), Z(2)^0 ], [ Z(2^2), Z(2^2) ], [ Z(2^2), Z(2^2)^2 ], 
      [ Z(2^2)^2, 0*Z(2) ], [ Z(2^2)^2, Z(2)^0 ], [ Z(2^2)^2, Z(2^2) ], 
      [ Z(2^2)^2, Z(2^2)^2 ] ], order := 16, representatives := [ 1 ], 
  schreierVector := [ -1, 6, 7, 1, 4, 6, 7, 7, 5, 6, 7, 1, 5, 6, 7, 1 ] )

# AffinePolarGraphVNO
gap> gamma:=AffinePolarGraphVNO(1,4,3);;
gap> SRGParameters(gamma);
[ 81, 24, 9, 6 ]

# End test
gap> STOP_TEST("AGT package: vctgrph.tst",0);  