#############################################################################
##
#W  gencon.tst          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Test file for functions that construct general graphs. 
##
gap> START_TEST("AGT package: gencon.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# AdjFunGraph
gap> AdjFunGraph([24..33],function(x,y) return Gcd(x,y)=1; end);
rec( 
  adjacencies := [ [ 2, 6, 8 ], [ 1, 3, 4, 5, 6, 8, 9, 10 ], 
      [ 2, 4, 6, 8, 10 ], [ 2, 3, 5, 6, 8, 9 ], [ 2, 4, 6, 8, 10 ], 
      [ 1, 2, 3, 4, 5, 7, 8, 9, 10 ], [ 6, 8 ], 
      [ 1, 2, 3, 4, 5, 6, 7, 9, 10 ], [ 2, 4, 6, 8, 10 ], 
      [ 2, 3, 5, 6, 8, 9 ] ], group := Group(()), isGraph := true, 
  names := [ 24 .. 33 ], order := 10, 
  representatives := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ], 
  schreierVector := [ -1, -2, -3, -4, -5, -6, -7, -8, -9, -10 ] )

# ProductGraph
gap> g:=CompleteGraph(SymmetricGroup(3));;
gap> h:=HammingGraph(2,2);;
gap> ProductGraph([g,h],function(x,y) return (x<>y) and 
>                                            (x[1]=y[1] or x[2]=y[2]); 
>                       end);
rec( adjacencies := [ [ 2, 3, 4, 5, 9 ] ], 
  group := Group([ (1,5,9)(2,6,10)(3,7,11)(4,8,12), (1,5)(2,6)(3,7)(4,8), 
      (1,3)(2,4)(5,7)(6,8)(9,11)(10,12), (1,2)(3,4)(5,6)(7,8)(9,10)(11,12), 
      (2,3)(6,7)(10,11) ]), isGraph := true, 
  names := [ [ 1, [ 1, 1 ] ], [ 1, [ 1, 2 ] ], [ 1, [ 2, 1 ] ], 
      [ 1, [ 2, 2 ] ], [ 2, [ 1, 1 ] ], [ 2, [ 1, 2 ] ], [ 2, [ 2, 1 ] ], 
      [ 2, [ 2, 2 ] ], [ 3, [ 1, 1 ] ], [ 3, [ 1, 2 ] ], [ 3, [ 2, 1 ] ], 
      [ 3, [ 2, 2 ] ] ], order := 12, representatives := [ 1 ], 
  schreierVector := [ -1, 4, 3, 4, 1, 4, 3, 4, 1, 4, 3, 4 ] )

