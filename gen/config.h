/* gen/config.h.  Generated from config.h.in by configure.  */
/* src/config.h.in.  Generated from configure.ac by autoheader.  */

/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* define as least offset which is still safe for an unaligned access */
#define C_STACK_ALIGN 2

/* define if building in debug mode */
/* #undef GAP_KERNEL_DEBUG */

/* The major version of the kernel ABI */
#define GAP_KERNEL_MAJOR_VERSION 3

/* The minor version of the kernel ABI */
#define GAP_KERNEL_MINOR_VERSION 1

/* define if building with memory checking */
/* #undef GAP_MEM_CHECK */

/* define as 1 if >> for long int behaves like an arithmetic right shift for
   negative numbers */
#define HAVE_ARITHRIGHTSHIFT 1

/* Defined if backtrace() could be fully identified. */
#define HAVE_BACKTRACE 1

/* Define to 1 if you have the `clock_getres' function. */
#define HAVE_CLOCK_GETRES 1

/* Define to 1 if you have the `clock_gettime' function. */
#define HAVE_CLOCK_GETTIME 1

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* define as 1 if you have `dlopen' and `dlsym' */
#define HAVE_DLOPEN 1

/* Define to 1 if you have the <execinfo.h> header file. */
#define HAVE_EXECINFO_H 1

/* Define to 1 if you have the `exp10' function. */
#define HAVE_EXP10 1

/* Define to 1 if you have the `exp2' function. */
#define HAVE_EXP2 1

/* Define to 1 if you have the `expm1' function. */
#define HAVE_EXPM1 1

/* Define to 1 if you have the `fork' function. */
#define HAVE_FORK 1

/* Define to 1 if the system has the `always_inline' function attribute */
#define HAVE_FUNC_ATTRIBUTE_ALWAYS_INLINE 1

/* Define to 1 if the system has the `noinline' function attribute */
#define HAVE_FUNC_ATTRIBUTE_NOINLINE 1

/* Define to 1 if the system has the `noreturn' function attribute */
#define HAVE_FUNC_ATTRIBUTE_NORETURN 1

/* Define to 1 if you have the `getrusage' function. */
#define HAVE_GETRUSAGE 1

/* Define to 1 if you have the `gettimeofday' function. */
#define HAVE_GETTIMEOFDAY 1

/* Define to 1 if GMP is found */
/* #undef HAVE_GMP */

/* Define to 1 if you have the `grantpt' function. */
/* #undef HAVE_GRANTPT */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define if you have libreadline */
/* #undef HAVE_LIBREADLINE */

/* Define to 1 if you have the <libutil.h> header file. */
/* #undef HAVE_LIBUTIL_H */

/* Define to 1 if you have the `log10' function. */
#define HAVE_LOG10 1

/* Define to 1 if you have the `log1p' function. */
#define HAVE_LOG1P 1

/* Define to 1 if you have the `log2' function. */
#define HAVE_LOG2 1

/* Define to 1 if you have the `lstat' function. */
#define HAVE_LSTAT 1

/* Define to 1 if you have the `madvise' function. */
#define HAVE_MADVISE 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `mkdtemp' function. */
#define HAVE_MKDTEMP 1

/* Define to 1 if you have the `mkstemp' function. */
#define HAVE_MKSTEMP 1

/* define as 1 if you have `openpty' */
#define HAVE_OPENPTY 1

/* Define to 1 if you have the `popen' function. */
#define HAVE_POPEN 1

/* Define to 1 if you have the `posix_openpt' function. */
/* #undef HAVE_POSIX_OPENPT */

/* Define if you have POSIX threads libraries and header files. */
/* #undef HAVE_PTHREAD */

/* Have PTHREAD_PRIO_INHERIT. */
/* #undef HAVE_PTHREAD_PRIO_INHERIT */

/* Define to 1 if you have the `ptsname' function. */
/* #undef HAVE_PTSNAME */

/* Define to 1 if you have the <pty.h> header file. */
#define HAVE_PTY_H 1

/* Define to 1 if READLINE is found */
/* #undef HAVE_READLINE */

/* Define to 1 if you have the `rld_load' function. */
/* #undef HAVE_RLD_LOAD */

/* Define to 1 if you have the `sbrk' function. */
#define HAVE_SBRK 1

/* Define to 1 if you have the `select' function. */
#define HAVE_SELECT 1

/* Define to 1 if you have the `setitimer' function. */
#define HAVE_SETITIMER 1

/* Define to 1 if you have the `setpgid' function. */
#define HAVE_SETPGID 1

/* Define to 1 if you have the `sigaction' function. */
#define HAVE_SIGACTION 1

/* Define to 1 if you have the `signal' function. */
#define HAVE_SIGNAL 1

/* Define to 1 if you have the <signal.h> header file. */
#define HAVE_SIGNAL_H 1

/* Define to 1 if you have the `sigsetjmp' function. */
#define HAVE_SIGSETJMP 1

/* Check for sig_atomic_t */
/* #undef HAVE_SIG_ATOMIC_T */

/* Define to 1 if you have the `stat' function. */
#define HAVE_STAT 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strlcat' function. */
/* #undef HAVE_STRLCAT */

