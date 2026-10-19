#############################################################################
##
#W  nmgrph.gi          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Implementation file for functions that construct named graphs.
##  
##

#############################################################################
##
#F  TetrahedronGraph(  )
##  
InstallGlobalFunction( TetrahedronGraph,
function()
  return CompleteGraph(SymmetricGroup(4));
end );

#############################################################################
##
#F  OctahedronGraph(  )
##  
InstallGlobalFunction( OctahedronGraph,
function()
  return CocktailPartyGraph(3);
end );

#############################################################################
##
#F  PetersenGraph2(  )
##  
InstallGlobalFunction( PetersenGraph2,
function()
  return OddGraph2(2);
end );

#############################################################################
##
#F  ShrikhandeGraph(  )
##  
InstallMethod( ShrikhandeGraphCons, "as a vector graph", true, 
     [IsVectorGraph], 0,
filter -> ComplementGraph(LatinSquareGraph(Group(Z(5))))
 );

InstallGlobalFunction( ShrikhandeGraph,
function()
 return ShrikhandeGraphCons(IsVectorGraph);
end );

#############################################################################
##
#F  ClebschGraph(  )
##  
InstallGlobalFunction( ClebschGraph,
function()
  return HalvedCubeGraph2(5);
end );

#############################################################################
##
#F  SchlaefliGraph(  )
##  
InstallGlobalFunction( SchlaefliGraph,
function()
  return Graph(DirectProduct(SymmetricGroup(6), SymmetricGroup(2)),
          [[-3,-3,1,1,1,1,1,1], [3,-1,-1,-1,-1,-1,-1,3]],
          OnRoots, RootAdjacency);
end );

#############################################################################
##
#F  HoffmanSingletonGraph(  )
##  
InstallGlobalFunction( HoffmanSingletonGraph,
function()
  return List([function()
        local G, dp, p1, p2, p3, p4;
        G := Group((1, 2, 3, 4, 5));
        dp := DirectProduct(G, G, G, Group((1, 2)));
        p1 := Projection(dp, 1);
        p2 := Projection(dp, 2);
        p3 := Projection(dp, 3);
        p4 := Projection(dp, 4);
        return Graph(dp, Cartesian(GF(5), GF(5), [1, 2]),
            function(x, g)
                local g4, j, s, u, v;
                u := 5^Image(p2, g) * Z(5)^0;
                v := 5^Image(p3, g) * Z(5)^0;
                g4 := Image(p4, g);
                s := x[3]^2;
                j := [1, 2*x[3]];
                return [1^g4*(x[1]+x[2]*(u-s*v)+s*(u^2-v^2)/2)+5^Image(p1, g),
                    j[1^g4]*(x[2]+s*u+v), x[3]^g4];
            end, function(x, y)
                return (x{[2,3]} = y{[2,3]} and y[1] in [x[1]-x[3], x[1]+x[3]])
                    or x[3] <> y[3] and y[1] = x[1] + x[2]*y[2]*x[3]^2;
            end, true);
    end])[1]();
end );

#############################################################################
##
#F  GewirtzGraph(  )
##  
InstallGlobalFunction( GewirtzGraph,
function()
  return Graph(MathieuGroup(21), [[1,2,3,7,10,20]],
                                    OnSets, DisjointSets);
end );

#############################################################################
##
#F  WittStronglyRegularGraph(  )
##  
InstallGlobalFunction( WittStronglyRegularGraph,
function()
  return Graph(MathieuGroup(22),
                                    [[1,2,3,7,10,20]], OnSets, DisjointSets);
end );

#############################################################################
##
#F  HigmanSimsGraph(  )
##  
InstallGlobalFunction( HigmanSimsGraph, 
function(  )
  local gamma, cocliqs;

  gamma := HoffmanSingletonGraph();
  gamma := ComplementGraph(gamma);

  cocliqs := CompleteSubgraphsOfGivenSize(gamma,15,2,false);

  return Graph(gamma.group,cocliqs,OnSets,
               function(x,y) return Length(Intersection(x,y)) in [0,8]; end);
end );

#############################################################################
##
#F  KlinGraph(  )
##  
InstallGlobalFunction( KlinGraph,
function()
  return List([function()
        local G, H, N, V;
        H := Group([(1,2,3,4,5,6), (1,4)]);
        V := Set(List(SymmetricGroup(7), g -> H*g));
        N := Position(V, H*());
        G := EdgeOrbitsGraph(Action(SymmetricGroup(7), V, OnRight),
            List([(3,4,5,6,7), (2,4,6,3,5,7), (3,5,6,7), (2,4,5,6,7,3),
                        (2,3,5,6,7), (2,4,5,6), (2,3,5,6)],
                    g -> [N, Position(V, H*g)]));
        AssignVertexNames(G, V);
        return G;
    end])[1]();
end );