# PowerGraph
gap> h:=HammingGraph(2,2);;
gap> PowerGraph(h,2,function(x,y) return (x<>y) and (x[1]=y[1] or x[2]=y[2]); 
>                   end);
rec( adjacencies := [ [ 2, 3, 4, 5, 9, 13 ] ], 
  group := <permutation group with 7 generators>, isGraph := true, 
  names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
      [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], [ [ 1, 2 ], [ 1, 1 ] ], 
      [ [ 1, 2 ], [ 1, 2 ] ], [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
      [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], [ [ 2, 1 ], [ 2, 1 ] ], 
      [ [ 2, 1 ], [ 2, 2 ] ], [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
      [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] )

# BoxProductGraph
gap> h:=HammingGraph(2,2);;
gap> BoxProductGraph(h,h);
rec( adjacencies := [ [ 2, 3, 5, 9 ] ], group := <permutation group with 
    6 generators>, isGraph := true, 
  names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
      [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], [ [ 1, 2 ], [ 1, 1 ] ], 
      [ [ 1, 2 ], [ 1, 2 ] ], [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
      [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], [ [ 2, 1 ], [ 2, 1 ] ], 
      [ [ 2, 1 ], [ 2, 2 ] ], [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
      [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] )

# BoxPowerGraph
gap> h:=HammingGraph(2,2);;
gap> BoxPowerGraph(h,2);
rec( adjacencies := [ [ 2, 3, 5, 9 ] ], group := <permutation group with 
    7 generators>, isGraph := true, 
  names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
      [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], [ [ 1, 2 ], [ 1, 1 ] ], 
      [ [ 1, 2 ], [ 1, 2 ] ], [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
      [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], [ [ 2, 1 ], [ 2, 1 ] ], 
      [ [ 2, 1 ], [ 2, 2 ] ], [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
      [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] )

# CrossProductGraph
gap> h:=HammingGraph(2,2);;
gap> CrossProductGraph(h,h);
rec( adjacencies := [ [ 6, 7, 10, 11 ] ], group := <permutation group with 
    6 generators>, isGraph := true, 
  names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
      [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], [ [ 1, 2 ], [ 1, 1 ] ], 
      [ [ 1, 2 ], [ 1, 2 ] ], [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
      [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], [ [ 2, 1 ], [ 2, 1 ] ], 
      [ [ 2, 1 ], [ 2, 2 ] ], [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
      [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] )

# CrossPowerGraph
gap> h:=HammingGraph(2,2);;
gap> CrossPowerGraph(h,2);
rec( adjacencies := [ [ 6, 7, 10, 11 ] ], group := <permutation group with 
    7 generators>, isGraph := true, 
  names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
      [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], [ [ 1, 2 ], [ 1, 1 ] ], 
      [ [ 1, 2 ], [ 1, 2 ] ], [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
      [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], [ [ 2, 1 ], [ 2, 1 ] ], 
      [ [ 2, 1 ], [ 2, 2 ] ], [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
      [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] )

# StrongProductGraph
gap> h:=HammingGraph(2,2);;
gap> StrongProductGraph(h,h);
rec( adjacencies := [ [ 2, 3, 5, 6, 7, 9, 10, 11 ] ], 
  group := <permutation group with 6 generators>, isGraph := true, 
  names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
      [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], [ [ 1, 2 ], [ 1, 1 ] ], 
      [ [ 1, 2 ], [ 1, 2 ] ], [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
      [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], [ [ 2, 1 ], [ 2, 1 ] ], 
      [ [ 2, 1 ], [ 2, 2 ] ], [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
      [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] )

# StrongPowerGraph
gap> h:=HammingGraph(2,2);;
gap> StrongPowerGraph(h,2);
rec( adjacencies := [ [ 2, 3, 5, 6, 7, 9, 10, 11 ] ], 
  group := <permutation group with 7 generators>, isGraph := true, 
  names := [ [ [ 1, 1 ], [ 1, 1 ] ], [ [ 1, 1 ], [ 1, 2 ] ], 
      [ [ 1, 1 ], [ 2, 1 ] ], [ [ 1, 1 ], [ 2, 2 ] ], [ [ 1, 2 ], [ 1, 1 ] ], 
      [ [ 1, 2 ], [ 1, 2 ] ], [ [ 1, 2 ], [ 2, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], 
      [ [ 2, 1 ], [ 1, 1 ] ], [ [ 2, 1 ], [ 1, 2 ] ], [ [ 2, 1 ], [ 2, 1 ] ], 
      [ [ 2, 1 ], [ 2, 2 ] ], [ [ 2, 2 ], [ 1, 1 ] ], [ [ 2, 2 ], [ 1, 2 ] ], 
      [ [ 2, 2 ], [ 2, 1 ] ], [ [ 2, 2 ], [ 2, 2 ] ] ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 5, 4, 5, 2, 5, 4, 5, 1, 5, 4, 5, 2, 5, 4, 5 ] )

# GraphJoin
gap> h:=HammingGraph(2,2);;
gap> GraphJoin(h,h);
rec( adjacencies := [ [ 2, 3, 5, 6, 7, 8 ], [ 1, 2, 3, 4, 6, 7 ] ], 
  group := Group([ (1,3)(2,4), (1,2)(3,4), (2,3), (5,7)(6,8), (5,6)(7,8), 
      (6,7) ]), isGraph := true, 
  names := [ [ 1, [ 1, 1 ] ], [ 1, [ 1, 2 ] ], [ 1, [ 2, 1 ] ], 
      [ 1, [ 2, 2 ] ], [ 2, [ 1, 1 ] ], [ 2, [ 1, 2 ] ], [ 2, [ 2, 1 ] ], 
      [ 2, [ 2, 2 ] ] ], order := 8, representatives := [ 1, 5 ], 
  schreierVector := [ -1, 2, 1, 2, -2, 5, 4, 5 ] )

# BipartiteDouble
gap> h:=HammingGraph(2,2);;
gap> BipartiteDoubleGraph(h);
rec( adjacencies := [ [ 6, 7 ] ], 
  group := Group([ (1,3)(2,4)(5,7)(6,8), (1,2)(3,4)(5,6)(7,8), (2,3)(6,7), 
      (1,5)(2,6)(3,7)(4,8) ]), halfDuality := function( x ) ... end, 
  halfPrimality := function( x ) ... end, isGraph := true, 
  names := [ [ [ 1, 1 ], "+" ], [ [ 1, 2 ], "+" ], [ [ 2, 1 ], "+" ], 
      [ [ 2, 2 ], "+" ], [ [ 1, 1 ], "-" ], [ [ 1, 2 ], "-" ], 
      [ [ 2, 1 ], "-" ], [ [ 2, 2 ], "-" ] ], order := 8, 
  representatives := [ 1 ], schreierVector := [ -1, 2, 1, 2, 4, 4, 4, 4 ] )

# ExtendedBipartiteDoubleGraph
gap> h:=HammingGraph(2,2);;
gap> ExtendedBipartiteDoubleGraph(h);
rec( adjacencies := [ [ 5, 6, 7 ] ], 
  group := Group([ (1,2)(3,4)(5,6)(7,8), (1,3)(2,4)(5,7)(6,8), (2,3)(6,7), 
      (1,5)(2,6)(3,7)(4,8) ]), halfDuality := function( x ) ... end, 
  halfPrimality := function( x ) ... end, isGraph := true, 
  names := [ [ [ 1, 1 ], "+" ], [ [ 2, 1 ], "+" ], [ [ 1, 2 ], "+" ], 
      [ [ 2, 2 ], "+" ], [ [ 1, 1 ], "-" ], [ [ 2, 1 ], "-" ], 
      [ [ 1, 2 ], "-" ], [ [ 2, 2 ], "-" ] ], order := 8, 
  representatives := [ 1 ], schreierVector := [ -1, 1, 2, 2, 4, 4, 4, 4 ] )

# HalvedGraph
gap> h:=CycleGraph2(8);;
gap> HalvedGraph(h);
rec( adjacencies := [ [ 2, 4 ] ], group := Group([ (2,4), (1,2)(3,4) ]), 
  isGraph := true, isSimple := true, names := [ 1, 3, 5, 7 ], order := 4, 
  representatives := [ 1 ], schreierVector := [ -1, 2, 2, 1 ] )

# AntipodalQuotientGraph
gap> h:=CycleGraph2(8);;
gap> AntipodalQuotientGraph(h);
rec( adjacencies := [ [ 2, 4 ] ], group := Group([ (1,2,3,4), (2,4) ]), 
  isGraph := true, names := [ [ 1, 5 ], [ 2, 6 ], [ 3, 7 ], [ 4, 8 ] ], 
  order := 4, representatives := [ 1 ], schreierVector := [ -1, 1, 1, 2 ] )

# SubspaceGraph
gap> q:=2;; n:=4;; d:=2;; V:=GF(q)^n;; S:=Elements;; G:=GL(n,q);;
gap> gamma:=SubspaceGraph(G,S,V,d);;
gap> SRGParameters(gamma);
[ 35, 18, 9, 9 ]

# CliqueGraph
gap> K7:=CompleteGraph(SymmetricGroup(7));;
gap> P:=PartialLinearSpaces(K7,2,2)[1];;
gap> gamma:=CliqueGraph(P);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 4 ], [ 1, 1, 2 ], [ 1, 1, 2 ], [ 2, 2, 0 ] ]

# AGT_IncidenceGraph
gap> pg:=GeneralizedQuadrangleQ(4,3);;
gap> gamma:=AGT_IncidenceGraph(pg);;
gap> GlobalParameters(gamma);
[ [ 0, 0, 4 ], [ 1, 0, 3 ], [ 1, 0, 3 ], [ 1, 0, 3 ], [ 4, 0, 0 ] ]

# End test
gap> STOP_TEST("AGT package: gencon.tst",0);  