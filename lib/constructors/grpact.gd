#############################################################################
##
#W  grpact.gd          Algebraic Graph Theory package         Janoš Vidali
##
##
#Y  Copyright (C) 2020
##
##  Declaration file for functions involving group actions.
##  
##


# Action on a finite field element.
DeclareGlobalFunction( "OnFFE" );

# Action of a matrix on a finite field element as a vector for a given basis.
DeclareGlobalFunction( "OnFFEByBasis" );

# Action of a group on a signed point.
DeclareGlobalFunction( "OnSignedPoints" );

# Action of a product group on vertices of a product graph.
DeclareGlobalFunction( "OnProduct" );

# Action of a product group on vertices of a sum graph.
DeclareGlobalFunction( "OnSum" );

# Action of a product group on the multiplication table of its factors.
DeclareGlobalFunction( "OnLatinSquare" );

DeclareGlobalFunction( "OnJohnson" );

# Action on the vertices of the Chang graphs.
DeclareGlobalFunction( "OnChang" );

# Action of a wreath product on vectors over a ring.
DeclareGlobalFunction( "OnWreathProduct" );

# Action of a wreath product on pairs of vectors with 3 elements.
DeclareGlobalFunction( "OnVectorPairs" );

# Action of a wreath product on matrices over a field.
DeclareGlobalFunction( "OnMatrices" );

# Action of a wreath product on Hermitean matrices over a field.
DeclareGlobalFunction( "OnHermiteanMatrices" );

# Action of a matrix group on subspaces of a vector space over a finite field.
DeclareGlobalFunction( "OnSubspaces" ); 

# Action of a matrix group on a set of subspaces of a vector space over a
# finite field.
DeclareGlobalFunction( "OnSetsSubspaces" );

# Action on the vertices of doubled Odd graphs.
DeclareGlobalFunction( "OnDoubledOdd" );

# Action on the vertices of Grassmann graphs.
DeclareGlobalFunction( "OnGrassmann" );

# Action on the vertices of doubled Grassmann graphs.
#DeclareGlobalFunction( "OnDoubledGrassmann" );

# Action on the vertices of dual polar graphs.
DeclareGlobalFunction( "OnDualPolar" );

# Action on the vertices of Paley graphs.
DeclareGlobalFunction( "OnPaley" );

# Action on the vertices of Preparata graphs.
DeclareGlobalFunction( "OnPreparata" );

# Action on the vertices of Kasami graphs.
DeclareGlobalFunction( "OnKasami" );

# Action on vertices of additive symplectic covers of complete graphs.
DeclareGlobalFunction( "OnAdditiveSymplecticCover" );

# Action on vertices of multiplicative symplectic covers of complete graphs.
DeclareGlobalFunction( "OnMultiplicativeSymplecticCover" );

# Action on the vertices of affine polar graphs.
DeclareGlobalFunction( "OnAffine" );

# Action on the roots of E_8
DeclareGlobalFunction( "OnRoots" );

# Action of a matrix group on normalized vectors over a semifield.
DeclareGlobalFunction( "OnSemifieldVectors" );

# Action of a matrix group on sets of normalized vectors over a semifield.
DeclareGlobalFunction( "OnSetsSemifieldVectors" );

# Action on points and lines of Desarguesian projective planes.
DeclareGlobalFunction( "OnProjectivePlane" );

# Action on points or lines of a point-line geometry.
DeclareGlobalFunction( "OnPointsOrLines" );

# Action on points and lines of Hall planes.
DeclareGlobalFunction( "OnHallPlane" );

# Action on points and lines of Hughes planes.
DeclareGlobalFunction( "OnHughesPlane" );
