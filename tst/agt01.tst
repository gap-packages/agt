# agt, chapter 1
gap> START_TEST("AGT package: agt01.tst");

# Loading package
gap> LoadPackage("agt",false);
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/intro.xml", 44, 47 ]
gap> LoadPackage("agt");
true

# [ "/usr/share/gap-4.10.2/pkg/agt/doc/intro.xml", 80, 105 ]
gap> LoadPackage("agt");
true
gap> IsFeasibleSRGParameters([16,6,2,2]); 
true
gap> NrSRGs([16,6,2,2]);
2
gap> IsEnumeratedSRGParameterTuple([16,6,2,2]);
true
gap> graphs:=AllSRGs([16,6,2,2]);;
gap> LeastEigenvalueFromSRGParameters([16,6,2,2]);
-2
gap> LeastEigenvalueInterval(graphs[1],1/10);
[ -2, -2 ]
gap> HoffmanCliqueBound([16,6,2,2]);  
4
gap> CliqueAdjacencyBound([16,6,2]);
4
gap> S:=[1,2,3,4];
[ 1, 2, 3, 4 ]
gap> Nexus(graphs[1],S);
1
gap> RegularSetParameters(graphs[1],S);
[ 3, 1 ]

#
gap> STOP_TEST("AGT package: agt01.tst",0);