/* Define to 1 if you have the `strlcmp' function. */
/* #undef HAVE_STRLCMP */

/* Define to 1 if you have the `strlcpy' function. */
/* #undef HAVE_STRLCPY */

/* Define to 1 if you have the `sysconf' function. */
#define HAVE_SYSCONF 1

/* Define to 1 if you have the <sys/ioctl.h> header file. */
#define HAVE_SYS_IOCTL_H 1

/* Define to 1 if you have the <sys/resource.h> header file. */
#define HAVE_SYS_RESOURCE_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have <sys/wait.h> that is POSIX.1 compatible. */
#define HAVE_SYS_WAIT_H 1

/* Define to 1 if you have the <termios.h> header file. */
#define HAVE_TERMIOS_H 1

/* Define to 1 if you have the `trunc' function. */
#define HAVE_TRUNC 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the `unlockpt' function. */
/* #undef HAVE_UNLOCKPT */

/* Define to 1 if you have the <util.h> header file. */
/* #undef HAVE_UTIL_H */

/* Define to 1 if you have the `vfork' function. */
#define HAVE_VFORK 1

/* Define to 1 if you have the <vfork.h> header file. */
/* #undef HAVE_VFORK_H */

/* Define to 1 if you have the `vm_allocate' function. */
/* #undef HAVE_VM_ALLOCATE */

/* Define to 1 if `fork' works. */
#define HAVE_WORKING_FORK 1

/* Define to 1 if `vfork' works. */
#define HAVE_WORKING_VFORK 1

/* Define to 1 if ZLIB is found */
#define HAVE_ZLIB 1

/* Define to 1 if you have the `_setjmp' function. */
/* #undef HAVE__SETJMP */

/* Define to 1 if the system has the `__builtin_clz' built-in function */
#define HAVE___BUILTIN_CLZ 1

/* Define to 1 if the system has the `__builtin_clzl' built-in function */
#define HAVE___BUILTIN_CLZL 1

/* Define to 1 if the system has the `__builtin_clzll' built-in function */
#define HAVE___BUILTIN_CLZLL 1

/* Define to 1 if the system has the `__builtin_popcountl' built-in function
   */
#define HAVE___BUILTIN_POPCOUNTL 1

/* Define to 1 if the system has the `__builtin_smulll_overflow' built-in
   function */
#define HAVE___BUILTIN_SMULLL_OVERFLOW 1

/* Define to 1 if the system has the `__builtin_smull_overflow' built-in
   function */
#define HAVE___BUILTIN_SMULL_OVERFLOW 1

/* Define to 1 if the system has the `__builtin_smul_overflow' built-in
   function */
#define HAVE___BUILTIN_SMUL_OVERFLOW 1

/* define if building HPC-GAP */
/* #undef HPCGAP */

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#define LT_OBJDIR ".libs/"

/* maximum number of GC threads */
/* #undef MAX_GC_THREADS */

/* define if building with valgrind extensions */
/* #undef MEMORY_CANARY */

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "support@gap-system.org"

/* Define to the full name of this package. */
#define PACKAGE_NAME "GAP"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "GAP 4.dev"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "gap"

/* Define to the home page for this package. */
#define PACKAGE_URL "http://www.gap-system.org/"

/* Define to the version of this package. */
#define PACKAGE_VERSION "4.dev"

/* to enable backtraces upon crashes */
/* #undef PRINT_BACKTRACE */

/* Define to necessary symbol if this constant uses a non-standard name on
   your system. */
/* #undef PTHREAD_CREATE_JOINABLE */

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT 4

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG 8

/* The size of `long long', as computed by sizeof. */
#define SIZEOF_LONG_LONG 8

/* The size of `void *', as computed by sizeof. */
#define SIZEOF_VOID_P 8

/* define as 1 on SPARC architecture to flush register windows */
/* #undef SPARC */

/* Define to 1 if the `S_IS*' macros in <sys/stat.h> do not work properly. */
/* #undef STAT_MACROS_BROKEN */

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* for backwards compatibility */
#define SYS_ARCH "x86_64-pc-linux-gnu-default64-kv3"

/* define if this is the Cygwin32 port */
/* #undef SYS_IS_CYGWIN32 */

/* define if this is the Darwin port */
/* #undef SYS_IS_DARWIN */

/* define as 1 if Boehm GC is used */
/* #undef USE_BOEHM_GC */

/* define as 1 if GASMAN is used */
#define USE_GASMAN 1

/* for backwards compatibility */
#define USE_GMP 1

/* define as 1 if the Julia GC is used */
/* #undef USE_JULIA_GC */

/* define as 1 if we should try and use the __builtin_popcntl function if
   available */
#define USE_POPCNT 1

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

/* Enable large inode numbers on Mac OS X 10.5.  */
#ifndef _DARWIN_USE_64_BIT_INODE
# define _DARWIN_USE_64_BIT_INODE 1
#endif

/* Number of bits in a file offset, on hosts where this is settable. */
/* #undef _FILE_OFFSET_BITS */

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

/* Defined to return type of backtrace(). */
#define backtrace_size_t int

/* Define to `int' if <sys/types.h> does not define. */
/* #undef pid_t */

/* Define as `fork' if `vfork' does not work. */
/* #undef vfork */