#############################################################################
##
#F  McLaughlinGraph(  )
##  
InstallGlobalFunction( McLaughlinGraph, 
function()
  local hoffman,gamma,cocliqs,edges,grp,pents,orbs;
  
  hoffman:=HoffmanSingletonGraph();
  edges:=UndirectedEdges(hoffman);
  
  # Aut(Hoff) acts transitively on 5-cycles
  pents:=PositionsProperty(hoffman.names,x->x{[2,3]}=[0*Z(5),1]);
  pents:=Orbit(AutGroupGraph(hoffman),pents,OnSets);

  hoffman:=ComplementGraph(hoffman);
  cocliqs:=CompleteSubgraphsOfGivenSize(hoffman,15,2,false);
  
  gamma:= Graph(hoffman.autGroup,Union(edges,cocliqs),OnSets,function(x,y)
                 if Length(x)=Length(y) then
                   if Length(x)=2 then
                     return ForAny(pents,p->IsSubset(p,x) and IsSubset(p,y)) and
                            Intersection(x,y)=[];
                   fi;
                   return Length(Intersection(x,y)) in [0,3] and x<>y;
                 fi;
                 return Intersection(x,y)=[];
               end);
  AssignVertexNames(gamma,List(gamma.names,x->hoffman.names{x}));
 
  return gamma;   
end );

#############################################################################
##
#F  CubeGraph(  )
##  
InstallGlobalFunction( CubeGraph,
function()
  return HammingGraph2(3, 2);
end );

#############################################################################
##
#F  HeawoodGraph(  )
##  
InstallGlobalFunction( HeawoodGraph,
function()
  return DesarguesianPlaneIncidenceGraph(2);
end );

#############################################################################
##
#F  IcosahedronGraph(  )
##  
InstallGlobalFunction( IcosahedronGraph,
function()
  return Graph(DirectProduct(AlternatingGroup(5),
                                                   Group((1, 2))),
                                     [(1,3,5,2,4)], function(p, g)
                                        return (p^g)^((-1)^(6^g));
                                     end, function(x, y)
                                        return Order(x*y) = 3;
                                     end);
end );

#############################################################################
##
#F  SylvesterGraph(  )
##  
InstallGlobalFunction( SylvesterGraph,
function()
  return Graph(SymmetricGroup(6),
                    [[1, [[[1,2], [3,4], [5,6]],
                          [[1,3], [2,5], [4,6]],
                          [[1,4], [2,6], [3,5]],
                          [[1,5], [2,4], [3,6]],
                          [[1,6], [2,3], [4,5]]]]],
                    function(x, g)
                        return [x[1]^g,
                            Set(List(x[2], l -> OnSetsSets(l, g)))];
                    end, function(x, y)
                        return x[1] <> y[1] and x[2] <> y[2] and
                            Set([x[1], y[1]]) in Intersection(x[2], y[2])[1];
                    end);
end );

#############################################################################
##
#O  PerkelGraphCons( filter )
##  
InstallMethod( PerkelGraphCons, "as a conjugacy class graph", true,
     [IsConjugacyClassGraph], 0,
function(filter)
  local G;
  G := PSL(2, 19);
  return Graph(G,
           Elements(Group( [ ( 2,12,15)( 3,17,16)( 4, 8,10)( 5, 6,13)( 9,20,18)(11,19,14),( 1, 2)( 3,20)( 4,19)( 5,18)( 6,17)( 7,16)( 8,15)( 9,14)(10,13)(11,12) ] )^G), ConjugateGroup, GroupIntersection(10), true);
end );

#############################################################################
##
#F  PerkelGraph(  )
##  
InstallGlobalFunction( PerkelGraph,
function()
  return PerkelGraphCons(IsConjugacyClassGraph);
end );

#############################################################################
##
#F  GossetGraph(  )
##  
InstallGlobalFunction( GossetGraph,
function()
  return Graph(DirectProduct(SymmetricGroup(8), SymmetricGroup(2)),
        [[-3,-3,1,1,1,1,1,1]], OnRoots, RootAdjacency);
end );

#############################################################################
##
#F  Witt23Graph(  )
##  
InstallGlobalFunction( Witt23Graph,
function()
  return Graph(MathieuGroup(23), [[1,4,8,12,13,19,21,23]],
                                OnSets, DisjointSets);
end );

