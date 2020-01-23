# agt, chapter 4
gap> START_TEST("AGT package: agt04.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 40, 51 ]
gap> HoffmanCocliqueBound(HammingGraph(3,5));
25
gap> HoffmanCocliqueBound(HammingGraph(2,5));               
5
gap> parms:=SRGParameters(HammingGraph(2,5));
[ 25, 8, 3, 2 ]
gap> HoffmanCocliqueBound(parms);
5

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 88, 101 ]    
gap> gamma:=EdgeOrbitsGraph(CyclicGroup(IsPermGroup,15),[[1,2],[2,1]]);;
gap> HoffmanCliqueBound(gamma);
2
gap> gamma:=JohnsonGraph(7,2);;
gap> HoffmanCliqueBound(gamma);
6
gap> parms:=SRGParameters(gamma);
[ 21, 10, 5, 4 ]
gap> HoffmanCliqueBound(parms);
6

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 136, 143 ]    
gap> HaemersRegularUpperBound(SimsGerwitzGraph(),3);
28
gap> HaemersRegularUpperBound([56,10,0,2],0);       
16

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 178, 185 ]    
gap> HaemersRegularLowerBound(HoffmanSingletonGraph(),4);
20
gap> HaemersRegularLowerBound([50,7,0,1],3);             
10

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 213, 222 ]    
gap> x:=Indeterminate(Rationals,"x");
x
gap> y:=Indeterminate(Rationals,"y");
y
gap> CliqueAdjacencyPolynomial([21,8,3],x,y);
-x^2*y-y^3+21*x^2-x*y+8*y^2+21*x-23*y

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 251, 256 ]
gap> CliqueAdjacencyBound([16,6,2]);
4

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 409, 414 ]    
gap> x:=Indeterminate(Rationals,"x");
x
gap> y:=Indeterminate(Rationals,"y");
y
gap> d:=Indeterminate(Rationals,"d");
d
gap> RegularAdjacencyPolynomial([16,6,2,2],x,y,d);
-x^2*y+2*x*y*d-y*d^2+16*x^2-13*x*y+2*y^2+y*d+16*x-2*y

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 444, 449 ]    
gap> RegularAdjacencyUpperBound([56,10,0,2],3);
28

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 479, 484 ]
gap> RegularAdjacencyLowerBound([50,7,0,1],2);
5

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 505, 512 ]    
gap> Nexus(SquareLatticeGraph(5),[1,2,3,4,6]);
fail
gap> Nexus(SquareLatticeGraph(5),[1,2,3,4,5]);
1

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 534, 541 ]    
gap> RegularSetParameters(SquareLatticeGraph(5),[6,11,16,21]);  
fail
gap> RegularSetParameters(SquareLatticeGraph(5),[1,6,11,16,21]);
[ 4, 1 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 573, 580 ]    
gap> IsRegularSet(HoffmanSingletonGraph(),[11..50],false);
true
gap> IsRegularSet(HoffmanSingletonGraph(),[11..50],true); 
false

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 616, 621 ]
gap> RegularSetSRGParameters([16,6,2,2],4);
[ [ 8, 2 ], [ 12, 6 ] ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 277, 284 ]
gap> NGParameters(HigmanSimsGraph());                    
fail
gap> NGParameters(TriangularGraph(10));
[ [ 45, 16, 8, 9, 2 ] ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 304, 311 ]   
gap> IsNG(HammingGraph(3,7));
false
gap> IsNG(HammingGraph(2,7));
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 345, 352 ]    
gap> IsFeasibleNGParameters([35,16,6,5,2]);
true
gap> IsFeasibleNGParameters([37,18,8,5,2]);
false

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regsubs.gd", 374, 383 ]    
gap> RegularCliqueERGParameters([8,7,6]);
[ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 4 ], [ 5, 5 ], [ 6, 6 ], [ 7, 7 ] ]
gap> RegularCliqueERGParameters([8,6,4]);
[ [ 4, 3 ] ]
gap> RegularCliqueERGParameters([16,9,4]);
[ [ 4, 2 ] ]

#
gap> STOP_TEST("AGT package: agt04.tst",0);
