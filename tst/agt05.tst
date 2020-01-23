# agt, chapter 5
gap> START_TEST("AGT package: agt05.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 31, 36 ]    
gap> ComplementSRGParameters([16,9,4,6]);
[ 16, 6, 2, 2 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 183, 188 ]    
gap> SRGToGlobalParameters([50,7,0,1]);
[ [ 0, 0, 7 ], [ 1, 0, 6 ], [ 1, 6, 0 ] ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 209, 216 ]   
gap> parms:=GlobalParameters(JohnsonGraph(5,3));
[ [ 0, 0, 6 ], [ 1, 3, 2 ], [ 4, 2, 0 ] ]
gap> GlobalToSRGParameters(parms);
[ 10, 6, 3, 4 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 69, 78 ]    
gap> IsFeasibleSRGParameters([8,6,4,6]); 
true
gap> IsPrimitiveSRGParameters([8,6,4,6]);
false
gap> IsPrimitiveSRGParameters([10,6,3,4]);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 109, 118 ]    
gap> IsTypeISRGParameters([5,2,0,1]);                              
true
gap> IsTypeISRGParameters([9,4,1,2]);
true
gap> IsTypeISRGParameters([10,3,0,1]); 
false

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 152, 161 ]    
gap> IsTypeIISRGParameters([5,2,0,1]); 
false
gap> IsTypeIISRGParameters([9,4,1,2]); 
true
gap> IsTypeIISRGParameters([10,3,0,1]);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 248, 258 ]    
gap> KreinParameters([10,6,3,4]);
[ 1, 16 ]
gap> KreinParameters([13,6,2,3]);
[ -14*E(13)-12*E(13)^2-14*E(13)^3-14*E(13)^4-12*E(13)^5-12*E(13)^6-12*E(13)^7
     -12*E(13)^8-14*E(13)^9-14*E(13)^10-12*E(13)^11-14*E(13)^12, 
  -12*E(13)-14*E(13)^2-12*E(13)^3-12*E(13)^4-14*E(13)^5-14*E(13)^6-14*E(13)^7
     -14*E(13)^8-12*E(13)^9-12*E(13)^10-14*E(13)^11-12*E(13)^12 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 286, 295 ]    
gap> IsKreinConditionsSatisfied([28,9,0,4]);
false
gap> IsKreinConditionsSatisfied([13,6,2,3]);
true
gap> IsKreinConditionsSatisfied([10,6,3,4]);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 322, 331 ]
gap> IsAbsoluteBoundSatisfied([13,6,2,3]);
true
gap> IsAbsoluteBoundSatisfied([50,21,4,12]);
false
gap> IsAbsoluteBoundSatisfied([50,21,8,9]); 
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 405, 416 ]    
gap> AGT_Brouwer_Parameters[34];  
[ [ 36, 20, 10, 12 ], 0, 32548, 32548 ]
gap> AGT_Brouwer_Parameters[35];  
[ [ 37, 18, 8, 9 ], 1, 6760, -1 ]
gap> AGT_Brouwer_Parameters[2530];
[ [ 765, 176, 28, 44 ], 2, 0, -1 ]
gap> AGT_Brouwer_Parameters[4530];
[ [ 1293, 646, 322, 323 ], 3, 0, 0 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 442, 449 ]
gap> IsSRGAvailable([28,12,6,4]);
true
gap> IsSRGAvailable([28,9,0,4]); 
false

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 471, 478 ]    
gap> SRGLibraryInfo([37,18,8,9]); 
[ [ 37, 18, 8, 9 ], 1, 6760, -1 ]
gap> SRGLibraryInfo([36,15,6,6]);
[ [ 36, 15, 6, 6 ], 0, 32548, 32548 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 502, 518 ]
gap> SRG([16,6,2,2],1);
rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], 
  group := <permutation group with 6 generators>, isGraph := true, 
  names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
  schreierVector := [ -1, 6, 4, 3, 5, 5, 5, 6, 6, 6, 4, 4, 4, 3, 3, 3 ] )

#gap> SRG([16,6,2,2],2);
#rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], group := Group([ (3,4)(5,6)(8,9)
#  (11,14)(12,13)(15,16), (2,3)(4,5)(6,7)(9,11)(10,12)(14,15), (1,2)(5,8)(6,9)
#  (7,10)(11,12)(13,14) ]), isGraph := true, names := [ 1 .. 16 ], 
#  order := 16, representatives := [ 1 ], 
#  schreierVector := [ -1, 3, 2, 1, 2, 1, 2, 3, 3, 3, 2, 2, 1, 1, 2, 1 ] )
gap> SRG([28,9,0,4],1);      
fail

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 540, 547 ]
gap> NrSRGs([36,15,6,6]);   
32548
gap> NrSRGs([28,9,0,4]); 
0

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 570, 583 ] 
gap> OneSRG([16,9,4,6]); 
rec( adjacencies := [ [ 8, 9, 10, 11, 12, 13, 14, 15, 16 ] ], 
  group := Group([ (2,5)(3,6)(4,7)(9,11)(10,14)(13,15), (6,7)(9,10)(12,13)
  (15,16), (5,6)(8,9)(11,12)(14,15), (1,2)(5,8)(6,9)(7,10) ]), 
  isGraph := true, names := [ 1 .. 16 ], order := 16, 
  representatives := [ 1 ], 
  schreierVector := [ -1, 4, 1, 1, 1, 3, 2, 4, 4, 4, 1, 3, 2, 1, 3, 2 ] )