#############################################################################
##
#F  Witt24Graph(  )
##  
InstallGlobalFunction( Witt24Graph,
function()
  return Graph(MathieuGroup(24), [[1,4,8,12,13,19,21,23]],
                                OnSets, DisjointSets);
end );

#############################################################################
##
#F  HigmanGraph(  )
##  
InstallGlobalFunction( HigmanGraph,
function()
  return Graph(Stabilizer(MathieuGroup(24), [23, 24], OnSets),
                            [[1,4,8,12,13,19,21,23]], OnSets,
                            function (x, y)
                                return Length(Difference(Intersection(x, y),
                                                         [23, 24])) in [0, 4];
                            end);
end );

#############################################################################
##
#F  CoxeterGraph(  )
##  
InstallGlobalFunction( CoxeterGraph,
function()
  return PolarGraphNOorth(1, 3, 7);
end );

#############################################################################
##
#F  Witt22Graph(  )
##  
InstallGlobalFunction( Witt22Graph,
function()
  return Graph(MathieuGroup(22), [[1,2,3,4,5,10,18,21]],
                                OnSets, DisjointSets);
end );

#############################################################################
##
#O  UnitalGraphCons( filter )
##  
InstallMethod( UnitalGraphCons, "as a spaces graph", true, [IsSpacesGraph], 0,
function(filter)
  local A, U, V;
  A := SetIntersection(1);
  V := GF(4)^3;
  U := [[0*Z(2), Z(2)^0, Z(2)^0],
        [Z(2)^0, 0*Z(2), 0*Z(2)],
        [Z(2)^0, 0*Z(2), Z(2)^0],
        [Z(2)^0, 0*Z(2), Z(4)],
        [Z(2)^0, Z(2)^0, 0*Z(2)],
        [Z(2)^0, Z(2)^0, Z(2)^0],
        [Z(2)^0, Z(2)^0, Z(4)^2],
        [Z(2)^0, Z(4), Z(2)^0],
        [Z(2)^0, Z(4)^2, 0*Z(2)]];
  return Graph(GL(3, 4), [Set(Filtered(Subspaces(V, 1), x -> A(x, U)))],
               OnSetsSubspaces(V), A);
end );

#############################################################################
##
#F  UnitalGraph(  )
##  
InstallGlobalFunction( UnitalGraph,
function()
  return UnitalGraphCons(IsSpacesGraph);
end );

#############################################################################
##
#F  DodecahedronGraph(  )
##  
InstallGlobalFunction( DodecahedronGraph,
function() 
  return List([function()
    local G, O, act, dp, p1, p2, u, v;
    dp := DirectProduct(AlternatingGroup(5), Group((1, 2)));
    p1 := Projection(dp, 1);
    p2 := Projection(dp, 2);
    act := function(t, g)
             return OnTuples(t{Permuted([1,2], Image(p2, g))}, Image(p1, g));
           end;
    u := [1, 2];
    v := [3, 4];
    O := Arrangements([1..5], 2);
    G := EdgeOrbitsGraph(Action(dp, O, act),
                         [Position(O, u), Position(O, v)]);
    AssignVertexNames(G, O);
    return G;
   end])[1]();
end );

#############################################################################
##
#F  DesarguesGraph(  )
##  
InstallGlobalFunction( DesarguesGraph,
function()
  return DoubledOddGraph(2);
end );

#############################################################################
##
#O  BiggsSmithGraphCons(  )
##  
InstallMethod(BiggsSmithGraphCons, "as a conjugacy class graph", true,
     [IsConjugacyClassGraph], 0,
function(filter)
  local G;
  G := PSL(2, 17);
  return Graph(G,
    Elements(Group( [ ( 3,11)( 4,12)( 5,13)( 6,14)( 7,15)( 8,16)( 9,17)(10,18),
                ( 1, 2)( 3, 5)( 6,18)( 7,17)( 8,16)( 9,15)(10,14)(11,13),
                ( 1, 4,16)( 2,12, 8)( 3, 9, 6)( 5, 7,14)(10,11,15)(13,17,18),
                ( 3, 7,11,15)( 4, 8,12,16)( 5, 9,13,17)( 6,10,14,18) ] )^G),
                        ConjugateGroup, GroupIntersection(8), true);
end );

#############################################################################
##
#F  BiggsSmithGraph(  )
##  
InstallGlobalFunction( BiggsSmithGraph,
function()
  return BiggsSmithGraphCons(IsConjugacyClassGraph);
end );

#############################################################################
##
#E
