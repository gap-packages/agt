#############################################################################
##
#W  PackageInfo.g         Algebraic Graph Theory package        Rhys J. Evans
##
##
##
SetPackageInfo( rec(

  PackageName := "AGT",
  Subtitle := "Algebraic Graph Theory",
  Version := "0.3.1",
  Date := "31/12/2022",
  License := "GPL-2.0-or-later",

##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.3.1">
##  <!ENTITY RELEASEDATE "31 December 2022">
##  <!ENTITY PKGWWWHOME "https://gap-packages.github.io/agt/">
##  <#/GAPDoc>

  PackageWWWHome :=
  Concatenation( "https://gap-packages.github.io/", LowercaseString( ~.PackageName ) ),

  SourceRepository := rec(
    Type := "git",
    URL := Concatenation("https://github.com/gap-packages/",
                         ~.PackageName),
  ),

  IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ), 

  SupportEmail := "rhysjevans00@gmail.com",

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
      WWWHome := "https://rhysje00.github.io/",
      Email := "rhysjevans00@gmail.com",
      PostalAddress := "Mile End Road, London, E14NS",
      Place := "London",
      Institution := "School of Mathematical Sciences, Queen Mary University of London",
    ),
  ],

  Status := "deposited",

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
    HTMLStart := "doc/chap0_mj.html",
    PDFFile   := "doc/manual.pdf",
    # the path to the .six file used by GAP's help system
    SixFile   := "doc/manual.six",
    LongTitle := "Algebraic Graph Theory",
  ),

  Dependencies := rec(

    GAP := ">= 4.10",

    NeededOtherPackages := [["GAPDoc", ">= 1.6"],["GRAPE",">= 4.8"],["design",">= 1.7"],["Digraphs",">= 0.15.2"]],
    SuggestedOtherPackages := [],
    OtherPackagesLoadedInAdvance := [],

    ExternalConditions := []

  ),

  AvailabilityTest := ReturnTrue,

  TestFile := "tst/testall.g",

  Keywords := ["strongly regular","edge-regular","eigenvalues", "clique","induced subgraphs"]

));

