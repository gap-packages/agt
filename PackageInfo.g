#############################################################################
##
#W  PackageInfo.g         Algebraic Graph Theory package        Rhys J. Evans
##
##
##
SetPackageInfo( rec(

  PackageName := "AGT",
  Subtitle := "Algebraic Graph Theory",
  Version := "0.1",
  Date := "04/02/2020",

##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.1">
##  <!ENTITY RELEASEDATE "4 February 2020">
##  <!ENTITY PKGWWWHOME "https://github.com/rhysje00/agt">
##  <#/GAPDoc>

  PackageWWWHome  := "https://github.com/rhysje00/agt",
##PackageWWWHome :=
##  Concatenation( "https://github.com/gap-packages/", LowercaseString( ~.PackageName ) ),
##

  SourceRepository :=
    rec( Type := "git",
         URL :=  "https://github.com/rhysje00/agt"),
##  SourceRepository :=
##    rec( Type := "git",
##         URL  := URL :=  "https://github.com/gap-packages/", LowercaseString( ~.PackageName ) ),

  IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ), 

  SupportEmail := "r.evans@qmul.ac.uk",

  ArchiveURL := Concatenation( ~.SourceRepository.URL,
                               "/releases/download/v", ~.Version,
                               "/", ~.PackageName, "-", ~.Version ),

  ArchiveFormats := ".tar.gz",

  Persons := [
    rec(
      IsAuthor := true,
      IsMaintainer := true,
      FirstNames := "Rhys J.",
      LastName := "Evans",
      WWWHome := "https://www.qmul.ac.uk/maths/profiles/evansr.html",
      Email := "r.evans@qmul.ac.uk",
      PostalAddress := "Mile End Road, London, E14NS",
      Place := "London",
      Institution := "School of Mathematical Sciences, Queen Mary University of London",
    ),
  ],

  Status := "other",

  README_URL := 
    Concatenation( ~.PackageWWWHome, "/README.md" ),
  
  PackageInfoURL := 
    Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

  AbstractHTML   :=  
    "The <span class=\"pkgname\">AGT</span> package provides functionality to \
     inspect combinatorial and algebraic properties of graphs in GRAPE format. \
     It also provides a library  strongly regular graphs on at most 40 vertices,\
     and several graph constructions",

  PackageDoc := rec(
    BookName  := "agt",
    ArchiveURLSubset := ["doc"],
    HTMLStart := "doc/chap0.html",
    PDFFile   := "doc/manual.pdf",
    # the path to the .six file used by GAP's help system
    SixFile   := "doc/manual.six",
    LongTitle := "Algebraic Graph Theory",
  ),

  Dependencies := rec(

    GAP := ">= 4.9",

    NeededOtherPackages := [["GAPDoc", "1.5"],["grape","4.8"],["design","1.6"],["Digraphs","0.12.2"]],
    SuggestedOtherPackages := [],
    OtherPackagesLoadedInAdvance := [],

    ExternalConditions := []

  ),

  AvailabilityTest := ReturnTrue,

  TestFile := "tst/testall.g",

  Keywords := ["strongly regular","edge-regular","eigenvalues", "clique","induced subgraphs"]

));

