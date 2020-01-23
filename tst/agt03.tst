# agt, chapter 3
gap> START_TEST("AGT package: agt03.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 345, 357 ]  
gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
gap> LeastEigenvalueInterval(gamma,1/10);            
[ -13/8, -25/16 ]
gap> parms:=SRGParameters(gamma);
[ 5, 2, 0, 1 ]
gap> LeastEigenvalueInterval(parms,1/10);         
[ -13/8, -25/16 ]
gap> LeastEigenvalueInterval(JohnsonGraph(7,3),1/20);
[ -3, -3 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 392, 404 ]    
gap> gamma:=EdgeOrbitsGraph(Group((1,2,3,4,5)),[[1,2],[2,1]]);;
gap> SecondEigenvalueInterval(gamma,1/10);           
[ 9/16, 5/8 ]
gap> parms:=SRGParameters(gamma);
[ 5, 2, 0, 1 ]
gap> SecondEigenvalueInterval(parms,1/10);           
[ 9/16, 5/8 ]
gap> SecondEigenvalueInterval(JohnsonGraph(7,3),1/20);
[ 5, 5 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 428, 435 ]    
gap> LeastEigenvalueFromSRGParameters([5,2,0,1]); 
E(5)^2+E(5)^3
gap> LeastEigenvalueFromSRGParameters([10,3,0,1]);
-2

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 458, 465 ]    
gap> SecondEigenvalueFromSRGParameters([5,2,0,1]);
E(5)+E(5)^4
gap> SecondEigenvalueFromSRGParameters([10,3,0,1]);
1

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 486, 493 ]    
gap> LeastEigenvalueMultiplicity([16,9,4,6]); 
6
gap> LeastEigenvalueMultiplicity([25,12,5,6]);
12

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 514, 521 ]    
gap> SecondEigenvalueMultiplicity([16,9,4,6]); 
9
gap> SecondEigenvalueMultiplicity([25,12,5,6]);
12

#
gap> STOP_TEST("AGT package: agt03.tst",0);
