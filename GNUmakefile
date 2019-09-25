# GNUmakefile.  Generated from GNUmakefile.in by configure.

# This file is the part of the GAP build system. It is the first file
# processed by GNU make when build GAP. If you want to understand the
# build system, you can begin tracing it from here.
#
# To learn more about the GAP build system, see README.buildsys.md


#
# Set lots of variables to values computed by the configure script
#

# GAP specific
SYS_IS_DARWIN = 
SYS_IS_CYGWIN32 = 
ABI = 64
ABI_CFLAGS = 

# HPC-GAP specific
HPCGAP = no
ADDGUARDS2 = 

# garbage collector source files
GC_SOURCES = src/gasman.c

# compatibility mode
COMPAT_MODE = yes
GAPARCH = x86_64-pc-linux-gnu-default64-kv3

# GAP kernel version
GAP_KERNEL_MINOR_VERSION = 1
GAP_KERNEL_MAJOR_VERSION = 3

# autoconf package metadata
PACKAGE_BUGREPORT = support@gap-system.org
PACKAGE_NAME = GAP
PACKAGE_STRING = GAP 4.dev
PACKAGE_TARNAME = gap
PACKAGE_URL = http://www.gap-system.org/
PACKAGE_VERSION = 4.dev

# autoconf host information
host = x86_64-pc-linux-gnu
host_alias = 
host_cpu = x86_64
host_os = linux-gnu
host_vendor = pc

# compile and linker flags
CFLAGS = -g -O2 
CPPFLAGS = 
DEFS = -DHAVE_CONFIG_H
LDFLAGS =  
LIBS = -lm -ldl -lutil 

WARNING_CPPFLAGS = -fno-strict-aliasing -Wall -Wextra -Wundef -Wwrite-strings -Wpointer-arith -Wredundant-decls -Wno-unused-parameter -Wmissing-field-initializers -Wformat=2 -Wold-style-definition -Wformat-nonliteral -Wformat-security -Wno-sign-compare -Wstrict-aliasing -Wshadow -Winline -Wpacked -Wmissing-format-attribute -Winit-self -Wmissing-include-dirs -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wno-implicit-fallthrough -Wno-inline -Wlogical-op -Wdouble-promotion -Wno-cast-function-type -Wnested-externs -Wimplicit-function-declaration -Wjump-misses-init -Wno-error=unused-parameter -Wno-error=sign-compare -Wno-error=inline

BUILD_GMP = yes
GMP_CPPFLAGS = -I${abs_builddir}/extern/install/gmp/include
GMP_LDFLAGS = ${abs_builddir}/extern/install/gmp/lib/libgmp.la
GMP_LIBS = 

BUILD_ZLIB = no
ZLIB_CPPFLAGS = 
ZLIB_LDFLAGS = 
ZLIB_LIBS = -lz

READLINE_CPPFLAGS = 
READLINE_LDFLAGS = 
READLINE_LIBS = 

JULIA = 
JULIA_CPPFLAGS = 
JULIA_LDFLAGS = 
JULIA_LIBS = 

BUILD_BOEHM_GC = 
BOEHM_GC_CPPFLAGS = 
BOEHM_GC_LDFLAGS = 
BOEHM_GC_LIBS = 

BUILD_LIBATOMIC_OPS = 
LIBATOMIC_OPS_CPPFLAGS = 
LIBATOMIC_OPS_LDFLAGS = 
LIBATOMIC_OPS_LIBS = 

PTHREAD_CFLAGS = 
PTHREAD_LIBS = 

# tools
AR = ar
AS = as
AWK = mawk
CC = gcc
CPP = gcc -E
INSTALL = /usr/bin/install -c
LD = /usr/bin/ld -m elf_x86_64
LIPO = 
LN_S = ln -s
MANIFEST_TOOL = :
MKDIR_P = /bin/mkdir -p
NM = /usr/bin/nm -B
NMEDIT = 
OBJDUMP = objdump
OTOOL = 
OTOOL64 = 
RANLIB = ranlib
SED = /bin/sed
SHELL = /bin/bash
STRIP = strip

# libtool
LIBTOOL = $(SHELL) $(top_builddir)/libtool
LTLIBOBJS = 
LT_SYS_LIBRARY_PATH = 

# misc
EXEEXT = 
LIBOBJS = 
OBJEXT = o
PATH_SEPARATOR = :
program_transform_name = s,x,x,
target_alias = 

build = x86_64-pc-linux-gnu
build_alias = 
build_cpu = x86_64
build_os = linux-gnu
build_vendor = pc

# build paths
abs_builddir = /usr/share/gap-4.10.2/pkg/agt
abs_srcdir = /usr/share/gap-4.10.2/pkg/agt/../..
builddir = .
srcdir = ../..

# for compatibility: top_builddir is used by libtool for LIBTOOL variable;
# keeping the others makes it easier to "git bisect" back and forth
top_builddir = .
top_srcdir = ../..
abs_top_builddir = /usr/share/gap-4.10.2/pkg/agt
abs_top_srcdir = /usr/share/gap-4.10.2/pkg/agt/../..

# install paths
bindir = ${exec_prefix}/bin
datadir = ${datarootdir}
datarootdir = ${prefix}/share
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
exec_prefix = ${prefix}
htmldir = ${docdir}
includedir = ${prefix}/include
infodir = ${datarootdir}/info
libdir = ${exec_prefix}/lib
libexecdir = ${exec_prefix}/libexec
localedir = ${datarootdir}/locale
localstatedir = ${prefix}/var
mandir = ${datarootdir}/man
pdfdir = ${docdir}
prefix = /usr/local
psdir = ${docdir}
sbindir = ${exec_prefix}/sbin
sharedstatedir = ${prefix}/com
sysconfdir = ${prefix}/etc


#
# Set vpath values to make GNU make read source files from $(srcdir).
#
# The vpath directives below ensure that if we reference src/foo.c, then if it
# is not found in the build dir (e.g. because we are doing an out-of-tree
# build), GNU make automatically looks for $(srcdir)/src/foo.c
# #
# Note that `vpath' is a GNU make extension. Unlike VPATH, it can be
# restricted to certain file extensions. This way, we can mix in-tree and
# out-of-tree builds without accidentally picking up e.g. *.o files from the
# wrong tree. Wee still have to be careful about gen/config.h, though.
#
vpath %.h $(srcdir)
vpath %.c $(srcdir)
vpath %.s $(srcdir)


#
# Finally, include the actual make rules.
#
include $(srcdir)/Makefile.rules