gap> OneSRG([28,9,0,4]); 
fail

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 604, 617 ]    
gap> AllSRGs([16,6,2,2]);
[ rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], 
      group := <permutation group with 6 generators>, isGraph := true, 
      names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
      schreierVector := [ -1, 6, 4, 3, 5, 5, 5, 6, 6, 6, 4, 4, 4, 3, 3, 3 ] ),
  rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7 ] ], group := Group([ (3,4)(5,6)
      (8,9)(11,14)(12,13)(15,16), (2,3)(4,5)(6,7)(9,11)(10,12)(14,15), (1,2)
      (5,8)(6,9)(7,10)(11,12)(13,14) ]), isGraph := true, 
      names := [ 1 .. 16 ], order := 16, representatives := [ 1 ], 
      schreierVector := [ -1, 3, 2, 1, 2, 1, 2, 3, 3, 3, 2, 2, 1, 1, 2, 1 ] ) 
 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 639, 644 ]
gap> SRGIterator([16,6,2,2]);
<iterator>

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 665, 672 ]
gap> SmallFeasibleSRGParameterTuples(16);
[ [ 5, 2, 0, 1 ], [ 9, 4, 1, 2 ], [ 10, 3, 0, 1 ], [ 10, 6, 3, 4 ], 
  [ 13, 6, 2, 3 ], [ 15, 6, 1, 3 ], [ 15, 8, 4, 4 ], [ 16, 5, 0, 2 ], 
  [ 16, 10, 6, 6 ], [ 16, 6, 2, 2 ], [ 16, 9, 4, 6 ] ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 696, 703 ]
gap> IsEnumeratedSRGParameterTuple([37,18,8,9]);
false
gap> IsEnumeratedSRGParameterTuple([56,10,0,2]);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 726, 735 ]    
gap> IsKnownSRGParameterTuple([64,28,12,12]);
true
gap> IsKnownSRGParameterTuple([64,30,18,10]);
false
gap> IsKnownSRGParameterTuple([65,32,15,16]);
false

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 759, 766 ]    
gap> IsAllSRGsStored([37,18,8,9]);
false
gap> IsAllSRGsStored([36,15,6,6]);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 787, 796 ]  
gap> DisjointUnionOfCliques(3,5,7);            
rec( adjacencies := [ [ 2, 3 ], [ 5, 6, 7, 8 ], [ 10, 11, 12, 13, 14, 15 ] ], 
  autGroup := <permutation group with 12 generators>, 
  group := <permutation group with 12 generators>, isGraph := true, 
  isSimple := true, order := 15, representatives := [ 1, 4, 9 ], 
  schreierVector := [ -1, 12, 11, -2, 10, 9, 8, 7, -3, 6, 5, 4, 3, 2, 1 ] )

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 822, 830 ]   
gap> CompleteMultipartiteGraph(4,2,1);
rec( adjacencies := [ [ 5, 6, 7 ], [ 1, 2, 3, 4, 7 ], [ 1, 2, 3, 4, 5, 6 ] ], 
  autGroup := Group([ (5,6), (3,4), (2,3), (1,2) ]), group := Group([ (5,6),
    (3,4), (2,3), (1,2) ]), isGraph := true, isSimple := true, order := 7, 
  representatives := [ 1, 5, 7 ], 
  schreierVector := [ -1, 4, 3, 2, -2, 1, -3 ] )

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 862, 875 ]    
gap> TriangularGraph(7); 
rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ] ], 
  group := Group([ (1,7,12,16,19,21,6)(2,8,13,17,20,5,11)(3,9,14,18,4,10,15),
    (2,7)(3,8)(4,9)(5,10)(6,11) ]), isGraph := true, isSimple := true, 
  names := [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ], 
      [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 2, 7 ], [ 3, 4 ], [ 3, 5 ], 
      [ 3, 6 ], [ 3, 7 ], [ 4, 5 ], [ 4, 6 ], [ 4, 7 ], [ 5, 6 ], [ 5, 7 ], 
      [ 6, 7 ] ], order := 21, representatives := [ 1 ], 
  schreierVector := [ -1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 
      1, 1, 1 ] )

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 906, 920 ]   
gap> SquareLatticeGraph(6);
rec( adjacencies := [ [ 2, 3, 4, 5, 6, 7, 13, 19, 25, 31 ] ], 
  group := <permutation group with 5 generators>, isGraph := true, 
  names := [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], 
      [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 3, 1 ], 
      [ 3, 2 ], [ 3, 3 ], [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], [ 4, 1 ], [ 4, 2 ], 
      [ 4, 3 ], [ 4, 4 ], [ 4, 5 ], [ 4, 6 ], [ 5, 1 ], [ 5, 2 ], [ 5, 3 ], 
      [ 5, 4 ], [ 5, 5 ], [ 5, 6 ], [ 6, 1 ], [ 6, 2 ], [ 6, 3 ], [ 6, 4 ], 
      [ 6, 5 ], [ 6, 6 ] ], order := 36, representatives := [ 1 ], 
  schreierVector := [ -1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 
      1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 3 ] )

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 942, 946 ]   
gap> gamma:=HoffmanSingletonGraph();;

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 968, 972 ]    
gap> gamma:=HigmanSimsGraph();;

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/srglib.gd", 994, 998 ]    
gap> gamma:=SimsGerwitzGraph();;

#
gap> STOP_TEST("AGT package: agt05.tst",0);
