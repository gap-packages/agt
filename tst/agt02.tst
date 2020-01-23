# agt, chapter 2
gap> START_TEST("AGT package: agt02.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 30, 39 ]
gap> gamma:=EdgeOrbitsGraph(Group((2,3,4,5)),[[1,2],[2,1]]);;
gap> RGParameters(gamma);
fail
gap> gamma:=HammingGraph(3,4);;                              
gap> RGParameters(gamma);
[ 64, 9 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 59, 71 ]
gap> gamma:=NullGraph(Group(()),5);;
gap> IsRG(gamma);
true
gap> gamma:=EdgeOrbitsGraph(Group((2,3,4,5)),[[1,2],[2,1]]);;
gap> IsRG(gamma);
false
gap> gamma:=TriangularGraph(6);;                             
gap> IsRG(gamma);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 103, 110 ]
gap> IsFeasibleRGParameters([15,9]);
false
gap> IsFeasibleRGParameters([16,9]);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 131, 140 ]
gap> gamma:=NullGraph(Group(()),5);;
gap> ERGParameters(gamma);
fail
gap> gamma:=JohnsonGraph(7,3);;
gap> ERGParameters(gamma);
[ 35, 12, 5 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 160, 169 ]    
gap> gamma:=NullGraph(Group(()),5);;
gap> IsERG(gamma);
false
gap> gamma:=JohnsonGraph(7,3);;
gap> IsERG(gamma);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 204, 211 ]    
gap> IsFeasibleERGParameters([15,9,6]);
false
gap> IsFeasibleERGParameters([16,9,4]);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 232, 241 ]    
gap> gamma:=CompleteGraph(Group(()),5);;
gap> SRGParameters(gamma);
fail
gap> gamma:=JohnsonGraph(5,3);;            
gap> SRGParameters(gamma);
[ 10, 6, 3, 4 ]

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 261, 270 ]    
gap> gamma:=CompleteGraph(Group(()),5);;
gap> IsSRG(gamma);
false
gap> gamma:=JohnsonGraph(5,3);;         
gap> IsSRG(gamma);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/../lib/regprop.gd", 306, 313 ]    
gap> IsFeasibleSRGParameters([15,9,4,7]);
false
gap> IsFeasibleSRGParameters([10,3,0,1]);
true

#
gap> STOP_TEST("AGT package: agt02.tst",0);
