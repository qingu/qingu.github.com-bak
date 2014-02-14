---
layout: post
title: "ifort Man Page"
date: 2013-12-03 20:28
comments: true
categories: [man, ifort, Fortran]
---

本文用于收集Intel Fortran v12.1编译器帮助文档，方便查找阅读。生成帮助文件命令为：

```
	man ifort | col -b > man_ifort.txt
```

<!--more-->

```
ifort(1)	     Intel(R) Fortran Compiler XE Options	     ifort(1)



       ifort - invokes the Intel(R) Fortran Compiler

SYNOPSIS
       ifort [ options ] file1 [ file2 ]...

       options		 Are zero or more compiler options.

       fileN		 Is  a	Fortran  source  file,	assembly file, object
			 file, object library, or other linkable file.

DESCRIPTION - ifort
       The ifort command invokes the Intel(R) Fortran  Compiler  XE  that  is
       designed  to  preprocess, compile, assemble, and link Fortran programs
       on  systems  using  IA-32  architecture,  systems  using  Intel(R)  64
       architecture.  For more information on this compiler, see the Intel(R)
       Fortran Building Applications guide.

       The ifort command interprets input files by their filename  suffix  as
       follows:

       · Filenames  with the suffix .f90 are interpreted as free-form Fortran
	 95/90 source files.

       · Filenames with the suffix .f,	.for,  or  .ftn  are  interpreted  as
	 fixed-form Fortran source files.

       · Filenames  with  the  suffix  .fpp,  .F,  .FOR,  .FTN,  or  .FPP are
	 interpreted as  fixed-form  Fortran  source  files,  which  must  be
	 preprocessed by the fpp preprocessor before being compiled.

       · Filenames  with the suffix .F90 are interpreted as free-form Fortran
	 source files, which must be pre-processed by  the  fpp  preprocessor
	 before being compiled.

       · Filenames  with the suffix .s are interpreted as assembler files and
	 are passed to the assembler.

       · Filenames with the suffix .S are interpreted as assembler files  and
	 are  preprocessed by the fpp preprocessor before being passed to the
	 assembler.

       · Filenames with the suffix .a are interpreted as object libraries and
	 are passed to ld(1).

       · Filenames  with  the  suffix  .o  are interpreted as compiled object
	 files and are passed to ld(1).

       You can override some options specified on the command line  by	using
       the  OPTIONS  statement	in  your  Fortran  source program. An OPTIONS
       statement affects only the program unit in which the statement occurs.
       For more information, see the Intel(R) Fortran Language Reference.

       This man page is intended for Linux* OS and Mac OS* X users.

       Most  language  features  are  available  on  all  supported  systems.
       However,  some  language  features  are	only  available  on   certain
       processors  or  a certain operating system. Such language features are
       labeled within parentheses as follows:

       i32		 Means the feature  is	available  on  systems	using
			 IA-32 architecture.

       i64em		 Means	the  feature  is  available  on systems using
			 Intel(R) 64 architecture.

       L*X		 Means the feature is available on Linux* systems.

       M*X		 Means the feature is available on all Intel(R)-based
			 systems running Mac OS* X.

			 M*X32		Means  the  feature  is  available on
					Intel(R)-based 32-bit systems running
					Mac OS* X.

			 M*X64		Means  the  feature  is  available on
					Intel(R)-based 64-bit systems running
					Mac OS* X.

       If  a  labeled  feature	is  only  available  on  one processor or one
       operating system, you will see the word "only" within the label. If no
       label  appears,	the  language  feature	is available on all supported
       systems.

       For example, option -Bstatic is labeled (L*X only),  which  means  the
       option  is  not available on Mac OS X systems; it is only available on
       Linux systems.

   Options that Improve Run-Time Performance
       The following command  line  options  can  be  used  to	increase  the
       run-time  performance  of  code	generated  by  the  Intel(R)  Fortran
       Compiler:

       · On systems using IA-32 architecture and systems  using  Intel(R)  64
	 architecture:	-ax<processor>,  -ftz, -ip, -ipo, -march=<processor>,
	 -mtune=<processor>, -O[n], -openmp, -parallel, -prof-gen, -prof-use,
	 -x<processor>.

       · On  systems  using  IA-64  architecture:  -fnsplit, -ftz, -ip, -ipo,
	 -march=<processor>, -mtune=<processor>, -O[n],  -openmp,  -parallel,
	 -prof-gen, -prof-use.

   Configuration and Indirect Files
       Command options to be used whenever the compiler is invoked can be put
       into a system configuration file named ifort.cfg, which resides in the
       same area as the compiler.

       The  text  in  this  file is processed by ifort before the text on the
       command	line.  To  use	a  personal  configuration  file,   set   the
       environment  variable IFORTCFG to point to the path and filename to be
       used.

       An indirect file contains text that  can  be  included  on  the	ifort
       command	line.  Precede	the  filename  with  an at sym bol (@) on the
       command line at the point where the options are to  be  inserted.  For
       example,  assume  file double_size contains options "-i8 -r8" and file
       my_includes contains  options  "-I/bld/inc  -I/bld/headers".  In  this
       case,  the  following  command line:	       ifort -O3 @double_size
       myprog.f90  @my_includespasses  "-O3  -i8  -r8  myprog.f90  -I/bld/inc
       -I/bld/headers" to the compiler.

OPTIONs
       Some  compiler  options	have  the  form -name keyword. Both -name and
       keyword can be abbreviated. It is recommended that you use the first 4
       characters  of each. For example, -assume buffered_io can be specified
       as -assu buff.

       To see lists of compiler options by functionality, specify a  category
       for option -help on the command line. For a list of the categories you
       can specify, see -help below.

       For information on linker and load-time options, see ld(1).

       For some options, you can (or must)  specify  additional  information,
       such  as  a keyword, a directory, a file name, a number, and so forth.
       When this information is required, it is shown in angle brackets (<>);
       when it is optional, it is shown in square brackets ([]). For example,
       in option -align <keyword>, keyword is required; in option -unroll[n],
       n (a number) is optional.

       -align [keyword]

       -noalign

	      Tells the compiler how to align certain data items.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the	data items to align. Possible
				values are:

				none	       Prevents     padding	bytes
					       anywhere  in common blocks and
					       structures.

				[no]commons    Affects	alignment  of  common
					       block entities.

				[no]dcommons   Affects	alignment  of  common
					       block entities.

				[no]qcommons   Affects	alignment  of  common
					       block entities.

				[no]records    Affects	    alignment	   of
					       derived-type  components   and
					       fields of record structures.

				recnbyte       Specifies  a size boundary for
					       derived-type  components   and
					       fields of record structures.

				[no]sequence   Affects alignment of sequenced
					       derived-type components.

				all	       Adds  padding  bytes  whenever
					       possible   to  data  items  in
					       common blocks and structures.

	      Default:

	      nocommons 	Adds no padding bytes for alignment of common
				blocks.

	      nodcommmons	Adds no padding bytes for alignment of common
				blocks.

	      noqcommmons	Adds no padding bytes for alignment of common
				blocks.

	      records		Aligns	derived-type  components  and  record
				structure   fields   on    default    natural
				boundaries.

	      nosequence	Causes	derived-type components declared with
				the  SEQUENCE	statement   to	 be   packed,
				regardless  of current alignment rules set by
				the user.

	      By default, no padding is added to common blocks but padding is
	      added to structures.

	      Description:

	      This  option  specifies  the  alignment to use for certain data
	      items.  The  compiler  adds  padding  bytes  to	perform   the
	      alignment.

	      Option		Description

	      align none	Tells  the  compiler not to add padding bytes
				anywhere in common blocks or structures. This
				is the same as specifying noalign.

	      align commons	Aligns	all  common block entities on natural
				boundaries up to 4 bytes, by  adding  padding
				bytes as needed.

	      The align nocommons option adds no padding to common blocks. In
	      this case, unaligned data can occur unless the  order  of  data
	      items  specified	in  the  COMMON  statement places the largest
	      numeric data item first, followed by the next  largest  numeric
	      data (and so on), followed by any character data.

	      align dcommons	Aligns	all  common block entities on natural
				boundaries up to 8 bytes, by  adding  padding
				bytes as needed.

	      This  option is useful for applications that use common blocks,
	      unless your application  has  no	unaligned  data  or,  if  the
	      application  might have unaligned data, all data items are four
	      bytes or smaller. For applications that use common blocks where
	      all data items are four bytes or smaller, you can specify align
	      commons  instead of align dcommons.

	      The align nodcommons option adds no padding to common blocks.

	      align qcommons	Aligns all common block entities  on  natural
				boundaries  up to 16 bytes, by adding padding
				bytes as needed.

	      This option is useful for applications that use common  blocks,
	      unless  your  application  has  no  unaligned  data  or, if the
	      application might have unaligned data, all data items are eight
	      bytes or smaller. For applications that use common blocks where
	      all data items are eight bytes  or  smaller,  you  can  specify
	      align dcommons instead of align qcommons.

	      The align noqcommons option adds no padding to common blocks.

	      align norecords	Aligns components of derived types and fields
				within record structures  on  arbitrary  byte
				boundaries with no padding.

	      The  align  records option requests that multiple data items in
	      record  structures  and  derived-type  structures  without  the
	      SEQUENCE	statement  be naturally aligned, by adding padding as
	      needed.

	      align recnbyte	Aligns components of derived types and fields
				within	record	structures  on the smaller of
				the  size  boundary  specified	(n)  or   the
				boundary  that	will  naturally align them. n
				can be 1, 2, 4, 8, or 16.  When  you  specify
				this  option, each structure member after the
				first is stored on either  the	size  of  the
				member	type  or n-byte boundaries, whichever
				is smaller. For example, to specify  2	bytes
				as   the   packing   boundary  (or  alignment
				constraint) for all structures and unions  in
				the file prog1.f, use the following command:

	      ifort {-align rec2byte | /align:rec2byte} prog1.f

	      This option does not affect whether common blocks are naturally
	      aligned or packed.

	      align sequence	Aligns components of a derived type  declared
				with   the   SEQUENCE	statement  (sequenced
				components) according to the alignment	rules
				that   are  currently  in  use.  The  default
				alignment  rules  are  to  align  unsequenced
				components on natural boundaries.

	      The  align nosequence option requests that sequenced components
	      be packed regardless of any other alignment  rules.  Note  that
	      align none implies align nosequence.

	      If you specify an option for standards checking, align sequence
	      is ignored.

	      align all 	Tells  the  compiler  to  add  padding	bytes
				whenever   possible  to  obtain  the  natural
				alignment of data  items  in  common  blocks,
				derived   types,   and	 record   structures.
				Specifies align  nocommons,  align  dcommons,
				align  records, align nosequence. This is the
				same as specifying align with no keyword.

	      Alternate Options:

	      align none	Linux and Mac OS X: -noalign

	      align records	Linux and Mac OS X: -align rec16byte, -Zp16

	      align norecords	Linux and Mac OS X: -Zp1, -align rec1byte

	      align recnbyte	Linux and Mac OS X: -Zp{1|2|4|8|16}

	      align all 	Linux and  Mac	OS  X:	-align	commons-align
				dcommons-align records-align nosequence

       -allow keyword

	      Determines whether the compiler allows certain behaviors.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies the behaviors to allow or disallow.
				Possible values are:

				[no]fpp_comments
					       Determines   how    the	  fpp
					       preprocessor   treats  Fortran
					       end-of-line    comments	   in
					       preprocessor directive lines.

	      Default:

	      fpp_comments	The    compiler    recognizes	Fortran-style
				end-of-line comments in preprocessor lines.

	      Description:

	      This option determines  whether  the  compiler  allows  certain
	      behaviors.

	      Option		Description

	      allow nofpp_comments
				Tells  the compiler to disallow Fortran-style
				end-of-line comments on  preprocessor  lines.
				Comment indicators have no special meaning.

	      Alternate Options:

	      None

       -altparam

       -noaltparam

	      Allows  alternate  syntax  (without  parentheses) for PARAMETER
	      statements.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      altparam		The alternate syntax for PARAMETER statements
				is allowed.

	      Description:

	      This  option  specifies that the alternate syntax for PARAMETER
	      statements is allowed. The alternate syntax is:

	      PARAMETER c = expr [, c = expr] ...

	      This statement assigns a	name  to  a  constant  (as  does  the
	      standard	PARAMETER  statement),	but  there are no parentheses
	      surrounding the assignment list.

	      In this alternative statement, the form of the constant, rather
	      than  implicit  or  explicit typing of the name, determines the
	      data type of the variable.

	      Alternate Options:

	      altparam		Linux  and  Mac  OS  X:  -dps  (this   is   a
				deprecated option)

	      noaltparam	Linux  and  Mac  OS  X:  -nodps  (this	is  a
				deprecated option)

       -ansi-alias

       -no-ansi-alias

	      Tells the compiler  to  assume  that  the  program  adheres  to
	      Fortran Standard type aliasability rules.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -ansi-alias	Programs  adhere  to  Fortran  Standard  type
				aliasability rules.

	      Description:

	      This option tells the  compiler  to  assume  that  the  program
	      adheres  to  type  aliasability  rules  defined  in the Fortran
	      Standard.

	      For example, an object of type real cannot be  accessed  as  an
	      integer.	For  information on the rules for data types and data
	      type constants, see "Data Types, Constants, and  Variables"  in
	      the Language Reference.

	      This option directs the compiler to assume the following:

	      · Arrays are not accessed out of arrays' bounds.

	      · Pointers are not cast to non-pointer types and vice-versa.

	      · References  to	objects  of two different scalar types cannot
		alias. For example, an object of type  integer	cannot	alias
		with  an object of type real or an object of type real cannot
		alias with an object of type double precision.

	      If  your	program  adheres  to  the   Fortran   Standard	 type
	      aliasability   rules,  this  option  enables  the  compiler  to
	      optimize more aggressively.  If  it  doesn't  adhere  to	these
	      rules,  then  you should disable the option with -no-ansi-alias
	      (Linux and Mac OS X) or /Qansi-alias- (Windows) so the compiler
	      does not generate incorrect code.

	      Alternate Options:

	      None

       -assume keyword

	      Tells the compiler to make certain assumptions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies   the   assumptions	to  be	made.
				Possible values are:

				none	       Disables all assume options.

				[no]bscc       Determines     whether	  the
					       backslash character is treated
					       as a C-style control character
					       syntax in character literals.

				[no]buffered_io
					       Determines   whether  data  is
					       immediately written to disk or
					       accumulated in a buffer.

				[no]byterecl   Determines  whether  units for
					       the   OPEN   statement	 RECL
					       specifier    (record   length)
					       value in unformatted files are
					       in    bytes    or    longwords
					       (four-byte units).

				[no]cc_omp     Determines whether conditional
					       compilation  as defined by the
					       OpenMP Fortran API is  enabled
					       or disabled.

				[no]dummy_aliases
					       Determines     whether	  the
					       compiler  assumes  that	dummy
					       arguments  to procedures share
					       memory  locations  with	other
					       dummy arguments or with COMMON
					       variables that are assigned.

				[no]fpe_summary
					       Determines      whether	    a
					       floating-point	   exceptions
					       summary is  displayed  when  a
					       STOP statement is encountered.

				[no]ieee_fpe_flags
					       Determines     whether	  the
					       floating-point  exception  and
					       status	flags  are  saved  on
					       routine entry and restored  on
					       routine exit.

				[no]minus0     Determines     whether	  the
					       compiler uses Fortran 2003  or
					       Fortran	   90/77     standard
					       semantics    in	  the	 SIGN
					       intrinsic  when	treating -0.0
					       and +0.0 as 0.0,  and  how  it
					       writes  the value on formatted
					       output.

				[no]old_boz    Determines whether the binary,
					       octal,	  and	  hexadecimal
					       constant     arguments	   in
					       intrinsic functions INT, REAL,
					       DBLE, and CMPLX are treated as
					       signed integer constants.

				[no]old_ldout_format
					       Determines   the   output   of
					       integer	and  real  values  in
					       list-directed		  and
					       namelist-directed output.

				[no]old_logical_ldio
					       Determines  whether   NAMELIST
					       and list-directed input accept
					       logical	values	for   numeric
					       IO-list items.

				[no]old_maxminloc
					       Determines   the   results  of
					       intrinsics MAXLOC  and  MINLOC
					       when  given  an empty array as
					       an argument.

				[no]old_unit_star
					       Determines  whether  READs  or
					       WRITEs  to  UNIT=* go to stdin
					       or stdout, respectively.

				[no]old_xor    Determines  whether  .XOR.  is
					       defined	by the compiler as an
					       intrinsic operator.

				[no]protect_constants
					       Determines whether a  constant
					       actual  argument  or a copy of
					       it  is  passed  to  a   called
					       routine.

				[no]protect_parens
					       Determines     whether	  the
					       optimizer  honors  parentheses
					       in REAL and COMPLEX expression
					       evaluations	 by	  not
					       reassociating operations.

				[no]realloc_lhs
					       Determines whether allocatable
					       objects on the left-hand  side
					       of  an  assignment are treated
					       according  to   Fortran	 2003
					       rules or Fortran 95/90 rules.

				[no]source_include
					       Determines     whether	  the
					       compiler  searches   for   USE
					       modules	and  INCLUDE files in
					       the default  directory  or  in
					       the directory where the source
					       file is located.

				[no]std_mod_proc_name
					       Determines whether  the	names
					       of   module   procedures   are
					       allowed to conflict with  user
					       external symbol names.

				[no]underscore Determines     whether	  the
					       compiler appends an underscore
					       character      to     external
					       user-defined names.

				[no]2underscores (Linux and Mac OS X)
					       Determines     whether	  the
					       compiler      appends	  two
					       underscore    characters    to
					       external user-defined names.

				[no]writeable-strings
					       Determines  whether  character
					       constants       go	 into
					       non-read-only memory.

	      Default:

	      nobscc		The  backslash	character  is  treated	as  a
				normal character in character literals.

	      nobuffered_io	Data in the internal  buffer  is  immediately
				written  (flushed)  to	disk  (OPEN specifier
				BUFFERED='NO').

				If  you  set  the  FORT_BUFFERED  environment
				variable  to  true,  the  default  is  assume
				buffered_io.

	      nobyterecl	Units for OPEN	statement  RECL  values  with
				unformatted files are in four-byte (longword)
				units.

	      nocc_omp		Conditional compilation  as  defined  by  the
				OpenMP	Fortran API is disabled unless option
				-openmp  (Linux)  or  /Qopenmp	(Windows)  is
				specified.

				If  compiler option -openmp (Linux and Mac OS
				X) or /Qopenmp (Windows)  is  specified,  the
				default is assume cc_omp.

	      nodummy_aliases	Dummy  arguments  to  procedures do not share
				memory locations with other  dummy  arguments
				or   with   variables	shared	 through  use
				association,  host  association,  or   common
				block use.

	      nofpe_summary	Suppresses   a	 summary   of  floating-point
				exceptions from being displayed when  a  STOP
				statement is encountered.

	      noieee_fpe_flags	The  flags are not saved on routine entry and
				they are not restored on routine exit.

	      nominus0		The  compiler  uses  Fortran  90/77  standard
				semantics in the SIGN intrinsic to treat -0.0
				and +0.0 as 0.0, and writes a  value  of  0.0
				with no sign on formatted output.

	      noold_boz 	The  binary,  octal, and hexadecimal constant
				arguments in intrinsic functions  INT,	REAL,
				DBLE,  and  CMPLX  are treated as bit strings
				that represent a value of the  data  type  of
				the  intrinsic,  that  is,  the  bits are not
				converted.

	      old_ldout_format	For  list-directed    and   namelist-directed
				output,  integers  are	written  with a fixed
				width that is dependent on the integer	kind,
				and  zero real values are written using the E
				format.

	      noold_logical_ldio
				Tells  the   compiler	that   NAMELIST   and
				list-directed  input  cannot  accept  logical
				values (T, F,  etc.)  for  numeric  (integer,
				real,  and  complex)  IO-list  items. If this
				option is specified and a  logical  value  is
				given  for  a  numeric	item  in NAMELIST and
				list-directed input, a run-time error will be
				produced.

	      old_maxminloc	MAXLOC	and  MINLOC  return  1	when given an
				empty array as an argument.

	      noold_unit_star	The READs or WRITEs to UNIT=* go to stdin  or
				stdout, respectively, even if UNIT=5 or 6 has
				been connected to another file.

	      old_xor		Intrinsic operator .XOR. is  defined  by  the
				compiler.

	      protect_constants A  constant  actual  argument  is passed to a
				called routine.  Any  attempt  to  modify  it
				results in an error.

	      noprotect_parens	The   optimizer  reorders  REAL  and  COMPLEX
				expressions without regard for parentheses if
				it produces faster executing code.

	      norealloc_lhs	The  compiler  uses  Fortran 95/90 rules when
				interpreting   assignment   statements.   The
				left-hand  side  is  assumed  to be allocated
				with the correct shape to hold the right-hand
				side.  If  it is not, incorrect behavior will
				occur.

	      source_include	The compiler searches  for  USE  modules  and
				INCLUDE  files	in  the  directory  where the
				source file is located.

	      nostd_mod_proc_name
				The  compiler  allows  the  names  of  module
				procedures  to	conflict  with	user external
				symbol names.

	      Windows: nounderscore Linux and Mac OS X: underscore
				On Windows systems,  the  compiler  does  not
				append	an  underscore	character to external
				user-defined names. On Linux  and  Mac	OS  X
				systems,  the  compiler appends an underscore
				character to external user-defined names.

	      no2underscores (Linux and Mac OS X)
				The compiler does not append  two  underscore
				characters  to	external  user-defined	names
				that contain an embedded underscore.

	      nowriteable-strings
				The compiler puts  character  constants  into
				read-only memory.

	      Description:

	      This option specifies assumptions to be made by the compiler.

	      Option		Description

	      assume none	Disables all the assume options.

	      assume bscc	Tells  the  compiler  to  treat the backslash
				character ( as	a  C-style  control  (escape)
				character  syntax  in character literals. The
				"bscc"		   keyword		means
				"BackSlashControlCharacters."

	      assume buffered_io
				Tells the compiler to accumulate records in a
				buffer. This sets  the	default  for  opening
				sequential  output  files  to BUFFERED='YES',
				which  also  occurs  if   the	FORT_BUFFERED
				run-time environment variable is specified.

	      When  this  option is specified, the internal buffer is filled,
	      possibly by many record output statements (WRITE), before it is
	      written  to  disk  by the Fortran run-time system. If a file is
	      opened for direct access, I/O buffering is ignored.

	      Using buffered writes usually makes disk I/O more efficient  by
	      writing  larger blocks of data to the disk less often. However,
	      if you request buffered writes, records not yet written to disk
	      may be lost in the event of a system failure.

	      The  OPEN  statement  BUFFERED  specifier applies to a specific
	      logical unit. In contrast, the  assume  [no]buffered_io  option
	      and the FORT_BUFFERED environment variable apply to all Fortran
	      units.

	      assume byterecl	Specifies  that  the  units  for   the	 OPEN
				statement   RECL  specifier  (record  length)
				value  are  in	bytes  for  unformatted  data
				files,	not  longwords (four-byte units). For
				formatted files, the RECL value is always  in
				bytes.

	      If  a  file is open for unformatted data and assume byterecl is
	      specified, INQUIRE returns RECL in bytes; otherwise, it returns
	      RECL in longwords. An INQUIRE returns RECL in bytes if the unit
	      is not open.

	      assume cc_omp	Enables conditional compilation as defined by
				the   OpenMP   Fortran	API.  That  is,  when
				"!$space"  appears  in	free-form  source  or
				"c$spaces"  appears in column 1 of fixed-form
				source, the rest of the line is accepted as a
				Fortran line.

	      assume dummy_aliases
				Tells	the   compiler	that  dummy  (formal)
				arguments   to	 procedures   share    memory
				locations    with   other   dummy   arguments
				(aliases) or with  variables  shared  through
				use  association, host association, or common
				block use.

	      Specify the option when you compile the called subprogram.  The
	      program  semantics involved with dummy aliasing do not strictly
	      obey the Fortran 95/90 standards and they slow performance,  so
	      you  get	better	run-time  performance  if you do not use this
	      option.

	      However, if a program depends on dummy aliasing and you do  not
	      specify  this option, the run-time behavior of the program will
	      be unpredictable. In such programs, the results will depend  on
	      the  exact  optimizations  that  are  performed. In some cases,
	      normal results will occur, but in  other	cases,	results  will
	      differ  because  the  values used in computations involving the
	      offending aliases will differ.

	      assume fpe_summary
				Causes a summary of floating-point exceptions
				that  occurred during program execution to be
				displayed   when   a   STOP   statement    is
				encountered.  Counts  will  be shown for each
				exception. This is the behavior specified  by
				the Fortran 2003 standard.

	      Note  that  if  there  is  no  STOP  statement,  no  summary is
	      displayed.

	      assume ieee_fpe_flags
				Tells the  compiler  to  save  floating-point
				exception  and	status flags on routine entry
				and restore them on routine exit.

	      This option can slow runtime performance	because  it  provides
	      extra code to save and restore the floating-point exception and
	      status flags (and the rounding mode) on entry to and exit  from
	      every routine compiled with the option.

	      This  option  can  be  used  to  get  the full Fortran Standard
	      behavior of intrinsic modules IEEE EXCEPTIONS, IEEE ARITHMETIC,
	      and IEEE FEATURES, which require that if a flag is signaling on
	      routine entry, the processor will set it to quiet on entry  and
	      restore  it to signaling on return. If a flag signals while the
	      routine is executing, it will not be set to  quiet  on  routine
	      exit.

	      Options  fpe  and  fpe-all can be used to set the initial state
	      for which floating-point exceptions will signal.

	      assume minus0	Tells the compiler to use Fortran 95 standard
				semantics  for	the  treatment	of  the IEEE*
				floating value -0.0 in	the  SIGN  intrinsic,
				which  distinguishes  the  difference between
				-0.0 and +0.0, and to write a value  of  -0.0
				with a negative sign on formatted output.

	      assume old_boz	Tells  the  compiler  that the binary, octal,
				and   hexadecimal   constant   arguments   in
				intrinsic  functions  INT,  REAL,  DBLE,  and
				CMPLX should be  treated  as  signed  integer
				constants.

	      assume noold_ldout_format
				Tells	the  compiler  to  use	Fortran  2003
				standard semantics for	  output  of  integer
				and   real   values   in   list-directed  and
				namelist-directed output.

	      Integers are written using an I0 format with a
				leading blank for spacing.

	      Real and complex values are written using and E
				or F format with a leading blank for spacing.
				The  format  used depends on the magnitude of
				the value. Values that are zero  are  written
				using an F format.

	      assume old_logical_ldio
				Logical values are allowed for numeric items.

	      assume noold_maxminloc
				Tells  the  compiler  that  MAXLOC and MINLOC
				should return 0 when given an empty array  as
				an  argument. Compared to the default setting
				(old_maxminloc),  this	behavior   may	 slow
				performance  because of the extra code needed
				to check for an empty array argument.

	      assume old_unit_star
				Tells the compiler that READs  or  WRITEs  to
				UNIT=*	go  to	whatever  file UNIT=5 or 6 is
				connected.

	      assume noold_xor	Prevents the compiler from defining .XOR.  as
				an  intrinsic  operator.  This	lets  you use
				.XOR. as a user-defined operator. This	is  a
				Fortran 2003 feature.

	      assume noprotect_constants
				Tells  the  compiler  to  pass	a  copy  of a
				constant actual argument. This	copy  can  be
				modified  by  the called routine, even though
				the   Fortran	standard    prohibits	 such
				modification.  The  calling  routine does not
				see any modification to the constant.

	      assume protect_parens
				Tells the optimizer to honor  parentheses  in
				REAL  and  COMPLEX  expression evaluations by
				not reassociating  operations.	For  example,
				(A+B)+C would not be evaluated as A+(B+C).

	      If  assume  noprotect_parens  is	specified,  (A+B)+C  would be
	      treated the same as A+B+C and could be evaluated as A+(B+C)  if
	      it produced faster executing code.

	      Such reassociation could produce different results depending on
	      the sizes and precision of the arguments.

	      For example, in (A+B)+C, if B and C had opposite signs and were
	      very  large in magnitude compared to A, A+B could result in the
	      value as B; adding C would result in 0.0.  With  reassociation,
	      B+C would be 0.0; adding A would result in a non-zero value.

	      assume realloc_lhs
				Tells  the  compiler  that when the left-hand
				side  of  an  assignment  is  an  allocatable
				object, it should be reallocated to the shape
				of the	right-hand  side  of  the  assignment
				before	the  assignment  occurs.  This is the
				Fortran 2003  definition.  This  feature  may
				cause extra overhead at run time.

	      assume nosource_include
				Tells  the  compiler  to  search  the default
				directory for module files specified by a USE
				statement  or  source  files  specified by an
				INCLUDE statement. This  option  affects  fpp
				preprocessor behavior and the USE statement.

	      assume std_mod_proc_name
				Tells  the  compiler  to  revise the names of
				module procedures so  they  do	not  conflict
				with user external symbol names. For example,
				procedure proc in module  m  would  be	named
				m_MP_proc. The Fortran 2003 Standard requires
				that module procedure names not conflict with
				other external symbols.

	      By default, procedure proc in module m
				would	be   named   m_mp_proc,  which	could
				conflict with a  user-defined  external  name
				m_mp_proc.

	      assume underscore Tells  the  compiler  to append an underscore
				character to external user-defined names: the
				main program name, named common blocks, BLOCK
				DATA blocks, global data  names  in  MODULEs,
				and  names  implicitly or explicitly declared
				EXTERNAL.  The	name  of  a  blank  (unnamed)
				common	block  remains	_BLNK__,  and Fortran
				intrinsic names are not affected.

	      assume 2underscores (Linux and Mac OS X)
				Tells the compiler to append  two  underscore
				characters  to	external  user-defined	names
				that contain an embedded underscore: the main
				program name, named common blocks, BLOCK DATA
				blocks, global data  names  in	MODULEs,  and
				names	implicitly   or  explicitly  declared
				EXTERNAL.  The	name  of  a  blank  (unnamed)
				common	block  remains	_BLNK__,  and Fortran
				intrinsic names are not affected.

	      This option does not affect external names that do not  contain
	      an  embedded  underscore. By default, the compiler only appends
	      one underscore to those names.  For  example,  if  you  specify
	      assume   2underscores   for   external   names  my_program  and
	      myprogram,  my_program  becomes  my_program__,  but   myprogram
	      becomes myprogram_.

	      assume writeable-strings
				Tells the compiler to put character constants
				into non-read-only memory.

	      Alternate Options:

	      assume nobscc	Linux and Mac OS X: -nbs

	      assume dummy_aliases
				Linux and Mac OS X: -common-args

	      assume underscore Linux and Mac OS X: -us (this is a deprecated
				option)

	      assume nounderscore
				Linux	and   Mac  OS  X:  -nus  (this	is  a
				deprecated option)

       -auto-scalar

	      Causes scalar  variables	of  intrinsic  types  INTEGER,	REAL,
	      COMPLEX,	and LOGICAL that do not have the SAVE attribute to be
	      allocated to the run-time stack.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -auto-scalar	Scalar variables of intrinsic types  INTEGER,
				REAL,  COMPLEX,  and LOGICAL that do not have
				the  SAVE  attribute  are  allocated  to  the
				run-time   stack.   Note   that   if   option
				recursive, -openmp (Linux and Mac  OS  X)  is
				specified, the default is automatic.

	      Description:

	      This  option causes allocation of scalar variables of intrinsic
	      types INTEGER, REAL,  COMPLEX,  and  LOGICAL  to	the  run-time
	      stack.  It  is  as  if  they  were  declared with the AUTOMATIC
	      attribute.

	      It does not affect  variables  that  have  the  SAVE  attribute
	      (which  include  initialized  locals)  or  that  appear  in  an
	      EQUIVALENCE statement or in a common block.

	      This option may provide a performance gain  for  your  program,
	      but  if your program depends on variables having the same value
	      as the last time the routine was invoked, your program may  not
	      function	properly.  Variables that need to retain their values
	      across subroutine calls should appear in a SAVE statement.

	      You cannot specify option save, auto, or	automatic  with  this
	      option.

	      NOTE:  On  Windows  NT* systems, there is a performance penalty
	      for addressing a stack frame that is too	large.	This  penalty
	      may  be  incurred  with  /automatic,  /auto,  or /Qauto because
	      arrays are allocated on the stack along with scalars.  However,
	      with  /Qauto-scalar, you would have to have more than 32K bytes
	      of local scalar variables before you incurred  the  performance
	      penalty.	/Qauto-scalar  enables	the  compiler  to make better
	      choices about which  variables  should  be  kept	in  registers
	      during program execution.

	      Alternate Options:

	      None

       -axcode

	      Tells  the  compiler  to	generate multiple, processor-specific
	      auto-dispatch code paths for Intel processors  if  there	is  a
	      performance benefit.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      code		Indicates  the	instructions  to be generated
				for   the   set   of   processors   in	 each
				description. The following descriptions refer
				to Intel® Streaming SIMD  Extensions  (Intel®
				SSE)	and   Supplemental   Streaming	 SIMD
				Extensions  (Intel®  SSSE).  Possible  values
				are:

				CORE-AVX2      May  generate  Intel® Advanced
					       Vector  Extensions  2  (Intel®
					       AVX2),	Intel®	AVX,  SSE4.2,
					       SSE4.1, SSSE3, SSE3, SSE2, and
					       SSE  instructions  for  Intel®
					       processors.

				CORE-AVX-I     May generate  Intel®  Advanced
					       Vector	 Extensions   (Intel®
					       AVX),  including  instructions
					       in  Intel®  Core 2™ processors
					       in process technology  smaller
					       than   32nm,  SSE4.2,  SSE4.1,
					       SSSE3,  SSE3,  SSE2,  and  SSE
					       instructions	for    Intel®
					       processors.

				AVX	       May generate  Intel®  Advanced
					       Vector	 Extensions   (Intel®
					       AVX), SSE4.2,  SSE4.1,  SSSE3,
					       SSE3,	 SSE2,	   and	  SSE
					       instructions    for     Intel®
					       processors.

				SSE4.2	       May  generate  Intel®  SSE4.2,
					       SSE4.1, SSSE3, SSE3, SSE2, and
					       SSE   instructions  for	Intel
					       processors.

				SSE4.1	       May  generate  Intel®  SSE4.1,
					       SSSE3,  SSE3,  SSE2,  and  SSE
					       instructions	for	Intel
					       processors.    This   replaces
					       value S, which is deprecated.

				SSSE3	       May  generate  Intel®   SSSE3,
					       SSE3,	 SSE2,	   and	  SSE
					       instructions	for	Intel
					       processors.   For  Mac  OS*  X
					       systems, this  value  is  only
					       supported    on	  Intel®   64
					       architecture.   This  replaces
					       value T, which is deprecated.

				SSE3	       May   generate	Intel®	SSE3,
					       SSE2, and SSE instructions for
					       Intel  processors. For Mac OS*
					       X systems, this value is  only
					       supported       on	IA-32
					       architecture.   This  replaces
					       value P, which is deprecated.

				SSE2	       May  generate  Intel® SSE2 and
					       SSE  instructions  for	Intel
					       processors.  This value is not
					       available   on	Mac   OS*   X
					       systems.  This  replaces value
					       N, which is deprecated.

	      Default:

	      OFF		No   auto-dispatch   code    is    generated.
				Processor-specific  code  is generated and is
				controlled by the setting of compiler options
				-m  and -x (Linux) or compiler option -x (Mac
				OS* X).

	      Description:

	      This  option  tells  the	 compiler   to	 generate   multiple,
	      processor-specific   auto-dispatch   code   paths   for	Intel
	      processors if there is a performance benefit. It also generates
	      a    baseline   code   path.   The   Intel   processor-specific
	      auto-dispatch path is usually more optimized than the  baseline
	      path.  Other options, such as O3, control how much optimization
	      is performed on the baseline path.

	      The baseline  code  path	is  determined	by  the  architecture
	      specified  by  options -m or -x (Linux and Mac OS X) or options
	      /arch or /Qx (Windows). While there are defaults for the -x  or
	      /Qx  option that depend on the operating system being used, you
	      can specify an architecture  and	optimization  level  for  the
	      baseline	code  that  is	higher or lower than the default. The
	      specified   architecture	 becomes   the	 effective    minimum
	      architecture for the baseline code path.

	      If you specify both the -ax and -x options (Linux and Mac OS X)
	      or the /Qax and /Qx options (Windows), the baseline  code  will
	      only execute on Intel® processors compatible with the processor
	      type specified by the -x or /Qx option.

	      If you specify both the -ax and -m options (Linux) or the  /Qax
	      and  /arch options (Windows), the baseline code will execute on
	      non-Intel  processors  compatible  with  the   processor	 type
	      specified by the -m or /arch option.

	      The   -ax   and	/Qax   options	tell  the  compiler  to  find
	      opportunities to generate separate versions of  functions  that
	      take advantage of features of the specified Intel® processor.

	      If  the  compiler  finds	such  an opportunity, it first checks
	      whether generating a processor-specific version of  a  function
	      is likely to result in a performance gain. If this is the case,
	      the compiler generates both a processor-specific version	of  a
	      function	and  a baseline version of the function. At run time,
	      one of the versions is chosen  to  execute,  depending  on  the
	      Intel  processor	in  use. In this way, the program can benefit
	      from performance gains on more advanced Intel processors, while
	      still  working  properly	on  older  processors	and non-Intel
	      processors. A non-Intel processor always executes the  baseline
	      code path.

	      You  can use more than one of the processor values by combining
	      them. For example, you can specify -axSSE4.1,SSSE3  (Linux  and
	      Mac OS X) or /QaxSSE4.1,SSSE3 (Windows). You cannot combine the
	      old style, deprecated options and the new options. For example,
	      you  cannot  specify  -axSSE4.1,T  (Linux  and  Mac  OS  X)  or
	      /QaxSSE4.1,T (Windows).

	      Previous values  W  and  K  are  deprecated.   The  details  on
	      replacements are as follows:

	      · Mac  OS  X  systems:  On  these  systems,  there  is no exact
		replacement for W or K. You can upgrade to the default option
		-msse3	(IA-32	architecture)  or  option  -mssse3 (Intel® 64
		architecture).

	      · Windows and Linux systems: The replacement for	W  is  -msse2
		(Linux)   or   /arch:SSE2   (Windows).	 There	is  no	exact
		replacement for K. However,  on  Windows  systems,  /QaxK  is
		interpreted   as   /arch:IA32;	on  Linux  systems,  -axK  is
		interpreted as -mia32. You can also do one of the following:

		· Upgrade to  option  -msse2  (Linux)  or  option  /arch:SSE2
		  (Windows).   This  will  produce  one  code  path  that  is
		  specialized for Intel® SSE2. It will	not  run  on  earlier
		  processors

		· Specify  the	two option combination -mia32 -axSSE2 (Linux)
		  or /arch:IA32 /QaxSSE2  (Windows).  This  combination  will
		  produce an executable that runs on any processor with IA-32
		  architecture but with an additional specialized Intel® SSE2
		  code path.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's  compilers  may  or may not optimize to the same degree
	      for non-Intel microprocessors for optimizations  that  are  not
	      unique  to  Intel  microprocessors. These optimizations include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel  does  not	guarantee the availability, functionality, or
	      effectiveness  of  any  optimization  on	microprocessors   not
	      manufactured  by	Intel. Microprocessor-dependent optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors.	Certain  optimizations	not specific to Intel
	      microarchitecture  are  reserved	for  Intel   microprocessors.
	      Please  refer  to  the  applicable  product  User and Reference
	      Guides for more information regarding the specific  instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -Bdir

	      Specifies  a  directory that can be used to find include files,
	      libraries, and executables.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the directory to be	used.  If  necessary,
				the   compiler	adds  a  directory  separator
				character at the end of dir.

	      Default:

	      OFF		The  compiler  looks   for   files   in   the
				directories    specified    in	  your	 PATH
				environment variable.

	      Description:

	      This option specifies a directory that  can  be  used  to  find
	      include files, libraries, and executables.

	      The compiler uses dir as a prefix.

	      For include files, the dir is converted to -I/dir/include. This
	      command is added to the front of the  includes  passed  to  the
	      preprocessor.

	      For  libraries, the dir is converted to -L/dir. This command is
	      added to the front of the standard -L inclusions before  system
	      libraries are added.

	      For executables, if dir contains the name of a tool, such as ld
	      or as, the compiler will use it instead of those found  in  the
	      default directories.

	      The  compiler  looks  for  include  files in dir /include while
	      library files are looked for in dir.

	      Alternate Options:

	      None

       -Bdynamic (L*X only)

	      Enables dynamic linking of libraries at run time.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Limited dynamic linking occurs.

	      Description:

	      This option enables dynamic linking of libraries at  run	time.
	      Smaller executables are created than with static linking.

	      This  option is placed in the linker command line corresponding
	      to its location on the  user  command  line.  It	controls  the
	      linking  behavior  of  any  library  that  is  passed using the
	      command line.

	      All libraries on the command line  following  option  -Bdynamic
	      are  linked  dynamically	until  the end of the command line or
	      until a -Bstatic option is  encountered.	The  -Bstatic  option
	      enables static linking of libraries.

	      Alternate Options:

	      None

       -Bstatic (L*X only)

	      Enables static linking of a user's library.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Default static linking occurs.

	      Description:

	      This option enables static linking of a user's library.

	      This  option is placed in the linker command line corresponding
	      to its location on the  user  command  line.  It	controls  the
	      linking  behavior  of  any  library  that  is  passed using the
	      command line.

	      All libraries on the command line following option -Bstatic are
	      linked  statically until the end of the command line or until a
	      -Bdynamic option is encountered. The -Bdynamic  option  enables
	      dynamic linking of libraries.

	      Alternate Options:

	      None

       -Bsymbolic (L*X only)

	      Binds  references  to  all  global  symbols in a program to the
	      definitions within a user's shared library.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		When a program is linked to a shared library,
				it  can  override  the	definition within the
				shared library.

	      Description:

	      This option binds references to all global symbols in a program
	      to the definitions within a user's shared library.

	      This  option  is	only  meaningful on Executable Linkage Format
	      (ELF) platforms that support shared libraries.

	      CAUTION:	This  option  can  have  unintended  side-effects  of
	      disabling symbol preemption in the shared library.

	      Alternate Options:

	      None

       -Bsymbolic-functions (L*X only)

	      Binds references to all global function symbols in a program to
	      the definitions within a user's shared library.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		When a program is linked to a shared library,
				it  can  override  the	definition within the
				shared library.

	      Description:

	      This option binds references to all global function symbols  in
	      a program to the definitions within a user's shared library.

	      This  option  is	only  meaningful on Executable Linkage Format
	      (ELF) platforms that support shared libraries.

	      CAUTION:	This  option  can  have  unintended  side-effects  of
	      disabling symbol preemption in the shared library.

	      Alternate Options:

	      None

       -c

	      Prevents linking.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Linking is performed.

	      Description:

	      This  option  prevents  linking.	Compilation  stops  after the
	      object file is generated.

	      The compiler generates an object file for each  Fortran  source
	      file.

	      Alternate Options:

	      Linux and Mac OS X: None

	      Windows: /compile-only, /nolink

       -ccdefault keyword

	      Specifies  the  type  of	carriage  control used when a file is
	      displayed at a terminal screen.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the	carriage-control  setting  to
				use. Possible values are:

				none	       Tells  the  compiler to use no
					       carriage control processing.

				default        Tells the compiler to use  the
					       default	     carriage-control
					       setting.

				fortran        Tells  the  compiler  to   use
					       normal  Fortran interpretation
					       of the  first  character.  For
					       example,   the	character   0
					       causes output of a blank  line
					       before a record.

				list	       Tells  the  compiler to output
					       one line feed between records.

	      Default:

	      ccdefault default The  compiler  uses  the   default   carriage
				control setting.

	      Description:

	      This  option specifies the type of carriage control used when a
	      file is displayed at a terminal screen  (units  6  and  *).  It
	      provides	the  same  functionality as using the CARRIAGECONTROL
	      specifier in an OPEN statement.

	      The default carriage-control setting can be affected by the vms
	      option.  If  vms	is specified with ccdefault default, carriage
	      control defaults to normal  Fortran  interpretation  (ccdefault
	      fortran)	if the file is formatted and the unit is connected to
	      a terminal. If novms (the default) is specified with  ccdefault
	      default, carriage control defaults to list (ccdefault list).

	      Alternate Options:

	      None

       -check [keyword]

       -nocheck

	      Checks for certain conditions at run time.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the	conditions to check. Possible
				values are:

				none	       Disables all check options.

				[no]arg_temp_created
					       Determines  whether   checking
					       occurs  for  actual  arguments
					       before routine calls.

				[no]bounds     Determines  whether   checking
					       occurs for array subscript and
					       character	    substring
					       expressions.

				[no]format     Determines   whether  checking
					       occurs for the data type of an
					       item   being   formatted   for
					       output.

				[no]output_conversion
					       Determines  whether   checking
					       occurs  for  the  fit  of data
					       items  within   a   designated
					       format descriptor field.

				[no]pointers   Determines   whether  checking
					       occurs	    for       certain
					       disassociated or uninitialized
					       pointers    or	  unallocated
					       allocatable objects.

				[no]uninit     Determines   whether  checking
					       occurs	 for	uninitialized
					       variables.

				all	       Enables all check options.

	      Default:

	      nocheck		No   checking	is   performed	for  run-time
				failures.  Note  that  if   option   vms   is
				specified,  the defaults are check format and
				check output_conversion.

	      Description:

	      This option checks for certain conditions at run time.

	      Option		Description

	      check none	Disables all check options (same as nocheck).

	      check arg_temp_created
				Enables run-time checking on  whether  actual
				arguments  are	copied into temporary storage
				before routine calls. If a copy  is  made  at
				run-time,    an    informative	 message   is
				displayed.

	      check bounds	Enables compile-time  and  run-time  checking
				for  array  subscript and character substring
				expressions. An  error	is  reported  if  the
				expression  is	outside  the dimension of the
				array or the length of the string.

	      For array bounds, each individual dimension  is  checked.   For
	      arrays  that  are  dummy	arguments,  only  the  lower bound is
	      checked for a dimension whose upper bound is specified as *  or
	      where the upper and lower bounds are both 1.

	      For some intrinsics that specify a DIM=
				dimension  argument, such as LBOUND, an error
				is reported if	the  specified	dimension  is
				outside  the declared rank of the array being
				operated upon.

	      Once the program	is  debugged,  omit  this  option  to  reduce
	      executable   program   size   and   slightly  improve  run-time
	      performance.

	      check format	Issues the  run-time  FORVARMIS  fatal	error
				when the data type of an item being formatted
				for  output  does  not	 match	 the   format
				descriptor  being used (for example, a REAL*4
				item formatted with an I edit descriptor).

	      With check noformat, the	data  item  is	formatted  using  the
	      specified  descriptor  unless  the  length  of  the item cannot
	      accommodate the descriptor (for example, it is still  an	error
	      to pass an INTEGER*2 item to an E edit descriptor).

	      check output_conversion
				Issues	the  run-time  OUTCONERR  continuable
				error message when a data item is  too	large
				to  fit  in  a	designated  format descriptor
				field without  loss  of  significant  digits.
				Format truncation occurs, the field is filled
				with asterisks (*), and execution continues.

	      check pointers	Enables run-time checking  for	disassociated
				or     uninitialized	 Fortran    pointers,
				unallocated allocatable objects, and  integer
				pointers that are uninitialized.

	      check uninit	Enables  run-time  checking for uninitialized
				variables. If a variable is read before it is
				written,  a  run-time  error  routine will be
				called.  Only  local  scalar   variables   of
				intrinsic  type  INTEGER,  REAL, COMPLEX, and
				LOGICAL  without  the  SAVE   attribute   are
				checked.

	      check all 	Enables  all  check options. This is the same
				as specifying check with no keyword.

	      To get more detailed location information about where an	error
	      occurred, use option traceback.

	      Alternate Options:

	      check none	Linux and Mac OS X: -nocheck

	      check bounds	Linux and Mac OS X: -CB

	      check uninit	Linux and Mac OS X: -CU

	      check all 	Linux and Mac OS X: -check, -C

       -coarray[=memory] (L*X only)

	      Enables the coarray feature.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      memory		Specifies   the   memory   system  where  the
				coarrays will be implemented. Possible values
				are:

				shared	       Indicates   a   shared  memory
					       system.

				distributed    Indicates a distributed memory
					       system.

	      Default:

	      OFF		Coarrays  are  not enabled without specifying
				this option.

	      Description:

	      This option enables the coarray feature  of  the	Fortran  2008
	      Standard.  It  enables  any coarray syntax in your program.  If
	      this option is not specified, coarray syntax is rejected.

	      It also tells the driver to link against appropriate libraries,
	      and to create the appropriate executables.

	      If you do not specify memory, the default is shared.

	      You  can	specify  option  -coarray-num-images  (Linux*  OS) or
	      /Qcoarray-num-images  (Windows*  OS)  to	specify  the  default
	      number  of images that can be used to run a coarray executable.
	      If you do not specify  that  option,  you  get  the  number  of
	      execution units on the current system.

	      You  can	specify  option  -coarray-config-file  (Linux* OS) or
	      /Qcoarray-config-file (Windows* OS) to specify the  name	of  a
	      Message Passing Interface (MPI) configuration file.

	      Options  –coarray-num-images and –coarray-config-file are valid
	      for both shared and distributed memory systems.

	      Alternate Options:

	      None

       -coarray-config-file=filename (L*X only)

	      Specifies  the  name  of	a  Message  Passing  Interface	(MPI)
	      configuration file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is  the  name  of the MPI configuration file.
				You can specify a path.

	      Default:

	      OFF		When coarrays are enabled, the compiler  uses
				default settings for MPI.

	      Description:

	      This  option  specifies the name of a Message Passing Interface
	      (MPI) configuration file. This file is  used  by	the  compiler
	      when   coarrays  are  processed;	it  configures	the  MPI  for
	      multi-node operations.

	      This option has  no  affect  unless  you	also  specify  option
	      -coarray	(Linux*  OS)  or  /Qcoarray  (Windows*	OS), which is
	      required to create the coarray executable.

	      Note that when a setting is specified in	environment  variable
	      FOR_COARRAY_CONFIG_FILE,	 it  overrides	the  compiler  option
	      setting.

	      Alternate Options:

	      None

       -coarray-num-images=n (L*X only)

	      Specifies the default number of images that can be used to  run
	      a coarray executable.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is the default number of images. The limit is
				determined from the system configuration.

	      Default:

	      OFF		The  number  of  images  is   determined   at
				run-time.

	      Description:

	      This  option specifies the default number of images that can be
	      used to run a coarray executable.

	      This option has  no  affect  unless  you	also  specify  option
	      -coarray (Linux* OS) or /Qcoarray (Windows* OS). This option is
	      required to create the coarray executable.

	      You can  specify	option	–coarray-num-images  (Linux*  OS)  or
	      /Qcoarray-num-images  (Windows*  OS)  to	specify  the  default
	      number of images that can be used to run a coarray  executable.
	      If  you  do  not	specify  that  option,	you get the number of
	      execution units on the current system.

	      Note that when a setting is specified in	environment  variable
	      FOR_COARRAY_NUM_IMAGES,	it   overrides	the  compiler  option
	      setting.

	      Alternate Options:

	      None

       -complex-limited-range

       -no-complex-limited-range

	      Determines whether the use of  basic  algebraic  expansions  of
	      some  arithmetic	operations  involving data of type COMPLEX is
	      enabled.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-complex-limited-range
				Basic algebraic expansions of some arithmetic
				operations involving data of type COMPLEX are
				disabled.

	      Description:

	      This option determines  whether  the  use  of  basic  algebraic
	      expansions of some arithmetic operations involving data of type
	      COMPLEX is enabled.

	      When  the  option  is  enabled,  this  can  cause   performance
	      improvements  in programs that use a lot of COMPLEX arithmetic.
	      However, values at the extremes of the exponent range  may  not
	      compute correctly.

	      Alternate Options:

	      None

       -convert keyword

	      Specifies  the  format  of unformatted files containing numeric
	      data.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the	format	for  the  unformatted
				numeric data. Possible values are:

				native	       Specifies   that   unformatted
					       data should not be converted.

				big_endian     Specifies that the format will
					       be big endian for integer data
					       and    big     endian	 IEEE
					       floating-point  for  real  and
					       complex data.

				cray	       Specifies that the format will
					       be big endian for integer data
					       and CRAY*  floating-point  for
					       real and complex data.

				fdx (Linux, Mac OS X)
					       Specifies that the format will
					       be little endian  for  integer
					       data,	and   VAX   processor
					       floating-point	       format
					       F_floating,   D_floating,  and
					       X_floating   for   real	  and
					       complex data.

				fgx (Linux, Mac OS X)
					       Specifies that the format will
					       be little endian  for  integer
					       data,	and   VAX   processor
					       floating-point	       format
					       F_floating,   G_floating,  and
					       X_floating   for   real	  and
					       complex data.

				ibm	       Specifies that the format will
					       be big endian for integer data
					       and	 IBM*	    System370
					       floating-point format for real
					       and complex data.

				little_endian  Specifies that the format will
					       be little endian  for  integer
					       data  and  little  endian IEEE
					       floating-point  for  real  and
					       complex data.

				vaxd	       Specifies that the format will
					       be little endian  for  integer
					       data,   and   VAX*   processor
					       floating-point	       format
					       F_floating,   D_floating,  and
					       H_floating   for   real	  and
					       complex data.

				vaxg	       Specifies that the format will
					       be little endian  for  integer
					       data,	and   VAX   processor
					       floating-point	       format
					       F_floating,   G_floating,  and
					       H_floating   for   real	  and
					       complex data.

	      Default:

	      convert native	No  conversion	is  performed  on unformatted
				files containing numeric data.

	      Description:

	      This  option  specifies  the  format   of   unformatted	files
	      containing numeric data.

	      Option		Description

	      convert native	Specifies that unformatted data should not be
				converted.

	      convert big_endian
				Specifies that the format will be big  endian
				for   INTEGER*1,   INTEGER*2,  INTEGER*4,  or
				INTEGER*8, and big endian IEEE floating-point
				for   REAL*4,	REAL*8,  REAL*16,  COMPLEX*8,
				COMPLEX*16, or COMPLEX*32.

	      convert cray	Specifies that the format will be big  endian
				for   INTEGER*1,   INTEGER*2,  INTEGER*4,  or
				INTEGER*8,  and  CRAY*	 floating-point   for
				REAL*8 or COMPLEX*16.

	      convert fdx	Specifies  that  the  format  will  be little
				endian for INTEGER*1,  INTEGER*2,  INTEGER*4,
				or     INTEGER*8,     and    VAX    processor
				floating-point format F_floating  for  REAL*4
				or   COMPLEX*8,   D_floating  for  REAL*8  or
				COMPLEX*16, and  X_floating  for  REAL*16  or
				COMPLEX*32.

	      convert fgx	Specifies  that  the  format  will  be little
				endian for INTEGER*1,  INTEGER*2,  INTEGER*4,
				or     INTEGER*8,     and    VAX    processor
				floating-point format F_floating  for  REAL*4
				or   COMPLEX*8,   G_floating  for  REAL*8  or
				COMPLEX*16, and  X_floating  for  REAL*16  or
				COMPLEX*32.

	      convert ibm	Specifies  that the format will be big endian
				for INTEGER*1, INTEGER*2, or  INTEGER*4,  and
				IBM*   System370  floating-point  format  for
				REAL*4 or COMPLEX*8 (IBM short 4) and  REAL*8
				or COMPLEX*16 (IBM long 8).

	      convert little_endian
				Specifies  that  the  format  will  be little
				endian for INTEGER*1,  INTEGER*2,  INTEGER*4,
				or   INTEGER*8	 and   little	endian	 IEEE
				floating-point for REAL*4,  REAL*8,  REAL*16,
				COMPLEX*8, COMPLEX*16, or COMPLEX*32.

	      convert vaxd	Specifies  that  the  format  will  be little
				endian for INTEGER*1,  INTEGER*2,  INTEGER*4,
				or     INTEGER*8,     and    VAX    processor
				floating-point format F_floating  for  REAL*4
				or   COMPLEX*8,   D_floating  for  REAL*8  or
				COMPLEX*16, and  H_floating  for  REAL*16  or
				COMPLEX*32.

	      convert vaxg	Specifies  that  the  format  will  be little
				endian for INTEGER*1,  INTEGER*2,  INTEGER*4,
				or     INTEGER*8,     and    VAX    processor
				floating-point format F_floating  for  REAL*4
				or   COMPLEX*8,   G_floating  for  REAL*8  or
				COMPLEX*16, and  H_floating  for  REAL*16  or
				COMPLEX*32.

	      Alternate Options:

	      None

       -cxxlib[=dir]

       -cxxlib-nostd

       -no-cxxlib

	      Determines  whether  the	compile  links using the C++ run-time
	      libraries  provided by gcc.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is an optional top-level location for the gcc
				binaries and libraries.

	      Default:

	      -no-cxxlib	The   compiler	 uses  the  default  run-time
				libraries and does not link to any additional
				C++ run-time libraries.

	      Description:

	      This  option determines whether the compile links using the C++
	      run-time libraries  provided by gcc.

	      Option -cxxlib-nostd prevents the compiler  from	linking  with
	      the  standard C++ library. It is only useful for mixed-language
	      applications.

	      Alternate Options:

	      None

       -Dname[=value]

	      Defines a symbol name that can be associated with  an  optional
	      value.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      name		Is the name of the symbol.

	      value		Is   an   optional  integer  or  an  optional
				character string delimited by double  quotes;
				for example, Dname=string.

	      Default:

	      noD		Only default symbols or macros are defined.

	      Description:

	      Defines  a  symbol name that can be associated with an optional
	      value. This definition is used during preprocessing.

	      If a value is not specified, name  is defined as "1".

	      If you want to specify more than one definition, you  must  use
	      separate D options.

	      If  you specify noD, all preprocessor definitions apply only to
	      fpp  and	not  to  Intel®   Fortran   conditional   compilation
	      directives.  To  use  this option, you must also specify option
	      fpp.

	      CAUTION: On Linux* and Mac  OS*  X  systems,  if	you  are  not
	      specifying  a  value,  do  not  use D for name, because it will
	      conflict with the -DD option.

	      Alternate Options:

	      D 		Linux*	and  Mac   OS*	 X:   None   Windows:
				/define:name[=value]

	      noD		Linux*	and  Mac  OS*  X:  -nodefine Windows:
				/nodefine

       -debug[keyword]

	      Enables or disables generation of debugging information.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Is the type of debugging  information  to  be
				generated. Possible values are:

				none	       Disables     generation	   of
					       debugging information.

				full or all    Generates  complete  debugging
					       information.

				minimal        Generates      line     number
					       information for debugging.

				[no]emit_column
					       Determines     whether	  the
					       compiler    generates   column
					       number	  information	  for
					       debugging.

				[no]inline-debug-info
					       Determines     whether	  the
					       compiler  generates   enhanced
					       debug  information for inlined
					       code.

				[no]semantic-stepping
					       Determines     whether	  the
					       compiler   generates  enhanced
					       debug information  useful  for
					       breakpoints and stepping.

				[no]variable-locations
					       Determines     whether	  the
					       compiler  generates   enhanced
					       debug  information  useful  in
					       finding	    scalar	local
					       variables.

				extended       Sets	  keyword      values
					       semantic-stepping	  and
					       variable-locations.

				[no]parallel (Linux only)
					       Determines     whether	  the
					       compiler  generates   parallel
					       debug   code  instrumentations
					       useful for thread data sharing
					       and reentrant call detection.

	      For information on the non-default settings for these keywords,
	      see the Description section.

	      Default:

	      -debug none	No debugging information is generated.

	      Description:

	      This  option  enables  or  disables  generation  of   debugging
	      information.

	      Note that if you turn debugging on, optimization is turned off.

	      Keywords		semantic-stepping,	   inline-debug-info,
	      variable-locations, and extended can  be	used  in  combination
	      with   each   other.   If  conflicting  keywords	are  used  in
	      combination, the last one specified on  the  command  line  has
	      precedence.

	      Option		Description

	      -debug none	Disables generation of debugging information.

	      -debug full or -debug all
				Generates  complete debugging information. It
				is the same  as  specifying  -debug  with  no
				keyword.

	      -debug minimal	Generates   line   number   information   for
				debugging.

	      -debug emit_column
				Generates  column  number   information   for
				debugging.

	      -debug inline-debug-info
				Generates   enhanced  debug  information  for
				inlined code.

	      On inlined functions, symbols are (by default) associated  with
	      the caller. This option causes symbols for inlined functions to
	      be associated with the source of the called function.

	      -debug semantic-stepping
				Generates enhanced debug  information  useful
				for  breakpoints  and  stepping. It tells the
				debugger to stop only at machine instructions
				that  achieve  the  final  effect of a source
				statement.

	      For example, in the case of an assignment statement, this might
	      be  a  store  instruction  that  assigns	a  value to a program
	      variable;  for  a  function  call,  it  might  be  the  machine
	      instruction   that   executes   the  call.  Other  instructions
	      generated for those source statements are not displayed  during
	      stepping.

	      This  option  has no impact unless optimizations have also been
	      enabled.

	      -debug variable-locations
				Generates enhanced debug  information  useful
				in  finding scalar local variables. It uses a
				feature of the Dwarf object module  known  as
				"location lists".

	      This  feature  allows  the  run-time  locations of local scalar
	      variables to be specified more accurately; that is, whether, at
	      a  given	position  in  the  code, a variable value is found in
	      memory or a machine register.

	      -debug extended	Sets  keyword  values  semantic-stepping  and
				variable-locations.   It   also   tells   the
				compiler to include  column  numbers  in  the
				line information.

	      -debug parallel	Generates	parallel      debug	 code
				instrumentations needed for the  thread  data
				sharing  and  reentrant call detection of the
				Intel® Parallel Debugger Extension.  For this
				setting  to be effective, option -openmp must
				be set.

	      On  Linux*  systems,  debuggers  read  debug  information  from
	      executable  images.  As  a  result,  information	is written to
	      object files and then added to the executable by the linker.

	      On Mac OS* X systems, debuggers  read  debug  information  from
	      object  files.  As  a result, the executables don't contain any
	      debug information. Therefore, if you want to be able  to	debug
	      on these systems, you must retain the object files.

	      Alternate Options:

	      For -debug full, -debug all, or -debug
				Linux and Mac OS X: -g

	      For -debug inline-debug-info
				Linux  and Mac OS X: -inline-debug-info (this
				is a deprecated option)

	      For -debug variable-locations
				Linux and Mac OS X: -fvar-tracking

	      For -debug semantic-stepping
				Linux	    and       Mac	 OS	   X:
				-fvar-tracking-assignments

       -debug-parameters [keyword]

       -nodebug-parameters

	      Tells the compiler to generate debug information for PARAMETERs
	      used in a program.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Are  the   PARAMETERs	to   generate	debug
				information for. Possible values are:

				none	       Generates no debug information
					       for any PARAMETERs used in the
					       program.  This  is the same as
					       specifying nodebug-parameters.

				used	       Generates  debug   information
					       for  only PARAMETERs that have
					       actually  been  referenced  in
					       the   program.	This  is  the
					       default if you do not  specify
					       a keyword.

				all	       Generates   debug  information
					       for all PARAMETERs defined  in
					       the program.

	      Default:

	      nodebug-parameters
				The  compiler  generates no debug information
				for any PARAMETERs used in the program.  This
				is the same as specifying keywordnone.

	      Description:

	      This  option  tells  the compiler to generate debug information
	      for PARAMETERs used in a program.

	      Note that if a .mod file contains PARAMETERs, debug information
	      is  only	generated  for the PARAMETERs that have actually been
	      referenced in the program, even if you specify keywordall.

	      Alternate Options:

	      None

       -diag-type diag-list

	      Controls the display of diagnostic information.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      type		Is  an	action	to  perform  on  diagnostics.
				Possible values are:

				enable	       Enables	a  diagnostic message
					       or a group of messages.

				disable        Disables a diagnostic  message
					       or a group of messages.

				error	       Tells  the  compiler to change
					       diagnostics to errors.

				warning        Tells the compiler  to  change
					       diagnostics to warnings.

				remark	       Tells  the  compiler to change
					       diagnostics     to     remarks
					       (comments).

	      diag-list 	Is  a  diagnostic group or ID value. Possible
				values are:

				driver	       Specifies diagnostic  messages
					       issued by the compiler driver.

				vec	       Specifies  diagnostic messages
					       issued by the vectorizer.

				par	       Specifies diagnostic  messages
					       issued	       by	  the
					       auto-parallelizer    (parallel
					       optimizer).

				openmp	       Specifies  diagnostic messages
					       issued	 by    the    OpenMP*
					       parallelizer.

				sc[n]	       Enables	   static    security
					       analysis and lets you  specify
					       the    level   of   diagnostic
					       messages issued. n can be  any
					       of the following: 1, 2, 3. For
					       more details on these  values,
					       see   below.   This  value  is
					       equivalent to deprecated value
					       sv[n].

				warn	       Specifies  diagnostic messages
					       that have a "warning" severity
					       level.

				error	       Specifies  diagnostic messages
					       that have an "error"  severity
					       level.

				remark	       Specifies  diagnostic messages
					       that are remarks or comments.

				cpu-dispatch   Specifies  the  CPU   dispatch
					       remarks	   for	   diagnostic
					       messages.  These  remarks  are
					       enabled by default.

				id[,id,...]    Specifies the ID number of one
					       or  more  messages.   If   you
					       specify	more than one message
					       number, they must be separated
					       by  commas.  There  can	be no
					       intervening    white	space
					       between each "id".

				tag[,tag,...]  Specifies the mnemonic name of
					       one or more messages.  If  you
					       specify more than one mnemonic
					       name, they must	be  separated
					       by  commas.  There  can	be no
					       intervening    white	space
					       between each "tag".

				The  diagnostic  messages  generated  can  be
				affected by certain options, such as /arch or
				/Qx  (Windows)	or -m or -x (Linux and Mac OS
				X).

	      Default:

	      OFF		The  compiler	issues	 certain   diagnostic
				messages by default.

	      Description:

	      This  option  controls  the  display of diagnostic information.
	      Diagnostic messages are output to stderr unless compiler option
	      -diag-file  (Linux* and Mac OS* X) or /Qdiag-file (Windows*) is
	      specified.

	      When diag-list  value  "warn"  is  used  with  static  security
	      analysis diagnostics, the following behavior occurs:

	      · Option	 -diag-enable  warn  (Linux)  and  /Qdiag-enable:warn
		(Windows) enable all diagnostics except those  that  have  an
		"error"  severity  level.  They  enable  all  static security
		analysis warnings, cautions, and remarks.

	      · Option -diag-disable  warn  (Linux)  and  /Qdiag-disable:warn
		(Windows)  disable  all  static security analysis diagnostics
		except those  that  have  an  "error"  severity  level.  They
		suppress all static security analysis warnings, cautions, and
		remarks.

	      The following table shows more information on  values  you  can
	      specify for diag-list item sc.

	      To disable  static security analysis, specify /Qdiag-disable:sc
	      (Windows) or option  -diag-disable sc (Linux and Mac OS X).

	      To  control  the	diagnostic  information   reported   by   the
	      vectorizer,  use	the  -vec-report  (Linux  and  Mac  OS	X) or
	      /Qvec-report (Windows) option.

	      To  control  the	diagnostic  information   reported   by   the
	      auto-parallelizer,  use the -par-report (Linux and Mac OS X) or
	      /Qpar-report (Windows) option.

	      Alternate Options:

	      enable vec	Linux and Mac OS X: -vec-report

	      disable vec	Linux and Mac OS X: -vec-report0

	      enable par	Linux and Mac OS X: -par-report

	      disable par	Linux and Mac OS X: -par-report0

       -diag-dump

	      Tells the compiler to print all enabled diagnostic messages and
	      stop compilation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The   compiler	 issues   certain  diagnostic
				messages by default.

	      Description:

	      This option tells the compiler to print all enabled  diagnostic
	      messages	and  stop  compilation.  The  diagnostic messages are
	      output to stdout.

	      This option prints the enabled diagnostics  from	all  possible
	      diagnostics  that the compiler can issue, including any default
	      diagnostics.

	      If   -diag-enablediag-list   (Linux   and   Mac	OS   X)    or
	      /Qdiag-enablediag-list  (Windows)  is  specified, the print out
	      will include the diag-list diagnostics.

	      Alternate Options:

	      None

       -diag-enable sc-include (L*X only)

	      Tells a source code  analyzer  to  process  include  files  and
	      source files when issuing diagnostic messages.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The   compiler	 issues   certain  diagnostic
				messages by default. If the  static  security
				analysis  is  enabled,	include files are not
				analyzed by default.

	      Description:

	      This option tells  the  static  security	analyzer  to  process
	      include	files	and  source  files  when  issuing  diagnostic
	      messages. Normally, when static security	analysis  diagnostics
	      are enabled, only source files are analyzed.

	      To  use  this  option,  you  must  also specify -diag-enable sc
	      (Linux)  or /Qdiag-enable:sc (Windows)  to  enable  the  static
	      security analysis diagnostics.

	      Alternate Options:

	      Linux  and  Mac  OS  X:  -diag-enable  sv-include  (this	is  a
	      deprecated option)

       -diag-error-limitn

       -no-diag-error-limit

	      Specifies  the  maximum  number  of   errors   allowed   before
	      compilation stops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the  maximum  number  of  error-level  or
				fatal-level compiler errors allowed.

	      Default:

	      30		A maximum of 30 error-level  and  fatal-level
				messages are allowed.

	      Description:

	      This  option  specifies  the  maximum  number of errors allowed
	      before compilation stops. It indicates the  maximum  number  of
	      error-level  or  fatal-level compiler errors allowed for a file
	      specified on the command line.

	      If you specify -no-diag-error-limit (Linux and  Mac  OS  X)  or
	      /Qdiag-error-limit-  (Windows) on the command line, there is no
	      limit on the number of errors that are allowed.

	      If the maximum number of errors is reached, a  warning  message
	      is  issued  and  the  next file (if any) on the command line is
	      compiled.

	      Alternate Options:

	      Linux and Mac OS X: -error-limit and -noerror-limit

       -diag-file[=filename] (L*X only)

	      Causes the results of diagnostic analysis to  be	output	to  a
	      file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the file for output.

	      Default:

	      OFF		Diagnostic messages are output to stderr.

	      Description:

	      This  option  causes  the  results of diagnostic analysis to be
	      output to a file. The file is placed  in	the  current  working
	      directory.

	      You  can	include a file extension in filename. For example, if
	      file.txt is specified, the name of the output file is file.txt.
	      If you do not provide a file extension, the name of the file is
	      filename.diag.

	      If  filename  is	not  specified,  the  name  of	the  file  is
	      name-of-the-first-source-file.diag.  This  is  also the name of
	      the file if the name specified for file conflicts with a source
	      file name provided in the command line.

	      NOTE:   If   you	specify  -diag-file  (Linux)  or  /Qdiag-file
	      (Windows) and you also  specify  -diag-file-append  (Linux)  or
	      /Qdiag-file-append  (Windows), the last option specified on the
	      command line takes precedence.

	      Alternate Options:

	      None

       -diag-file-append[=filename] (L*X only)

	      Causes the results of diagnostic analysis to be appended	to  a
	      file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the file to be appended to. It
				can include a path.

	      Default:

	      OFF		Diagnostic messages are output to stderr.

	      Description:

	      This option causes the results of  diagnostic  analysis  to  be
	      appended	to  a  file. If you do not specify a path, the driver
	      will look for filename in the current working directory.

	      If filename is not found, then a new file  with  that  name  is
	      created in the current working directory. If the name specified
	      for file conflicts with a source	file  name  provided  in  the
	      command	  line,     the     name     of     the    file    is
	      name-of-the-first-source-file.diag.

	      NOTE:   If   you	 specify   -diag-file-append	(Linux)    or
	      /Qdiag-file-append  (Windows)  and  you also specify -diag-file
	      (Linux) or /Qdiag-file (Windows), the last option specified  on
	      the command line takes precedence.

	      Alternate Options:

	      None

       -diag-id-numbers

       -no-diag-id-numbers

	      Determines whether the compiler displays diagnostic messages by
	      using their ID number values.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -diag-id-numbers	The compiler displays diagnostic messages  by
				using their ID number values.

	      Description:

	      This option determines whether the compiler displays diagnostic
	      messages by using  their	ID  number  values.  If  you  specify
	      -no-diag-id-numbers  (Linux and Mac OS X) or /Qdiag-id-numbers-
	      (Windows), mnemonic names are  output  for  driver  diagnostics
	      only.

	      Alternate Options:

	      None

       -diag-onceid[,id,...]

	      Tells  the  compiler  to	issue one or more diagnostic messages
	      only once.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      id		Is the ID number of the  diagnostic  message.
				If  you specify more than one message number,
				they must be separated by commas.  There  can
				be  no	intervening  white space between each
				id.

	      Default:

	      OFF		The  compiler	issues	 certain   diagnostic
				messages by default.

	      Description:

	      This  option tells the compiler to issue one or more diagnostic
	      messages only once.

	      Alternate Options:

	      None

       -diag-sc-dir[=dir] (L*X only)

	      Specifies a directory for static security analysis results.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is  the  name  of  the	directory  where  the
				results should be placed.

	      Default:

	      OFF		If   static  security  analysis  is  enabled,
				analysis results are placed  in  the  current
				working  directory.  For  more	details,  see
				below.

	      Description:

	      This option specifies a directory for static security  analysis
	      results.

	      If  you  do  not	specify  dir,  the  results are placed in the
	      current  working	directory.    Results	are   placed   in   a
	      subdirectory with the name rnnnsc, where nnn is replaced by the
	      next available sequence number (001, 002, etc.).

	      NOTE: To use this  option,  you  must  enable  static  security
	      analysis by specifying option –diag-enable sc[n] (Linux* OS) or
	      /Qdiag-enable:sc[n] (Windows* OS).

	      Alternate Options:

	      None

       -d-lines

       -nod-lines

	      Compiles debug statements.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      nod-lines 	Debug lines are treated as comment lines.

	      Description:

	      This option compiles debug statements. It specifies that	lines
	      in  fixed-format	files  that  contain  a  D in column 1 (debug
	      statements) should be treated as source code.

	      Alternate Options:

	      Linux and Mac OS X: -DD

       -double-size size

	      Specifies the default KIND  for  DOUBLE  PRECISION  and  DOUBLE
	      COMPLEX variables.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      size		Specifies   the   default   KIND  for  DOUBLE
				PRECISION and  DOUBLE  COMPLEX	declarations,
				constants,    functions,    and   intrinsics.
				Possible  values  are:	64  (KIND=8)  or  128
				(KIND=16).

	      Default:

	      64		DOUBLE	PRECISION  variables  are  defined as
				REAL*8	and  DOUBLE  COMPLEX  variables   are
				defined as COMPLEX*16.

	      Description:

	      This  option  defines the default KIND for DOUBLE PRECISION and
	      DOUBLE  COMPLEX	declarations,	constants,   functions,   and
	      intrinsics.

	      Option		Description

	      double-size 64	Defines    DOUBLE   PRECISION	declarations,
				constants,  functions,	and   intrinsics   as
				REAL(KIND=8)   (REAL*8)  and  defines  DOUBLE
				COMPLEX    declarations,    functions,	  and
				intrinsics as COMPLEX(KIND=8) (COMPLEX*16).

	      double-size 128	Defines    DOUBLE   PRECISION	declarations,
				constants,  functions,	and   intrinsics   as
				REAL(KIND=16)  (REAL*16)  and  defines DOUBLE
				COMPLEX    declarations,    functions,	  and
				intrinsics as COMPLEX(KIND=16) (COMPLEX*32).

	      Alternate Options:

	      None

       -dryrun

	      Specifies  that  driver  tool  commands should be shown but not
	      executed.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No tool commands  are  shown,  but  they  are
				executed.

	      Description:

	      This option specifies that driver tool commands should be shown
	      but not executed.

	      Alternate Options:

	      None

       -dumpmachine

	      Displays the target machine and operating system configuration.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler does not display target  machine
				or operating system information.

	      Description:

	      This  option  displays  the target machine and operating system
	      configuration. No compilation is performed.

	      Alternate Options:

	      None

       -dynamic-linker file (L*X only)

	      Specifies a dynamic linker other than the default.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      file		Is the name of the dynamic linker to be used.

	      Default:

	      OFF		The default dynamic linker is used.

	      Description:

	      This option lets you specify a dynamic linker  other  than  the
	      default.

	      Alternate Options:

	      None

       -dynamiclib (M*X only)

	      Invokes the libtool command to generate dynamic libraries.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler produces an executable.

	      Description:

	      This  option  invokes  the  libtool command to generate dynamic
	      libraries.

	      When passed this option, the compiler uses the libtool  command
	      to  produce  a  dynamic  library	instead of an executable when
	      linking.

	      To build static libraries, you should specify option -staticlib
	      or libtool -static <objects>.

	      Alternate Options:

	      None

       -dyncom "common1,common2,..."

	      Enables dynamic allocation of common blocks at run time.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      common1,common2,...
				Are  the  names  of  the  common blocks to be
				dynamically allocated. The list of names must
				be within quotes.

	      Default:

	      OFF		Common	blocks	are not dynamically allocated
				at run time.

	      Description:

	      This option enables dynamic allocation of the specified  common
	      blocks  at  run time. For example, to enable dynamic allocation
	      of common blocks a, b, and c at run time, use this syntax:

	      /Qdyncom "a,b,c"	  ! on Windows systems

	      -dyncom "a,b,c"	  ! on Linux and Mac OS X systems

	      The following are some limitations that you should be aware  of
	      when using this option:

	      · An entity in a dynamic common cannot be initialized in a DATA
		statement.

	      · Only named common blocks can be designated as dynamic COMMON.

	      · An entity in a dynamic common block must not be  used  in  an
		EQUIVALENCE  expression  with  an  entity  in a static common
		block or a DATA-initialized variable.

	      Alternate Options:

	      None

       -E

	      Causes the preprocessor to send output to stdout.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Preprocessed source files are output  to  the
				compiler.

	      Description:

	      This  option  causes the preprocessor to send output to stdout.
	      Compilation stops when the files have been preprocessed.

	      When you	specify  this  option,	the  compiler's  preprocessor
	      expands your source module and writes the result to stdout. The
	      preprocessed  source  contains  #line  directives,  which   the
	      compiler uses to determine the source file and line number.

	      Alternate Options:

	      None

       -EP

	      Causes  the  preprocessor  to  send  output to stdout, omitting
	      #line directives.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Preprocessed source files are output  to  the
				compiler.

	      Description:

	      This  option  causes the preprocessor to send output to stdout,
	      omitting #line directives.

	      If you also specify option preprocess-only, option P, or option
	      F,  the  preprocessor  will  write  the  results (without #line
	      directives) to a file instead of stdout.

	      Alternate Options:

	      None

       -extend-source [size]

       -noextend-source

	      Specifies the length of the statement  field  in	a  fixed-form
	      source file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      size		Is  the  length  of  the statement field in a
				fixed-form source file. Possible values  are:
				72, 80, or 132.

	      Default:

	      72		If  you  do  not  specify  this option or you
				specify noextend-source, the statement	field
				ends at column 72.

	      132		If  you  specify  extend_source without size,
				the statement field ends at column 132.-

	      Description:

	      This option specifies the size (column number) of the statement
	      field of a source line in a fixed-form source file. This option
	      is valid only for fixed-form files; it is ignored for free-form
	      files.

	      When size is specified, it is the last column parsed as part of
	      the statement field. Any columns	after  that  are  treated  as
	      comments.

	      If  you  do  not	specify  size,	it  is the same as specifying
	      extend_source 132.

	      Option		Description

	      extend-source 72	Specifies that the statement  field  ends  at
				column 72.

	      extend-source 80	Specifies  that  the  statement field ends at
				column 80.

	      extend-source 132 Specifies that the statement  field  ends  at
				column 132.

	      Alternate Options:

	      extend-source 72	Linux and Mac OS X: -72

	      extend-source 80	Linux and Mac OS X: -80

	      extend-source 132 Linux and Mac OS X: -132

       -Fdir (M*X only)

	      Adds  a  framework  directory  to  the  head of an include file
	      search path.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the name for the framework directory.

	      Default:

	      OFF		The  compiler  does  not  add	a   framework
				directory  to  the  head  of  an include file
				search path.

	      Description:

	      This option adds a  framework  directory	to  the  head  of  an
	      include file search path.

	      Alternate Options:

	      None

       -f66

	      Tells the compiler to apply FORTRAN 66 semantics.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler applies Fortran 95 semantics.

	      Description:

	      This  option  tells  the compiler to apply FORTRAN 66 semantics
	      when interpreting language features. This causes the  following
	      to occur:

	      · DO loops are always executed at least once

	      · FORTRAN  66  EXTERNAL  statement  syntax  and  semantics  are
		allowed

	      · If the	OPEN  statement  STATUS  specifier  is	omitted,  the
		default changes to STATUS='NEW' instead of STATUS='UNKNOWN'

	      · If the OPEN statement BLANK specifier is omitted, the default
		changes to BLANK='ZERO' instead of BLANK='NULL'

	      Alternate Options:

	      Linux and Mac OS X: -1, -66, -onetrip

       -f77rtl

       -nof77rtl

	      Tells the compiler to use the run-time behavior of FORTRAN 77.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      nof77rtl		The compiler uses the  run-time  behavior  of
				Intel® Fortran.

	      Description:

	      This  option tells the compiler to use the run-time behavior of
	      FORTRAN 77.

	      Specifying  this	option	controls   the	 following   run-time
	      behavior:

	      · When  the  unit  is  not  connected  to  a file, some INQUIRE
		specifiers will return different values:

		· NUMBER= returns 0

		· ACCESS= returns 'UNKNOWN'

		· BLANK= returns 'UNKNOWN'

		· FORM= returns 'UNKNOWN'

	      · PAD= defaults to 'NO' for formatted input.

	      · NAMELIST and list-directed input of character strings must be
		delimited by apostrophes or quotes.

	      · When processing NAMELIST input:

		· Column 1 of each record is skipped.

		· The  '$'  or	'&' that appears prior to the group-name must
		  appear in column 2 of the input record.

	      Alternate Options:

	      None

       -Fa[filename|dir]

	      Specifies that an assembly listing file should be generated.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the assembly listing file.

	      dir		Is the directory where	the  file  should  be
				placed. It can include filename.

	      Default:

	      OFF		No assembly listing file is produced.

	      Description:

	      This  option  specifies that an assembly listing file should be
	      generated (optionally named filename).

	      If filename is not specified, the file name will be the name of
	      the  source  file with an extension of .asm; the file is placed
	      in the current directory.

	      Alternate Options:

	      Linux and Mac OS X: -S

	      Windows: /S, /asmfile  (this is a deprecated option)

       -falias

       -fno-alias

	      Determines whether aliasing should be assumed in the program.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-alias	No aliasing is assumed in the program.

	      Description:

	      This option determines whether aliasing should  be  assumed  in
	      the program.

	      If  you  want  aliasing  to  be assumed in the program, specify
	      -falias. However, this may affect performance.

	      Alternate Options:

	      Linux and Mac OS X: None

       -falign-functions[=n]

       -fno-align-functions

	      Tells the compiler  to  align  functions	on  an	optimal  byte
	      boundary.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the byte boundary for function alignment.
				Possible values are 2 or 16.

	      Default:

	      -fno-align-functions
				The  compiler  aligns  functions  on   2-byte
				boundaries.  This  is  the same as specifying
				-falign-functions=2 (Linux and Mac OS X).

	      Description:

	      This option tells the compiler to align functions on an optimal
	      byte boundary. If you do not specify n, the compiler aligns the
	      start of functions on 16-byte boundaries.

	      Alternate Options:

	      None

       -falign-stack=mode

	      Tells the compiler the stack  alignment  to  use	on  entry  to
	      routines.

	      Architectures: IA-32 architecture

	      Arguments:

	      mode		Is  the  method  to  use for stack alignment.
				Possible values are:

				assume-4-byte  Tells the compiler  to  assume
					       the stack is aligned on 4-byte
					       boundaries. The	compiler  can
					       dynamically  adjust  the stack
					       to   16-byte   alignment    if
					       needed.

				maintain-16-byte
					       Tells   the  compiler  to  not
					       assume  any   specific	stack
					       alignment,   but   attempt  to
					       maintain alignment in case the
					       stack  is already aligned. The
					       compiler can dynamically align
					       the   stack  if	needed.  This
					       setting	is  compatible	 with
					       gcc.

				assume-16-byte Tells  the  compiler to assume
					       the  stack   is	 aligned   on
					       16-byte	 boundaries   and  to
					       continue to  maintain  16-byte
					       alignment.   This  setting  is
					       compatible with gcc.

	      Default:

	      -falign-stack=assume-16-byte
				The compiler assumes the stack is aligned  on
				16-byte  boundaries and continues to maintain
				16-byte alignment.

	      Description:

	      This option tells the compiler the stack alignment  to  use  on
	      entry to routines.

	      Note that on Mac OS* X systems, this option is deprecated.

	      Alternate Options:

	      None

       -fast

	      Maximizes speed across the entire program.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The optimizations that maximize speed are not
				enabled.

	      Description:

	      This option maximizes speed across the entire program.

	      It sets the following options:

	      · On  Mac  OS*  X   systems:   -ipo,   -mdynamic-no-pic,	 -O3,
		-no-prec-div,  and  -xHost  On	Windows* systems: /O3, /Qipo,
		/Qprec-div-,  and  /QxHost  On	Linux*	systems:  -ipo,  -O3,
		-no-prec-div, -static, and -xHost

	      When  option  fast is specified, you can override the -xHost or
	      /QxHost setting by specifying a different processor-specific -x
	      or  /Qx  option  on  the command line. However, the last option
	      specified on the command line takes precedence.

	      For example, if you  specify  -fast  -xSSE3  (Linux)  or	/fast
	      /QxSSE3  (Windows),  option  -xSSE3  or  /QxSSE3	takes effect.
	      However, if you specify -xSSE3 -fast (Linux) or  /QxSSE3	/fast
	      (Windows), option -xHost or /QxHost takes effect.

	      For  implications  on  non-Intel processors, refer to the xHost
	      documentation.

	      NOTE: Option fastsets some aggressive  optimizations  that  may
	      not   be	 appropriate  for  all	applications.  The  resulting
	      executable may not run on processor types  different  from  the
	      one  on  which  you  compile.  You  should  make	sure that you
	      understand the individual optimization options that are enabled
	      by option fast.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's  compilers  may  or may not optimize to the same degree
	      for non-Intel microprocessors for optimizations  that  are  not
	      unique  to  Intel  microprocessors. These optimizations include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel  does  not	guarantee the availability, functionality, or
	      effectiveness  of  any  optimization  on	microprocessors   not
	      manufactured  by	Intel. Microprocessor-dependent optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors.	Certain  optimizations	not specific to Intel
	      microarchitecture  are  reserved	for  Intel   microprocessors.
	      Please  refer  to  the  applicable  product  User and Reference
	      Guides for more information regarding the specific  instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -fast-transcendentals

       -no-fast-transcendentals

	      Enables	the  compiler  to  replace  calls  to  transcendental
	      functions with faster but less precise implementations.

	      Architectures: IA-32, Intel® 64 architectures

	      Default:

	      depends on the setting of -fp-model (Linux and Mac OS X)
				If    you    do    not	   specify     option
				-[no-]fast-transcendentals:

				· The  default is ON if option -fp-model fast
				  is specified or is in effect.

				· The default is OFF if a value-safe  setting
				  is   specified   for	 -fp-model  (such  as
				  "precise", "source", etc.).

	      Description:

	      This  option  enables  the  compiler  to	 replace   calls   to
	      transcendental  functions  with  implementations	that  may  be
	      faster but less precise.

	      It allows the compiler  to  perform  certain  optimizations  on
	      transcendental functions, such as replacing individual calls to
	      sine in a loop with a single call to a less precise  vectorized
	      sine library routine.

	      This  option does not affect explicit Short Vector Math Library
	      (SVML)  intrinsics.   It	only  affects  scalar  calls  to  the
	      standard math library routines.

	      You   cannot   use  option  –fast-transcendentals  with  option
	      –fp-model strict.

	      This option determines the setting for  the  maximum  allowable
	      relative error for math library function results (max-error) if
	      none of the following options are specified:

	      · -fimf-accuracy-bits  (Linux*   OS   and   Mac	OS*   X)   or
		/Qimf-accuracy-bits (Windows* OS)

	      · -fimf-max-error  (Linux  OS  and Mac OS X) or /Qimf-max-error
		(Windows OS)

	      · -fimf-precision (Linux OS and Mac OS  X)  or  /Qimf-precision
		(Windows OS)

	      This  option  enables  extra  optimization that only applies to
	      Intel® processors.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's compilers may or may not optimize to  the  same  degree
	      for  non-Intel  microprocessors  for optimizations that are not
	      unique to Intel microprocessors.	These  optimizations  include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel does not guarantee the  availability,  functionality,  or
	      effectiveness   of  any  optimization  on  microprocessors  not
	      manufactured by Intel.  Microprocessor-dependent	optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors. Certain optimizations not  specific  to	Intel
	      microarchitecture   are  reserved  for  Intel  microprocessors.
	      Please refer to  the  applicable	product  User  and  Reference
	      Guides  for more information regarding the specific instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -fasynchronous-unwind-tables

       -fno-asynchronous-unwind-tables

	      Determines  whether  unwind  information	is  precise   at   an
	      instruction boundary or at a call boundary.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      Intel® 64 architecture: -fasynchronous-unwind-tables
				The  unwind table generated is precise at  an
				instruction   boundary,   enabling   accurate
				unwinding at any instruction.

	      IA-32 architecture: -fno-asynchronous-unwind-tables
				The unwind table generated is precise at call
				boundaries only.

	      Description:

	      This option determines whether unwind information is precise at
	      an  instruction  boundary  or  at a call boundary. The compiler
	      generates an unwind table in DWARF2 or DWARF3 format, depending
	      on which format is supported on your system.

	      If  -fno-asynchronous-unwind-tables  is  specified,  the unwind
	      table is precise at call boundaries only.  In  this  case,  the
	      compiler will avoid creating unwind tables for routines such as
	      the following:

	      · A C++ routine that does not declare objects with  destructors
		and  does  not	contain calls to routines that might throw an
		exception.

	      · A C/C++ or Fortran routine compiled without -fexceptions, and
		on Intel® 64 architecture, without -traceback.

	      · A  C/C++  or  Fortran routine compiled with -fexceptions that
		does not contain  calls  to  routines  that  might  throw  an
		exception.

	      Alternate Options:

	      None

       -fcode-asm

	      Produces an assembly listing with machine code annotations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No  machine  code  annotations	appear in the
				assembly listing file, if one is produced.

	      Description:

	      This option produces an assembly listing file with machine code
	      annotations.

	      The assembly listing file shows the hex machine instructions at
	      the beginning of each line of assembly code. The file cannot be
	      assembled; the file name is the name of the source file with an
	      extension of .cod.

	      To use this option, you must  also  specify  option  -S,	which
	      causes an assembly listing to be generated.

	      Alternate Options:

	      Linux and Mac OS X: None

       -fexceptions

       -fno-exceptions

	      Enables exception handling table generation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-exceptions	Exception   handling   table   generation  is
				disabled.

	      Description:

	      This option enables C++ exception  handling  table  generation,
	      preventing Fortran routines in mixed-language applications from
	      interfering with exception handling between C++  routines.  The
	      -fno-exceptions  option  disables  C++ exception handling table
	      generation, resulting in smaller	code.  When  this  option  is
	      used, any use of C++ exception handling constructs (such as try
	      blocks and throw statements) when a Fortran routine is  in  the
	      call chain will produce an error.

	      Alternate Options:

	      None

       -ffnalias

       -fno-fnalias

	      Specifies that aliasing should be assumed within functions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -ffnalias 	Aliasing is assumed within functions.

	      Description:

	      This  option  specifies  that aliasing should be assumed within
	      functions.

	      The -fno-fnalias option specifies that aliasing should  not  be
	      assumed within functions, but should be assumed across calls.

	      Alternate Options:

	      Linux and Mac OS X: None

       -fimf-absolute-error=value[:funclist]

	      Defines  the  maximum allowable absolute error for math library
	      function results.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      value		Is   a	 positive,   floating-point    number
				indicating  the  maximum  allowable  absolute
				error the compiler should use.

				The  format  for  the  number	is   [digits]
				[.digits] [ { e | E }[sign]digits]

	      funclist		Is  an	optional  list	of  one  or more math
				library  functions  to	which  the  attribute
				should	be  applied. If you specify more than
				one function, they  must  be  separated  with
				commas.

	      Default:

	      0 (zero)		The  compiler  uses  default  heuristics when
				calling math library functions.

				An absolute-error setting of 0 means that the
				function  is  bound  by  the  relative	error
				setting.  This is the default behavior.

	      Description:

	      This option defines the maximum allowable  absolute  error  for
	      math library function results.

	      This  option  can  improve  run-time  performance,  but  it may
	      decrease the accuracy of results.

	      This option only affects functions that have zero as a possible
	      return value, such as log, sin, asin, etc.

	      The  relative  error requirements for a particular function are
	      determined by options that set  max-error  and  precision.  The
	      return  value  from  a function must have a relative error less
	      than the max-error value, or an absolute error  less  than  the
	      absolute-error value.

	      NOTE:  Many  routines in libraries LIBM (Math Library) and SVML
	      (Short Vector Math  Library)  are  more  highly  optimized  for
	      Intel® microprocessors than for non-Intel microprocessors.

	      Alternate Options:

	      None

       -fimf-accuracy-bits=bits[:funclist]

	      Defines the relative error for math library function results.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      bits		Is    a   positive,   floating-point   number
				indicating the number  of  correct  bits  the
				compiler should use.

	      funclist		Is  an	optional  list	of  one  or more math
				library  functions  to	which  the  attribute
				should	be  applied. If you specify more than
				one function, they  must  be  separated  with
				commas.

	      Default:

	      OFF		The  compiler  uses  default  heuristics when
				calling math library functions.

	      Description:

	      This option defines the relative error, measured by the  number
	      of correct bits, for math library function results.

	      The following formula is used to convert bits into ulps: ulps =
	      2p-1-bits, where p is the number of the target format  mantissa
	      bits  (24,  53, and 113 for single, double, and quad precision,
	      respectively).

	      This option  can	improve  run-time  performance,  but  it  may
	      decrease the accuracy of results.

	      If  option  -fimf-precision  (Linux*  OS	and  Mac  OS*  X)  or
	      /Qimf-precision  (Windows*  OS),	or   option   -fimf-max-error
	      (Linux*  OS and Mac OS* X) or /Qimf-max-error (Windows* OS), or
	      option  -fimf-accuracy-bits  (Linux  OS  and  Mac  OS*  X)   or
	      /Qimf-accuracy-bits  (Windows  OS)  is  specified,  the default
	      value for max-error is determined by that  option.  If  one  or
	      more  of	these  options	are  specified, the default value for
	      max-error is determined  by  the	last  one  specified  on  the
	      command line.

	      If  none	of these options are specified, the default value for
	      max-error  is  determined  by   the   setting   specified   for
	      option-[no-]fast-transcendentals	(Linux	OS  and  Mac OS X) or
	      /Qfast-transcendentals[-] (Windows OS). If that option also has
	      not  been  specified,  the  default  value is determined by the
	      setting of option -fp-model (Linux OS and  Mac  OS  X)  or  /fp
	      (Windows OS).

	      NOTE:  Many  routines in libraries LIBM (Math Library) and SVML
	      (Short Vector Math  Library)  are  more  highly  optimized  for
	      Intel® microprocessors than for non-Intel microprocessors.

	      Alternate Options:

	      None

       -fimf-arch-consistency=value[:funclist]

	      Ensures  that  the  math	library  functions produce consistent
	      results  across	different   implementations   of   the	 same
	      architecture.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      value		Is  one  of  the  logical  values  "true"  or
				"false".

	      funclist		Is an optional	list  of  one  or  more  math
				library  functions  to	which  the  attribute
				should be applied. If you specify  more  than
				one  function,	they  must  be separated with
				commas.

	      Default:

	      OFF		The compiler  uses  default  heuristics  when
				calling math library functions.

	      Description:

	      This  option  ensures  that  the math library functions produce
	      consistent results across different implementations of the same
	      architecture.

	      If   -fimf-arch-consistency=true	 (Linux  and  Mac  OS  X)  or
	      /Qimf-arch-consistency:true is specified, it  takes  precedence
	      over precision settings in the following options:

	      · -fimf-absolute-error   (Linux*	 OS   and   Mac   OS*  X)  or
		/Qimf-absolute-error (Windows* OS)

	      · -fimf-accuracy-bits   (Linux   OS   and   Mac	OS   X)    or
		/Qimf-accuracy-bits (Windows OS)

	      · -fimf-max-error  (Linux  OS  and Mac OS X) or /Qimf-max-error
		(Windows OS)

	      · -fimf-precision (Linux OS and Mac OS  X)  or  /Qimf-precision
		(Windows OS)

	      The  -fimf-arch-consistency  (Linux*  OS	and  Mac  OS*  X) and
	      /Qimf-arch-consistency  (Windows*  OS)  option   may   decrease
	      run-time	performance,  but  the	option	will provide bit-wise
	      consistent results on all  Intel®  processors  and  compatible,
	      non-Intel  processors,  regardless  of micro-architecture. This
	      option may not  provide  bit-wise  consistent  results  between
	      different  architectures, for example, between IA-32 and Intel®
	      64 architectures.

	      NOTE: Many routines in libraries LIBM (Math Library)  and  SVML
	      (Short  Vector  Math  Library)  are  more  highly optimized for
	      Intel® microprocessors than for non-Intel microprocessors.

	      Alternate Options:

	      None

       -fimf-max-error=ulps[:funclist]

	      Defines the maximum allowable relative error for	math  library
	      function results.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      ulps		Is    a   positive,   floating-point   number
				indicating  the  maximum  allowable  relative
				error  the  compiler  should use.  The format
				for the number is [digits] [.digits] [ { e  |
				E }[sign]digits]

	      funclist		Is  an	optional  list	of  one  or more math
				library  functions  to	which  the  attribute
				should	be  applied. If you specify more than
				one function, they  must  be  separated  with
				commas.

	      Default:

	      OFF		The  compiler  uses  default  heuristics when
				calling math library functions.

	      Description:

	      This option  defines  the  maximum  allowable  relative  error,
	      measured in ulps, for math library function results.

	      This  option  can  improve  run-time  performance,  but  it may
	      decrease the accuracy of results.

	      If  option  -fimf-precision  (Linux*  OS	and  Mac  OS*  X)  or
	      /Qimf-precision	(Windows*   OS),  or  option  -fimf-max-error
	      (Linux* OS and Mac OS* X) or /Qimf-max-error (Windows* OS),  or
	      option   -fimf-accuracy-bits  (Linux  OS	and  Mac  OS*  X)  or
	      /Qimf-accuracy-bits (Windows  OS)  is  specified,  the  default
	      value  for  max-error  is  determined by that option. If one or
	      more of these options are  specified,  the  default  value  for
	      max-error  is  determined  by  the  last	one  specified on the
	      command line.

	      If none of these options are specified, the default  value  for
	      max-error   is   determined   by	 the  setting  specified  for
	      option-[no-]fast-transcendentals (Linux OS and  Mac  OS  X)  or
	      /Qfast-transcendentals[-] (Windows OS). If that option also has
	      not been specified, the default  value  is  determined  by  the
	      setting  of  option  -fp-model  (Linux  OS and Mac OS X) or /fp
	      (Windows OS).

	      NOTE: Many routines in libraries LIBM (Math Library)  and  SVML
	      (Short  Vector  Math  Library)  are  more  highly optimized for
	      Intel® microprocessors than for non-Intel microprocessors.

	      Alternate Options:

	      None

       -fimf-precision[=value[:funclist]]

	      Defines the accuracy for math library functions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      value		Is one of the following values	denoting  the
				desired accuracy:

				high	       This    is    equivalent    to
					       max-error = 0.6.

				medium	       This    is    equivalent    to
					       max-error  =  4;  this  is the
					       default setting if the  option
					       is   specified  and  value  is
					       omitted.

				low	       This    is    equivalent    to
					       accuracy-bits   =  11  if  the
					       value  is  single   precision;
					       accuracy-bits   =  26  if  the
					       value is double precision.

				In the above  explanations,  max-error	means
				option	 -fimf-max-error  (Linux*  OS and Mac
				OS*  X)  or  /Qimf-max-error  (Windows*  OS);
				accuracy-bits		means	       option
				-fimf-accuracy-bits (Linux* OS and Mac OS* X)
				or /Qimf-accuracy-bits (Windows* OS).

	      funclist		Is  an	optional  list	of  one  or more math
				library  functions  to	which  the  attribute
				should	be  applied. If you specify more than
				one function, they  must  be  separated  with
				commas.

	      Default:

	      OFF		The  compiler  uses  default  heuristics when
				calling math library functions.

	      Description:

	      This option defines the accuracy (precision) for	math  library
	      functions.

	      This  option  can  be  used  to improve run-time performance if
	      reduced accuracy is sufficient for the application, or  it  can
	      be used to increase the accuracy of math library functions.

	      In  general,  using  a  lower  precision	can  improve run-time
	      performance and using a higher precision	may  reduce  run-time
	      performance.

	      If  option  -fimf-precision  (Linux*  OS	and  Mac  OS*  X)  or
	      /Qimf-precision  (Windows*  OS),	or   option   -fimf-max-error
	      (Linux*  OS and Mac OS* X) or /Qimf-max-error (Windows* OS), or
	      option  -fimf-accuracy-bits  (Linux  OS  and  Mac  OS*  X)   or
	      /Qimf-accuracy-bits  (Windows  OS)  is  specified,  the default
	      value for max-error is determined by that  option.  If  one  or
	      more  of	these  options	are  specified, the default value for
	      max-error is determined  by  the	last  one  specified  on  the
	      command line.

	      If  none	of these options are specified, the default value for
	      max-error is determined by the  setting  specified  for  option
	      -[no-]fast-transcendentals   (Linux   OS	 and  Mac  OS  X)  or
	      /Qfast-transcendentals[-] (Windows OS). If that option also has
	      not  been  specified,  the  default  value is determined by the
	      setting of option -fp-model (Linux OS and  Mac  OS  X)  or  /fp
	      (Windows OS).

	      NOTE:  Many  routines in libraries LIBM (Math Library) and SVML
	      (Short Vector Math  Library)  are  more  highly  optimized  for
	      Intel® microprocessors than for non-Intel microprocessors.

	      Alternate Options:

	      None

       -finline

       -fno-inline

	      Tells  the  compiler  to	inline	functions declared with cDEC$
	      ATTRIBUTES FORCEINLINE.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-inline	The  compiler  does  not   inline   functions
				declared with cDEC$ ATTRIBUTES FORCEINLINE.

	      Description:

	      This  option  tells  the	compiler to inline functions declared
	      with cDEC$ ATTRIBUTES FORCEINLINE.

	      Alternate Options:

	      None

       -finline-functions

       -fno-inline-functions

	      Enables function inlining for single file compilation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -finline-functions
				Interprocedural optimizations occur. However,
				if you specify -O0, the default is OFF.

	      Description:

	      This   option   enables	function  inlining  for  single  file
	      compilation.

	      It enables the compiler to perform  inline  function  expansion
	      for calls to functions defined within the current source file.

	      The  compiler  applies  a  heuristic  to	perform  the function
	      expansion. To specify the size of the function to be  expanded,
	      use the -finline-limit option.

	      Alternate Options:

	      Linux and Mac OS X: -inline-level=2

       -finline-limit=n

	      Lets you specify the maximum size of a function to be inlined.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Must  be  an integer greater than or equal to
				zero. It is the maximum number of  lines  the
				function   can	have  to  be  considered  for
				inlining.

	      Default:

	      OFF		The compiler  uses  default  heuristics  when
				inlining functions.

	      Description:

	      This  option lets you specify the maximum size of a function to
	      be inlined. The compiler inlines smaller	functions,  but  this
	      option  lets  you  inline  large	functions.  For  example,  to
	      indicate a large function, you could specify 100 or 1000 for n.

	      Note that parts of functions  cannot  be	inlined,  only	whole
	      functions.

	      This option is a modification of the -finline-functions option,
	      whose behavior occurs by default.

	      Alternate Options:

	      None

       -finstrument-functions

       -fno-instrument-functions

	      Determines  whether  routine  entry   and   exit	 points   are
	      instrumented.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-instrument-functions
				Routine   entry   and  exit  points  are  not
				instrumented.

	      Description:

	      This option determines whether routine entry  and  exit  points
	      are instrumented. It may increase execution time.

	      The  following  profiling functions are called with the address
	      of the current routine and the address of where the routine was
	      called (its "call site"):

	      · This function is called upon routine entry:

		·

		  void __cyg_profile_func_enter (void *this_fn,

		  void *call_site);

	      · This function is called upon routine exit:

		·

		  void __cyg_profile_func_exit (void *this_fn,

		  void *call_site);

	      These functions can be used to gather more information, such as
	      profiling information or timing information. Note  that  it  is
	      the user's responsibility to provide these profiling functions.

	      If  you  specify -finstrument-functions (Linux and Mac OS X) or
	      /Qinstrument-functions (Windows), routine inlining is disabled.
	      If      you      specify	    -fno-instrument-functions	   or
	      /Qinstrument-functions-, inlining is not disabled.

	      This option is provided for compatibility with gcc.

	      Alternate Options:

	      None

       -fixed

       -nofixed

	      Specifies source files are in fixed format.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The source file format is determined from the
				file extension.

	      Description:

	      This option specifies source files are in fixed format. If this
	      option is not specified, format is determined as follows:

	      · Files  with  an  extension  of	.f90,  .F90,  or   .i90   are
		free-format source files.

	      · Files  with an extension of .f, .for, .FOR, .ftn, .FTN, .fpp,
		.FPP, or .i are fixed-format files.

	      Note that on Linux and Mac OS X systems, file  names  and  file
	      extensions are case sensitive.

	      Alternate Options:

	      Linux and Mac OS X: -FI

       -fkeep-static-consts

       -fno-keep-static-consts

	      Tells the compiler to preserve allocation of variables that are
	      not referenced in the source.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-keep-static-consts
				If  a  variable  is  never  referenced	in  a
				routine,  the  variable  is  discarded unless
				optimizations  are  disabled  by  option  -O0
				(Linux* OS and Mac OS* X).

	      Description:

	      This  option  tells  the	compiler  to  preserve	allocation of
	      variables that are not referenced in the source.

	      The negated form can be useful when optimizations  are  enabled
	      to reduce the memory usage of static data.

	      Alternate Options:

	      None

       -fltconsistency

       -nofltconsistency

	      Enables improved floating-point consistency.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      nofltconsistency	Improved  floating-point  consistency  is not
				enabled.   This   setting   provides   better
				accuracy  and  run-time  performance  at  the
				expense  of  less  consistent  floating-point
				results.

	      Description:

	      This option enables improved floating-point consistency and may
	      slightly	reduce	execution  speed.  It  limits  floating-point
	      optimizations   and   maintains  declared  precision.  It  also
	      disables inlining of math library functions.

	      Floating-point operations are not reordered and the  result  of
	      each  floating-point operation is stored in the target variable
	      rather than being kept in the floating-point processor for  use
	      in a subsequent calculation.

	      For  example,  the  compiler can change floating-point division
	      computations into  multiplication  by  the  reciprocal  of  the
	      denominator.   This   change   can   alter   the	 results   of
	      floating-point division computations slightly.

	      Floating-point intermediate results are kept in  full  80  bits
	      internal precision. Additionally, all spills/reloads of the X87
	      floating point registers are done using the  internal  formats;
	      this  prevents accidental loss of precision due to spill/reload
	      behavior over which you have no control.

	      Specifying this option has the  following  effects  on  program
	      compilation:

	      · Floating-point user variables are not assigned to registers.

	      · Floating-point arithmetic comparisons conform to IEEE 754.

	      · The exact operations specified in the code are performed. For
		example, division is never changed to multiplication  by  the
		reciprocal.

	      · The  compiler performs floating-point operations in the order
		specified without reassociation.

	      · The  compiler  does   not   perform   constant	 folding   on
		floating-point	values.  Constant folding also eliminates any
		multiplication	by  1,	division  by  1,  and	addition   or
		subtraction of 0. For example, code that adds 0.0 to a number
		is executed exactly as written.  Compile-time  floating-point
		arithmetic  is	not  performed	to ensure that floating-point
		exceptions are also maintained.

	      · Whenever an expression is spilled, it is spilled as  80  bits
		(extended  precision),	not  64 bits (DOUBLE PRECISION). When
		assignments to type REAL and DOUBLE PRECISION are  made,  the
		precision  is  rounded from 80 bits down to 32 bits (REAL) or
		64 bits (DOUBLE PRECISION). When you do not specify /Op,  the
		extra  bits  of  precision are not always rounded away before
		the variable is reused.

	      · Even if vectorization is enabled by the -x (Linux and Mac  OS
		X)  or /Qx (Windows) options, the compiler does not vectorize
		reduction loops (loops computing the dot product)  and	loops
		with  mixed precision types. Similarly, the compiler does not
		enable	certain  loop  transformations.  For   example,   the
		compiler  does	not  transform	reduction  loops  to  perform
		partial summation or loop interchange.

	      This option causes performance degradation  relative  to	using
	      default floating-point optimization flags.

	      On Windows systems, an alternative is to use the /Qprec option,
	      which  should  provide  better  than   default   floating-point
	      precision    while   still   delivering	good   floating-point
	      performance.

	      The  recommended	 method   to   control	 the   semantics   of
	      floating-point  calculations  is to use option -fp-model (Linux
	      and Mac OS X) or /fp (Windows).

	      Alternate Options:

	      fltconsistency	Linux and Mac OS X: -mp (this is a deprecated
				option), -mieee-fp

	      nofltconsistency	Linux and Mac OS X: -mno-ieee-fp

       -fma

       -no-fma

	      Determines  whether  the	compiler generates fused multiply-add
	      (FMA) instructions if such instructions  exist  on  the  target
	      processor.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fma		If  the  instructions  exist  on  the  target
				processor,  the  compiler   generates	fused
				multiply-add (FMA) instructions.

				However,  if  you  specify  -fp-model  strict
				(Linux*  OS  and  Mac  OS*  X),  but  do  not
				explicitly   specify  -fma,  the  default  is
				-no-fma.

	      Description:

	      This option determines whether  the  compiler  generates	fused
	      multiply-add  (FMA)  instructions if such instructions exist on
	      the target processor. When -fma (Linux OS  and  Mac  OS  X)  or
	      /Qfma (Windows* OS) is specified, the compiler may generate FMA
	      instructions for combining multiply and  add  operations.  When
	      -no-fma  (Linux	OS  and  Mac OS X) or /Qfma- (Windows* OS) is
	      specified, the compiler must generate separate multiply and add
	      instructions with intermediate rounding.

	      This option has no effect unless setting CORE-AVX2 or higher is
	      specified for option -x  (Linux	OS  and  Mac  OS  X)  or  /Qx
	      (Windows	OS),   or  options  -march (Linux OS and Mac OS X) or
	      /arch (Windows OS).

       -fmath-errno

       -fno-math-errno

	      Tells the compiler that errno  can  be  reliably	tested	after
	      calls to standard math library functions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-math-errno	The  compiler  assumes	that the program does
				not test errno after calls to  standard  math
				library functions.

	      Description:

	      This option tells the compiler to assume that the program tests
	      errno after calls to math  library  functions.  This  restricts
	      optimization  because it causes the compiler to treat most math
	      functions as having side effects.

	      Option -fno-math-errno tells the compiler to  assume  that  the
	      program  does  not  test	errno  after  calls  to  math library
	      functions. This frequently  allows  the  compiler  to  generate
	      faster code. Floating-point code that relies on IEEE exceptions
	      instead of errno to detect errors can safely use this option to
	      improve performance.

	      Alternate Options:

	      None

       -fmerge-debug-strings (L*X only)

       -fno-merge-debug-strings (L*X only)

	      Causes   the   compiler  to  pool  strings  used	in  debugging
	      information.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-merge-debug-strings
				The compiler does not pool  strings  used  in
				debugging information.

	      Description:

	      This  option  causes  the  compiler  to  pool  strings  used in
	      debugging information. The  linker  will	automatically  retain
	      this pooling.

	      This  option  can  reduce the size of debug information, but it
	      may produce slightly slower compile and link times.

	      When using this option, we recommend you use  binutils  version
	      2.17 or later.

	      Alternate Options:

	      None

       -fminshared

	      Specifies  that  a  compilation  unit  is a component of a main
	      program and should not be linked as part of a shareable object.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Source files are compiled together to form  a
				single object file.

	      Description:

	      This option specifies that a compilation unit is a component of
	      a main program and should not be linked as part of a  shareable
	      object.

	      This  option  allows  the  compiler  to  optimize references to
	      defined symbols without special visibility settings. To  ensure
	      that  external  and common symbol references are optimized, you
	      need to specify visibility hidden or  protected  by  using  the
	      -fvisibility,  -fvisibility-hidden,  or  -fvisibility-protected
	      option.

	      Also,   the   compiler	does	not    need    to    generate
	      position-independent  code  for  the  main  program. It can use
	      absolute addressing, which may reduce the size  of  the  global
	      offset table (GOT) and may reduce memory traffic.

	      Alternate Options:

	      None

       -fomit-frame-pointer

       -fno-omit-frame-pointer

	      Determines whether EBP is used as a general-purpose register in
	      optimizations.

	      Architectures:  -f[no-]omit-frame-pointer:  IA-32,  Intel®   64
	      architectures/Oy[-]: IA-32 architecture

	      Arguments:

	      None

	      Default:

	      -fomit-frame-pointer
				EBP  is used as a general-purpose register in
				optimizations. However, on Linux* and Mac OS*
				X      systems,      the      default	   is
				-fno-omit-frame-pointer if option -O0  or  -g
				is specified.

	      Description:

	      These   options	determine   whether   EBP   is	 used	as  a
	      general-purpose	 register    in    optimizations.     Options
	      -fomit-frame-pointer   and   /Oy	 allow	 this	use.  Options
	      -fno-omit-frame-pointer and /Oy- disallow it.

	      Some debuggers expect EBP to be used as a stack frame  pointer,
	      and  cannot  produce  a  stack backtrace unless this is so. The
	      -fno-omit-frame-pointer and /Oy- options direct the compiler to
	      generate	code  that  maintains  and  uses EBP as a stack frame
	      pointer for all functions so that a debugger can still  produce
	      a stack backtrace without doing the following:

	      · For  -fno-omit-frame-pointer:  turning off optimizations with
		-O0

	      · For /Oy-: turning off /O1, /O2, or /O3 optimizations

	      The -fno-omit-frame-pointer option  is  set  when  you  specify
	      option -O0 or the -g option. The -fomit-frame-pointer option is
	      set when you specify option -O1, -O2, or -O3.

	      The /Oy option is set when you specify the  /O1,	/O2,  or  /O3
	      option. Option /Oy- is set when you specify the /Od option.

	      Using  the  -fno-omit-frame-pointer  or /Oy- option reduces the
	      number of available general-purpose registers  by  1,  and  can
	      result in slightly less efficient code.

	      Alternate Options:

	      Linux and Mac OS X: -fp (this is a deprecated option)

       -fp-model keyword

	      Controls the semantics of floating-point calculations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the semantics to be used. Possible
				values are:

				precise        Enables		   value-safe
					       optimizations		   on
					       floating-point data and rounds
					       intermediate	results    to
					       source-defined precision.

				fast[=1|2]     Enables	  more	   aggressive
					       optimizations		   on
					       floating-point data.

				strict	       Enables	precise  and  except,
					       disables   contractions,   and
					       enables	the   property	 that
					       allows	modification  of  the
					       floating-point environment.

				source	       Rounds intermediate results to
					       source-defined  precision  and
					       enables		   value-safe
					       optimizations.

				[no-]except (Linux and Mac OS X) or except[-]
				(Windows)
					       Determines	      whether
					       floating-point	    exception
					       semantics are used.

	      Default:

	      -fp-model fast=1	The    compiler    uses    more    aggressive
				optimizations on floating-point calculations.

	      Description:

	      This   option   controls	 the   semantics   of  floating-point
	      calculations.

	      The keywords can be considered in groups:

	      · Group A: precise, fast, strict

	      · Group B: source

	      · Group C: except (or the negative form)

	      You can use more than one keyword. However, the following rules
	      apply:

	      · You  cannot  specify  fast  and  except  together in the same
		compilation. You can specify any other combination  of	group
		A,  group B, and group C. Since fast is the default, you must
		not specify except without a group A or group B keyword.

	      · You should specify only one keyword from group A and only one
		keyword  from	group  B. If you try to specify more than one
		keyword from either group A or group B, the last  (rightmost)
		one takes effect.

	      · If  you  specify  except more than once, the last (rightmost)
		one takes effect.

	      The  floating-point  (FP)  environment  is  a   collection   of
	      registers  that control the behavior of FP machine instructions
	      and  indicate  the  current  FP  status.	 The   floating-point
	      environment   may  include  rounding-mode  controls,  exception
	      masks, flush-to-zero  controls,  exception  status  flags,  and
	      other floating-point related features.

	      Option		Description

	      -fp-model precise or /fp:precise
				Tells  the  compiler  to  strictly  adhere to
				value-safe  optimizations  when  implementing
				floating-point	 calculations.	 It  disables
				optimizations that can change the  result  of
				floating-point	calculations. These semantics
				ensure	 the   accuracy   of   floating-point
				computations, but they may slow performance.

	      The  compiler  assumes  the default floating-point environment;
	      you are not allowed to modify it.

	      IA-32 architecture: Windows: Double; Linux: Extended; Mac OS X:
	      Extended

	      Intel® 64 architecture: All operating systems: Source

	      Floating-point  exception semantics are disabled by default. To
	      enable these semantics, you must also specify -fp-model  except
	      or /fp:except.

	      -fp-model fast[=1|2] or /fp:fast[=1|2]
				Tells  the  compiler  to  use more aggressive
				optimizations	     when	 implementing
				floating-point	     calculations.	These
				optimizations increase speed, but  may	alter
				the accuracy of floating-point computations.

	      Specifying  fast	is  the same as specifying fast=1. fast=2 may
	      produce faster and less accurate results.

	      Floating-point exception semantics are disabled by default  and
	      they  cannot  be	enabled  because  you cannot specify fast and
	      except together in the same compilation.	To  enable  exception
	      semantics,  you  must  explicitly  specify another keyword (see
	      other keyword descriptions for details).

	      -fp-model strict or /fp:strict
				Tells the  compiler  to  strictly  adhere  to
				value-safe  optimizations  when  implementing
				floating-point	 calculations	and   enables
				floating-point	exception  semantics. This is
				the strictest floating-point model.

	      The  compiler  does  not	assume	the  default   floating-point
	      environment; you are allowed to modify it.

	      Floating-point   exception   semantics   can   be  disabled  by
	      explicitly specifying -fp-model no-except or /fp:except-.

	      -fp-model source or /fp:source
				This option causes intermediate results to be
				rounded  to  the  precision  defined  in  the
				source code. It also implies keyword  precise
				unless	it  is	overridden  by a keyword from
				Group A.

	      long  double:  64-bit  precision;  80-bit  data  type;   15-bit
	      exponent

	      double: 53-bit precision; 64-bit data type; 11-bit exponent; on
	      Windows systems using IA-32 architecture, the exponent  may  be
	      15-bit if an x87 register is used to hold the value.

	      float: 24-bit precision; 32-bit data type; 8-bit exponent

	      The  compiler  assumes  the default floating-point environment;
	      you are not allowed to modify it.

	      This option determines the setting for  the  maximum  allowable
	      relative error for math library function results (max-error) if
	      none of the following options are specified:

	      · -fimf-accuracy-bits  (Linux*   OS   and   Mac	OS*   X)   or
		/Qimf-accuracy-bits (Windows* OS)

	      · -fimf-max-error  (Linux  OS  and Mac OS X) or /Qimf-max-error
		(Windows OS)

	      · -fimf-precision (Linux OS and Mac OS  X)  or  /Qimf-precision
		(Windows OS)

	      · -[no-]fast-transcendentals   (Linux  OS  and  Mac  OS  X)  or
		/Qfast-transcendentals[-] (Windows OS)

	      NOTE: This option cannot be used to change the default (source)
	      precision for the calculation of intermediate results.

	      NOTE:   On   Windows  and  Linux	operating  systems  on	IA-32
	      architecture,    the   compiler,	 by    default,    implements
	      floating-point (FP) arithmetic using SSE2 and SSE instructions.
	      This can	cause  differences  in	floating-point	results  when
	      compared to previous x87 implementations.

	      This  option  enables  extra  optimization that only applies to
	      Intel® processors.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's compilers may or may not optimize to  the  same  degree
	      for  non-Intel  microprocessors  for optimizations that are not
	      unique to Intel microprocessors.	These  optimizations  include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel does not guarantee the  availability,  functionality,  or
	      effectiveness   of  any  optimization  on  microprocessors  not
	      manufactured by Intel.  Microprocessor-dependent	optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors. Certain optimizations not  specific  to	Intel
	      microarchitecture   are  reserved  for  Intel  microprocessors.
	      Please refer to  the  applicable	product  User  and  Reference
	      Guides  for more information regarding the specific instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -fp-port

       -no-fp-port

	      Rounds floating-point results after floating-point operations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-fp-port	The default rounding behavior depends on  the
				compiler's  code generation decisions and the
				precision parameters of the operating system.

	      Description:

	      This option rounds floating-point results after  floating-point
	      operations.  Rounding  to  user-specified  precision  occurs at
	      assignments and type  conversions.  This	has  some  impact  on
	      speed.

	      The  default is to keep results of floating-point operations in
	      higher precision. This provides  better  performance  but  less
	      consistent floating-point results.

	      Alternate Options:

	      None

       -fp-speculation=mode

	      Tells   the   compiler  the  mode  in  which  to	speculate  on
	      floating-point operations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      mode		Is the mode  for  floating-point  operations.
				Possible values are:

				fast	       Tells	the    compiler    to
					       speculate  on   floating-point
					       operations.

				safe	       Tells  the compiler to disable
					       speculation  if	there  is   a
					       possibility	that	  the
					       speculation   may   cause    a
					       floating-point exception.

				strict	       Tells  the compiler to disable
					       speculation on  floating-point
					       operations.

				off	       This is the same as specifying
					       strict.

	      Default:

	      -fp-speculation=fast
				The  compiler  speculates  on  floating-point
				operations.  This  is  also the behavior when
				optimizations are enabled.  However,  if  you
				specify  no optimizations (-O0 on Linux* OS),
				the default is	-fp-speculation=safe  (Linux*
				OS).

	      Description:

	      This  option  tells the compiler the mode in which to speculate
	      on floating-point operations.

	      Alternate Options:

	      None

       -fp-stack-check

	      Tells the compiler to generate extra code after every  function
	      call to ensure that the floating-point stack is in the expected
	      state.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		There is  no  checking	to  ensure  that  the
				floating-point	(FP) stack is in the expected
				state.

	      Description:

	      This option tells the compiler to  generate  extra  code	after
	      every  function  call  to  ensure  that the floating-point (FP)
	      stack is in the expected state.

	      By default,  there  is  no  checking.  So  when  the  FP	stack
	      overflows,  a  NaN  value  is  put into FP calculations and the
	      program's results differ. Unfortunately, the overflow point can
	      be  far  away  from  the	point  of the actual bug. This option
	      places  code  that  causes  an   access	violation   exception
	      immediately  after  an  incorrect  call  occurs, thus making it
	      easier to locate these issues.

	      Alternate Options:

	      None

       -fpconstant

       -nofpconstant

	      Tells the compiler that single-precision constants assigned  to
	      double-precision	 variables  should  be	evaluated  in  double
	      precision.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      nofpconstant	Single-precision   constants   assigned    to
				double-precision  variables  are evaluated in
				single precision according  to	Fortran  2003
				Standard rules.

	      Description:

	      This  option tells the compiler that single-precision constants
	      assigned to double-precision variables should be	evaluated  in
	      double precision.

	      This is extended precision. It does not comply with the Fortran
	      2003 standard, which requires that  single-precision  constants
	      assigned	to  double-precision variables be evaluated in single
	      precision.

	      It allows compatibility with FORTRAN 77,	where  such  extended
	      precision  was  allowed.	If  this  option is not used, certain
	      programs originally created for FORTRAN 77 compilers  may  show
	      different  floating-point  results  because  they  rely  on the
	      extended precision for single-precision constants  assigned  to
	      double-precision variables.

	      Alternate Options:

	      None

       -fpen

	      Allows  some control over floating-point exception handling for
	      the main program at run-time.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Specifies   the   floating-point    exception
				handling level. Possible values are:

				0	       Floating-point	     invalid,
					       divide-by-zero,	and  overflow
					       exceptions are enabled. If any
					       such	exceptions     occur,
					       execution  is  aborted.	 This
					       option	causes	 denormalized
					       floating-point  results	to be
					       set to zero. Underflow results
					       will  also  be  set  to	zero,
					       unless you  override  this  by
					       explicitly  specifying  option
					       -no-ftz or  -fp-model  precise
					       (Linux and Mac OS X) or option
					       /Qftz-	  or	  /fp:precise
					       (Windows).

					       Underflow   results  from  SSE
					       instructions, as well  as  x87
					       instructions,  will  be set to
					       zero. By contrast, option -ftz
					       or   /Qftz   only   sets   SSE
					       underflow results to zero.

					       To get more detailed  location
					       information  about  where  the
					       error  occurred,  use   option
					       traceback.

				1	       All  floating-point exceptions
					       are disabled.

					       Underflow  results  from   SSE
					       instructions,  as  well as x87
					       instructions, will be  set  to
					       zero.

				3	       All  floating-point exceptions
					       are  disabled.  Floating-point
					       underflow  is  gradual, unless
					       you   explicitly   specify   a
					       compiler  option  that enables
					       flush-to-zero, such as -ftz or
					       /Qftz, O3, or O2. This setting
					       provides full IEEE support.

	      Default:

	      -fpe3		All floating-point exceptions  are  disabled.
				Floating-point	underflow  is gradual, unless
				you explicitly specify a compiler option that
				enables flush-to-zero.

	      Description:

	      This  option  allows some control over floating-point exception
	      handling for  the  main  program	at  run-time.  This  includes
	      whether  exceptional  floating-point values are allowed and how
	      precisely run-time exceptions are reported.

	      The  fpe	option	affects  how  the  following  conditions  are
	      handled:

	      · When  floating-point calculations result in a divide by zero,
		overflow, or invalid operation.

	      · When floating-point calculations result in an underflow.

	      · When  a  denormalized  number  or  other  exceptional  number
		(positive  infinity,  negative infinity, or a NaN) is present
		in an arithmetic expression.

	      When enabled exceptions occur, execution	is  aborted  and  the
	      cause  of  the  abort  reported to the user. If compiler option
	      traceback is specified at compile  time,	detailed  information
	      about the location of the abort is also reported.

	      This   option  does  not	enable	underflow  exceptions,	input
	      denormal exceptions, or inexact exceptions.

	      Alternate Options:

	      None

       -fpe-all=n

	      Allows some control over floating-point exception handling  for
	      each routine in a program at run-time.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Specifies    the   floating-point   exception
				handling level. Possible values are:

				0	       Floating-point	     invalid,
					       divide-by-zero,	and  overflow
					       exceptions are enabled. If any
					       such	exceptions     occur,
					       execution  is  aborted.	 This
					       option  sets  the  -ftz (Linux
					       and  Mac  OS   X)   or	/Qftz
					       (Windows)   option;  therefore
					       underflow results will be  set
					       to  zero unless you explicitly
					       specify -no-ftz (Linux and Mac
					       OS X) or /Qftz- (Windows).

					       Underflow   results  from  SSE
					       instructions, as well  as  x87
					       instructions,  will  be set to
					       zero. By contrast, option -ftz
					       or   /Qftz   only   sets   SSE
					       underflow results to zero.

					       To get more detailed  location
					       information  about  where  the
					       error  occurred,  use   option
					       traceback.

				1	       All  floating-point exceptions
					       are disabled.

					       Underflow  results  from   SSE
					       instructions,  as  well as x87
					       instructions, will be  set  to
					       zero.

				3	       All  floating-point exceptions
					       are  disabled.  Floating-point
					       underflow  is  gradual, unless
					       you   explicitly   specify   a
					       compiler  option  that enables
					       flush-to-zero, such as -ftz or
					       /Qftz, O3, or O2. This setting
					       provides full IEEE support.

	      Default:

	      -fpe-all=3  or the setting of fpe that  the  main  program  was
	      compiled with
				All  floating-point  exceptions are disabled.
				Floating-point underflow is  gradual,  unless
				you explicitly specify a compiler option that
				enables flush-to-zero.

	      Description:

	      This option allows some control over  floating-point  exception
	      handling	for  each  routine  in	a  program  at run-time. This
	      includes whether exceptional floating-point values are  allowed
	      and how precisely run-time exceptions are reported.

	      The  fpe-all  option  affects  how the following conditions are
	      handled:

	      · When floating-point calculations result in a divide by	zero,
		overflow, or invalid operation.

	      · When floating-point calculations result in an underflow.

	      · When  a  denormalized  number  or  other  exceptional  number
		(positive infinity, negative infinity, or a NaN)  is  present
		in an arithmetic expression.

	      The current settings of the floating-point exception and status
	      flags are saved on each routine  entry  and  restored  on  each
	      routine exit. This may incur some performance overhead.

	      When  option  fpe-all  is applied to a main program, it has the
	      same affect as when option fpe is applied to the main program.

	      When enabled exceptions occur, execution	is  aborted  and  the
	      cause  of  the  abort  reported to the user. If compiler option
	      traceback is specified at compile  time,	detailed  information
	      about the location of the abort is also reported.

	      This   option  does  not	enable	underflow  exceptions,	input
	      denormal exceptions, or inexact exceptions.

	      Option fpe-all sets option assume ieee_fpe_flags.

	      Alternate Options:

	      None

       -fpic

       -fno-pic

	      Determines whether the compiler generates  position-independent
	      code.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-pic		The	compiler     does     not    generate
				position-independent code.

	      Description:

	      This  option  determines	 whether   the	 compiler   generates
	      position-independent code.

	      Option  -fpic  specifies	full symbol preemption. Global symbol
	      definitions as well as global  symbol  references  get  default
	      (that  is,  preemptable) visibility unless explicitly specified
	      otherwise.

	      Option -fpic must be used when building shared objects.

	      This option can also be specified as -fPIC.

	      Alternate Options:

	      None

       -fpie (L*X only)

	      Tells the compiler to generate position-independent  code.  The
	      generated code can only be linked into executables.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The	compiler     does     not    generate
				position-independent	 code	  for	   an
				executable-only object.

	      Description:

	      This option tells the compiler to generate position-independent
	      code. It is similar to -fpic, but code generated by  -fpie  can
	      only be linked into an executable.

	      Because  the  object  is linked into an executable, this option
	      causes better optimization of some symbol references.

	      To ensure that run-time libraries are set up properly  for  the
	      executable, you should also specify option -pie to the compiler
	      driver on the link command line.

	      Option -fpie can also be specified as -fPIE.

	      Alternate Options:

	      None

       fpp[n]

       fpp[="option"]

       -nofpp

	      Runs  the  Fortran  preprocessor	 on   source   files   before
	      compilation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Deprecated. Tells the compiler whether to run
				the preprocessor or not. Possible values are:

				0	       Tells the compiler not to  run
					       the preprocessor.

				1, 2, or 3     Tells  the compiler to run the
					       preprocessor.

	      option		Is a Fortran preprocessor (fpp)  option;  for
				example,  "-macro=no",	which  disables macro
				expansion.  The quotes are  required.  For  a
				list of fpp options, see Fortran Preprocessor
				Options.

	      Default:

	      nofpp		The Fortran preprocessor is not run on	files
				before compilation.

	      Description:

	      This  option  runs  the  Fortran	preprocessor  on source files
	      before they are compiled.

	      If the option is specified with no argument, the compiler  runs
	      the preprocessor.

	      If  0  is specified for n, it is equivalent to nofpp. Note that
	      argument n is deprecated.

	      We recommend you use option Qoption,fpp,"option"	to  pass  fpp
	      options to the Fortran preprocessor.

	      Alternate Options:

	      Linux and Mac OS X: -cpp (this is a deprecated option)

       -fpscomp [keyword]

       -nofpscomp

	      Controls	whether  certain  aspects  of the run-time system and
	      semantic language features within the compiler  are  compatible
	      with Intel® Fortran or Microsoft* Fortran PowerStation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies the compatibility that the compiler
				should follow. Possible values are:

				none	       Specifies  that	 no   options
					       should	  be	 used	  for
					       compatibility.

				[no]filesfromcmd
					       Determines what	compatibility
					       is    used   when   the	 OPEN
					       statement FILE=	specifier  is
					       blank.

				[no]general    Determines  what compatibility
					       is   used    when    semantics
					       differences    exist   between
					       Fortran	  PowerStation	  and
					       Intel® Fortran.

				[no]ioformat   Determines  what compatibility
					       is  used   for	list-directed
					       formatted and unformatted I/O.

				[no]libs       Determines     whether	  the
					       portability library is  passed
					       to the linker.

				[no]ldio_spacing
					       Determines  whether a blank is
					       inserted at run-time  after  a
					       numeric	  value    before   a
					       character value.

				[no]logicals   Determines what	compatibility
					       is  used for representation of
					       LOGICAL values.

				all	       Specifies  that	all   options
					       should	  be	 used	  for
					       compatibility.

	      Default:

	      fpscomp libs	The portability  library  is  passed  to  the
				linker.

	      Description:

	      This  option  controls  whether certain aspects of the run-time
	      system and semantic language features within the	compiler  are
	      compatible   with   Intel   Fortran   or	 Microsoft*   Fortran
	      PowerStation.

	      If you  experience  problems  when  porting  applications  from
	      Fortran  PowerStation,  specify  fpscomp (or fpscomp all). When
	      porting applications from Intel Fortran, use  fpscomp  none  or
	      fpscomp libs (the default).

	      Option		Description

	      fpscomp none	Specifies  that no options should be used for
				compatibility with Fortran PowerStation. This
				is  the  same as specifying nofpscomp. Option
				fpscomp  none  enables	full  Intel®  Fortran
				compatibility.	 If  you  omit	fpscomp,  the
				default is fpscomp libs. You cannot  use  the
				fpscomp and vms options in the same command.

	      fpscomp filesfromcmd
				Specifies  Fortran PowerStation behavior when
				the OPEN statement FILE= specifier  is	blank
				(FILE='  ').  It causes the following actions
				to be taken at run time:

				· The program reads a file name from the list
				  of  arguments  (if any) in the command line
				  that invoked the program.  If  any  of  the
				  command-line	 arguments   contain  a  null
				  string (''), the program asks the user  for
				  the	 corresponding	  file	 name.	 Each
				  additional  OPEN  statement  with  a	blank
				  FILE= specifier reads the next command-line
				  argument.

				· If there are more nameless OPEN  statements
				  than	command-line  arguments,  the program
				  prompts for additional file names.

				· In a QuickWin application, a	 File  Select
				  dialog box appears to request file names.

	      To  prevent  the	run-time  system  from	using  the  file name
	      specified on the command line  when  the	OPEN  statement  FILE
	      specifier  is  omitted,  specify	fpscomp  nofilesfromcmd. This
	      allows the application of Intel Fortran defaults, such  as  the
	      FORTn environment variable and the FORT.n file name (where n is
	      the unit number).

	      The fpscomp filesfromcmd option affects the  following  Fortran
	      features:

				· The	OPEN  statement  FILE  specifier  For
				  example, assume a program OPENTEST contains
				  the  following  statements:  OPEN(UNIT = 2,
				  FILE = ' ') OPEN(UNIT =  3,  FILE  =	'  ')
				  OPEN(UNIT  =	4,  FILE = ' ') The following
				  command line assigns the file  TEST.DAT  to
				  unit 2, prompts the user for a file name to
				  associate with unit 3, then  prompts	again
				  for  a  file name to associate with unit 4:
				  opentest test.dat '' ''

				· Implicit file open statements such  as  the
				  WRITE,   READ,   and	 ENDFILE   statements
				  Unopened files referred to in READ or WRITE
				  statements  are  opened  implicitly  as  if
				  there had been an  OPEN  statement  with  a
				  name	specified  as all blanks. The name is
				  read from the command line.

	      fpscomp general	Specifies that Fortran PowerStation semantics
				should	be  used  when	a  difference  exists
				between    Intel    Fortran    and    Fortran
				PowerStation.	The  fpscomp  general  option
				affects the following Fortran features:

	      · The BACKSPACE statement:

		· It allows files opened with ACCESS='APPEND' to be used with
		  the BACKSPACE statement.

		· It allows files opened with ACCESS='DIRECT' to be used with
		  the BACKSPACE statement.
	      Note: Allowing files that are not opened with sequential access
	      (such  as  ACCESS='DIRECT')  to  be  used  with  the  BACKSPACE
	      statement violates the Fortran 95 standard and may  be  removed
	      in the future.

	      · The READ statement:

		· It  causes  a  READ from a formatted file opened for direct
		  access to read records  that	have  the  same  record  type
		  format as Fortran PowerStation. This consists of accounting
		  for the trailing Carriage Return/Line Feed pair  (<CR><LF>)
		  that is part of the record. It allows sequential reads from
		  a formatted file opened for direct access.  Note:  Allowing
		  files  that  are not opened with sequential access (such as
		  ACCESS='DIRECT')  to	be  used  with	the  sequential  READ
		  statement  violates  the  Fortran  95  standard  and may be
		  removed in the future.

		· It  allows  the  last  record  in  a	 file	opened	 with
		  FORM='FORMATTED'   and   a  record  type  of	STREAM_LF  or
		  STREAM_CR that does not end with a proper record terminator
		  (<line  feed>  or  <carriage	return>)  to  be read without
		  producing an error.

		· It allows sequential reads from an unformatted file  opened
		  for direct access.

		· Note:  Allowing  files  that are not opened with sequential
		  access (such	as  ACCESS='DIRECT')  to  be  read  with  the
		  sequential  READ statement violates the Fortran 95 standard
		  and may be removed in the future.

	      · The INQUIRE statement:

		· The CARRIAGECONTROL specifier returns the value "UNDEFINED"
		  instead  of  "UNKNOWN"  when	the  carriage  control is not
		  known.

		· The NAME specifier returns the file name "UNKNOWN"  instead
		  of  filling the file name with spaces when the file name is
		  not known.

		· The SEQUENTIAL specifier returns the value "YES" instead of
		  "NO" for a direct access formatted file.

		· The UNFORMATTED specifier returns the value "NO" instead of
		  "UNKNOWN" when it is not known whether unformatted I/O  can
		  be  performed  to the file.  Note: Returning the value "NO"
		  instead  of  "UNKNOWN"  for  this  specifier	violates  the
		  Fortran 95 standard and may be removed in the future.

	      · The OPEN statement:

		· If  a  file  is  opened  with an unspecified STATUS keyword
		  value, and is not named (no FILE specifier),	the  file  is
		  opened as a scratch file.  For example: OPEN (UNIT = 4)

		· In  contrast,  when  fpscomp nogeneral is in effect with an
		  unspecified STATUS value with no FILE specifier, the	FORTn
		  environment  variable  and  the  FORT.n  file name are used
		  (where n is the unit number).

		· If the STATUS value was not specified and if	the  name  of
		  the file is "USER", the file is marked for deletion when it
		  is closed.

		· It allows a file to be opened with the APPEND and  READONLY
		  characteristics.

		· If   the  default  for  the  CARRIAGECONTROL	specifier  is
		  assumed, it gives "LIST" carriage control to direct  access
		  formatted files instead of "NONE".

		· If the default for the CARRIAGECONTROL specifier is assumed
		  and the device type is a terminal file, the file  is	given
		  the  default carriage control value of "FORTRAN" instead of
		  "LIST".

		· It gives an opened file the  additional  default  of	write
		  sharing.

		· It  gives  the file a default block size of 1024 instead of
		  8192.

		· If the default for the MODE and ACTION specifier is assumed
		  and  there  was  an error opening the file, try opening the
		  file as read only, then write only.

		· If a file that is being re-opened has a different file type
		  than the current existing file, an error is returned.

		· It gives direct access formatted files the same record type
		  as Fortran PowerStation.  This  means  accounting  for  the
		  trailing  Carriage Return/Line Feed pair (<CR><LF>) that is
		  part of the record.

	      · The STOP statement: It writes the Fortran PowerStation output
		string and/or returns the same exit condition values.

	      · The WRITE statement:

		· Writing  to  formatted  direct  files  When  writing	to  a
		  formatted  file  opened  for	direct	access,  records  are
		  written   in	 the  same  record  type  format  as  Fortran
		  PowerStation. This consists of adding the trailing Carriage
		  Return/Line Feed pair <CR><LF>) that is part of the record.
		  It  ignores  the  CARRIAGECONTROL  specifier	setting  when
		  writing to a formatted direct access file.

		· Interpreting	 Fortran  carriage  control  characters  When
		  interpreting Fortran	carriage  control  characters  during
		  formatted  I/O, carriage control sequences are written that
		  are the same as Fortran PowerStation. This is true for  the
		  "Space, 0, 1 and + " characters.

		· Performing   non-advancing   I/O   to   the  terminal  When
		  performing non-advancing I/O to  the	terminal,  output  is
		  written in the same format as Fortran PowerStation.

		· Interpreting	 the   backslash   (   and  dollar  ($)  edit
		  descriptors When interpreting  backslash  and  dollar  edit
		  descriptors during formatted I/O, sequences are written the
		  same as Fortran PowerStation.

		· Performing sequential writes It  allows  sequential  writes
		  from	an  unformatted file opened for direct access.	Note:
		  Allowing files that are not opened with  sequential  access
		  (such  as  ACCESS='DIRECT')  to be read with the sequential
		  WRITE statement violates the Fortran 95 standard and may be
		  removed in the future.

	      Specifying fpscomp general sets fpscomp ldio_spacing.

	      fpscomp ioformat	Specifies  that Fortran PowerStation semantic
				conventions and record formats should be used
				for  list-directed  formatted and unformatted
				I/O. The fpscomp ioformat option affects  the
				following Fortran features:

	      · The WRITE statement:

		· For  formatted  list-directed  WRITE	statements, formatted
		  internal  list-directed  WRITE  statements,  and  formatted
		  namelist  WRITE  statements,	the  output line, field width
		  values, and  the  list-directed  data  type  semantics  are
		  determined  according  to  the  following  sample  for real
		  constants (N below): For 1 <= N  <  10**7,  use  F15.6  for
		  single  precision  or F24.15 for double.  For N < 1 or N >=
		  10**7, use E15.6E2 for single  precision  or	E24.15E3  for
		  double.   See  the  Fortran  PowerStation documentation for
		  more	detailed  information  about  the  other  data	types
		  affected.

		· For  unformatted  WRITE  statements,	the  unformatted file
		  semantics   are   dictated   according   to	the   Fortran
		  PowerStation	documentation;	these semantics are different
		  from	the  Intel  Fortran  file  format.  See  the  Fortran
		  PowerStation	documentation  for more detailed information.
		  The following table summarizes the default  output  formats
		  for list-directed output with the intrinsic data types:

	      · The READ statement:

		· For  formatted  list-directed  READ  statements,  formatted
		  internal  list-directed  READ  statements,  and   formatted
		  namelist  READ  statements,  the field width values and the
		  list-directed  semantics  are  dictated  according  to  the
		  following sample for real constants (N below): For 1 <= N <
		  10**7, use F15.6 for single precision or F24.15 for double.
		  For  N  < 1 or N >= 10**7, use E15.6E2 for single precision
		  or E24.15E3  for  double.   See  the	Fortran  PowerStation
		  documentation for more detailed information about the other
		  data types affected.

		· For  unformatted  READ  statements,  the  unformatted  file
		  semantics   are   dictated   according   to	the   Fortran
		  PowerStation documentation; these semantics  are  different
		  from	the  Intel  Fortran  file  format.  See  the  Fortran
		  PowerStation documentation for more detailed information.

	      fpscomp nolibs	Prevents the portability library  from	being
				passed to the linker.

	      fpscomp ldio_spacing
				Specifies that at run time a blank should not
				be inserted after a numeric  value  before  a
				character    value   (undelimited   character
				string). This representation is used by Intel
				Fortran  releases  before  Version 8.0 and by
				Fortran PowerStation. If you specify  fpscomp
				general, it sets fpscomp ldio_spacing.

	      fpscomp logicals	Specifies that integers with a non-zero value
				are treated as true,  integers	with  a  zero
				value  are  treated  as  false.  The  literal
				constant .TRUE. has an integer	value  of  1,
				and  the  literal  constant  .FALSE.  has  an
				integer value of 0.  This  representation  is
				used by Intel Fortran releases before Version
				8.0 and by Fortran PowerStation.

	      The default is fpscomp nologicals,  which  specifies  that  odd
	      integer  values  (low  bit  one)	are  treated as true and even
	      integer values (low bit zero) are treated as false.

	      The literal constant .TRUE. has an integer value of -1, and the
	      literal  constant  .FALSE.  has  an  integer  value  of 0. This
	      representation is used by Compaq* Visual Fortran. The  internal
	      representation  of  LOGICAL  values  is  not  specified  by the
	      Fortran standard. Programs which use integer values in  LOGICAL
	      contexts, or which pass LOGICAL values to procedures written in
	      other  languages,  are  non-portable  and   may	not   execute
	      correctly.  Intel  recommends  that  you avoid coding practices
	      that depend on the internal representation of LOGICAL values.

	      The fpscomp logical option affects the results of  all  logical
	      expressions  and	affects  the  return  value for the following
	      Fortran features:

	      · The INQUIRE statement specifiers OPENED, IOFOCUS, EXISTS, and
		NAMED

	      · The EOF intrinsic function

	      · The BTEST intrinsic function

	      · The lexical intrinsic functions LLT, LLE, LGT, and LGE

	      fpscomp all	Specifies that all options should be used for
				compatibility with Fortran PowerStation. This
				is  the  same  as  specifying fpscomp with no
				keyword.  Option  fpscomp  all	enables  full
				compatibility with Fortran PowerStation.

	      Alternate Options:

	      None

       -free

       -nofree

	      Specifies source files are in free format.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The source file format is determined from the
				file extension.

	      Description:

	      This option specifies source files are in free format. If  this
	      option is not specified, format is determined as follows:

	      · Files	with   an  extension  of  .f90,  .F90,	or  .i90  are
		free-format source files.

	      · Files with an extension of .f, .for, .FOR, .ftn,  or  .i  are
		fixed-format files.

	      Alternate Options:

	      Linux and Mac OS X: -FR

       -fsource-asm

	      Produces an assembly listing with source code annotations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No  source  code  annotations  appear  in the
				assembly listing file, if one is produced.

	      Description:

	      This option produces an assembly listing file with source  code
	      annotations. The assembly listing file shows the source code as
	      interspersed comments.

	      To use this option, you must  also  specify  option  -S,	which
	      causes an assembly listing to be generated.

	      Alternate Options:

	      Linux and Mac OS X: None

       -ftrapuv

	      Initializes  stack  local  variables to an unusual value to aid
	      error detection.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  compiler  does  not   initialize	local
				variables.

	      Description:

	      This  option  initializes  stack	local variables to an unusual
	      value to aid error detection. Normally, these  local  variables
	      should be initialized in the application.

	      The  option  sets  any  uninitialized  local variables that are
	      allocated on the stack to a value that is typically interpreted
	      as  a  very  large integer or an invalid address. References to
	      these variables are then likely to cause run-time  errors  that
	      can help you detect coding errors.

	      This  option sets option -g (Linux and Mac OS X) and /Zi or /Z7
	      (Windows).

	      Alternate Options:

	      None

       -ftz

       -no-ftz

	      Flushes denormal results to zero.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -ftz or /Qftz	Denormal results are flushed to zero.

				Every optimization option O level, except O0,
				sets -ftz and /Qftz.

	      Options  -fpe0 and -fpe1 (Linux and Mac OS X) set -ftz. Options
	      /fpe:0 and /fpe:1 (Windows) set /Qftz.

	      Description:

	      This  option  flushes  denormal  results	to  zero   when   the
	      application  is  in  the gradual underflow mode. It may improve
	      performance if the denormal values are  not  critical  to  your
	      application's behavior.

	      This  option sets or resets the FTZ and the DAZ hardware flags.
	      If FTZ is ON, denormal results from floating-point calculations
	      will  be set to the value zero. If FTZ is OFF, denormal results
	      remain as is. If DAZ is ON, denormal values used	as  input  to
	      floating-point  instructions will be treated as zero. If DAZ is
	      OFF, denormal instruction inputs remain as is.   Systems	using
	      Intel®  64  architecture have both FTZ and DAZ. FTZ and DAZ are
	      not supported on all IA-32 architectures.

	      When -ftz (Linux and Mac OS X) or /Qftz (Windows)  is  used  in
	      combination  with an SSE-enabling option on systems using IA-32
	      architecture (for example, xN or QxN), the compiler will insert
	      code in the main routine to set FTZ and DAZ. When -ftz or /Qftz
	      is used without such an option, the compiler will  insert  code
	      to  conditionally  set  FTZ/DAZ  based  on a run-time processor
	      check. -no-ftz (Linux and Mac OS X) or  /Qftz-  (Windows)  will
	      prevent the compiler from inserting any code that might set FTZ
	      or DAZ.

	      This option only has an effect when the main program  is	being
	      compiled. It sets the FTZ/DAZ mode for the process. The initial
	      thread and any threads subsequently  created  by	that  process
	      will operate in FTZ/DAZ mode.

	      If  this	option	produces undesirable results of the numerical
	      behavior of your program, you can turn the FTZ/DAZ mode off  by
	      using  -no-ftz  or  /Qftz-  in  the  command  line  while still
	      benefiting from the O3 optimizations.

	      NOTE: Options -ftz and /Qftz are performance  options.  Setting
	      these  options  does  not  guarantee  that  all  denormals in a
	      program  are  flushed  to  zero.	They  only  cause   denormals
	      generated at run time to be flushed to zero.

	      Alternate Options:

	      None

       -fverbose-asm

       -fno-verbose-asm

	      Produces	an assembly listing with compiler comments, including
	      options and version information.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-verbose-asm	No source  code  annotations  appear  in  the
				assembly listing file, if one is produced.

	      Description:

	      This  option  produces  an  assembly listing file with compiler
	      comments, including options and version information.

	      To use this option,  you	must  also  specify  -S,  which  sets
	      -fverbose-asm.

	      If  you  do  not want this default when you specify -S, specify
	      -fno-verbose-asm.

	      Alternate Options:

	      None

       -fvisibility=keyword

       -fvisibility-keyword=filename

	      Specifies the default visibility	for  global  symbols  or  the
	      visibility for symbols in a file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the	visibility  setting. Possible
				values are:

				default        Sets visibility to default.

				extern	       Sets visibility to extern.

				hidden	       Sets visibility to hidden.

				protected      Sets visibility to  protected.
					       This value is not available on
					       Mac OS* X systems.

	      filename		Is the pathname of a file containing the list
				of  symbols whose visibility you want to set.
				The symbols must be separated  by  whitespace
				(spaces, tabs, or newlines).

	      Default:

	      -fvisibility=default
				The  compiler  sets  visibility of symbols to
				default.

	      Description:

	      This option specifies the default visibility for global symbols
	      (syntax  -fvisibility=keyword) or the visibility for symbols in
	      a file (syntax -fvisibility-keyword=filename).

	      Visibility specified by -fvisibility-keyword=filename overrides
	      visibility   specified   by  -fvisibility=keyword  for  symbols
	      specified in a file.

	      Option		Description

	      -fvisibility=default -fvisibility-default=filename
				Sets visibility of symbols to  default.  This
				means  other  components  can  reference  the
				symbol, and  the  symbol  definition  can  be
				overridden (preempted) by a definition of the
				same name in another component.

	      -fvisibility=extern -fvisibility-extern=filename
				Sets visibility of symbols  to	extern.  This
				means  the  symbol is treated as though it is
				defined in another component. It  also	means
				that  the  symbol  can	be  overridden	by  a
				definition  of	the  same  name  in   another
				component.

	      -fvisibility=hidden -fvisibility-hidden=filename
				Sets  visibility  of  symbols to hidden. This
				means that other components  cannot  directly
				reference  the	symbol.  However, its address
				may be passed to other components indirectly.

	      -fvisibility=protected -fvisibility-protected=filename
				Sets visibility of symbols to protected. This
				means  other  components  can  reference  the
				symbol, but it	cannot	be  overridden	by  a
				definition   of  the  same  name  in  another
				component.  This value is  not	available  on
				Mac OS* X systems.

	      If  an  -fvisibility  option is specified more than once on the
	      command line, the last specification takes precedence over  any
	      others.

	      If  a  symbol appears in more than one visibility filename, the
	      setting with the least visibility takes precedence.

	      The following shows the precedence of the  visibility  settings
	      (from greatest to least visibility):

	      · extern

	      · default

	      · protected

	      · hidden

	      Note  that  extern  visibility  only applies to functions. If a
	      variable symbol is specified as extern, it  is  assumed  to  be
	      default.

	      Alternate Options:

	      None

       -fzero-initialized-in-bss

       -fno-zero-initialized-in-bss

	      Determines  whether the compiler places in the DATA section any
	      variables explicitly initialized with zeros.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -fno-zero-initialized-in-bss
				Variables explicitly initialized  with	zeros
				are  placed in the BSS section. This can save
				space in the resulting code.

	      Description:

	      This option determines whether the compiler places in the  DATA
	      section any variables explicitly initialized with zeros.

	      If  option -fno-zero-initialized-in-bss (Linux and Mac OS X) or
	      /Qzero-initialized-in-bss- (Windows) is specified, the compiler
	      places  in  the DATA section any variables that are initialized
	      to zero.

	      Alternate Options:

	      None

       -g

	      Tells the compiler to generate full  debugging  information  in
	      the object file or a project database (PDB) file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No  debugging  information is produced in the
				object file or in a PDB file.

	      Description:

	      Options -g (Linux* OS and Mac OS* X) and	/Z7  (Windows*)  tell
	      the  compiler to generate symbolic debugging information in the
	      object file, which increases the size of the object  file.  The
	      /Zi  option  (Windows)  tells the compiler to generate symbolic
	      debugging information in a PDB file.

	      If you want to name the file, use option	/Fd;  otherwise,  the
	      PDB file used by the compilation step will be named vc90.pdb in
	      Microsoft Visual	Studio*  2008,	and  vc100.pdb	in  Microsoft
	      Visual  Studio*  2010.  Note that Microsoft Visual Studio users
	      do not  normally	need  to  specify  this  option  because  the
	      environment sets it correctly.

	      The  compiler  does  not	support  the  generation of debugging
	      information in assemblable files. If you specify these options,
	      the  resulting  object file will contain debugging information,
	      but the assemblable file will not.

	      These options turn off O2 and make O0 (Linux OS and Mac  OS  X)
	      or Od (Windows) the default unless O2 (or higher) is explicitly
	      specified in the same command line.

	      On Linux* OS using Intel® 64 architecture and Linux OS and  Mac
	      OS*  X  systems  using IA-32 architecture, specifying the -g or
	      -O0 option sets the -fno-omit-frame-pointer option.

	      When compiling under Microsoft  Visual  Studio*  2005  or  when
	      option  /Qvc8  is used, the /Zd option is treated as equivalent
	      to the /Z7 option. That is, the debug information is emitted to
	      the object file by either option. There is no way to emit debug
	      information to the pdb file. This is to maintain	compatibility
	      with  previous  versions	of the Intel compiler's behavior when
	      performing parallel builds.

	      Alternate Options:

	      /Zi		Linux and Mac OS X: None

       -gcc-name=name

	      Specifies the name of the gcc compiler that should be  used  to
	      set up the environment for C compilations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      name		Is  the  name of the gcc compiler to use.  It
				can include a full path.

	      Default:

	      OFF		The compiler locates the gcc libraries in the
				gcc install directory.

	      Description:

	      This  option specifies the name of the gcc compiler that should
	      be used to set up the environment for C compilations.

	      This option is helpful when you are referencing a  non-standard
	      gcc installation.

	      The C++ equivalent to option -gcc-name is -gxx-name.

	      Alternate Options:

	      None

       -gdwarf-2

	      Enables  generation  of  debugging  information using the DWARF
	      Version 2 format.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No debug information is  generated.  However,
				if compiler option -g is specified, debugging
				information is generated in the DWARF Version
				2   format   with   some   DWARF   Version  3
				extensions.

	      Description:

	      This option enables generation of debugging  information	using
	      the DWARF Version 2 format.

	      Alternate Options:

	      None

       -gdwarf-3

	      Enables  generation  of  debugging  information using the DWARF
	      Version 3 format.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No debug information is  generated.  However,
				if compiler option -g is specified, debugging
				information is generated in the DWARF Version
				2   format   with   some   DWARF   Version  3
				extensions.

	      Description:

	      This option enables generation of debugging  information	using
	      the DWARF Version 3 format.

	      When  you  specify  this	option,  the compiler will emit DWARF
	      version 3-compatible debugging information, which can  be  used
	      by  debuggers such as gdb and idb. It also generates additional
	      debugging information  for  optimized  code,  such  as  end  of
	      prologue markers.

	      Alternate Options:

	      None

       -gen-dep[=filename]

       -no-gen-dep

	      Tells  the  compiler  to	generate  build  dependencies for the
	      current compilation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the file for  output.  It  can
				include a path.

	      Default:

	      -no-gen-dep or /gen-dep-
				The   compiler	 does	not   generate	build
				dependencies for the compilation.

	      Description:

	      This option tells the compiler to generate  build  dependencies
	      for  the	current compilation. The build dependencies include a
	      list of all files included  with	INCLUDE  statements  or  .mod
	      files accessed with USE statements.

	      If you do not specify filename, the dependencies are written to
	      stdout.

	      You can use option gen-depformat to specify  the	form  of  the
	      output for the build dependencies generated.

	      If  you  specify	option	gen-dep and you do not specify option
	      gen-depformat, the output format is in a form acceptable to the
	      make utility.

	      Note  that  if  option  fpp  is used to process #include files,
	      those files will also appear in the list of build dependencies.

	      Alternate Options:

	      None

       -gen-depformat=form

	      Specifies the form for the output generated when option gen-dep
	      is specified.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      form		Is  the  output  form  for  the list of build
				dependencies. Possible	values	are  make  or
				nmake.

	      Default:

	      make		The   output  form  for  the  list  of	build
				dependencies is in a form acceptable  to  the
				make utility.

	      Description:

	      This  option  specifies  the form for the output generated when
	      option gen-dep is specified.

	      If you specify option gen-depformat and do not  specify  option
	      gen-dep, the option is ignored.

	      Alternate Options:

	      None

       -gen-interfaces [[no]source]

       -nogen-interfaces

	      Tells  the  compiler  to	generate  an interface block for each
	      routine in a source file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      nogen-interfaces	The  compiler  does  not  generate  interface
				blocks for routines in a source file.

	      Description:

	      This  option  tells the compiler to generate an interface block
	      for each routine (that is, for  each  SUBROUTINE	and  FUNCTION
	      statement)  defined  in the source file. The compiler generates
	      two files for each routine, a .mod file and a  .f90  file,  and
	      places  them  in	the  current  directory  or  in the directory
	      specified by the include (-I) or -module option. The .f90  file
	      is  the  text  of  the  interface  block;  the .mod file is the
	      interface block compiled into binary form.

	      If source is specified, the compiler creates the	*_mod.f90  as
	      well  as	the  *_mod.mod	files.	If nosource is specified, the
	      compiler creates the *_mod.mod but not the *_mod.f90 files.  If
	      neither	is   specified,   it   is   the  same  as  specifying
	      -gen-interfaces	source	 (Linux   and	Mac    OS    X)    or
	      /gen-interfaces:source (Windows).

	      Alternate Options:

	      None

       -global-hoist

       -no-global-hoist

	      Enables  certain	optimizations that can move memory loads to a
	      point earlier in the program execution than where  they  appear
	      in the source.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -global-hoist	Certain  optimizations	are  enabled that can
				move memory loads.

	      Description:

	      This option enables certain optimizations that can move  memory
	      loads  to  a  point earlier in the program execution than where
	      they appear in the source. In most cases,  these	optimizations
	      are safe and can improve performance.

	      The  -no-global-hoist  (Linux  and Mac OS X) or /Qglobal-hoist-
	      (Windows) option is useful for some applications, such as those
	      that use shared or dynamically mapped memory, which can fail if
	      a load is moved too early in the execution stream (for example,
	      before the memory is mapped).

	      Alternate Options:

	      None

       -guide[=n]

	      Lets  you  set  a  level	of  guidance  for auto-vectorization,
	      auto-parallelization, and data transformation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is an optional value specifying the level  of
				guidance to be provided.

				The values available are 1 through 4. Value 1
				indicates a standard level of guidance. Value
				4   indicates  the  most  advanced  level  of
				guidance. If n is omitted, the default is 4.

	      Default:

	      OFF		You do not  receive  guidance  about  how  to
				improve  optimizations	for  parallelization,
				vectorization, and data transformation.

	      Description:

	      This option lets you set	a  level  of  guidance	(advice)  for
	      auto-vectorization,      auto-parallelization,	 and	 data
	      transformation. It causes the  compiler  to  generate  messages
	      suggesting ways to improve these optimizations.

	      When  this  option  is specified, the compiler does not produce
	      any objects or executables.

	      You must also specify option –parallel (Linux* OS and  Mac  OS*
	      X)  or /Qparallel (Windows* OS) to receive auto-parallelization
	      guidance.

	      You can  set  levels  of	guidance  for  the  individual	guide
	      optimizations by specifying one of the following options:

	      data transformation
				-guide-data-trans  (Linux OS and Mac OS X) or
				/Qguide-data-trans (Windows OS)

	      auto-parallelization
				-guide-par  (Linux  OS	and  Mac  OS  X)   or
				/Qguide-par (Windows OS)

	      auto-vectorization
				-guide-vec   (Linux  OS  and  Mac  OS  X)  or
				/Qguide-vec (Windows OS)

	      If you specify -guide or /Qguide and also specify  one  of  the
	      options  setting	a  level  of guidance for an individual guide
	      optimization,  the  value  set   for   the   individual	guide
	      optimization  will  override the setting specified in -guide or
	      /Qguide.

	      If you do not specify -guide or /Qguide, but specify one of the
	      options  setting	a  level  of guidance for an individual guide
	      optimization, option -guide or  /Qguide  is  enabled  with  the
	      greatest	value  passed among any of the three individual guide
	      optimizations specified.

	      In debug mode, this option has no effect unless option  O2  (or
	      higher) is explicitly specified in the same command line.

	      NOTE:  You can specify –diag-disable (Linux OS and Mac OS X) or
	      /Qdiag-disable  (Windows	OS)  to  prevent  the  compiler  from
	      issuing one or more diagnostic messages.

	      Alternate Options:

	      None

       -guide-data-trans[=n]

	      Lets you set a level of guidance for data transformation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  an optional value specifying the level of
				guidance to be provided.

				The values available are 1  and  2.  Value  1
				indicates a standard level of guidance. Value
				2  indicates  a  more	advanced   level   of
				guidance. If n is omitted, the default is 2.

	      Default:

	      OFF		You  do  not  receive  guidance  about how to
				improve      optimizations	for	 data
				transformation.

	      Description:

	      This  option  lets  you  set  a  level  of  guidance  for  data
	      transformation. It causes the  compiler  to  generate  messages
	      suggesting ways to improve that optimization.

	      Alternate Options:

	      None

       -guide-file[=filename]

	      Causes  the results of guided auto-parallelization to be output
	      to a file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the file for  output.  It  can
				include a path.

	      Default:

	      OFF		Messages   that   are	generated  by  guided
				auto-parallelization are output to stderr.

	      Description:

	      This option causes the results of  guided  auto-parallelization
	      to be output to a file.

	      This  option  is ignored unless you also specify one or more of
	      the   following	 options:    option    -guide,	  -guide-vec,
	      -guide-data-trans,  or -guide-par (Linux* OS and Mac OS* X), or
	      option /Qguide, /Qguide-vec, /Qguide-data-trans, or /Qguide-par
	      (Windows* OS).

	      If you do not specify a path, the file is placed in the current
	      working directory.

	      If  there  is  already  a  file  named  filename,  it  will  be
	      overwritten.

	      You  can include a file extension in filename.  For example, if
	      file.txt is specified, the name of the output file is file.txt.
	      If you do not provide a file extension, the name of the file is
	      filename.guide.

	      If you do not  specify  filename,  the  name  of	the  file  is
	      name-of-the-first-source-file.guide.  This  is also the name of
	      the file if the name specified for filename  conflicts  with  a
	      source file name provided in the command line.

	      NOTE:  If  you specify -guide-file or /Qguide-file and you also
	      specify  -guide-file-append  (Linux  OS  and  Mac  OS   X)   or
	      /Qguide-file-append  (Windows OS), the last option specified on
	      the command line takes precedence.

	      Alternate Options:

	      None

       -guide-file-append[=filename]

	      Causes  the  results  of	guided	auto-parallelization  to   be
	      appended to a file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the file to be appended to. It
				can include a path.

	      Default:

	      OFF		Messages  that	are   generated   by   guided
				auto-parallelization are output to stderr.

	      Description:

	      This  option  causes the results of guided auto-parallelization
	      to be appended to a file.

	      This option is ignored unless you also specify one or  more  of
	      the    following	  options:    option	-guide,   -guide-vec,
	      -guide-data-trans, or -guide-par (Linux* OS and Mac OS* X),  or
	      option /Qguide, /Qguide-vec, /Qguide-data-trans, or /Qguide-par
	      (Windows* OS).

	      If you do not specify a path, the compiler looks	for  filename
	      in the current working directory.

	      If  filename  is	not  found, then a new file with that name is
	      created in the current working directory.

	      If you do not specify a file extension, the name of the file is
	      filename.guide.

	      If the name specified for filename conflicts with a source file
	      name provided in the command line, the  name  of	the  file  is
	      name-of-the-first-source-file.guide.

	      NOTE:  If you specify -guide-file-append or /Qguide-file-append
	      and you also specify  -guide-file (Linux OS and Mac  OS  X)  or
	      /Qguide-file  (Windows  OS),  the  last option specified on the
	      command line takes precedence.

	      Alternate Options:

	      None

       guide-opts=string

	      Tells  the  compiler  to	analyze  certain  code	and  generate
	      recommendations that may improve optimizations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      string		Is the text denoting the code to analyze. The
				string must appear within quotes. It can take
				one   or   more   of   the  following  forms:
				filenamefilename, routinefilename,  range  [,
				range]...    filename,	 routine,   range  [,
				range]...

				If you specify more than  one  of  the	above
				forms  in  a  string, a semicolon must appear
				between each form. If you specify  more  than
				one  range  in	a string, a comma must appear
				between  each  range.  Optional  blanks   can
				follow	each parameter in the forms above and
				they can also follow each form in a string.

				filename       Specifies the name of  a  file
					       to be analyzed. It can include
					       a path.

					       If you do not specify a	path,
					       the    compiler	  looks   for
					       filename   in   the    current
					       working directory.

				routine        Specifies   the	 name	of  a
					       routine to be  analyzed.   You
					       can   include  an  identifying
					       argument.

					       The   name,   including	  any
					       argument,  must be enclosed in
					       single quotes.

					       The compiler tries to uniquely
					       identify   the	routine  that
					       corresponds to  the  specified
					       routine	name.  It  may select
					       multiple routines to  analyze,
					       especially if the following is
					       true:

					       · More than  one  routine  has
						 the  specified routine name,
						 so  the  routine  cannot  be
						 uniquely identified.

					       · No  argument information has
						 been specified to narrow the
						 number  of routines selected
						 as matches.

				range	       Specifies  a  range  of	 line
					       numbers to analyze in the file
					       or  routine   specified.   The
					       range  must  be	specified  in
					       integers in the form:

					       first_line_number-last_line_number

					       The  hyphen  between  the line
					       numbers is required.

	      Default:

	      OFF		You do not receive guidance on how to improve
				optimizations.	  However,   if  you  specify
				option -guide (Linux* OS and Mac  OS*  X)  or
				/Qguide  (Windows* OS), the compiler analyzes
				and generates  recommendations	for  all  the
				code in an application

	      Description:

	      This  option  tells  the	compiler  to analyze certain code and
	      generate recommendations that may improve optimizations.

	      This option is ignored unless you also specify one or  more  of
	      the    following	  options:    option	-guide,   -guide-vec,
	      -guide-data-trans, or -guide-par (Linux* OS and Mac OS* X),  or
	      option /Qguide, /Qguide-vec, /Qguide-data-trans, or /Qguide-par
	      (Windows* OS).

	      When option -guide-opt or /Qguide-opt is specified,  a  message
	      is  output  that	includes  which  parts of the input files are
	      being analyzed. If a routine is selected to  be  analyzed,  the
	      complete routine name will appear in the generated message.

	      When  inlining  is  involved,  you  should  specify callee line
	      numbers. Generated messages also use callee line numbers.

	      Alternate Options:

	      None

       -guide-par[=n]

	      Lets you set a level of guidance for auto-parallelization.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is an optional value specifying the level  of
				guidance to be provided.

				The  values  available	are  1 and 2. Value 1
				indicates a standard level of guidance. Value
				2   indicates	a   more  advanced  level  of
				guidance. If n is omitted, the default is 2.

	      Default:

	      OFF		You do not  receive  guidance  about  how  to
				improve optimizations for parallelization.

	      Description:

	      This   option   lets   you   set	 a   level  of	guidance  for
	      auto-parallelization.  It  causes  the  compiler	to   generate
	      messages suggesting ways to improve that optimization.

	      You  must  also specify option -parallel (Linux* OS and Mac OS*
	      X) or /Qparallel (Windows* OS) to receive  auto-parallelization
	      guidance.

	      Alternate Options:

	      None

       -guide-vec[=n]

	      Lets you set a level of guidance for auto-vectorization.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  an optional value specifying the level of
				guidance to be provided.

				The values available are 1  and  2.  Value  1
				indicates a standard level of guidance. Value
				2  indicates  a  more	advanced   level   of
				guidance. If n is omitted, the default is 2.

	      Default:

	      OFF		You  do  not  receive  guidance  about how to
				improve optimizations for vectorization.

	      Description:

	      This  option  lets  you	set   a   level   of   guidance   for
	      auto-vectorization. It causes the compiler to generate messages
	      suggesting ways to improve that optimization.

	      Alternate Options:

	      None

       -gxx-name=name

	      Specifies the name of the g++ compiler that should be  used  to
	      set up the environment for C++ compilations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      name		Is  the  name of the g++ compiler to use.  It
				can include a full path.

	      Default:

	      OFF		The compiler uses the PATH  setting  to  find
				the  g++  compiler  and  resolve  environment
				settings.

	      Description:

	      This option specifies the name of the g++ compiler that  should
	      be used to set up the environment for C++ compilations.

	      The C equivalent to option -gxx-name is -gcc-name.

	      NOTE:  When  compiling  a C++ file with icc, g++ is used to get
	      the environment.

	      Alternate Options:

	      None

       -heap-arrays [size]

       -no-heap-arrays

	      Puts  automatic  arrays  and  arrays  created   for   temporary
	      computations on the heap instead of the stack.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      size		Is  an integer value representing the size of
				the arrays in kilobytes. Any arrays known  at
				compile-time  to  be  larger  than  size  are
				allocated on the heap instead of the stack.

	      Default:

	      -no-heap-arrays	The compiler puts automatic arrays and arrays
				created   for	temporary   computations   in
				temporary storage in the stack storage area.

	      Description:

	      This option  puts  automatic  arrays  and  arrays  created  for
	      temporary computations on the heap instead of the stack.

	      If  heap-arrays is specified and size is omitted, all automatic
	      and temporary arrays are put on the heap. If  10	is  specified
	      for  size, all automatic and temporary arrays larger than 10 KB
	      are put on the heap.

	      Alternate Options:

	      None

       -help[category]

	      Displays all  available  compiler  options  or  a  category  of
	      compiler options.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      category		Is a category or class of options to display.
				Possible values are:

				advanced       Displays advanced optimization
					       options that allow fine tuning
					       of   compilation   or	allow
					       control over advanced features
					       of the compiler.

				codegen        Displays    Code    Generation
					       options.

				compatibility  Displays   options   affecting
					       language compatibility.

				component      Displays options for component
					       control.

				data	       Displays  options  related  to
					       interpretation  of   data   in
					       programs  or  the  storage  of
					       data.

				deprecated     Displays  options  that	 have
					       been deprecated.

				diagnostics    Displays  options  that affect
					       diagnostic messages  displayed
					       by the compiler.

				float	       Displays  options  that affect
					       floating-point operations.

				help	       Displays  all  the   available
					       help categories.

				inline	       Displays  options  that affect
					       inlining.

				ipo	       Displays       Interprocedural
					       Optimization (IPO) options

				language       Displays options affecting the
					       behavior   of   the   compiler
					       language features.

				link	       Displays   linking  or  linker
					       options.

				misc	       Displays miscellaneous options
					       that  do  not fit within other
					       categories.

				openmp	       Displays OpenMP	and  parallel
					       processing options.

				opt	       Displays options that help you
					       optimize code.

				output	       Displays options that  provide
					       control over compiler output.

				pgo	       Displays     Profile    Guided
					       Optimization (PGO) options.

				preproc        Displays options  that  affect
					       preprocessing operations.

				reports        Displays      options	  for
					       optimization reports.

	      Default:

	      OFF		No list is  displayed  unless  this  compiler
				option is specified.

	      Description:

	      This  option  displays  all  available  compiler	options  or a
	      category of compiler options. If category is not specified, all
	      available compiler options are displayed.

	      Alternate Options:

	      Linux and Mac OS X: None

       -Idir

	      Specifies an additional directory for the include path.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the directory to add to the include path.

	      Default:

	      OFF		The default include path is used.

	      Description:

	      This  option  specifies an additional directory for the include
	      path, which is searched for  module  files  referenced  in  USE
	      statements  and include files referenced in INCLUDE statements.
	      To specify multiple directories on the command line, repeat the
	      option for each directory you want to add.

	      For  all	USE statements and for those INCLUDE statements whose
	      file name does not begin with a device or directory  name,  the
	      directories are searched in this order:

	      1)

		  The directory containing the first source file.

		  Note	that  if  assume  nosource_include is specified, this
		  directory will not be searched.

	      2)

		  The current working  directory  where  the  compilation  is
		  taking place (if different from the above directory).

	      3)

		  Any  directory or directories specified using the I option.
		  If multiple directories are specified, they are searched in
		  the  order  specified  on  the  command  line, from left to
		  right.

	      4)

		  On Linux and Mac OS X systems,  any  directories  indicated
		  using  environment  variable CPATH. On Windows systems, any
		  directories indicated using environment variable INCLUDE.

	      This option affects  fpp	preprocessor  behavior	and  the  USE
	      statement.

	      Alternate Options:

	      Linux and Mac OS X: None

       -idirafterdir

	      Adds a directory to the second include file search path.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the name of the directory to add.

	      Default:

	      OFF		Include  file  search  paths  include certain
				default directories.

	      Description:

	      This option adds a directory to the second include file  search
	      path (after -I).

	      Alternate Options:

	      None

	      Tells  the  compiler  to	link  to  the IMSL* Fortran Numerical
	      Library*(IMSL* library).

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler  does  not  link  to  the	IMSL*
				library.

	      Description:

	      This  option  tells  the	compiler to link to the IMSL* Fortran
	      Numerical Library* (IMSL* library). This option  is  applicable
	      for  users  of  editions of the Intel® Fortran Compiler product
	      that include the IMSL* libraries.

	      Alternate Options:

	      None

       -inline-factor=n

       -no-inline-factor

	      Specifies the percentage multiplier that should be  applied  to
	      all inlining options that define upper limits.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is   a	 positive   integer   specifying  the
				percentage value. The default value is 100 (a
				factor of 1).

	      Default:

	      -no-inline-factor The  compiler  uses  default  heuristics  for
				inline routine expansion.

	      Description:

	      This option specifies the percentage multiplier that should  be
	      applied to all inlining options that define upper limits:

	      · -inline-max-size and /Qinline-max-size

	      · -inline-max-total-size and /Qinline-max-total-size

	      · -inline-max-per-routine and /Qinline-max-per-routine

	      · -inline-max-per-compile and /Qinline-max-per-compile

	      This  option  takes  the	default  value	for each of the above
	      options and multiplies it by n divided by 100. For example,  if
	      200 is specified, all inlining options that define upper limits
	      are multiplied by a factor of 2. This option is useful  if  you
	      do not want to individually increase each option limit.

	      If  you  specify	-no-inline-factor  (Linux  and	Mac  OS X) or
	      /Qinline-factor- (Windows), the following occurs:

	      · Every  function  is  considered  to  be  a  small  or  medium
		function; there are no large functions.

	      · There  is no limit to the size a routine may grow when inline
		expansion is performed.

	      · There is no limit to the number of times some routine may  be
		inlined into a particular routine.

	      · There  is  no  limit  to  the number of times inlining can be
		applied to a compilation unit.

	      To see compiler values for important inlining  limits,  specify
	      compiler	 option   -opt-report	(Linux	 and  Mac  OS  X)  or
	      /Qopt-report (Windows).

	      CAUTION: When you use this option to increase  default  limits,
	      the  compiler  may  do so much additional inlining that it runs
	      out of memory and terminates with an "out of memory" message.

	      Alternate Options:

	      None

       -inline-forceinline

	      Specifies that an inline routine should be inlined whenever the
	      compiler can do so.

	      Architectures: IA-32, Intel® 64 architectures

	      Default:

	      OFF		The  compiler  uses  default  heuristics  for
				inline routine expansion.

	      Description:

	      This option specifies that a inline routine should  be  inlined
	      whenever	the  compiler  can  do	so.  This causes the routines
	      marked with an inline keyword or directive to be treated as  if
	      they were "forceinline".

	      NOTE:  Because  C++  member  functions  whose  definitions  are
	      included	in  the  class	declaration  are  considered   inline
	      functions  by  default,  using this option will also make these
	      member functions "forceinline" functions.

	      The "forceinline" condition can also be specified by using  the
	      directive cDEC$ ATTRIBUTES FORCEINLINE.

	      To  see  compiler values for important inlining limits, specify
	      compiler option -opt-report (Linux and Mac OS) or  /Qopt-report
	      (Windows).

	      CAUTION:	When  you  use	this  option to change the meaning of
	      inline to "forceinline", the compiler may do so much additional
	      inlining that it runs out of memory and terminates with an "out
	      of memory" message.

	      Alternate Options:

	      None

       -inline-level=n

	      Specifies the level of inline function expansion.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the  inline  function  expansion   level.
				Possible values are 0, 1, and 2.

	      Default:

	      -inline-level=2	This is the default if option O2 is specified
				or is  in  effect  by  default.  On  Windows*
				systems,  this	is also the default if option
				O3 is specified.

	      -inline-level=0	This is the default if option -O0 (Linux*  OS
				and Mac OS* X) is specified.

	      Description:

	      This  option  specifies the level of inline function expansion.
	      Inlining	procedures   can   greatly   improve   the   run-time
	      performance of certain programs.

	      Option		Description

	      -inline-level=0 or Ob0
				Disables  inlining of user-defined functions.
				Note  that  statement  functions  are  always
				inlined.

	      -inline-level=1 or Ob1
				Enables inlining when an inline keyword or an
				inline directive is specified.

	      -inline-level=2 or Ob2
				Enables  inlining  of  any  function  at  the
				compiler's discretion.

	      Alternate Options:

	      Linux: -Ob  (this is a deprecated option)

	      Mac OS X: None

       -inline-max-per-compile=n

       -no-inline-max-per-compile

	      Specifies  the  maximum number of times inlining may be applied
	      to an entire compilation unit.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is a  positive	integer  that  specifies  the
				number of times inlining may be applied.

	      Default:

	      -no-inline-max-per-compile
				The  compiler  uses  default  heuristics  for
				inline routine expansion.

	      Description:

	      This option the maximum number of times inlining may be applied
	      to  an  entire  compilation unit. It limits the number of times
	      that inlining can be applied.

	      For compilations using Interprocedural Optimizations (IPO), the
	      entire   compilation   is   a   compilation   unit.  For	other
	      compilations, a compilation unit is a file.

	      If you specify -no-inline-max-per-compile (Linux and Mac OS  X)
	      or  /Qinline-max-per-compile-  (Windows),  there is no limit to
	      the number of times inlining may be applied  to  a  compilation
	      unit.

	      To  see  compiler values for important inlining limits, specify
	      compiler	option	-opt-report  (Linux  and   Mac	 OS   X)   or
	      /Qopt-report (Windows).

	      CAUTION:	When  you  use	this  option  to increase the default
	      limit, the compiler may do so much additional inlining that  it
	      runs  out  of  memory  and  terminates  with an "out of memory"
	      message.

	      Alternate Options:

	      None

       -inline-max-per-routine=n

       -no-inline-max-per-routine

	      Specifies the maximum number of times the  inliner  may  inline
	      into a particular routine.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  a  positive  integer  that	specifies the
				maximum  number  of  times  the  inliner  may
				inline into a particular routine.

	      Default:

	      -no-inline-max-per-routine
				The  compiler  uses  default  heuristics  for
				inline routine expansion.

	      Description:

	      This option specifies the maximum number of times  the  inliner
	      may  inline  into a particular routine. It limits the number of
	      times that inlining can be applied to any routine.

	      If you specify -no-inline-max-per-routine (Linux and Mac OS  X)
	      or  /Qinline-max-per-routine-  (Windows),  there is no limit to
	      the number  of  times  some  routine  may  be  inlined  into  a
	      particular routine.

	      To  see  compiler values for important inlining limits, specify
	      compiler	option	-opt-report  (Linux  and   Mac	 OS   X)   or
	      /Qopt-report (Windows).

	      To  see  compiler values for important inlining limits, specify
	      compiler	option	-opt-report  (Linux  and   Mac	 OS   X)   or
	      /Qopt-report (Windows).

	      CAUTION:	When  you  use	this  option  to increase the default
	      limit, the compiler may do so much additional inlining that  it
	      runs  out  of  memory  and  terminates  with an "out of memory"
	      message.

	      Alternate Options:

	      None

       -inline-max-size=n

       -no-inline-max-size

	      Specifies the lower limit for the  size  of  what  the  inliner
	      considers to be a large routine.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  a  positive  integer  that	specifies the
				minimum size of what the inliner considers to
				be a large routine.

	      Default:

	      -inline-max-size	The   compiler	sets  the  maximum  size  (n)
				dynamically, based on the platform.

	      Description:

	      This option specifies the lower limit for the size of what  the
	      inliner  considers  to  be  a  large  routine  (a  function  or
	      subroutine). The inliner classifies routines as small,  medium,
	      or  large.  This option specifies the boundary between what the
	      inliner considers to be medium and large-size routines.

	      The  inliner  prefers  to  inline  small	routines.  It  has  a
	      preference  against  inlining  large  routines.  So,  any large
	      routine is highly unlikely to be inlined.

	      If you specify -no-inline-max-size (Linux  and  Mac  OS  X)  or
	      /Qinline-max-size-  (Windows),  there  are  no  large routines.
	      Every routine is either a small or medium routine.

	      To see compiler values for important inlining  limits,  specify
	      compiler	 option   -opt-report	(Linux	 and  Mac  OS  X)  or
	      /Qopt-report (Windows).

	      CAUTION: When you use  this  option  to  increase  the  default
	      limit,  the compiler may do so much additional inlining that it
	      runs out of memory and  terminates  with	an  "out  of  memory"
	      message.

	      Alternate Options:

	      None

       -inline-max-total-size=n

       -no-inline-max-total-size

	      Specifies  how  much  larger  a  routine can normally grow when
	      inline expansion is performed.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is a  positive	integer  that  specifies  the
				permitted increase in the routine's size when
				inline expansion is performed.

	      Default:

	      -no-inline-max-total-size
				The  compiler  uses  default  heuristics  for
				inline routine expansion.

	      Description:

	      This  option  specifies  how much larger a routine can normally
	      grow  when  inline  expansion  is  performed.  It  limits   the
	      potential  size  of  the	routine.  For  example,  if  2000  is
	      specified for n, the size of  any  routine  will	normally  not
	      increase by more than 2000.

	      If  you  specify -no-inline-max-total-size (Linux and Mac OS X)
	      or /Qinline-max-total-size- (Windows), there is no limit to the
	      size a routine may grow when inline expansion is performed.

	      To  see  compiler values for important inlining limits, specify
	      compiler	option	-opt-report  (Linux  and   Mac	 OS   X)   or
	      /Qopt-report (Windows).

	      To  see  compiler values for important inlining limits, specify
	      compiler	option	-opt-report  (Linux  and   Mac	 OS   X)   or
	      /Qopt-report (Windows).

	      CAUTION:	When  you  use	this  option  to increase the default
	      limit, the compiler may do so much additional inlining that  it
	      runs  out  of  memory  and  terminates  with an "out of memory"
	      message.

	      Alternate Options:

	      None

       -inline-min-size=n

       -no-inline-min-size

	      Specifies the upper limit for the  size  of  what  the  inliner
	      considers to be a small routine.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  a  positive  integer  that	specifies the
				maximum size of what the inliner considers to
				be a small routine.

	      Default:

	      -no-inline-min-size
				The  compiler  uses  default  heuristics  for
				inline routine expansion.

	      Description:

	      This option specifies the upper limit for the size of what  the
	      inliner  considers  to  be  a  small  routine  (a  function  or
	      subroutine). The inliner classifies routines as small,  medium,
	      or  large.  This option specifies the boundary between what the
	      inliner considers to be small and medium-size routines.

	      The inliner has a preference to inline small routines. So, when
	      a routine is smaller than or equal to the specified size, it is
	      very likely to be inlined.

	      If you specify -no-inline-min-size (Linux  and  Mac  OS  X)  or
	      /Qinline-min-size-  (Windows), there is no limit to the size of
	      small routines. Every routine is a small routine; there are  no
	      medium or large routines.

	      To  see  compiler values for important inlining limits, specify
	      compiler	option	-opt-report  (Linux  and   Mac	 OS   X)   or
	      /Qopt-report (Windows).

	      To  see  compiler values for important inlining limits, specify
	      compiler	option	-opt-report  (Linux  and   Mac	 OS   X)   or
	      /Qopt-report (Windows).

	      CAUTION:	When  you  use	this  option  to increase the default
	      limit, the compiler may do so much additional inlining that  it
	      runs  out  of  memory  and  terminates  with an "out of memory"
	      message.

	      Alternate Options:

	      None

       -intconstant

       -nointconstant

	      Tells the compiler to use FORTRAN 77 semantics to determine the
	      kind parameter for integer constants.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      nointconstant	The  compiler  uses  the Fortran 2003 default
				INTEGER type.

	      Description:

	      This option tells the compiler to use FORTRAN 77	semantics  to
	      determine the kind parameter for integer constants.

	      With  FORTRAN 77 semantics, the kind is determined by the value
	      of the constant. All  constants  are  kept  internally  by  the
	      compiler in the highest precision possible. For example, if you
	      specify option intconstant,  the	compiler  stores  an  integer
	      constant	of  14 internally as INTEGER(KIND=8) and converts the
	      constant upon  reference	to  the  corresponding	proper	size.
	      Fortran  2003 specifies that integer constants with no explicit
	      KIND are kept internally in the default INTEGER kind (KIND=4 by
	      default).

	      Note  that  the internal precision for floating-point constants
	      is controlled by option fpconstant.

	      Alternate Options:

	      None

       -integer-size size

	      Specifies the default KIND for integer and logical variables.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      size		Is  the  size	for   integer	and   logical
				variables.  Possible  values  are: 16, 32, or
				64.

	      Default:

	      integer-size 32	Integer and logical  variables	are  4	bytes
				long (INTEGER(KIND=4) and LOGICAL(KIND=4)).

	      Description:

	      This  option  specifies  the default size (in bits) for integer
	      and logical variables.

	      Option		Description

	      integer-size 16	Makes default integer and logical variables 2
				bytes  long. INTEGER and LOGICAL declarations
				are treated as (KIND=2).

	      integer-size 32	Makes default integer and logical variables 4
				bytes  long. INTEGER and LOGICAL declarations
				are treated as (KIND=4).

	      integer-size 64	Makes default integer and logical variables 8
				bytes  long. INTEGER and LOGICAL declarations
				are treated as (KIND=8).

	      Alternate Options:

	      integer-size 16	Linux and Mac OS X: -i2

	      integer-size 32	Linux and Mac OS X: -i4

	      integer-size 64	Linux and Mac OS X: -i8

       -ip

       -no-ip

	      Determines whether additional interprocedural optimizations for
	      single-file compilation are enabled.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Some  limited  interprocedural	optimizations
				occur, including  inline  function  expansion
				for  calls  to	functions  defined within the
				current source file. These optimizations  are
				a  subset  of full intra-file interprocedural
				optimizations. Note that this setting is  not
				the same as -no-ip (Linux and Mac OS X).

	      Description:

	      This   option  determines  whether  additional  interprocedural
	      optimizations for single-file compilation are enabled.

	      Options -ip (Linux and Mac OS  X)  and  /Qip  (Windows)  enable
	      additional   interprocedural   optimizations   for  single-file
	      compilation.

	      Options -no-ip (Linux and Mac OS X) and /Qip- (Windows) may not
	      disable  inlining.  To  ensure  that  inlining  of user-defined
	      functions is disabled,  specify  -inline-level=0or  -fno-inline
	      (Linux and Mac OS X), or specify /Ob0 (Windows).

	      Alternate Options:

	      None

       -ip-no-inlining

	      Disables	full  and partial inlining enabled by interprocedural
	      optimization options.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Inlining    enabled    by     interprocedural
				optimization options is performed.

	      Description:

	      This  option  disables full and partial inlining enabled by the
	      following interprocedural optimization options:

	      · On Linux and Mac OS X systems: -ip or -ipo

	      · On Windows systems: /Qip, /Qipo, or /Ob2

	      It has no effect on other interprocedural optimizations.

	      On  Windows  systems,  this  option  also  has  no  effect   on
	      user-directed inlining specified by option /Ob1.

	      Alternate Options:

	      None

       -ip-no-pinlining

	      Disables	  partial   inlining   enabled	 by   interprocedural
	      optimization options.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Inlining    enabled    by     interprocedural
				optimization options is performed.

	      Description:

	      This  option disables partial inlining enabled by the following
	      interprocedural optimization options:

	      · On Linux and Mac OS X systems: -ip or -ipo

	      · On Windows systems: /Qip or /Qipo

	      It has no effect on other interprocedural optimizations.

	      Alternate Options:

	      None

       -ipo[n]

	      Enables interprocedural optimization between files.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is an optional	integer  that  specifies  the
				number	of  object  files the compiler should
				create. The integer must be greater  than  or
				equal to 0.

	      Default:

	      OFF		Multifile interprocedural optimization is not
				enabled.

	      Description:

	      This option enables interprocedural optimization between files.
	      This  is	also  called  multifile  interprocedural optimization
	      (multifile IPO) or Whole Program Optimization (WPO).

	      When you specify this  option,  the  compiler  performs  inline
	      function	expansion  for calls to functions defined in separate
	      files.

	      You cannot specify the names for the files that are created.

	      If n is 0, the compiler decides whether to create one  or  more
	      object   files  based  on  an  estimate  of  the	size  of  the
	      application.  It	generates   one   object   file   for	small
	      applications,   and   two   or  more  object  files  for	large
	      applications.

	      If n is greater than 0, the compiler generates n object  files,
	      unless  n exceeds the number of source files (m), in which case
	      the compiler generates only m object files.

	      If you do not specify n, the default is 0.

	      Alternate Options:

	      None

       -ipo-c

	      Tells the  compiler  to  optimize  across  multiple  files  and
	      generate a single object file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  compiler  does  not generate a multifile
				object file.

	      Description:

	      This option tells the  compiler  to  optimize  across  multiple
	      files  and  generate  a  single object file (named ipo_out.o on
	      Linux and Mac OS X systems; ipo_out.obj on Windows systems).

	      It performs the same optimizations as -ipo (Linux and Mac OS X)
	      or /Qipo (Windows), but compilation stops before the final link
	      stage, leaving an optimized object file that  can  be  used  in
	      further link steps.

	      Alternate Options:

	      None

       -ipo-jobsn

	      Specifies   the  number  of  commands  (jobs)  to  be  executed
	      simultaneously  during  the  link  phase	 of   Interprocedural
	      Optimization (IPO).

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the  number  of  commands  (jobs)  to run
				simultaneously. The number  must  be  greater
				than or equal to 1.

	      Default:

	      -ipo-jobs1	One   command	(job)	is   executed  in  an
				interprocedural optimization parallel build.

	      Description:

	      This option specifies the  number  of  commands  (jobs)  to  be
	      executed	  simultaneously    during    the   link   phase   of
	      Interprocedural Optimization (IPO). It should only be  used  if
	      the  link-time  compilation is generating more than one object.
	      In  this	case,  each  object  is  generated  by	 a   separate
	      compilation, which can be done in parallel.

	      This option can be affected by the following compiler options:

	      · -ipo   (Linux	and   Mac  OS  X)  or  /Qipo  (Windows)  when
		applications are large enough that the	compiler  decides  to
		generate multiple object files.

	      · -ipon  (Linux  and  Mac  OS  X) or /Qipon (Windows) when n is
		greater than 1.

	      · -ipo-separate (Linux) or /Qipo-separate (Windows)

	      CAUTION:	Be   careful   when   using   this   option.   On   a
	      multi-processor  system  with  lots  of  memory,	it  can speed
	      application build time. However,	if  n  is  greater  than  the
	      number of processors, or if there is not enough memory to avoid
	      thrashing, this option can increase application build time.

	      Alternate Options:

	      None

       -ipo-S

	      Tells the  compiler  to  optimize  across  multiple  files  and
	      generate a single assembly file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  compiler  does  not generate a multifile
				assembly file.

	      Description:

	      This option tells the  compiler  to  optimize  across  multiple
	      files  and  generate a single assembly file (named ipo_out.s on
	      Linux and Mac OS X systems; ipo_out.asm on Windows systems).

	      It performs the same optimizations as -ipo (Linux and Mac OS X)
	      or /Qipo (Windows), but compilation stops before the final link
	      stage, leaving an optimized assembly file that can be  used  in
	      further link steps.

	      Alternate Options:

	      None

       -ipo-separate (L*X only)

	      Tells the compiler to generate one object file for every source
	      file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler decides whether to create one or
				more object files.

	      Description:

	      This  option tells the compiler to generate one object file for
	      every source file. It  overrides	any  -ipo  (Linux)  or	/Qipo
	      (Windows) specification.

	      Alternate Options:

	      None

       -isystemdir

	      Specifies a directory to add to the start of the system include
	      path.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the directory to add to the system include
				path.

	      Default:

	      OFF		The default system include path is used.

	      Description:

	      This  option specifies a directory to add to the system include
	      path. The compiler searches the specified directory for include
	      files  after  it	searches  all directories specified by the -I
	      compiler option but before  it  searches	the  standard  system
	      directories.  This  option  is  provided for compatibility with
	      gcc.

	      Alternate Options:

	      None

       -lstring

	      Tells the  linker  to  search  for  a  specified	library  when
	      linking.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      string		Specifies  the	library  (libstring) that the
				linker should search.

	      Default:

	      OFF		The linker searches for standard libraries in
				standard directories.

	      Description:

	      This  option tells the linker to search for a specified library
	      when linking.

	      When resolving references, the  linker  normally	searches  for
	      libraries  in  several  standard	directories,  in  directories
	      specified by the L option, then in the library specified by the
	      l option.

	      The linker searches and processes libraries and object files in
	      the order they are  specified.  So,  you	should	specify  this
	      option following the last object file it applies to.

	      Alternate Options:

	      None

       -Ldir

	      Tells  the  linker  to  search  for  libraries  in  a specified
	      directory before searching the standard directories.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the name of the directory  to  search  for
				libraries.

	      Default:

	      OFF		The  linker searches the standard directories
				for libraries.

	      Description:

	      This option tells the linker  to	search	for  libraries	in  a
	      specified  directory  before searching for them in the standard
	      directories.

	      Alternate Options:

	      None

       -list[=filename]

       -no-list

	      Tells the compiler to create a listing of the source file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the file for  output.  It  can
				include a path.

	      Default:

	      -no-list or /list-
				No listing is created for the source file.

	      Description:

	      This  option  tells  the	compiler  to  create a listing of the
	      source file.  The listing contains the following:

	      · The contents of files included with INCLUDE statements

	      · A symbol list with a line  number  cross-reference  for  each
		routine

	      · A list of compiler options used for the current compilation

	      The  contents  of  the  listing can be controlled by specifying
	      option show.

	      The line length of the listing can be specified by using option
	      list-line-len.

	      The page length of the listing can be specified by using option
	      list-page-len.

	      If you do not specify filename, the output is written to a file
	      in  the same directory as the source. The file name is the name
	      of the source file with an extension of .lst.

	      Alternate Options:

	      None

       -list-line-len=n

	      Specifies the line length for the listing generated when option
	      list is specified.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  a  positive integer indicating the number
				of columns to show in the listing.

	      Default:

	      80		When a listing is generated, the default line
				length is 80 columns.

	      Description:

	      This option specifies the line length for the listing generated
	      when option list is specified.

	      If you specify option list-line-len and do not  specify  option
	      list, the option is ignored.

	      Alternate Options:

	      None

       -list-page-len=n

	      Specifies the page length for the listing generated when option
	      list is specified.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is a positive integer indicating  the  number
				of lines on a page to show in the listing.

	      Default:

	      60		When a listing is generated, the default page
				length is 60 lines.

	      Description:

	      This option specifies the page length for the listing generated
	      when option list is specified.

	      If  you  specify option list-page-len and do not specify option
	      list, the option is ignored.

	      Alternate Options:

	      None

       -logo

       -nologo

	      Displays the compiler version information.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      Linux and Mac OS X: nologo
				The  compiler  version	information  is   not
				displayed.

	      Description:

	      This  option  displays  the  startup banner, which contains the
	      following compiler information:

	      · The name of the compiler and its applicable architecture

	      · The major and minor  version  of  the  compiler,  the  update
		number,   and	the   package	number(for  example,  Version
		11.1.0.047)

	      · The  specific  build  and  build  date	(for  example,	Build
		<builddate>)

	      · The copyright date of the software

	      This option can be placed anywhere on the command line.

	      Alternate Options:

	      Linux and Mac OS X: -V

       -mcode

	      Tells  the  compiler  to	generate  code	specialized  for  the
	      processor that executes your program.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      code		Indicates the instructions  to	be  generated
				for   the   set   of   processors   in	 each
				description.   Many    of    the    following
				descriptions  refer  to Intel® Streaming SIMD
				Extensions  (Intel®  SSE)  and	 Supplemental
				Streaming   SIMD  Extensions  (Intel®  SSSE).
				Possible values are:

				avx	       May generate  Intel®  Advanced
					       Vector	 Extensions   (Intel®
					       AVX), SSE4.2,  SSE4.1,  SSSE3,
					       SSE3,	 SSE2,	   and	  SSE
					       instructions.

				sse4.2	       May  generate  Intel®  SSE4.2,
					       SSE4.1, SSSE3, SSE3, SSE2, and
					       SSE instructions.

				sse4.1	       May  generate  Intel®  SSE4.1,
					       SSSE3,  SSE3,  SSE2,  and  SSE
					       instructions.

				ssse3	       May  generate  Intel®   SSSE3,
					       SSE3,	 SSE2,	   and	  SSE
					       instructions.

				sse3	       May  generate   Intel®	SSE3,
					       SSE2, and SSE instructions.

				sse2	       May  generate  Intel® SSE2 and
					       SSE instructions.  This	value
					       is  only  available  on	Linux
					       systems.

				sse	       This    option	 has	 been
					       deprecated; it is now the same
					       as specifying ia32.

				ia32	       Generates x86/x87 generic code
					       that  is compatible with IA-32
					       architecture.   Disables   any
					       default	extended  instruction
					       settings, and  any  previously
					       set    extended	  instruction
					       settings.   It  also  disables
					       all	   processor-specific
					       optimizations		  and
					       instructions.  This  value  is
					       only   available   on	Linux
					       systems	     using	IA-32
					       architecture.

	      Default:

	      Linux  systems:  -msse2  Mac   OS   X   systems	using	IA-32
	      architecture:   -msse3   Mac  OS	X  systems  using  Intel®  64
	      architecture: -mssse3
				For more information on the  default  values,
				see Arguments above.

	      Description:

	      This option tells the compiler to generate code specialized for
	      the processor that executes your program.

	      Code  generated  with  these  options  should  execute  on  any
	      compatible,   non-Intel	processor   with   support   for  the
	      corresponding instruction set.

	      Options  -x  and	-m  are  mutually  exclusive.  If  both   are
	      specified,  the  compiler  uses  the  last  one  specified  and
	      generates a warning.

	      For compatibility with gcc, the compiler allows  the  following
	      options  but they have no effect. You will get a warning error,
	      but the instructions associated  with  the  name	will  not  be
	      generated. You should use the suggested replacement options.

	      gcc Compatibility Option
				Suggested Replacement Option

	      -mfma		-march=core-avx2

	      -mbmi, -mavx2, -mlzcnt
				-march=core-avx2

	      -mmovbe		-march=atom -minstruction=movbe

	      -mcrc32, -maes, -mpclmul, -mpopcnt
				-march=corei7

	      -mvzeroupper	-march=corei7-avx

	      -mfsgsbase, -mrdrnd, -mf16c
				-march=core-avx-i

	      Alternate Options:

	      Linux and Mac OS X: None

       -m32

       -m64

	      Tells   the   compiler   to   generate   code  for  a  specific
	      architecture.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler's behavior depends on  the  host
				system.

	      Description:

	      These options tell the compiler to generate code for a specific
	      architecture.

	      Option		Description

	      -m32		Tells the compiler to generate code for IA-32
				architecture.

	      -m64		Tells  the  compiler  to  generate  code  for
				Intel® 64 architecture.

	      The -m32 and -m64 options are the same as  Mac  OS*  X  options
	      -arch  i386  and	-arch  x86_64,	respectively. Note that these
	      options are provided for compatibility with gcc. They  are  not
	      related to the Intel® Fortran  compiler option arch.

	      Alternate Options:

	      None

       -map-opts (L*X only)

	      Maps  one  or  more  compiler  options to their equivalent on a
	      different operating system.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No platform mappings are performed.

	      Description:

	      This  option  maps  one  or  more  compiler  options  to	their
	      equivalent  on  a  different  operating  system.	The result is
	      output to stdout.

	      On Windows systems, the options you provide are presumed to  be
	      Windows  options, so the options that are output to stdout will
	      be Linux equivalents. On Linux systems, the options you provide
	      are  presumed  to  be  Linux  options,  so the options that are
	      output to stdout will be Windows equivalents.

	      The tool can be invoked from the compiler command  line  or  it
	      can be used directly.

	      No  compilation  is  performed  when the option mapping tool is
	      used.

	      This option is useful if you have both compilers	and  want  to
	      convert scripts or makefiles.

	      NOTE:  Compiler  options	are mapped to their equivalent on the
	      architecture you are using. For example, if  you	are  using  a
	      processor with IA-32 architecture, you will only see equivalent
	      options  that  are   available   on   processors	 with	IA-32
	      architecture.

	      Alternate Options:

	      None

       -march=processor

	      Tells the compiler to generate code for a specified processor.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      processor 	Is  the  processor  for  which	the  compiler
				should generate code. Possible values are:

				core-avx2      Generates code for  processors
					       that  support  Intel® Advanced
					       Vector  Extensions  2  (Intel®
					       AVX2),	Intel®	AVX,  SSE4.2,
					       SSE4.1, SSSE3, SSE3, SSE2, and
					       SSE instructions.

				core-avx-i     Generates  code for processors
					       that support  Intel®  Advanced
					       Vector	 Extensions   (Intel®
					       AVX),  including  instructions
					       in  Intel®  Core 2™ processors
					       in process technology  smaller
					       than   32nm,   Intel®  SSE4.2,
					       SSE4.1, SSSE3, SSE3, SSE2, and
					       SSE instructions.

				corei7-avx     Generates  code for processors
					       that support Intel(R) Advanced
					       Vector	 Extensions   (Intel®
					       AVX), Intel®  SSE4.2,  SSE4.1,
					       SSSE3,  SSE3,  SSE2,  and  SSE
					       instructions.

				corei7	       Generates  code	 for   Intel®
					       Core™   i7   processors	 that
					       support	   Intel(R)	 SSE4
					       Efficient  Accelerated  String
					       and	Text	   Processing
					       instructions.	 May	 also
					       generate      Intel®	 SSE4
					       Vectorizing Compiler and Media
					       Accelerator,   Intel®   SSSE3,
					       SSE3,	 SSE2,	   and	  SSE
					       instructions   and   it	  may
					       optimize  for the Intel® Core™
					       processor family.

				atom	       Generates code for  processors
					       that	  support	MOVBE
					       instructions, depending on the
					       setting	      of       option
					       -minstruction (Linux*  OS  and
					       Mac  OS*  X)  or /Qinstruction
					       (Windows*   OS).   May	 also
					       generate  Intel®  SSSE3, SSE3,
					       SSE2, and SSE instructions for
					       Intel   processors.  Optimizes
					       for the Intel® Atom™ processor
					       and   Intel®  Centrino®	Atom™
					       Processor Technology.

				core2	       Generates code for the  Intel®
					       Core 2™ processor family.

				pentium-m      Generates   code   for  Intel®
					       Pentium® M processors.

				pentium4       Generates  code	 for   Intel®
					       Pentium®  4  processors.  This
					       value is only available on

				pentium3       Generates  code	 for   Intel®
					       Pentium®  III processors. This
					       value  is  only	available  on
					       Linux* OS.

	      Default:

	      OFF or -march=pentium4
				On  systems  using  IA-32  architecture,  the
				compiler does not generate processor-specific
				code  unless  it is told to do so. On systems
				using Intel® 64  architecture,	the  compiler
				generates    code   for   Intel   Pentium   4
				processors.

	      Description:

	      This option tells the compiler to generate code for a specified
	      processor.

	      Specifying -march=pentium4 sets -mtune=pentium4.

	      For  compatibility, a number of historical processor values are
	      also supported, but the generated code will not differ from the
	      default.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's  compilers  may  or may not optimize to the same degree
	      for non-Intel microprocessors for optimizations  that  are  not
	      unique  to  Intel  microprocessors. These optimizations include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel  does  not	guarantee the availability, functionality, or
	      effectiveness  of  any  optimization  on	microprocessors   not
	      manufactured  by	Intel. Microprocessor-dependent optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors.	Certain  optimizations	not specific to Intel
	      microarchitecture  are  reserved	for  Intel   microprocessors.
	      Please  refer  to  the  applicable  product  User and Reference
	      Guides for more information regarding the specific  instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      -march=pentium3	Linux: -xSSE

				Mac OS X: None

	      -march=pentium4 -march=pentium-m
				Linux: -xSSE2

				Mac OS X: None

	      -march=core2	Linux: -xSSSE3

				Mac OS X: None

       -mcmodel=mem_model (L*X only)

	      Tells  the  compiler to use a specific memory model to generate
	      code and store data.

	      Architectures: Intel® 64 architecture

	      Arguments:

	      mem_model 	Is the memory model to use.  Possible  values
				are:

				small	       Tells the compiler to restrict
					       code and data to the first 2GB
					       of address space. All accesses
					       of code and data can  be  done
					       with    Instruction    Pointer
					       (IP)-relative addressing.

				medium	       Tells the compiler to restrict
					       code  to  the  first  2GB;  it
					       places no  memory  restriction
					       on  data. Accesses of code can
					       be   done   with   IP-relative
					       addressing,  but  accesses  of
					       data   must   be   done	 with
					       absolute addressing.

				large	       Places  no  memory restriction
					       on code or data. All  accesses
					       of  code and data must be done
					       with absolute addressing.

	      Default:

	      -mcmodel=small	On systems using Intel® 64 architecture,  the
				compiler restricts code and data to the first
				2GB of	address  space.  Instruction  Pointer
				(IP)-relative	addressing  can  be  used  to
				access code and data.

	      Description:

	      This option tells the compiler to use a specific	memory	model
	      to  generate  code  and store data. It can affect code size and
	      performance. If your program has COMMON blocks and  local  data
	      with   a	 total	size  smaller  than  2GB,  -mcmodel=small  is
	      sufficient. COMMONs larger than 2GB  require-mcmodel=medium  or
	      -mcmodel=large.  Allocation  of  memory  larger than 2GB can be
	      done with any setting of -mcmodel.

	      IP-relative addressing requires only 32 bits, whereas  absolute
	      addressing requires 64-bits. IP-relative addressing is somewhat
	      faster. So, the small memory model  has  the  least  impact  on
	      performance.

	      NOTE:  When  you specify -mcmodel=medium or -mcmodel=large, you
	      must also specify compiler option -shared-intel to ensure  that
	      the  correct  dynamic  versions of the Intel run-time libraries
	      are used.

	      Alternate Options:

	      None

	      Tells the linker to  search  for	unresolved  references	in  a
	      multithreaded, dynamic-link run-time library.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The linker searches for unresolved references
				in   a	 single-threaded,   static   run-time
				library.

	      Description:

	      This   option   tells  the  linker  to  search  for  unresolved
	      references in  a	multithreaded,	dynamic-link  (DLL)  run-time
	      library.	This  is  the  same  as  specifying options /libs:dll
	      /threads /dbglibs. You can also specify /MDd, where d indicates
	      a debug version.

	      Alternate Options:

	      None

       -mdynamic-no-pic (M*X only)

	      Generates   code	that  is  not  position-independent  but  has
	      position-independent external references.

	      Architectures: IA-32 architecture

	      Arguments:

	      None

	      Default:

	      OFF		All  references  are  generated  as  position
				independent.

	      Description:

	      This option generates code that is not position-independent but
	      has position-independent external references.

	      The generated code is suitable for building executables, but it
	      is not suitable for building shared libraries.

	      This  option  may  reduce  code size and produce more efficient
	      code. It overrides the -fpic compiler option.

	      Alternate Options:

	      None

       -minstruction=[no]movbe

	      Determines whether MOVBE instructions are generated  for	Intel
	      processors.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      –minstruction=nomovbe
				The   compiler	 does	not   generate	MOVBE
				instructions for Intel® Atom™ processors.

	      Description:

	      This option determines whether MOVBE instructions are generated
	      for Intel processors. To use this option, you must also specify
	      -xSSSE3_ATOM (Linux and Mac OS X) or /QxSSSE3_ATOM (Windows).

	      If -minstruction=movbe or /Qinstruction:movbe is specified, the
	      following occurs:

	      · MOVBE  instructions  are  generated  that are specific to the
		Intel® Atom™ processor.

	      · The  options  are  ON  by  default   when   -xSSSE3_ATOM   or
		/QxSSSE3_ATOM is specified.

	      · Generated  executables	can  only  be  run  on	Intel®	Atom™
		processors or processors  that	support  Intel®  Supplemental
		Streaming SIMD Extensions 3 (Intel® SSSE3) and MOVBE.

	      If -minstruction=nomovbe or /Qinstruction:nomovbe is specified,
	      the following occurs:

	      · The compiler optimizes code for the Intel®  Atom™  processor,
		but it does not generate MOVBE instructions.

	      · Generated   executables   can  be  run	on  non-Intel®	Atom™
		processors that support Intel® SSE3.

	      Alternate Options:

	      None

       -mkl[=lib]

	      Tells the compiler to link to certain parts of the Intel®  Math
	      Kernel Library (Intel® MKL).

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      lib		Indicates  the	part  of the library that the
				compiler should link to. Possible values are:

				parallel       Tells  the  compiler  to  link
					       using the threaded part of the
					       Intel®  MKL.   This   is   the
					       default	 if   the  option  is
					       specified with no lib.

				sequential     Tells  the  compiler  to  link
					       using the non-threaded part of
					       the Intel® MKL.

				cluster        Tells  the  compiler  to  link
					       using the cluster part and the
					       sequential part of the  Intel®
					       MKL.

	      Default:

	      OFF		The compiler does not link to the Intel® MKL.

	      Description:

	      This  option tells the compiler to link to certain parts of the
	      Intel® Math Kernel Library (Intel® MKL).

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's compilers may or may not optimize to  the  same  degree
	      for  non-Intel  microprocessors  for optimizations that are not
	      unique to Intel microprocessors.	These  optimizations  include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel does not guarantee the  availability,  functionality,  or
	      effectiveness   of  any  optimization  on  microprocessors  not
	      manufactured by Intel.  Microprocessor-dependent	optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors. Certain optimizations not  specific  to	Intel
	      microarchitecture   are  reserved  for  Intel  microprocessors.
	      Please refer to  the  applicable	product  User  and  Reference
	      Guides  for more information regarding the specific instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -module path

	      Specifies the directory where module  files  should  be  placed
	      when created and where they should be searched for.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      path		Is the directory for module files.

	      Default:

	      OFF		The  compiler  places  module  files  in  the
				current directory.

	      Description:

	      This option specifies the directory (path) where module  (.mod)
	      files  should  be  placed when created and where they should be
	      searched for (USE statement).

	      Alternate Options:

	      None

       -mp1

	      Improves floating-point precision and consistency.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  compiler  provides  good  accuracy   and
				run-time  performance  at the expense of less
				consistent floating-point results.

	      Description:

	      This option improves floating-point consistency. It ensures the
	      out-of-range  check of operands of transcendental functions and
	      improves the accuracy of floating-point compares.

	      This option prevents the compiler from performing optimizations
	      that  change  NaN comparison semantics and causes all values to
	      be truncated to declared precision  before  they	are  used  in
	      comparisons.  It	also  causes  the  compiler  to  use  library
	      routines that give better precision results compared to the X87
	      transcendental instructions.

	      This option disables fewer optimizations and has less impact on
	      performance than option fltconsistency or mp.

	      Alternate Options:

	      None

       -mtune=processor

	      Performs optimizations for specific processors.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      processor 	Is  the  processor  for  which	the  compiler
				should	 perform  optimizations.     Possible
				values are:

				generic        Generates   code    for	  the
					       compiler's default behavior.

				core2	       Optimizes for the Intel® Core™
					       2 processor family,  including
					       support	for MMX™, Intel® SSE,
					       SSE2,	SSE3	and	SSSE3
					       instruction sets.

				pentium        Optimizes  for Intel® Pentium®
					       processors.

				pentium-mmx    Optimizes for Intel®  Pentium®
					       with MMX technology.

				pentiumpro     Optimizes  for Intel® Pentium®
					       Pro,  Intel  Pentium  II,  and
					       Intel Pentium III processors.

				pentium4       Optimizes  for Intel® Pentium®
					       4 processors.

				pentium4m      Optimizes for Intel®  Pentium®
					       4    processors	  with	  MMX
					       technology.

	      Default:

	      generic		Code is generated for the compiler's  default
				behavior.

	      Description:

	      This option performs optimizations for specific processors.

	      The  resulting executable is backwards compatible and generated
	      code is optimized for specific processors.  For  example,  code
	      generated  with  -mtune=pentium4	will  run  correctly on Core2
	      processors, but it might not run as fast	as  if	it  had  been
	      generated using -mtune=core2.

	      The  following  table  shows  on which architecture you can use
	      each value.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's compilers may or may not optimize to  the  same  degree
	      for  non-Intel  microprocessors  for optimizations that are not
	      unique to Intel microprocessors.	These  optimizations  include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel does not guarantee the  availability,  functionality,  or
	      effectiveness   of  any  optimization  on  microprocessors  not
	      manufactured by Intel.  Microprocessor-dependent	optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors. Certain optimizations not  specific  to	Intel
	      microarchitecture   are  reserved  for  Intel  microprocessors.
	      Please refer to  the  applicable	product  User  and  Reference
	      Guides  for more information regarding the specific instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      -mtune		Linux: -mcpu (this is a deprecated option)

				Mac OS X: None

       -multiple-processes[=n]

	      Creates multiple processes that can be used  to  compile	large
	      numbers of source files at the same time.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the  maximum number of processes that the
				compiler should create.

	      Default:

	      OFF		A single process is used  to  compile  source
				files.

	      Description:

	      This  option  creates  multiple  processes  that can be used to
	      compile large numbers of source files at the same time. It  can
	      improve  performance  by	reducing the time it takes to compile
	      source files on the command line.

	      This option causes the compiler to create one or more copies of
	      itself, each in a separate process. These copies simultaneously
	      compile the source files.

	      If n is not specified for this option, the default value is  as
	      follows:

	      · On  Windows  OS,  the  value  is  based on the setting of the
		NUMBER_OF_PROCESSORS environment variable.

	      · On Linux OS and Mac OS X, the value is 2.

	      This option applies to compilations,  but  not  to  linking  or
	      link-time code generation.

	      Alternate Options:

	      None

       -names keyword

	      Specifies  how  source  code identifiers and external names are
	      interpreted.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies how to  interpret  the  identifiers
				and  external  names in source code. Possible
				values are:

				lowercase      Causes the compiler to  ignore
					       case	  differences	   in
					       identifiers  and  to   convert
					       external names to lowercase.

				uppercase      Causes  the compiler to ignore
					       case	 differences	   in
					       identifiers   and  to  convert
					       external names to uppercase.

				as_is	       Causes	the    compiler    to
					       distinguish  case  differences
					       in identifiers and to preserve
					       the case of external names.

	      Default:

	      lowercase 	This  is  the  default	on Linux and Mac OS X
				systems.   The	  compiler    ignores	 case
				differences   in   identifiers	and  converts
				external names to lowercase.

	      uppercase 	This is the default on Windows	systems.  The
				compiler    ignores   case   differences   in
				identifiers and converts  external  names  to
				uppercase.

	      Description:

	      This  option specifies how source code identifiers and external
	      names are interpreted.  It  can  be  useful  in  mixed-language
	      programming.

	      This  naming convention applies whether names are being defined
	      or referenced.

	      You can  use  the  ALIAS	directive  to  specify	an  alternate
	      external	 name	to   be   used	when  referring  to  external
	      subprograms.

	      CAUTION: On Windows systems, if you specify option /iface:cref,
	      it  overrides the default for external names and causes them to
	      be lowercase. It is as if you specified  "!dec$  attributes  c,
	      reference" for the external name.

	      If you specify option /iface:cref and want external names to be
	      uppercase, you must explicitly specify option /names:uppercase.

	      Alternate Options:

	      names lowercase	Linux and Mac OS X:  -lowercase  (this	is  a
				deprecated option)

	      names uppercase	Linux  and  Mac  OS  X: -uppercase (this is a
				deprecated option)

       -no-bss-init

	      Tells  the  compiler  to	place  in  the	 DATA	section   any
	      uninitialized   variables   and	explicitly   zero-initialized
	      variables.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Uninitialized	variables   and    explicitly
				zero-initialized  variables are placed in the
				BSS section.

	      Description:

	      This option tells the compiler to place in the DATA section any
	      uninitialized   variables   and	explicitly   zero-initialized
	      variables.

	      Alternate Options:

	      Linux and Mac OS X: -nobss-init (this is a deprecated option)

       -nodefaultlibs

	      Prevents	the  compiler  from  using  standard  libraries  when
	      linking.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The standard libraries are linked.

	      Description:

	      This option prevents the compiler from using standard libraries
	      when linking.

	      Alternate Options:

	      None

       -nofor-main

	      Specifies that the main program is not written in Fortran.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler  assumes  the  main  program  is
				written in Fortran.

	      Description:

	      This  option  specifies that the main program is not written in
	      Fortran. It is a link-time option that  prevents	the  compiler
	      from linking for_main.o into applications.

	      For  example,  if  the main program is written in C and calls a
	      Fortran subprogram,  specify  -nofor-main  when  compiling  the
	      program with the ifort command.

	      If  you  omit  this  option, the main program must be a Fortran
	      program.

	      Alternate Options:

	      None

       -nolib-inline

	      Disables inline expansion  of  standard  library	or  intrinsic
	      functions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  compiler  inlines	many standard library
				and intrinsic functions.

	      Description:

	      This option disables inline expansion of	standard  library  or
	      intrinsic  functions.  It  prevents the unexpected results that
	      can arise from inline expansion of these functions.

	      Alternate Options:

	      None

       -nostartfiles

	      Prevents the compiler from using standard  startup  files  when
	      linking.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler uses standard startup files when
				linking.

	      Description:

	      This option prevents the compiler from using  standard  startup
	      files when linking.

	      Alternate Options:

	      None

       -nostdlib

	      Prevents the compiler from using standard libraries and startup
	      files when linking.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler uses standard startup files  and
				standard libraries when linking.

	      Description:

	      This option prevents the compiler from using standard libraries
	      and startup files when linking.

	      Alternate Options:

	      None

       -o filename

	      Specifies the name for an output file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name for the output  file.  The	space
				before filename is optional.

	      Default:

	      OFF		The  compiler  uses the default file name for
				an output file.

	      Description:

	      This option specifies the name for an output file as follows:

	      · If -c is specified, it specifies the name  of  the  generated
		object file.

	      · If  -S	is  specified, it specifies the name of the generated
		assembly listing file.

	      · If -preprocess-only or -P is specified, it specifies the name
		of the generated preprocessor file.

	      Otherwise, it specifies the name of the executable file.

	      NOTE:  If  you  misspell	a compiler option beginning with "o",
	      such as -openmp, -opt-report, etc., the compiler interprets the
	      misspelled option as an -ofilename option. For example, say you
	      misspell "-opt-report" as "  -opt-reprt";  in  this  case,  the
	      compiler	interprets  the  misspelled  option as "-o pt-reprt",
	      where pt-reprt is the output file name.

	      Alternate Options:

	      Linux and Mac OS X: None

	      Windows: /exe

       -O[n]

	      Specifies the code optimization for applications.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is the optimization  level.  Possible  values
				are  1,  2,  or 3. On Linux* OS and Mac OS* X
				systems, you can also specify 0.

	      Default:

	      O2		Optimizes for code speed.  This  default  may
				change	depending  on  which  other  compiler
				options  are  specified.  For  details,   see
				below.

	      Description:

	      This option specifies the code optimization for applications.

	      Option		Description

	      O (Linux* OS and Mac OS* X)
				This is the same as specifying O2.

	      O0 (Linux OS and Mac OS X)
				Disables all optimizations.

	      This  option  may  set other options. This is determined by the
	      compiler, depending on which operating system and  architecture
	      you are using. The options that are set may change from release
	      to release.

	      This option causes certain warn options to be ignored. This  is
	      the default if you specify option -debug (with no keyword).

	      O1		Enables  optimizations for speed and disables
				some optimizations that  increase  code  size
				and  affect  speed.  To limit code size, this
				option:

				· Enables global optimization; this  includes
				  data-flow  analysis,	code motion, strength
				  reduction	and	test	 replacement,
				  split-lifetime  analysis,  and  instruction
				  scheduling.

	      This option may set other options. This is  determined  by  the
	      compiler,  depending on which operating system and architecture
	      you are using. The options that are set may change from release
	      to release.

	      The  O1  option  may  improve performance for applications with
	      very large code size, many branches,  and  execution  time  not
	      dominated by code within loops.

	      O2		Enables  optimizations for speed. This is the
				generally  recommended	optimization   level.
				Vectorization  is  enabled  at	O2 and higher
				levels.

	      On  systems  using  IA-32   architecture:   Some	 basic	 loop
	      optimizations such as Distribution, Predicate Opt, Interchange,
	      multi-versioning, and scalar replacements are performed.

	      This option also enables:

				· Inlining of intrinsics

				· Intra-file  interprocedural	optimization,
				  which includes:

				  · inlining

				  · constant propagation

				  · forward substitution

				  · routine attribute propagation

				  · variable address-taken analysis

				  · dead static function elimination

				  · removal of unreferenced variables

				· The  following capabilities for performance
				  gain:

				  · constant propagation

				  · copy propagation

				  · dead-code elimination

				  · global register allocation

				  · global instruction scheduling and control
				    speculation

				  · loop unrolling

				  · optimized code selection

				  · partial redundancy elimination

				  · strength   reduction/induction   variable
				    simplification

				  · variable renaming

				  · exception handling optimizations

				  · tail recursions

				  · peephole optimizations

				  · structure	assignment    lowering	  and
				    optimizations

				  · dead store elimination

	      This  option  may  set  other options,  especially options that
	      optimize for code speed. This is determined  by  the  compiler,
	      depending  on  which  operating system and architecture you are
	      using. The options that are set  may  change  from  release  to
	      release.

	      On Windows systems, this option is the same as the Ox option.

	      On Linux and Mac OS X systems, if -g is specified, O2 is turned
	      off and O0 is the default unless O2 (or O1
				or O3) is explicitly specified in the command
				line together with -g.

	      Many routines in the shared libraries are more highly optimized
	      for Intel® microprocessors than for non-Intel microprocessors.

	      O3		Performs O2 optimizations  and	enables  more
				aggressive   loop   transformations  such  as
				Fusion, Block-Unroll-and-Jam, and  collapsing
				IF statements.

	      This  option  may  set other options. This is determined by the
	      compiler, depending on which operating system and  architecture
	      you are using. The options that are set may change from release
	      to release.

	      When O3 is used with options -ax	or  -x	(Linux	OS)  or  with
	      options  /Qax  or  /Qx (Windows OS), the compiler performs more
	      aggressive data dependency analysis  than  for  O2,  which  may
	      result in longer compilation times.

	      The  O3  optimizations  may not cause higher performance unless
	      loop  and  memory  access  transformations  take	 place.   The
	      optimizations  may  slow down code in some cases compared to O2
	      optimizations.

	      The O3 option is recommended for applications that  have	loops
	      that  heavily use floating-point calculations and process large
	      data sets.

	      Many routines in the shared libraries are more highly optimized
	      for Intel® microprocessors than for non-Intel microprocessors.

	      The   last  O  option  specified	on  the  command  line	takes
	      precedence over any others.

	      Alternate Options:

       -onetrip

	      Tells the compiler  to  follow  the  FORTRAN  66	Standard  and
	      execute DO loops at least once.This is a deprecated option.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  compiler  applies	the  current  Fortran
				Standard semantics, which allows zero-trip DO
				loops.

	      Description:

	      This  option  tells  the	compiler  to  follow  the  FORTRAN 66
	      Standard and execute DO loops at least  once.  Note  that  this
	      behavior is included if you specify option f66.

	      Alternate Options:

	      Linux and Mac OS X: -1

       -openmp

	      Enables  the parallelizer to generate multi-threaded code based
	      on the OpenMP* directives.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No OpenMP* multi-threaded code	is  generated
				by the compiler.

	      Description:

	      This option enables the parallelizer to generate multi-threaded
	      code based on the OpenMP* directives. The code can be  executed
	      in parallel on both uniprocessor and multiprocessor systems.

	      If  you  use this option, multithreaded libraries are used, but
	      option fpp is not automatically invoked.

	      This option sets option automatic.

	      This option works with any optimization  level.  Specifying  no
	      optimization  (-O0  on  Linux or /Od on Windows) helps to debug
	      OpenMP applications.

	      NOTE: On Mac OS* X systems, when you enable OpenMP*,  you  must
	      also  set  the  DYLD_LIBRARY_PATH  environment  variable within
	      Xcode or an error will be displayed.

	      NOTE: Options that use OpenMP* are available  for  both  Intel®
	      microprocessors	and   non-Intel  microprocessors,  but	these
	      options  may  perform  additional   optimizations   on   Intel®
	      microprocessors than they perform on non-Intel microprocessors.
	      The list of major, user-visible OpenMP constructs and  features
	      that  may  perform differently on Intel® microprocessors versus
	      non-Intel microprocessors include:  locks  (internal  and  user
	      visible),   the	SINGLE	 construct,  barriers  (explicit  and
	      implicit),  parallel  loop   scheduling,	 reductions,   memory
	      allocation, thread affinity, and binding.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's  compilers  may  or may not optimize to the same degree
	      for non-Intel microprocessors for optimizations  that  are  not
	      unique  to  Intel  microprocessors. These optimizations include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel  does  not	guarantee the availability, functionality, or
	      effectiveness  of  any  optimization  on	microprocessors   not
	      manufactured  by	Intel. Microprocessor-dependent optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors.	Certain  optimizations	not specific to Intel
	      microarchitecture  are  reserved	for  Intel   microprocessors.
	      Please  refer  to  the  applicable  product  User and Reference
	      Guides for more information regarding the specific  instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      Linux and Mac OS X: -fopenmp

       -openmp-lib=type

	      Lets  you  specify  an  OpenMP*  run-time  library  to  use for
	      linking.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      type		Specifies the type  of	library  to  use;  it
				implies  compatibility levels. Currently, the
				only possible value is:

				compat	       Tells the compiler to use  the
					       compatibility OpenMP* run-time
					       library	  (libiomp).	 This
					       setting provides compatibility
					       with  object   files   created
					       using   Microsoft*   and  GNU*
					       compilers.

	      Default:

	      -openmp-lib=compat
				The compiler uses the  compatibility  OpenMP*
				run-time library (libiomp).

	      Description:

	      This option lets you specify an OpenMP* run-time library to use
	      for linking.

	      The compatibility OpenMP run-time library  is  compatible  with
	      object  files  created  using  the  Microsoft*  OpenMP run-time
	      library (vcomp) and GNU OpenMP run-time library (libgomp).

	      To use the compatibility OpenMP run-time library,  compile  and
	      link  your application using the -openmp-lib=compat  (Linux) or
	      /Qopenmp-lib:compat (Windows) option. To use this  option,  you
	      must also specify one of the following compiler options:

	      · Linux* OS: -openmp, -openmp-profile, or -openmp-stubs

	      · Windows* OS: /Qopenmp, /Qopenmp-profile, or /Qopenmp-stubs

	      On Windows* systems, the compatibility OpenMP* run-time library
	      lets  you  combine  OpenMP*  object  files  compiled  with  the
	      Microsoft*  C/C++  compiler  with OpenMP* object files compiled
	      with the Intel® C, Intel® C++, or Intel® Fortran compilers. The
	      linking  phase  results  in  a  single,  coherent  copy  of the
	      run-time library.

	      On Linux* systems, the  compatibility  Intel  OpenMP*  run-time
	      library lets you combine OpenMP* object files compiled with the
	      GNU* gcc or gfortran  compilers  with  similar  OpenMP*  object
	      files compiled with the Intel® C, Intel® C++, or Intel® Fortran
	      compilers. The linking phase results in a single, coherent copy
	      of the run-time library.

	      You  cannot  link  object files generated by the Intel® Fortran
	      compiler to object files compiled by the GNU Fortran  compiler,
	      regardless of the presence or absence of the -openmp (Linux) or
	      /Qopenmp (Windows) compiler option. This is because the Fortran
	      run-time libraries are incompatible.

	      NOTE:   The   compatibility  OpenMP  run-time  library  is  not
	      compatible with object files  created  using  versions  of  the
	      Intel compilers earlier than 10.0.

	      Alternate Options:

	      None

       -openmp-link=library

	      Controls whether the compiler links to static or dynamic OpenMP
	      run-time libraries. This is a deprecated option.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      library		Specifies the OpenMP library to use. Possible
				values are:

				static	       Tells  the compiler to link to
					       static	  OpenMP     run-time
					       libraries.  Note  that  static
					       OpenMP	   libraries	  are
					       deprecated.

				dynamic        Tells  the compiler to link to
					       dynamic	  OpenMP     run-time
					       libraries.

	      Default:

	      -openmp-link=dynamic
				The compiler links to dynamic OpenMP run-time
				libraries.  However,  if  Linux*  OS   option
				-static  is  specified, the compiler links to
				static OpenMP run-time libraries.

	      Description:

	      This option controls whether the compiler links  to  static  or
	      dynamic OpenMP run-time libraries.

	      To  link to the static OpenMP run-time library (RTL) and create
	      a    purely    static    executable,    you    must     specify
	      -openmp-link=static     (Linux	 and	Mac    OS    X)    or
	      /Qopenmp-link:static (Windows). However, we strongly  recommend
	      you  use	the  default setting, -openmp-link=dynamic (Linux and
	      Mac OS X) or /Qopenmp-link:dynamic (Windows).

	      NOTE: Compiler options -static-intel and	-shared-intel  (Linux
	      and  Mac	OS X) have no effect on which OpenMP run-time library
	      is linked.

	      NOTE: On Linux systems, -openmp-link=dynamic cannot be used  in
	      conjunction  with  option  -static.  If you try to specify both
	      options together, an error will be displayed.

	      Alternate Options:

	      None

       -openmp-profile

	      Enables analysis	of  OpenMP*  applications  if  Intel®  Thread
	      Profiler is installed. This is a deprecated option.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		OpenMP applications are not analyzed.

	      Description:

	      This  option  enables  analysis of OpenMP* applications. To use
	      this option, you must have previously installed  Intel®  Thread
	      Profiler, which is one of the Intel® Threading Analysis Tools.

	      This  option  can  adversely  affect performance because of the
	      additional profiling  and  error	checking  invoked  to  enable
	      compatibility  with the threading tools. Do not use this option
	      unless you plan to use the Intel® Thread Profiler.

	      For more information about Intel®  Thread  Profiler,  open  the
	      page  associated	with  threading  tools	at  Intel(R) Software
	      Development Products.

	      Note that this  option  is  no  longer  needed  because  Intel®
	      Parallel	Amplifier  can be used to analyze OpenMP applications
	      and  OpenMP  binaries  produced  by  the	compiler.   For  more
	      information  about  Intel®  Parallel  Amplifier,	open the page
	      associated  with	 threading   tools   at   Intel(R)   Software
	      Development Products.

	      Alternate Options:

	      None

       -openmp-report[=n]

	      Controls	 the   OpenMP*	parallelizer's	level  of  diagnostic
	      messages.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the  level	of  diagnostic	messages   to
				display. Possible values are:

				0	       No   diagnostic	messages  are
					       displayed.

				1	       Diagnostic    messages	  are
					       displayed   indicating  loops,
					       regions,     and      sections
					       successfully parallelized.

				2	       The  same  diagnostic messages
					       are displayed as specified  by
					       value1	  plus	   diagnostic
					       messages indicating successful
					       handling of MASTER constructs,
					       SINGLE  constructs,   CRITICAL
					       constructs,	      ORDERED
					       constructs, ATOMIC directives,
					       and so forth.

	      Default:

	      -openmp-report=1	If   you  do  not  specify  n,	the  compiler
				displays   diagnostic	messages   indicating
				loops,	regions,  and  sections  successfully
				parallelized.  If  you	do  not  specify  the
				option on the command line, the default is to
				display no messages.

	      Description:

	      This  option  controls  the  OpenMP*  parallelizer's  level  of
	      diagnostic  messages. To use this option, you must also specify
	      -openmp (Linux and Mac OS X) or /Qopenmp (Windows).

	      If this option is specified on the command line, the report  is
	      sent to stdout.

	      On Windows systems, if this option is specified from within the
	      IDE, the report is included in the build log  if	the  Generate
	      Build Logs option is selected.

	      Alternate Options:

	      None

       -openmp-stubs

	      Enables compilation of OpenMP programs in sequential mode.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  library  of OpenMP function stubs is not
				linked.

	      Description:

	      This  option  enables  compilation  of   OpenMP	programs   in
	      sequential  mode.  The OpenMP directives are ignored and a stub
	      OpenMP library is linked.

	      Alternate Options:

	      None

       -openmp-threadprivate=type (L*X only)

	      Lets you specify an OpenMP* threadprivate implementation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      type		Specifies   the   type	  of	threadprivate
				implementation. Possible values are:

				legacy	       Tells  the compiler to use the
					       legacy  OpenMP*	threadprivate
					       implementation	used  in  the
					       previous   releases   of   the
					       Intel®  compiler. This setting
					       does not provide compatibility
					       with  the  implementation used
					       by other compilers.

				compat	       Tells the compiler to use  the
					       compatibility	      OpenMP*
					       threadprivate   implementation
					       based	on    applying	  the
					       thread-local attribute to each
					       threadprivate  variable.  This
					       setting provides compatibility
					       with	the    implementation
					       provided by the Microsoft* and
					       GNU* compilers.

	      Default:

	      -openmp-threadprivate=legacy
				The   compiler	 uses	the   legacy  OpenMP*
				threadprivate  implementation  used  in   the
				previous releases of the Intel® compiler.

	      Description:

	      This   option   lets   you  specify  an  OpenMP*	threadprivate
	      implementation.

	      The legacy OpenMP  run-time  library  is	not  compatible  with
	      object  files created using OpenMP run-time libraries supported
	      in other compilers.

	      To use this option, you must also specify one of the  following
	      compiler options:

	      · Linux OS: -openmp, -openmp-profile, or -openmp-stubs

	      · Windows OS: /Qopenmp, /Qopenmp-profile, or /Qopenmp-stubs

	      The value specified for this option is independent of the value
	      used for option -openmp-lib (Linux) or /Qopenmp-lib (Windows).

	      NOTE: On Mac  OS*  X  systems,  legacy  is  the  only  type  of
	      threadprivate  supported.   Option -openmp-threadprivate is not
	      recognized by the compiler.

	      Alternate Options:

	      None

       -opt-args-in-reg[=keyword]

	      Determines whether calls to routines are optimized  by  passing
	      arguments in registers instead of on the stack.

	      Architectures: IA-32 architecture

	      Arguments:

	      keyword		Specifies  whether the optimization should be
				performed   and   under   what	  conditions.
				Possible values are:

				none	       The    optimization   is   not
					       performed.  No  arguments  are
					       passed  in registers. They are
					       put on the stack.

				seen	       Causes arguments to be  passed
					       in  registers  when  they  are
					       passed	to   routines	whose
					       definition  can be seen in the
					       same compilation unit.

				all	       Causes arguments to be  passed
					       in registers, whether they are
					       passed	to   routines	whose
					       definition  can be seen in the
					       same compilation unit, or not.
					       This  value  is only available
					       on Linux* systems.

	      Default:

	      -opt-args-in-regs=seen
				Arguments are passed in registers  when  they
				are  passed  to  routines whose definition is
				seen in the same compilation unit

	      Description:

	      This option determines whether calls to routines are  optimized
	      by  passing  arguments in registers instead of on the stack. It
	      also indicates the conditions when  the  optimization  will  be
	      performed.

	      This  option  can  improve  performance  for Application Binary
	      Interfaces (ABIs) that require arguments to be passed in memory
	      and compiled without interprocedural optimization (IPO).

	      Note  that  on  Linux*  systems,	if  all is specified, a small
	      overhead may be paid when calling 'unseen' routines  that  have
	      not  been  compiled  with  the same option. This is because the
	      call will need to go through a 'thunk' to ensure that arguments
	      are placed back on the stack where the callee expects them.

	      Alternate Options:

	      None

       -opt-block-factor=n

	      Lets you specify a loop blocking factor.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is   the  blocking  factor.  It  must  be  an
				integer. The compiler may ignore the blocking
				factor if the value is 0 or 1.

	      Default:

	      OFF		The compiler uses default heuristics for loop
				blocking.

	      Description:

	      This option lets you specify a loop blocking factor.

	      Alternate Options:

	      None

       -opt-jump-tables=keyword

       -no-opt-jump-tables

	      Enables or  disables  generation	of  jump  tables  for  switch
	      statements.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Is   the   instruction	for  generating  jump
				tables. Possible values are:

				never	       Tells the  compiler  to	never
					       generate   jump	 tables.  All
					       switch	  statements	  are
					       implemented   as   chains   of
					       if-then-elses.  This  is   the
					       same	  as	   specifying
					       -no-opt-jump-tables (Linux and
					       Mac  OS) or /Qopt-jump-tables-
					       (Windows).

				default        The  compiler   uses   default
					       heuristics  to  determine when
					       to generate jump tables.

				large	       Tells the compiler to generate
					       jump  tables  up  to a certain
					       pre-defined     size	 (64K
					       entries).

				n	       Must  be an integer. Tells the
					       compiler  to   generate	 jump
					       tables up ton entries in size.

	      Default:

	      -opt-jump-tables=default
				The   compiler	uses  default  heuristics  to
				determine when to generate  jump  tables  for
				switch statements.

	      Description:

	      This  option  enables or disables generation of jump tables for
	      switch statements. When the option is enabled, it  may  improve
	      performance for programs with large switch statements.

	      Alternate Options:

	      None

       -opt-malloc-options=n

	      Lets you specify an alternate algorithm for malloc().

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Specifies  the algorithm to use for malloc().
				Possible values are:

				0	       Tells the compiler to use  the
					       default	    algorithm	  for
					       malloc(). This is the default.

				1	       Causes	   the	    following
					       adjustments  to	the  malloc()
					       algorithm:  M_MMAP_MAX=2   and
					       M_TRIM_THRESHOLD=0x10000000.

				2	       Causes	   the	    following
					       adjustments  to	the  malloc()
					       algorithm:   M_MMAP_MAX=2  and
					       M_TRIM_THRESHOLD=0x40000000.

				3	       Causes	   the	    following
					       adjustments  to	the  malloc()
					       algorithm:  M_MMAP_MAX=0   and
					       M_TRIM_THRESHOLD=-1.

				4	       Causes	   the	    following
					       adjustments  to	the  malloc()
					       algorithm:	M_MMAP_MAX=0,
					       M_TRIM_THRESHOLD=-1,
					       M_TOP_PAD=4096.

	      Default:

	      -opt-malloc-options=0
				The  compiler uses the default algorithm when
				malloc()  is  called.  No  call  is  made  to
				mallopt().

	      Description:

	      This  option  lets  you  specify	an  alternate  algorithm  for
	      malloc().

	      If you specify a non-zero value  for  n,	it  causes  alternate
	      configuration  parameters  to be set for how malloc() allocates
	      and frees memory. It tells the  compiler	to  insert  calls  to
	      mallopt()  to  adjust  these parameters to malloc() for dynamic
	      memory allocation. This may improve speed.

	      Alternate Options:

	      None

       -opt-matmul (L*X only)

       -no-opt-matmul (L*X only)

	      Enables  or  disables  a	compiler-generated  Matrix   Multiply
	      (matmul)
		     library call.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-opt-matmul	The matmul library call optimization does not
				occur  unless  this  option  is  enabled   or
				certain  other compiler options are specified
				(see below).

	      Description:

	      This option enables or  disables	a  compiler-generated  Matrix
	      Multiply (MATMUL) library call.

	      Options  -opt-matmul  and  /Qopt-matmul  tell  the  compiler to
	      identify matrix multiplication loop nests (if any) and  replace
	      them  with a matmul library call for improved performance.  The
	      resulting executable may get  additional	performance  gain  on
	      Intel® microprocessors than on non-Intel microprocessors.

	      This  option  is enabled by default if options O3 and -parallel
	      (Linux* OS) or /Qparallel (Windows*) are specified.  To disable
	      this optimization, specify -no-opt-matmul or /Qopt-matmul-.

	      This option has no effect unless option O2 or higher is set.

	      NOTE:  Many  routines  in  the  MATMUL  library are more highly
	      optimized  for  Intel®  microprocessors  than   for   non-Intel
	      microprocessors.

	      Alternate Options:

	      None

       -opt-mem-layout-trans[=n]

       -no-opt-mem-layout-trans

	      Controls	the  level of memory layout transformations performed
	      by the compiler.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is    the    level    of    memory     layout
				transformations. Possible values are:

				0	       Disables     memory     layout
					       transformations. This  is  the
					       same	  as	   specifying
					       -no-opt-mem-layout-trans
					       (Linux*	OS  and Mac OS* X) or
					       /Qopt-mem-layout-trans-
					       (Windows* OS).

				1	       Enables	basic  memory  layout
					       transformations.

				2	       Enables	more  memory   layout
					       transformations.  This  is the
					       same	  as	   specifying
					       -opt-mem-layout-trans  (Linux*
					       OS   and   Mac	OS*   X)   or
					       /Qopt-mem-layout-trans
					       (Windows    OS*)    with    no
					       argument.

				3	       Enables	  aggressive   memory
					       layout  transformations.   You
					       should  only  use this setting
					       if your system has  more  than
					       4GB  of	physical  memory  per
					       core.

	      Default:

	      -opt-mem-layout-trans=2
				The compiler performs moderate memory  layout
				transformations.

	      Description:

	      This option controls the level of memory layout transformations
	      performed by the compiler. This option can improve cache	reuse
	      and cache locality.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's  compilers  may  or may not optimize to the same degree
	      for non-Intel microprocessors for optimizations  that  are  not
	      unique  to  Intel  microprocessors. These optimizations include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel  does  not	guarantee the availability, functionality, or
	      effectiveness  of  any  optimization  on	microprocessors   not
	      manufactured  by	Intel. Microprocessor-dependent optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors.	Certain  optimizations	not specific to Intel
	      microarchitecture  are  reserved	for  Intel   microprocessors.
	      Please  refer  to  the  applicable  product  User and Reference
	      Guides for more information regarding the specific  instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -opt-multi-version-aggressive

       -no-opt-multi-version-aggressive

	      Tells  the compiler to use aggressive multi-versioning to check
	      for pointer aliasing and scalar replacement.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-opt-multi-version-aggressive
				The compiler  uses  default  heuristics  when
				checking  for  pointer	aliasing  and  scalar
				replacement.

	      Description:

	      This   option   tells   the   compiler   to   use    aggressive
	      multi-versioning	to  check  for	pointer  aliasing  and scalar
	      replacement. This option may improve performance.

	      The performance can be affected by  certain  options,  such  as
	      /arch or /Qx (Windows) or -m or -x (Linux and Mac OS X).

	      Alternate Options:

	      None

       -opt-prefetch[=n]

       -no-opt-prefetch

	      Enables or disables  prefetch insertion optimization.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is   the  level  of  detail  in  the  report.
				Possible values are:

				0	       Disables software prefetching.
					       This is the same as specifying
					       -no-opt-prefetch  (Linux   and
					       Mac  OS	X) or /Qopt-prefetch-
					       (Windows).

				1 to 4	       Enables	different  levels  of
					       software  prefetching.  If you
					       do not specify a value for  n,
					       the  default  is  2. Use lower
					       values to reduce the amount of
					       prefetching.

	      Default:

	      -no-opt-prefetch	Prefetch insertion optimization is disabled.

	      Description:

	      This    option   enables	 or   disables	 prefetch   insertion
	      optimization. The goal of prefetching is to reduce cache misses
	      by  providing  hints to the processor about when data should be
	      loaded into the cache.

	      This option enables prefetching when higher optimization levels
	      are specified.

       -opt-ra-region-strategy[=keyword]

	      Selects	the  method  that  the	register  allocator  uses  to
	      partition each routine into regions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Is the method used for partitioning. Possible
				values are:

				routine        Creates	a  single  region for
					       each routine.

				block	       Partitions each	routine  into
					       one region per basic block.

				trace	       Partitions  each  routine into
					       one region per trace.

				region	       Partitions each	routine  into
					       one region per loop.

				default        The  compiler determines which
					       method	  is	 used	  for
					       partitioning.

	      Default:

	      -opt-ra-region-strategy=default
				The  compiler determines which method is used
				for partitioning. This is also the default if
				keyword is not specified.

	      Description:

	      This option selects the method that the register allocator uses
	      to partition each routine into regions.

	      When setting default is in effect,  the  compiler  attempts  to
	      optimize	the  tradeoff  between	compile-time  performance and
	      generated code performance.

	      This option is only relevant when optimizations are enabled (O1
	      or higher).

	      Alternate Options:

	      None

       -opt-report [n]

	      Tells  the  compiler  to	generate  an  optimization  report to
	      stderr.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is the level of  detail  in  the  report.  On
				Linux  OS  and Mac OS X systems, a space must
				appear before the n. Possible values are:

				0	       Tells the compiler to generate
					       no optimization report.

				1	       Tells the compiler to generate
					       a  report  with	the   minimum
					       level of detail.

				2	       Tells the compiler to generate
					       a report with the medium level
					       of detail.

				3	       Tells the compiler to generate
					       a  report  with	the   maximum
					       level of detail.

	      Default:

	      -opt-report 2	If   you  do  not  specify  n,	the  compiler
				generates a report with medium detail. If you
				do  not  specify  the  option  on the command
				line,  the  compiler  does  not  generate  an
				optimization report.

	      Description:

	      This  option  tells  the	compiler  to generate an optimization
	      report to stderr.

	      Alternate Options:

	      None

       -opt-report-file=filename

	      Specifies the name for an optimization report.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name for the optimization report.

	      Default:

	      OFF		No optimization report is generated.

	      Description:

	      This option specifies the name for an optimization  report.  If
	      you  use	this  option,  you do not have to specify -opt-report
	      (Linux and Mac OS X) or /Qopt-report (Windows).

	      Alternate Options:

	      None

       -opt-report-help

	      Displays the optimizer phases available for report generation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No optimization reports are generated.

	      Description:

	      This option displays the optimizer phases available for  report
	      generation  using  -opt-report-phase  (Linux  and  Mac OS X) or
	      /Qopt-report-phase (Windows). No compilation is performed.

	      Alternate Options:

	      None

       -opt-report-phase=phase

	      Specifies an optimizer phase to use when	optimization  reports
	      are generated.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      phase		Is the phase to generate reports for. Some of
				the possible values are:

				ipo	       The Interprocedural  Optimizer
					       phase

				hlo	       The High Level Optimizer phase

				hpo	       The High Performance Optimizer
					       phase

				ilo	       The   Intermediate    Language
					       Scalar Optimizer phase

				pgo	       The	 Profile       Guided
					       Optimization phase

				all	       All optimizer phases

	      Default:

	      OFF		No optimization reports are generated.

	      Description:

	      This  option  specifies  an  optimizer  phase   to   use	 when
	      optimization  reports  are  generated.  To use this option, you
	      must  also  specify  -opt-report	(Linux	and  Mac  OS  X)   or
	      /Qopt-report (Windows).

	      This option can be used multiple times on the same command line
	      to generate reports for multiple optimizer phases.

	      When one of the logical names for optimizer phases is specified
	      for phase, all reports from that optimizer phase are generated.

	      To  find	all  phase possibilities, use option -opt-report-help
	      (Linux and Mac OS X) or /Qopt-report-help (Windows).

	      Alternate Options:

	      None

       -opt-report-routine=string

	      Tells  the  compiler  to	generate  reports  on  the   routines
	      containing specified text.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      string		Is the text (string) to look for.

	      Default:

	      OFF		No optimization reports are generated.

	      Description:

	      This  option  tells  the	compiler  to  generate reports on the
	      routines containing specified text as part of their name.

	      Alternate Options:

	      None

       -opt-streaming-stores keyword

	      Enables generation of streaming stores for optimization.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  whether   streaming	 stores   are
				generated. Possible values are:

				always	       Enables	    generation	   of
					       streaming      stores	  for
					       optimization.   The   compiler
					       optimizes under the assumption
					       that the application is memory
					       bound.

				never	       Disables     generation	   of
					       streaming      stores	  for
					       optimization.  Normal   stores
					       are performed.

				auto	       Lets the compiler decide which
					       instructions to use.

	      Default:

	      -opt-streaming-stores auto
				The compiler decides whether to use streaming
				stores or normal stores.

	      Description:

	      This   option   enables  generation  of  streaming  stores  for
	      optimization. This method stores data  with  instructions  that
	      use  a  non-temporal  buffer,  which minimizes memory hierarchy
	      pollution.

	      This option may be useful for  applications  that  can  benefit
	      from streaming stores.

	      Alternate Options:

	      None

       -opt-subscript-in-range

       -no-opt-subscript-in-range

	      Determines  whether  the	compiler  assumes  that  there are no
	      "large" integers being used or being computed inside loops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-opt-subscript-in-range
				The  compiler  assumes	 there	are   "large"
				integers  being used or being computed within
				loops.

	      Description:

	      This option determines whether the compiler assumes that	there
	      are  no  "large"	integers  being used or being computed inside
	      loops.

	      If you specify -opt-subscript-in-range (Linux and Mac OS X)  or
	      /Qopt-subscript-in-range	(Windows),  the compiler assumes that
	      there are no "large" integers  being  used  or  being  computed
	      inside  loops.  A  "large"  integer  is  typically  > 231. This
	      feature can enable more loop transformations.

	      Alternate Options:

	      None

       -Os

	      Enables optimizations  that  do  not  increase  code  size  and
	      produces smaller code size than O2.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Optimizations	are   made  for  code  speed.
				However,  if  O1  is  specified,  Os  is  the
				default.

	      Description:

	      This  option  enables  optimizations  that do not increase code
	      size and produces smaller code size than O2. It  disables  some
	      optimizations  that  increase  code  size  for  a  small	speed
	      benefit.

	      This option tells the compiler to  favor	transformations  that
	      reduce  code  size  over	transformations  that produce maximum
	      performance.

	      Alternate Options:

	      None

       -p

	      Compiles and links for function profiling with gprof(1).

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Files  are  compiled   and   linked   without
				profiling.

	      Description:

	      This  option  compiles  and  links  for function profiling with
	      gprof(1).

	      Alternate Options:

	      Linux and Mac OS X: -pg,-qp (this is a deprecated option)

       -pad

       -nopad

	      Enables the changing of the variable and array memory layout.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -nopad		Variable and array memory layout is performed
				by default methods.

	      Description:

	      This  option  enables  the  changing  of the variable and array
	      memory layout.

	      This option is effectively not different from the align  option
	      when  applied  to  structures  and  derived types. However, the
	      scope of pad is greater  because	it  applies  also  to  common
	      blocks, derived types, sequence types, and structures.

	      Alternate Options:

	      None

       -pad-source

       -nopad-source

	      Specifies padding for fixed-form source records.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -nopad-source	Fixed-form source records are not padded.

	      Description:

	      This option specifies padding for fixed-form source records. It
	      tells the compiler that fixed-form source  lines	shorter  than
	      the  statement  field width are to be padded with spaces to the
	      end of the statement field. This affects the interpretation  of
	      character  and  Hollerith  literals  that  are continued across
	      source records.

	      The default value  setting  causes  a  warning  message  to  be
	      displayed  if a character or Hollerith literal that ends before
	      the statement field ends is  continued  onto  the  next  source
	      record.  To suppress this warning message, specify option -warn
	      nousage (Linux and Mac OS X) or /warn:nousage (Windows).

	      Specifying  pad-source  or  /Qpad-source	can  prevent  warning
	      messages	associated  with option -warn usage (Linux and Mac OS
	      X) or /warn:usage (Windows).

	      Alternate Options:

	      None

       -parallel

	      Tells the auto-parallelizer to generate multithreaded code  for
	      loops that can be safely executed in parallel.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Multithreaded code is not generated for loops
				that can be safely executed in parallel.

	      Description:

	      This   option   tells   the   auto-parallelizer	to   generate
	      multithreaded  code  for	loops  that can be safely executed in
	      parallel.

	      To use this option, you must also specify option O2 or O3.

	      On  Linux  and  Windows  systems,  this  option	sets   option
	      -opt-matmul (Linux*) or /Qopt-matmul (Windows*) if option O3 is
	      also specified.

	      NOTE:  On  Mac  OS*  X  systems,	when  you  enable   automatic
	      parallelization,	 you  must  also  set  the  DYLD_LIBRARY_PATH
	      environment  variable  within  Xcode  or	an  error   will   be
	      displayed.

	      NOTE: Using this option enables parallelization for both Intel®
	      microprocessors and non-Intel microprocessors.   The  resulting
	      executable   may	get  additional  performance  gain  on	Intel
	      microprocessors  than   on   non-Intel   microprocessors.   The
	      parallelization  can  also be affected by certain options, such
	      as /arch or /Qx (Windows) or -m or -x (Linux and Mac OS X).

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's compilers may or may not optimize to  the  same  degree
	      for  non-Intel  microprocessors  for optimizations that are not
	      unique to Intel microprocessors.	These  optimizations  include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel does not guarantee the  availability,  functionality,  or
	      effectiveness   of  any  optimization  on  microprocessors  not
	      manufactured by Intel.  Microprocessor-dependent	optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors. Certain optimizations not  specific  to	Intel
	      microarchitecture   are  reserved  for  Intel  microprocessors.
	      Please refer to  the  applicable	product  User  and  Reference
	      Guides  for more information regarding the specific instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -parallel-source-info[=n]

       -no-parallel-source-info

	      Enables or disables source location emission  when  OpenMP*  or
	      auto-parallelization code is generated.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the  level	of  source location emission.
				Possible values are:

				0	       Disables   the	emission   of
					       source	location  information
					       when	    OpenMP	   or
					       auto-parallelization  code  is
					       generated. This is the same as
					       specifying
					       -no-parallel-source-info
					       (Linux*	and  Mac  OS*  X)  or
					       /Qparallel-source-info-
					       (Windows*).

				1	       Tells  the  compiler  to  emit
					       routine	  name	  and	 line
					       information.  This is the same
					       as		   specifying
					       -parallel-source-info  (Linux*
					       and    Mac    OS*    X)	   or
					       /Qparallel-source-info
					       (Windows*) with no keyword.

				2	       Tells  the  compiler  to  emit
					       path,  file, routine name, and
					       line information.

	      Default:

	      -parallel-source-info=1
				When OpenMP* or auto-parallelization code  is
				generated,   the   routine   name   and  line
				information is emitted.

	      Description:

	      This option enables or disables source location  emission  when
	      OpenMP or auto-parallelization code is generated.  It also lets
	      you set the level of emission.

	      Alternate Options:

	      None

       -par-affinity=[modifier,...]type[,permute][,offset] (L*X only)

	      Specifies thread affinity.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      modifier		Is   one    of	  the	 following    values:
				granularity={fine|thread|core},  [no]respect,
				[no]verbose,			[no]warnings,
				proclist=proc_list.	 The	default    is
				granularity=core, respect, and noverbose. For
				information  on  value	proclist,  see Thread
				Affinity Interface in OpenMP* Support.

	      type		Indicates the thread affinity. This  argument
				is  required and must be one of the following
				values: compact,  disabled,  explicit,	none,
				scatter,  logical,  physical.  The default is
				none.	Values	logical  and   physical   are
				deprecated.    Use   compact   and   scatter,
				respectively, with no permute value.

	      permute		Is a positive integer. You  cannot  use  this
				argument with type setting explicit, none, or
				disabled. The default is 0.

	      offset		Is a positive integer. You  cannot  use  this
				argument with type setting explicit, none, or
				disabled. The default is 0.

	      Default:

	      OFF		The thread  affinity  is  determined  by  the
				run-time environment.

	      Description:

	      This  option  specifies thread affinity, which binds threads to
	      physical	processing  units.  It	has  the   same   effect   as
	      environment variable KMP_AFFINITY.

	      This  option  overrides  the environment variable when both are
	      specified.

	      This option only has an effect if the following is true:

	      · Linux* OS: You have specified option -parallel or -openmp (or
		both).	 Windows* OS: You have specified option /Qparallel or
		/Qopenmp (or both).

	      · You are compiling the main program.

	      NOTE:  This   option   may   behave   differently   on   Intel®
	      microprocessors than on non-Intel microprocessors.

	      Alternate Options:

	      None

       -par-num-threads=n

	      Specifies the number of threads to use in a parallel region.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is the number of threads to use. It must be a
				positive integer.

	      Default:

	      OFF		The number of threads to use is determined by
				the run-time environment.

	      Description:

	      This  option  specifies  the  number  of	threads  to  use in a
	      parallel region. It has the same effect as environment variable
	      OMP_NUM_THREADS.

	      This  option  overrides  the environment variable when both are
	      specified.

	      This option only has an effect if the following is true:

	      · Linux* OS and Mac OS* X: You have specified option  -parallel
		or -openmp (or both).  Windows* OS: You have specified option
		/Qparallel or /Qopenmp (or both).

	      · You are compiling the main program.

	      Alternate Options:

	      None

       -par-report[n]

	      Controls	 the   diagnostic   information   reported   by   the
	      auto-parallelizer.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is a value denoting which diagnostic messages
				to report. Possible values are:

				0	       Tells the auto-parallelizer to
					       report	   no	   diagnostic
					       information.

				1	       Tells the auto-parallelizer to
					       report diagnostic messages for
					       loops		 successfully
					       auto-parallelized.	  The
					       compiler also issues  a	"LOOP
					       AUTO-PARALLELIZED" message for
					       parallel loops.

				2	       Tells the auto-parallelizer to
					       report diagnostic messages for
					       loops	 successfully	  and
					       unsuccessfully
					       auto-parallelized.

				3	       Tells the auto-parallelizer to
					       report	the  same  diagnostic
					       messages specified by  2  plus
					       additional  information	about
					       any    proven	or    assumed
					       dependencies	   inhibiting
					       auto-parallelization  (reasons
					       for not parallelizing).

	      Default:

	      -par-report1	If   you  do  not  specify  n,	the  compiler
				displays  diagnostic   messages   for	loops
				successfully auto-parallelized. If you do not
				specify the option on the command  line,  the
				default is to display no messages.

	      Description:

	      This option controls the diagnostic information reported by the
	      auto-parallelizer (parallel optimizer). To use this option, you
	      must  also specify -parallel (Linux and Mac OS X) or /Qparallel
	      (Windows).

	      If this option is specified on the command line, the report  is
	      sent to stdout.

	      On Windows systems, if this option is specified from within the
	      IDE, the report is included in the build log  if	the  Generate
	      Build Logs option is selected.

	      Alternate Options:

	      None

       -par-runtime-control[n]

       -no-par-runtime-control

	      Generates  code  to perform run-time checks for loops that have
	      symbolic loop bounds.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is a  a value denoting what kind  of  runtime
				checking to perform. Possible values are:

				0	       Performs   no   runtime	check
					       based on auto-parallelization.
					       This is the same as specifying
					       -no-par-runtime-control
					       (Linux*	and  Mac  OS*  X)  or
					       /Qpar-runtime-control-
					       (Windows*).

				1	       Generates  runtime  check code
					       under conservative mode.  This
					       is  the	default if you do not
					       specify n.

				2	       Generates runtime  check  code
					       under heuristic mode.

				3	       Generates  runtime  check code
					       under aggressive mode.

	      Default:

	      -no-par-runtime-control
				The compiler  uses  default  heuristics  when
				checking loops.

	      Description:

	      This option generates code to perform run-time checks for loops
	      that have symbolic loop bounds.

	      If  the  granularity  of	 a   loop   is	 greater   than   the
	      parallelization	threshold,  the  loop  will  be  executed  in
	      parallel.

	      If you do  not  specify  this  option,  the  compiler  may  not
	      parallelize loops with symbolic loop bounds if the compile-time
	      granularity  estimation  of  a  loop  can  not  ensure  it   is
	      beneficial to parallelize the loop.

	      NOTE:   This   option   may   behave   differently   on  Intel®
	      microprocessors than on non-Intel microprocessors.

	      Alternate Options:

	      None

       -par-schedule-keyword[=n]

	      Lets you specify a scheduling algorithm or a tuning method  for
	      loop iterations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the scheduling algorithm or tuning
				method. Possible values are:

				auto	       Lets the compiler or  run-time
					       system	   determine	  the
					       scheduling algorithm.

				static	       Divides	  iterations	 into
					       contiguous pieces.

				static-balanced
					       Divides	   iterations	 into
					       even-sized chunks.

				static-steal   Divides	  iterations	 into
					       even-sized  chunks, but allows
					       threads	to  steal  parts   of
					       chunks	  from	  neighboring
					       threads.

				dynamic        Gets  a	set   of   iterations
					       dynamically.

				guided	       Specifies  a minimum number of
					       iterations.

				guided-analytical
					       Divides	iterations  by	using
					       exponential   distribution  or
					       dynamic distribution.

				runtime        Defers the scheduling decision
					       until run time.

	      n 		Is  the  size  of  the chunk or the number of
				iterations for each chunk. This  setting  can
				only  be  specified  for static, dynamic, and
				guided.  For  more   information,   see   the
				descriptions of each keyword below.

	      Default:

	      static-balanced	Iterations are divided into even-sized chunks
				and the chunks are assigned to the threads in
				the  team  in  a  round-robin  fashion in the
				order of the thread number.

	      Description:

	      This option lets you specify a scheduling algorithm or a tuning
	      method for loop iterations.  It specifies how iterations are to
	      be divided among the threads of the team.

	      This option affects performance tuning and can  provide  better
	      performance during auto-parallelization.

	      Option		Description

	      -par-schedule-auto or /Qpar-schedule-auto
				Lets   the   compiler	or   run-time  system
				determine  the	scheduling   algorithm.   Any
				possible  mapping may occur for iterations to
				threads in the team.

	      -par-schedule-static or /Qpar-schedule-static
				Divides  iterations  into  contiguous  pieces
				(chunks)  of  size n. The chunks are assigned
				to threads  in	the  team  in  a  round-robin
				fashion  in  the  order of the thread number.
				Note that the last chunk to be	assigned  may
				have a smaller number of iterations.

	      If  no  n  is  specified,  the  iteration space is divided into
	      chunks that are approximately
				equal in size, and each thread is assigned at
				most one chunk.

	      -par-schedule-static-balanced or /Qpar-schedule-static-balanced
				Divides  iterations  into  even-sized chunks.
				The chunks are assigned to the threads in the
				team in a round-robin fashion in the order of
				the thread number.

	      -par-schedule-static-steal or /Qpar-schedule-static-steal
				Divides iterations  into  even-sized  chunks,
				but when a thread completes its chunk, it can
				steal parts of chunks assigned to neighboring
				threads.

	      Each thread keeps track
				of  L  and  U,	which represent the lower and
				upper  bounds  of  its	chunks	respectively.
				Iterations  are  executed  starting  from the
				lower bound, and simultaneously, L is updated
				to represent the new lower bound.

	      -par-schedule-dynamic or /Qpar-schedule-dynamic
				Can  be  used  to  get	a  set	of iterations
				dynamically. Assigns iterations to threads in
				chunks	as  the  threads  request  them.  The
				thread executes the chunk of iterations, then
				requests   another  chunk,  until  no  chunks
				remain to be assigned.

	      As each thread finishes a piece  of  the	iteration  space,  it
	      dynamically gets the next
				set  of  iterations.  Each  chunk  contains n
				iterations, except for the last chunk  to  be
				assigned, which may have fewer iterations. If
				no n is specified, the default is 1.

	      -par-schedule-guided or /Qpar-schedule-guided
				Can be used to specify a  minimum  number  of
				iterations.  Assigns iterations to threads in
				chunks	as  the  threads  request  them.  The
				thread executes the chunk of iterations, then
				requests  another  chunk,  until  no   chunks
				remain to be assigned.

	      For  a  chunk of size 1, the size of each chunk is proportional
	      to the number of unassigned
				iterations divided by the number of  threads,
				decreasing to 1.

	      For an n with value
				k (greater than 1), the size of each chunk is
				determined  in	the   same   way   with   the
				restriction  that  the	chunks do not contain
				fewer than k iterations (except for the  last
				chunk  to  be  assigned, which may have fewer
				than k iterations). If no n is specified, the
				default is 1.

	      -par-schedule-guided-analytical				   or
	      /Qpar-schedule-guided-analytical
				Divides  iterations  by   using   exponential
				distribution  or  dynamic  distribution.  The
				method depends	on  run-time  implementation.
				Loop   bounds	are  calculated  with  faster
				synchronization and  chunks  are  dynamically
				dispatched  at	run  time  by  threads in the
				team.

	      -par-schedule-runtime or /Qpar-schedule-runtime
				Defers	the  scheduling  decision  until  run
				time. The scheduling algorithm and chunk size
				are  then   taken   from   the	 setting   of
				environment variable OMP_SCHEDULE.

	      NOTE:   This   option   may   behave   differently   on  Intel®
	      microprocessors than on non-Intel microprocessors.

	      Alternate Options:

	      None

       -par-threshold[n]

	      Sets a threshold for the auto-parallelization of loops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is an integer whose value  is  the  threshold
				for   the   auto-parallelization   of  loops.
				Possible values are 0 through 100.

				If  n  is  0,  loops  get   auto-parallelized
				always,   regardless   of   computation  work
				volume.

				If n is 100, loops get auto-parallelized when
				performance  gains are predicted based on the
				compiler    analysis	data.	 Loops	  get
				auto-parallelized only if profitable parallel
				execution is almost certain.

				The intermediate 1 to 99 values represent the
				percentage    probability    for   profitable
				speed-up.  For	example,  n=50	directs   the
				compiler  to  parallelize  only if there is a
				50% probability of the code  speeding  up  if
				executed in parallel.

	      Default:

	      -par-threshold100 Loops	 get	auto-parallelized   only   if
				profitable  parallel  execution   is   almost
				certain.  This	is also the default if you do
				not specify n.

	      Description:

	      This option sets a threshold for	the  auto-parallelization  of
	      loops  based  on the probability of profitable execution of the
	      loop in parallel. To use this option,  you  must	also  specify
	      -parallel (Linux and Mac OS X) or /Qparallel (Windows).

	      This  option  is useful for loops whose computation work volume
	      cannot be determined at compile-time. The threshold is  usually
	      relevant when the loop trip count is unknown at compile-time.

	      The  compiler  applies  a  heuristic  that tries to balance the
	      overhead of creating multiple threads versus the amount of work
	      available to be shared amongst the threads.

	      NOTE:   This   option   may   behave   differently   on  Intel®
	      microprocessors than on non-Intel microprocessors.

	      Alternate Options:

	      None

       -pcn

	      Enables control of floating-point significand precision.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is the floating-point significand  precision.
				Possible values are:

				32	       Rounds  the  significand to 24
					       bits (single precision).

				64	       Rounds the significand  to  53
					       bits (double precision).

				80	       Rounds  the  significand to 64
					       bits (extended precision).

	      Default:

	      -pc80		On  Linux*  and  Mac  OS*  X   systems,   the
				floating-point	significand  is rounded to 64
				bits.

	      Description:

	      This  option  enables  control  of  floating-point  significand
	      precision.

	      Some floating-point algorithms are sensitive to the accuracy of
	      the significand,	or  fractional	part  of  the  floating-point
	      value.  For  example,  iterative	operations  like division and
	      finding the square  root	can  run  faster  if  you  lower  the
	      precision with the this option.

	      Note that a change of the default precision control or rounding
	      mode, for example, by using the -pc32 (Linux and Mac OS  X)  or
	      /Qpc32 (Windows) option or by user intervention, may affect the
	      results returned by some of the mathematical functions.

	      Alternate Options:

	      None

       -pie (L*X only)

	      Produces a position-independent executable on  processors  that
	      support it.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The  driver  does not set up special run-time
				libraries and the linker does not perform the
				optimizations on executables.

	      Description:

	      This  option  produces  a  position-independent  executable  on
	      processors that support it. It is both a compiler option and  a
	      linker  option.  When  used  as  a compiler option, this option
	      ensures the linker sets up run-time libraries correctly.

	      Normally the object linked has been compiled with option -fpie.

	      When you specify -pie, it is recommended that you  specify  the
	      same options that were used during compilation of the object.

	      Alternate Options:

	      None

       -prec-div

       -no-prec-div

	      Improves precision of floating-point divides.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -prec-div 	The    compiler    uses   this	 method   for
				floating-point divides.

	      Description:

	      This option improves precision of  floating-point  divides.  It
	      has a slight impact on speed.

	      With  some  optimizations, such as -msse2 (Linux) or /arch:SSE2
	      (Windows), the  compiler	may  change  floating-point  division
	      computations  into  multiplication  by  the  reciprocal  of the
	      denominator. For example, A/B is	computed  as  A  *  (1/B)  to
	      improve the speed of the computation.

	      However, sometimes the value produced by this transformation is
	      not as accurate as full IEEE division. When it is important  to
	      have  fully  precise  IEEE division, use this option to disable
	      the floating-point division-to-multiplication optimization. The
	      result is more accurate, with some loss of performance.

	      If you specify -no-prec-div (Linux and Mac OS X) or /Qprec-div-
	      (Windows), it enables optimizations  that  give  slightly  less
	      precise results than full IEEE division.

	      Alternate Options:

	      None

       -prec-sqrt

       -no-prec-sqrt

	      Improves precision of square root implementations.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-prec-sqrt	The  compiler  uses a faster but less precise
				implementation of square root.

				However, the default is -prec-sqrt if any  of
				the following options are specified: -O0, -mp
				(or -fltconsistency), or -mp1 on  Linux*  and
				Mac OS* X systems.

	      Description:

	      This  option improves precision of square root implementations.
	      It has a slight impact on speed.

	      This option  inhibits  any  optimizations  that  can  adversely
	      affect  the  precision of a square root computation. The result
	      is fully precise square root implementations, with some loss of
	      performance.

	      Alternate Options:

	      None

       -preprocess-only

	      Causes the Fortran preprocessor to send output to a file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Preprocessed  source  files are output to the
				compiler.

	      Description:

	      This option causes the Fortran preprocessor to send output to a
	      file.

	      The  source  file  is preprocessed by the Fortran preprocessor,
	      and  the	result	for  each  source  file  is   output   to   a
	      corresponding .i or .i90 file.

	      Note that the source file is not compiled.

	      Alternate Options:

	      Linux and Mac OS X: -P

       -print-multi-lib

	      Prints  information  about  where  system  libraries  should be
	      found.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No information is printed unless  the  option
				is specified.

	      Description:

	      This  option  prints  information  about where system libraries
	      should be found, but no compilation occurs. It is provided  for
	      compatibility with gcc.

	      Alternate Options:

	      None

       -prof-data-order (L*X only)

       -no-prof-data-order (L*X only)

	      Enables  or  disables data ordering if profiling information is
	      enabled.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-prof-data-order
				Data ordering is disabled.

	      Description:

	      This option enables or  disables	data  ordering	if  profiling
	      information  is  enabled.  It  controls  the  use  of profiling
	      information to order static program data items.

	      For this option to be effective, you must do the following:

	      · For   instrumentation	compilation,   you    must    specify
		-prof-gen=globdata (Linux) or /Qprof-gen:globdata (Windows).

	      · For  feedback compilation, you must specify -prof-use (Linux)
		or  /Qprof-use	(Windows).  You  must  not   use   multi-file
		optimization  by  specifying  options  such  as  option  -ipo
		(Linux) or /Qipo  (Windows),  or  option  -ipo-c  (Linux)  or
		/Qipo-c (Windows).

	      Alternate Options:

	      None

       -prof-dir dir

	      Specifies a directory for profiling information output files.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the name of the directory.

	      Default:

	      OFF		Profiling  output  files  are  placed  in the
				directory where the program is compiled.

	      Description:

	      This option specifies a  directory  for  profiling  information
	      output  files  (*.dyn  and *.dpi). The specified directory must
	      already exist.

	      You should specify this option using the	same  directory  name
	      for both instrumentation and feedback compilations. If you move
	      the .dyn files, you need to specify the new path.

	      Option /Qprof-dir is equivalent to  option  /Qcov-dir.  If  you
	      specify  both options, the last option specified on the command
	      line takes precedence.

	      Alternate Options:

	      None

       -prof-file filename

	      Specifies an alternate file  name  for  the  profiling  summary
	      files.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the profiling summary file.

	      Default:

	      OFF		The  profiling	summary  files	have the file
				name pgopti.*

	      Description:

	      This option specifies an alternate file name for the  profiling
	      summary  files. The filename is used as the base name for files
	      created by different profiling passes.

	      If you add this option to profmerge,  the  .dpi  file  will  be
	      named filename.dpi instead of pgopti.dpi.

	      If you specify this option with option-prof-genx (Linux and Mac
	      OS X) or /Qprof-genx (Windows), the .spi and .spl files will be
	      named  filename.spi  and filename.spl instead of pgopti.spi and
	      pgopti.spl.

	      If you specify this option with option -prof-use (Linux and Mac
	      OS  X)  or  /Qprof-use  (Windows),  the .dpi file will be named
	      filename.dpi instead of pgopti.dpi.

	      Option /Qprof-file is equivalent to option /Qcov-file.  If  you
	      specify  both options, the last option specified on the command
	      line takes precedence.

	      Alternate Options:

	      None

       -prof-func-order (L*X only)

       -no-prof-func-order (L*X only)

	      Enables or disables function ordering if profiling  information
	      is enabled.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-prof-func-order
				Function ordering is disabled.

	      Description:

	      This  option enables or disables function ordering if profiling
	      information is enabled.

	      For this option to be effective, you must do the following:

	      · For   instrumentation	compilation,   you    must    specify
		-prof-gen=srcpos (Linux) or /Qprof-gen:srcpos (Windows).

	      · For  feedback compilation, you must specify -prof-use (Linux)
		or  /Qprof-use	(Windows).  You  must  not   use   multi-file
		optimization  by  specifying  options  such  as  option  -ipo
		(Linux) or /Qipo  (Windows),  or  option  -ipo-c  (Linux)  or
		/Qipo-c (Windows).

	      If  you  enable  profiling  information  by  specifying  option
	      -prof-use (Linux) or  /Qprof-use	(Windows),  -prof-func-groups
	      (Linux)  and  /Qprof-func-groups (Windows) are set and function
	      grouping	is  enabled.	However,  if  you  explicitly  enable
	      -prof-func-order	 (Linux)   or	/Qprof-func-order  (Windows),
	      function ordering is performed instead of function grouping.

	      On Linux* systems, this option  is  only	available  for	Linux
	      linker 2.15.94.0.1, or later.

	      To set the hotness threshold for function grouping and function
	      ordering,  use  option   -prof-hotness-threshold	 (Linux)   or
	      /Qprof-hotness-threshold (Windows).

	      Alternate Options:

	      None

       -prof-gen[=keyword]

       -no-prof-gen

	      Produces	an  instrumented  object  file	that  can  be used in
	      profile-guided optimization.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies details for the instrumented	file.
				Possible values are:

				default        Produces    an	 instrumented
					       object file. This is the  same
					       as     specifying    -prof-gen
					       (Linux*	and  Mac  OS*  X)  or
					       /Qprof-gen  (Windows*) with no
					       keyword.

				srcpos	       Produces    an	 instrumented
					       object	file   that  includes
					       extra	 source      position
					       information.  This  option  is
					       the same as option  -prof-genx
					       (Linux*	and  Mac  OS*  X)  or
					       /Qprof-genx (Windows*),	which
					       are deprecated.

				globdata       Produces    an	 instrumented
					       object  file   that   includes
					       information  for  global  data
					       layout.

	      Default:

	      -no-prof-gen	Profile generation is disabled.

	      Description:

	      This option produces an instrumented object file	that  can  be
	      used  in	profile-guided	optimization.  It  gets the execution
	      count of each basic block.

	      If you specify keyword srcpos or	globdata,  a  static  profile
	      information file (.spi) is created. These settings may increase
	      the time needed to do a parallel build using -prof-gen, because
	      of contention writing the .spi file.

	      These  options  are  used  in  phase  1  of  the Profile Guided
	      Optimizer  (PGO)	to   instruct	the   compiler	 to   produce
	      instrumented  code  in  your  object  files  in preparation for
	      instrumented execution.

	      Alternate Options:

	      None

       -prof-hotness-threshold=n (L*X only)

	      Lets you set the hotness threshold for  function	grouping  and
	      function ordering.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  the  hotness threshold. n is a percentage
				having a value between 0 and  100  inclusive.
				If  you  specify  0, there will be no hotness
				threshold  setting  in	effect	for  function
				grouping and function ordering.

	      Default:

	      OFF		The   compiler's  default  hotness  threshold
				setting  of  10  percent  is  in  effect  for
				function grouping and function ordering.

	      Description:

	      This  option  lets  you  set the hotness threshold for function
	      grouping and function ordering.

	      The "hotness threshold" is the percentage of functions  in  the
	      application  that  should  be  placed  in the application's hot
	      region.  The hot region is the most frequently executed part of
	      the application.	By grouping these functions together into one
	      hot region,  they  have  a  greater  probability	of  remaining
	      resident	in  the  instruction  cache.  This  can  enhance  the
	      application's performance.

	      For this	option	to  take  effect,  you	must  specify  option
	      -prof-use  (Linux)  or   /Qprof-use  (Windows)  and  one of the
	      following:

	      · On Linux systems: -prof-func-groups or -prof-func-order

	      · On Windows systems: /Qprof-func-order

	      Alternate Options:

	      None

       -prof-src-dir

       -no-prof-src-dir

	      Determines whether directory information	of  the  source  file
	      under  compilation  is  considered when looking up profile data
	      records.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -prof-src-dir	Directory information is used when looking up
				profile data records in the .dpi file.

	      Description:

	      This  option  determines	whether  directory information of the
	      source file under compilation is	considered  when  looking  up
	      profile  data records in the .dpi file. To use this option, you
	      must also specify option -prof-use (Linux  and  Mac  OS  X)  or
	      /Qprof-use (Windows).

	      If  the  option is enabled, directory information is considered
	      when looking up the profile data records within the .dpi	file.
	      You  can	specify  directory  information  by  using one of the
	      following options:

	      · Linux and Mac OS X:  -prof-src-root or	-prof-src-root-cwd

	      · Windows:  /Qprof-src-root or /Qprof-src-root-cwd

	      If the option is disabled, directory information is ignored and
	      only  the  name  of  the	file is used to find the profile data
	      record.

	      Note that options  -prof-src-dir	(Linux	and  Mac  OS  X)  and
	      /Qprof-src-dir  (Windows)  control  how the names of the user's
	      source files get represented within the  .dyn  or  .dpi  files.
	      Options -prof-dir (Linux and Mac OS X) and /Qprof-dir (Windows)
	      specify the location of the .dyn or the .dpi files.

	      Alternate Options:

	      None

       -prof-src-root=dir

	      Lets you use relative directory paths when looking  up  profile
	      data and specifies a directory as the base.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is the base for the relative paths.

	      Default:

	      OFF		The  setting  of  relevant options determines
				the path used when looking  up	profile  data
				records.

	      Description:

	      This  option lets you use relative directory paths when looking
	      up profile data in .dpi files. It lets you specify a  directory
	      as  the  base.  The  paths  are  relative  to  a base directory
	      specified  during  the  -prof-gen  (Linux  and  Mac  OS  X)  or
	      /Qprof-gen (Windows) compilation phase.

	      This  option  is	available  during  the	following  phases  of
	      compilation:

	      · Linux and Mac OS X: -prof-gen and -prof-use phases

	      · Windows: /Qprof-gen and /Qprof-use phases

	      When  this  option  is  specified  during  the   -prof-gen   or
	      /Qprof-gen  phase,  it stores information into the .dyn or .dpi
	      file. Then, when .dyn files are merged  together	or  the  .dpi
	      file  is	loaded, only the directory information below the root
	      directory is used for forming the lookup key.

	      When  this  option  is  specified  during  the   -prof-use   or
	      /Qprof-use  phase,  it specifies a root directory that replaces
	      the root directory specified at  the  -prof-gen  or  /Qprof-gen
	      phase for forming the lookup keys.

	      To  be  effective,  this	option	or  option -prof-src-root-cwd
	      (Linux and Mac OS X) or /Qprof-src-root-cwd (Windows)  must  be
	      specified   during   the	-prof-gen  or  /Qprof-gen  phase.  In
	      addition, if one of these options is  not  specified,  absolute
	      paths are used in the .dpi file.

	      Alternate Options:

	      None

       -prof-src-root-cwd

	      Lets  you  use relative directory paths when looking up profile
	      data and specifies the current working directory as the base.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The setting of	relevant  options  determines
				the  path  used  when looking up profile data
				records.

	      Description:

	      This option lets you use relative directory paths when  looking
	      up profile data in .dpi files. It specifies the current working
	      directory as the base.  To  use  this  option,  you  must  also
	      specify  option  -prof-use  (Linux  and  Mac  OS) or /Qprof-use
	      (Windows).

	      This  option  is	available  during  the	following  phases  of
	      compilation:

	      · Linux and Mac OS X: -prof-gen and -prof-use phases

	      · Windows: /Qprof-gen and /Qprof-use phases

	      When   this   option  is	specified  during  the	-prof-gen  or
	      /Qprof-gen phase, it stores information into the .dyn  or  .dpi
	      file.  Then,  when  .dyn	files are merged together or the .dpi
	      file is loaded, only the directory information below  the  root
	      directory is used for forming the lookup key.

	      When   this   option  is	specified  during  the	-prof-use  or
	      /Qprof-use phase, it specifies a root directory  that  replaces
	      the  root  directory  specified  at the -prof-gen or /Qprof-gen
	      phase for forming the lookup keys.

	      To be effective, this option or  option  -prof-src-root  (Linux
	      and  Mac	OS  X) or /Qprof-src-root (Windows) must be specified
	      during the -prof-gen or /Qprof-gen phase. In addition,  if  one
	      of  these  options is not specified, absolute paths are used in
	      the .dpi file.

	      Alternate Options:

	      None

       -prof-use[=keyword]

       -no-prof-use

	      Enables the use of profiling information during optimization.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies additional  instructions.  Possible
				values are:

				weighted       Tells the profmerge utility to
					       apply a weighting to the  .dyn
					       file  values when creating the
					       .dpi  file  to  normalize  the
					       data  counts when the training
					       runs  have  differentexecution
					       durations.  This argument only
					       has   an   effect   when   the
					       compiler invokes the profmerge
					       utility	to  create  the  .dpi
					       file.  This  argument does not
					       have an	effect	if  the  .dpi
					       file  was  previously  created
					       without weighting.

				[no]merge      Enables or disables  automatic
					       invocation  of  the  profmerge
					       utility. The default is merge.
					       Note  that  you cannot specify
					       both weighted and nomerge.  If
					       you   try   to	specify  both
					       values,	a  warning  will   be
					       displayed  and  nomerge	takes
					       precedence.

				default        Enables the use	of  profiling
					       information	       during
					       optimization.  The   profmerge
					       utility is invoked by default.
					       This  value  is	the  same  as
					       specifying   -prof-use  (Linux
					       and Mac OS  X)  or  /Qprof-use
					       (Windows) with no argument.

	      Default:

	      -no-prof-use	Profiling  information	is  not  used  during
				optimization.

	      Description:

	      This option enables the use of profiling information (including
	      function	splitting and function grouping) during optimization.
	      It enables option /Qfnsplit (Windows).

	      This   option   instructs   the	compiler   to	 produce    a
	      profile-optimized  executable and it merges available profiling
	      output files into a pgopti.dpi file.

	      Note that there is no way to turn off function grouping if  you
	      enable it using this option.

	      To set the hotness threshold for function grouping and function
	      ordering,  use  option   -prof-hotness-threshold	 (Linux)   or
	      /Qprof-hotness-threshold (Windows).

	      Alternate Options:

	      None

       -prof-value-profiling[=keyword]

	      Controls which values are value profiled.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Controls  which  type  of  value profiling is
				performed. Possible values are:

				none	       Prevents all  types  of	value
					       profiling.

				nodivide       Prevents  value	profiling  of
					       non-compile   time   constants
					       used  in division or remainder
					       operations.

				noindcall      Prevents  value	profiling  of
					       function addresses at indirect
					       call sites.

				all	       Enables	all  types  of	value
					       profiling.

	      You  can	specify  more  than  one  keyword,  but  they must be
	      separated by commas.

	      Default:

	      -prof-value-profiling=all or /Qprof-value-profiling:all
				All value profile types are enabled and value
				profiling is performed.

	      Description:

	      This option controls which features are value profiled.

	      If  this	option is specified with option -prof-gen (Linux* and
	      Mac  OS*	X)   or   /Qprof-gen   (Windows*),   it   turns   off
	      instrumentation  of operations of the specified type. This also
	      prevents feedback of values for the operations.

	      If this option is specified with option  -prof-use  (Linux  and
	      Mac  OS  X)  or  /Qprof-use (Windows), it turns off feedback of
	      values collected of the specified type.

	      If you specify -opt-report (Linux and Mac OS X) or /Qopt-report
	      (Windows) level 2 or higher, the value profiling specialization
	      information  will  be  reported  within  the  PGO  optimization
	      report.

	      Alternate Options:

	      None

       -profile-functions

	      Inserts  instrumentation	calls  at a function's entry and exit
	      points.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No instrumentation calls are  inserted	at  a
				function's entry and exit points.

	      Description:

	      This option inserts instrumentation calls at a function's entry
	      and exit points within a single-threaded application to collect
	      the  cycles  spent  within the function to produce reports that
	      can help in identifying code hotspots.

	      When the instrumented application is run,  this  option  causes
	      the  generation  of  a  loop_prof_funcs_<name>.dump file, where
	      <name> is a timestamp for the run.

	      The  same  data  values  are  also   dumped   into   the	 file
	      loop_prof_<name>.xml  for use with the data viewer application,
	      unless  you  turn  off  the  output  format  by	setting   the
	      environment variable INTEL_LOOP_PROF_XML_DUMP to 0.

	      Alternate Options:

	      None

       -profile-loops=keyword

	      Inserts  instrumentation	calls  at a function's entry and exit
	      points, and before and after instrumentable loops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies which type  of  loops  should  have
				instrumentation.  Possible values are:

				inner	       Inserts instrumentation before
					       and after inner loops.

				outer	       Inserts instrumentation before
					       and after outer loops.

				all	       Inserts instrumentation before
					       and after all loops.

	      Default:

	      OFF		No instrumentation calls are  inserted	at  a
				function's  entry  and exit points, or before
				and after instrumentable loop.

	      Description:

	      This option inserts instrumentation calls at a function's entry
	      and  exit  points  within  a  single-threaded application.  For
	      unthreaded applications, it also inserts instrumentation before
	      and after instrumentable loops of the type listed in keyword.

	      When  the  instrumented  application is run, this option causes
	      the generation of  a  loop_prof_funcs_<name>.dump  file  and  a
	      loop_prof_funcs_<name>.dump  file,  where <name> is a timestamp
	      for the run.

	      The same timestamp is used for the loop file and function file.
	      This  identifies that the loop data and function data were from
	      the same program run.

	      The  same  data  values  are  also   dumped   into   the	 file
	      loop_prof_<name>.xml  for use with the data viewer application,
	      unless  you  turn  off  the  output  format  by	setting   the
	      environment variable INTEL_LOOP_PROF_XML_DUMP to 0.

	      Alternate Options:

	      None

       -profile-loops-report[=n]

	      Controls	the  level  of	detail	for  the  data collected when
	      instrumentation occurs before and after certain loops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is a value denoting the level of  detail   to
				report. Possible values are:

				1	       Reports	the  cycle  counts on
					       entry and exits of loops. This
					       is  the	default  if  n is not
					       specified.

				2	       Reports the  level  1  default
					       details, but also includes the
					       loop min/max and average  loop
					       iteration counts.

					       To  collect the loop iteration
					       counts,		   additional
					       instrumentation	is  inserted.
					       This can increase overhead  in
					       the  instrumented  application
					       and slow performance.

	      Default:

	      -profile-loops-report=1 or /Qprofile-loops-report:1
				The report shows the cycle  counts  on	entry
				and exits of loops.

	      Description:

	      This option controls the level of detail for the data collected
	      when instrumentation occurs before and after certain loops.  To
	      use  this  option,  you must also specify option -profile-loops
	      (Linux and Mac OS X) or /Qprofile-loops (Windows).

	      The report appears in file  loop_prof_loops_<name>.dump,	where
	      <name>  is a timestamp value for the run. The columns listed in
	      the report will be based	on  the  level	of  detail  that  was
	      selected during instrumentation.

	      It  is  recommended  that the same report level be used for all
	      files that are instrumented for the application.	If  different
	      files  of  the  application  were  instrumented  with different
	      levels, the report will contain all the columns of the  highest
	      detail  level,  but  with default values for unavailable fields
	      for files that were instrumented at lower levels.

	      Alternate Options:

	      None

       -Qinstalldir

	      Specifies the root directory where  the  compiler  installation
	      was performed.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      dir		Is  the root directory where the installation
				was performed.

	      Default:

	      OFF		The  default  root  directory  for   compiler
				installation is searched for the compiler.

	      Description:

	      This  option  specifies  the  root directory where the compiler
	      installation was performed. It is useful if you want to  use  a
	      different  compiler  or  if you did not use the ifortvars shell
	      script to set your environment variables.

	      Alternate Options:

	      None

       -Qlocation,string,dir

	      Specifies the directory for supporting tools.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      string		Is the name of the tool.

	      dir		Is the directory (path)  where	the  tool  is
				located.

	      Default:

	      OFF		The  compiler  looks  for  tools in a default
				area.

	      Description:

	      This option specifies the directory for supporting tools.

	      string can be any of the following:

	      · f - Indicates the Intel® Fortran compiler.

	      · fpp (or cpp) - Indicates the Intel® Fortran preprocessor.

	      · asm - Indicates the assembler.

	      · link - Indicates the linker.

	      · prof - Indicates the profiler.

	      · On Windows* systems, the following is also available:

		· masm - Indicates the Microsoft assembler.

	      · On Linux* and Mac OS*  X  systems,  the  following  are  also
		available:

		· as - Indicates the assembler.

		· gas - Indicates the GNU assembler.

		· ld - Indicates the loader.

		· gld - Indicates the GNU loader.

		· lib - Indicates an additional library.

		· crt - Indicates the crt%.o files linked into executables to
		  contain the place to start execution.

	      Alternate Options:

	      None

       -Qoption,string,options

	      Passes options to a specified tool.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      string		Is the name of the tool.

	      options		Are  one  or  more   comma-separated,	valid
				options for the designated tool.

	      Default:

	      OFF		No options are passed to tools.

	      Description:

	      This option passes options to a specified tool.

	      If  an  argument	contains  a  space or tab character, you must
	      enclose the entire argument in quotation marks (" "). You  must
	      separate multiple arguments with commas.

	      string can be any of the following:

	      · fpp (or cpp) - Indicates the Intel® Fortran preprocessor.

	      · asm - Indicates the assembler.

	      · link - Indicates the linker.

	      · prof - Indicates the profiler.

	      · On Windows* systems, the following is also available:

		· masm - Indicates the Microsoft assembler.

	      · On  Linux*  and  Mac  OS*  X  systems, the following are also
		available:

		· as - Indicates the assembler.

		· gas - Indicates the GNU assembler.

		· ld - Indicates the loader.

		· gld - Indicates the GNU loader.

		· lib - Indicates an additional library.

		· crt - Indicates the crt%.o files linked into executables to
		  contain the place to start execution.

	      Alternate Options:

	      None

       -rcd

	      Enables fast float-to-integer conversions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Floating-point	values	are  truncated when a
				conversion to an integer is involved.

	      Description:

	      This option enables fast float-to-integer conversions.  It  can
	      improve	 the	performance    of    code    that    requires
	      floating-point-to-integer conversions.

	      The   system   default   floating-point	rounding   mode    is
	      round-to-nearest.   However,   the  Fortran  language  requires
	      floating-point values to be truncated when a conversion  to  an
	      integer  is  involved. To do this, the compiler must change the
	      rounding	   mode      to      truncation      before	 each
	      floating-point-to-integer   conversion   and   change  it  back
	      afterwards.

	      This option disables the change to truncation of	the  rounding
	      mode  for  all  floating-point calculations, including floating
	      point-to-integer	 conversions.	This   option	can   improve
	      performance, but floating-point conversions to integer will not
	      conform to Fortran semantics.

	      Alternate Options:

	      Linux and Mac OS X: None

       -real-size size

	      Specifies the default KIND for real and complex variables.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      size		Is the size for real and  complex  variables.
				Possible values are: 32, 64, or 128.

	      Default:

	      real-size 32	Default  real  and  complex  variables	are 4
				bytes	   long       (REAL(KIND=4)	  and
				COMPLEX(KIND=4)).

	      Description:

	      This  option  specifies the default size (in bits) for real and
	      complex variables.

	      Option		Description

	      real-size 32	Makes default real and	complex  variables  4
				bytes  long. REAL declarations are treated as
				single	precision  REAL  (REAL(KIND=4))   and
				COMPLEX  declarations  are treated as COMPLEX
				(COMPLEX(KIND=4)).

	      real-size 64	Makes default real and	complex  variables  8
				bytes  long. REAL declarations are treated as
				DOUBLE PRECISION (REAL(KIND=8))  and  COMPLEX
				declarations  are  treated  as DOUBLE COMPLEX
				(COMPLEX(KIND=8)).

	      real-size 128	Makes default real and complex	variables  16
				bytes  long. REAL declarations are treated as
				extended  precision   REAL   (REAL(KIND=16));
				COMPLEX  and  DOUBLE COMPLEX declarations are
				treated   as   extended   precision   COMPLEX
				(COMPLEX(KIND=16)).

	      These  compiler options can affect the result type of intrinsic
	      procedures, such as CMPLX, FLOAT, REAL, SNGL, and AIMAG,	which
	      normally	produce  single-precision REAL or COMPLEX results. To
	      prevent this effect, you must explicitly declare the kind  type
	      for arguments of such intrinsic procedures.

	      For  example, if real-size 64 is specified, the CMPLX intrinsic
	      will produce a result of type DOUBLE COMPLEX (COMPLEX(KIND=8)).
	      To  prevent this, you must explicitly declare any real argument
	      to  be  REAL(KIND=4),  and   any	 complex   argument   to   be
	      COMPLEX(KIND=4).

	      Alternate Options:

	      real-size 64	Linux and Mac OS X: -r8, -autodouble

	      real-size 128	Linux and Mac OS X: -r16

       -recursive

       -norecursive

	      Tells  the  compiler  that  all routines should be compiled for
	      possible recursive execution.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      norecursive	Routines  are  not  compiled   for   possible
				recursive execution.

	      Description:

	      This  option  tells  the	compiler  that all routines should be
	      compiled	for  possible  recursive  execution.  It   sets   the
	      automatic option.

	      Alternate Options:

	      None

       -reentrancy keyword

       -noreentrancy

	      Tells  the  compiler  to	generate  reentrant code to support a
	      multithreaded application.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies details about the program. Possible
				values are:

				none	       Tells   the  run-time  library
					       (RTL) that  the	program  does
					       not   rely   on	 threaded  or
					       asynchronous  reentrancy.  The
					       RTL  will  not  guard  against
					       such interrupts inside its own
					       critical  regions. This is the
					       same	  as	   specifying
					       noreentrancy.

				async	       Tells   the  run-time  library
					       (RTL)  that  the  program  may
					       contain	 asynchronous	(AST)
					       handlers that could  call  the
					       RTL.  This  causes  the RTL to
					       guard against  AST  interrupts
					       inside	 its   own   critical
					       regions.

				threaded       Tells  the  run-time   library
					       (RTL)   that  the  program  is
					       multithreaded,	  such	   as
					       programs   using   the	POSIX
					       threads library.  This  causes
					       the  RTL to use thread locking
					       to  guard  its  own   critical
					       regions.

	      Default:

	      noreentrancy	The compiler does not generate reentrant code
				for applications.

	      Description:

	      This option tells the compiler to generate  reentrant  code  to
	      support a multithreaded application.

	      If  you do not specify a keyword for reentrancy, it is the same
	      as specifying reentrancy threaded.

	      Note that if  option  threads  is  specified,  it  sets  option
	      reentrancy   threaded,   since   multithreaded   code  must  be
	      reentrant.

	      Alternate Options:

	      None

       -S

	      Causes the compiler to compile to an assembly file only and not
	      link.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Normal compilation and linking occur.

	      Description:

	      This  option causes the compiler to compile to an assembly file
	      only and not link.

	      On Linux and Mac OS X systems, the assembly file name has a  .s
	      suffix.  On Windows systems, the assembly file name has an .asm
	      suffix.

	      Alternate Options:

	      Linux and Mac OS X: None

       -safe-cray-ptr

	      Tells the compiler that  Cray*  pointers	do  not  alias	other
	      variables.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler assumes that Cray pointers alias
				other variables.

	      Description:

	      This option tells the compiler that Cray pointers do not	alias
	      (that is, do not specify sharing memory with) other variables.

	      Alternate Options:

	      None

       -save

	      Causes variables to be placed in static memory.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -auto-scalar	Scalar	variables of intrinsic types INTEGER,
				REAL, COMPLEX, and LOGICAL are	allocated  to
				the  run-time  stack.  Note  that the default
				changes to  auto  if  one  of  the  following
				options   are	specified:recursive,  -openmp
				(Linux and Mac OS X).

	      Description:

	      This option saves all variables  in  static  allocation  except
	      local  variables	within	a  recursive  routine  and  variables
	      declared as AUTOMATIC.

	      If you want all local, non-SAVEd variables to be	allocated  to
	      the run-time stack, specify option automatic.

	      Alternate Options:

	      Linux and Mac OS X: -noauto

       -save-temps

       -no-save-temps

	      Tells  the  compiler  to save intermediate files created during
	      compilation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      Linux and Mac OS X: -no-save-temps
				On Linux and Mac OS X systems,	the  compiler
				deletes  intermediate files after compilation
				is completed.

	      Description:

	      This option tells  the  compiler	to  save  intermediate	files
	      created  during  compilation.  The names of the files saved are
	      based on the name of the source file; the files  are  saved  in
	      the current working directory.

	      If  -save-temps  or  /Qsave-temps  is  specified, the following
	      occurs:

	      · The object .o  file  (Linux  and  Mac  OS  X)  or  .obj  file
		(Windows) is saved.

	      · The  assembler	.s  file  (Linux  and  Mac OS X) or .asm file
		(Windows) is saved if you specified -use-asm (Linux or Mac OS
		X) or /Quse-asm (Windows).

	      · The  .i  or  .i90  file  is  saved if the fpp preprocessor is
		invoked.

	      If -no-save-temps is specified on Linux or Mac  OS  X  systems,
	      the following occurs:

	      · The .o file is put into /tmp and deleted after calling ld.

	      · The  preprocessed file is not saved after it has been used by
		the compiler.

	      If /Qsave-temps- is specified on Windows systems, the following
	      occurs:

	      · The .obj file is not saved after the linker step.

	      · The  preprocessed file is not saved after it has been used by
		the compiler.

	      NOTE: This  option  only	saves  intermediate  files  that  are
	      normally created during compilation.

	      Alternate Options:

	      None

       -scalar-rep

       -no-scalar-rep

	      Enables	 scalar    replacement	  performed    during	 loop
	      transformation.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-scalar-rep	Scalar replacement is  not  performed  during
				loop transformation.

	      Description:

	      This  option  enables  scalar replacement performed during loop
	      transformation. To use this option, you must also specify O3.

	      Alternate Options:

	      None

       -shared (L*X only)

	      Tells the compiler to produce a dynamic shared  object  instead
	      of an executable.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler produces an executable.

	      Description:

	      This  option  tells  the	compiler  to produce a dynamic shared
	      object (DSO) instead of an executable. This includes linking in
	      all libraries dynamically and passing -shared to the linker.

	      You must specify option fpic for the compilation of each object
	      file you want to include in the shared library.

	      Alternate Options:

	      None

       -shared-intel

	      Causes Intel-provided libraries to be linked in dynamically.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Intel® libraries are  linked  in  statically,
				with  the exception of Intel's OpenMP runtime
				support   library,   which   is   linked   in
				dynamically.

	      Description:

	      This  option  causes  Intel-provided  libraries to be linked in
	      dynamically. It is the opposite of -static-intel.

	      NOTE: On Mac  OS*  X  systems,  when  you  set  "Intel  Runtime
	      Libraries"    to	  "Dynamic",	you   must   also   set   the
	      DYLD_LIBRARY_PATH environment variable within Xcode or an error
	      will be displayed.

	      Alternate Options:

	      Linux and Mac OS X: -i-dynamic (this is a deprecated option)

       -shared-libgcc (L*X only)

	      Links the GNU libgcc library dynamically.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -shared-libgcc	The   compiler	 links	 the  libgcc  library
				dynamically.

	      Description:

	      This option links the GNU libgcc library dynamically. It is the
	      opposite of option static-libgcc.

	      This  option  is	useful	when you want to override the default
	      behavior of the static option, which causes all libraries to be
	      linked statically.

	      Alternate Options:

	      None

       -show=keyword

	      Controls the contents of the listing generated when option list
	      is specified.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the	contents  for  the   listing.
				Possible values are:

				[no]include    Controls  whether  contents of
					       files   added   with   INCLUDE
					       statements are included when a
					       listing is generated.

				[no]map        Controls  whether   a   symbol
					       listing	with  a  line  number
					       cross-reference	  for	 each
					       routine is     included when a
					       listing is generated.

				[no]options    Controls  whether  a  list  of
					       compiler  options used for the
					       compilation is included when a
					       listing is generated.

	      Default:

	      include, map, and options
				When  a listing is generated, it contains the
				contents of INCLUDEd  files,  a  symbol  list
				with  a  line  number  cross reference, and a
				list of compiler options used.

	      Description:

	      This option controls the contents of the listing generated when
	      option list is specified.

	      If  you specify option show and do not specify option list, the
	      option is ignored.

	      Alternate Options:

	      None

       -simd

       -no-simd

	      Enables or disables  the	SIMD  vectorization  feature  of  the
	      compiler.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -simd		The SIMD vectorization feature is enabled.

	      Description:

	      This  option enables or disables the SIMD vectorization feature
	      of the compiler.

	      To disable the SIMD transformations for vectorization,  specify
	      -no-simd (Linux and Mac OS X) or /Qsimd- (Windows).

	      To  disable  vectorization,  specify options -no-vec (Linux and
	      Mac OS X) or /Qvec- (Windows).

	      NOTE: The SIMD vectorization  feature  is  available  for  both
	      Intel®	microprocessors    and	 non-Intel   microprocessors.
	      Vectorization may call library  routines	that  can  result  in
	      additional  performance  gain  on Intel microprocessors than on
	      non-Intel  microprocessors.  The	vectorization  can  also   be
	      affected	by certain options, such as /arch or /Qx (Windows) or
	      -m or -x (Linux and Mac OS X).

	      Alternate Options:

	      None

       -sox[=keyword[,keyword]] (L*X only)

       -no-sox (L*X only)

	      Tells the compiler to save the compilation options and  version
	      number  in  the  Linux* OS executable or the Windows* OS object
	      file.  It also lets you choose  whether  to  include  lists  of
	      certain routines.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Is   the   routine  information  to  include.
				Possible values are:

				inline	       Includes   a   list   of   the
					       routines  that  were  compiled
					       with -prof-use (Linux* OS)  or
					       /Qprof-use  (Windows*) and for
					       which  the   .dpi   file   had
					       profile	information,  and  an
					       indication  for	each  as   to
					       whether	     the      profile
					       information was USED (matched)
					       or IGNORED (mismatched).

				profile        Includes   a   list   of   the
					       routines that were inlined  in
					       each object.

	      Default:

	      -no-sox		The    compiler    does    not	 save	these
				informational strings in  the  executable  or
				object file.

	      Description:

	      This  option tells the compiler to save the compilation options
	      and version number in the Linux* OS executable or the  Windows*
	      OS  object  file.   It  also lets you choose whether to include
	      lists of certain routines.  The information is  embedded	as  a
	      string in each object file or assembly output.

	      If  you  specify -sox  with no argument, the compiler saves the
	      compiler options and version number used in the compilation  of
	      the objects that make up the executable.

	      If  you  specify	this option on Linux systems, the size of the
	      executable on disk is increased  slightly.  Each	keyword   you
	      specify  increases  the  size of the executable.	When you link
	      the object files into an executable  file,  the  linker  places
	      each  of	the  information  strings  into  the  header  of  the
	      executable. It is then possible  to  use	a  tool,  such	as  a
	      strings  utility,  to determine what options were used to build
	      the executable file.

	      If you specify this option on Windows systems, the  information
	      stays in the object file.

	      Alternate Options:

	      None

       -stand [keyword]

       -nostand

	      Tells   the   compiler   to  issue  compile-time	messages  for
	      nonstandard language elements.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies  the	language  to   use   as   the
				standard. Possible values are:

				none	       Issue	no    messages	  for
					       nonstandard language elements.

				f90	       Issue  messages	for  language
					       elements that are not standard
					       in Fortran 90.

				f95	       Issue  messages	for  language
					       elements that are not standard
					       in Fortran 95.

				f03	       Issue  messages	for  language
					       elements that are not standard
					       in Fortran 2003.

	      Default:

	      nostand		The   compiler	 issues   no   messages   for
				nonstandard language elements.

	      Description:

	      This  option  tells the compiler to issue compile-time messages
	      for nonstandard language elements.

	      If you do not specify a keyword for stand, it is	the  same  as
	      specifying stand f03.

	      Option		Description

	      stand none	Tells  the  compiler to issue no messages for
				nonstandard language elements.	This  is  the
				same as specifying nostand.

	      stand f90 	Tells  the  compiler  to  issue  messages for
				language elements that are  not  standard  in
				Fortran 90.

	      stand f95 	Tells  the  compiler  to  issue  messages for
				language elements that are  not  standard  in
				Fortran 95.

	      stand f03 	Tells  the  compiler  to  issue  messages for
				language elements that are  not  standard  in
				Fortran  2003.	This  option  is  set  if you
				specify warn stderrors.

	      Alternate Options:

	      stand none	Linux and Mac OS X: -nostand

	      stand f90 	Linux and Mac OS X: -std90

	      stand f95 	Linux and Mac OS X: -std95

	      stand f03 	Linux and Mac OS X: -std03, -stand, -std

       -standard-semantics

       -no-standard-semantics

	      Determines whether the current Fortran Standard behavior of the
	      compiler is fully implemented.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-standard-semantics or /standard-semantics-
				The  compiler  implements most of the current
				Fortran Standard behavior.

	      Description:

	      This option determines whether  the  current  Fortran  Standard
	      behavior of the compiler is fully implemented.

	      If  you  specify	standard-semantics,  it  enables  all  of the
	      options that implement the current Fortran Standard behavior of
	      the  compiler,  which  is  Fortran  2003 with some Fortran 2008
	      features.

	      Option standard-semantics enables the  following	settings  for
	      option	assume:    byterecl,	minus0,   noold_ldout_format,
	      noold_maxminloc,	noold_unit_star,  noold_xor,  protect_parens,
	      realloc_lhs, std_mod_proc_name, and fpe_summary.

	      If  you  specify	option standard-semantics and also explicitly
	      specify a different setting for an affected assume option,  the
	      value  you  specify  takes  effect.  It  overrides the settings
	      enabled by option standard-semantics.

	      Option  –no-standard-semantics  (Linux  and  Mac	 Os   X)   or
	      /standard-semantics-  (Windows)  enables the following settings
	      for    option    assume:	  old_ldout_format,    old_maxminloc,
	      old_unit_star, and old_xor.

	      Alternate Options:

	      None

       -static (L*X only)

	      Prevents linking with shared libraries.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      Linux: OFF  Windows: varies
				On  Linux*  systems,  the compiler links with
				shared libraries. On  Windows*	systems,  for
				option	 /Qvc8	 and   higher,	 /static   is
				equivalent   to   option   /MT.   For	 more
				information, see that compiler option.

	      Description:

	      This  option  prevents linking with shared libraries. It causes
	      the executable to link all libraries statically.

	      Alternate Options:

	      None

       -static-intel

	      Causes Intel-provided libraries to be linked in statically.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      ON		Intel® libraries are  linked  in  statically,
				with  the exception of Intel's OpenMP runtime
				support   library,   which   is   linked   in
				dynamically.

	      Description:

	      This  option  causes  Intel-provided  libraries to be linked in
	      statically. It is the opposite of -shared-intel.

	      Alternate Options:

	      Linux and Mac OS X: i-static (this is a deprecated option)

       -staticlib (M*X only)

	      Invokes the libtool command to generate static libraries.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The compiler produces an executable.

	      Description:

	      This option invokes the  libtool	command  to  generate  static
	      libraries.

	      When  passed this option, the compiler uses the libtool command
	      to produce a static  library  instead  of  an  executable  when
	      linking.

	      To   build   dynamic   libraries,  you  should  specify  option
	      -dynamiclib or libtool -dynamic <objects>.

	      Alternate Options:

	      None

       -static-libgcc (L*X only)

	      Links the GNU libgcc library statically.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		DEFAULT_DESC

	      Description:

	      This option links the GNU libgcc library statically. It is  the
	      opposite of option libgcc.

	      This  option  is	useful	when you want to override the default
	      behavior of the libgcc option, which causes all libraries to be
	      linked statically.

	      Alternate Options:

	      None

       -syntax-only

	      Tells the compiler to check only for correct syntax.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Normal compilation is performed.

	      Description:

	      This  option  tells  the	compiler  to  check  only for correct
	      syntax. It lets you do a quick  syntax  check  of  your  source
	      file.

	      Compilation  stops  after  the  source file has been parsed. No
	      code is generated, no object file is produced, and  some	error
	      checking done by the optimizer is bypassed.

	      Warnings and messages appear on stderr.

	      Alternate Options:

	      Linux: -y, -fsyntax-only, -syntax (this is a deprecated option)

	      Mac OS X: -y, -fsyntax-only

	      Windows: /Zs

       -Tfilename (L*X only)

	      Tells the linker to read link commands from a file.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of the file.

	      Default:

	      OFF		The linker does not read link commands from a
				file.

	      Description:

	      This option tells the linker to read link commands from a file.

	      Alternate Options:

	      None

       -tcheck (L*X only)

	      Enables analysis of threaded applications.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Threaded applications are not instrumented by
				the  compiler  for  analysis by Intel® Thread
				Checker.

	      Description:

	      This option enables analysis of threaded applications.

	      To use  this  option,  you  must	have  Intel®  Thread  Checker
	      installed, which is one of the Intel® Threading Analysis Tools.
	      If you do not have this tool installed,  the  compilation  will
	      fail.  Remove  the -tcheck (Linux) or /Qtcheck (Windows) option
	      from the command line and recompile.

	      For more information about Intel® Thread Checker (including  an
	      evaluation copy), open the page associated with threading tools
	      at Intel® Software Development Products.

	      Alternate Options:

	      None

       -tcollect[lib] (L*X only)

	      Inserts  instrumentation	probes	calling  the   Intel®	Trace
	      Collector API.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      lib		Is   one   of	the  Intel®  Trace  Collector
				libraries; for example, VT,  VTcs,  VTmc,  or
				VTfs.  If you do not specify lib, the default
				library is VT.

	      Default:

	      OFF		Instrumentation probes are not inserted  into
				compiled applications.

	      Description:

	      This  option  inserts instrumentation probes calling the Intel®
	      Trace Collector API. To use this	option,  you  must  have  the
	      Intel®  Trace Collector installed and set up through one of its
	      set-up scripts. This tool is a component of  the	Intel®	Trace
	      Analyzer and Collector.

	      This   option   provides	a  flexible  and  convenient  way  of
	      instrumenting functions of a compiled  application.  For	every
	      function, the entry and exit points are instrumented at compile
	      time to let the Intel® Trace Collector record functions  beyond
	      the  default  MPI calls. For non-MPI applications (for example,
	      threaded or serial), you must  ensure  that  the	Intel®	Trace
	      Collector is properly initialized (VT_initialize/VT_init).

	      CAUTION:	Be  careful  with  full  instrumentation because this
	      feature can produce very large trace files.

	      For more details, see the Intel® Trace Collector User Guide.

	      Alternate Options:

	      None

       -tcollect-filter filename (L*X only)

	      Lets you enable or disable  the  instrumentation	of  specified
	      functions.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is  a  configuration file that lists filters,
				one per  line.	Each  filter  consists	of  a
				regular   expression  string  and  a  switch.
				Strings with leading or trailing white spaces
				must  be quoted. Other strings do not have to
				be quoted. The switch value can  be  ON,  on,
				OFF, or off.

	      Default:

	      OFF		Functions  are	not instrumented. However, if
				option -tcollect (Linux)  is  specified,  the
				filter	setting  is ".* ON" and all functions
				get instrumented.

	      Description:

	      This option lets you enable or disable the  instrumentation  of
	      specified functions.

	      During instrumentation, the regular expressions in the file are
	      matched  against	the  function  names.  The  switch  specifies
	      whether  matching  functions  are  to  be  instrumented or not.
	      Multiple	filters  are  evaluated  from  top  to	bottom	 with
	      increasing precedence.

	      The  names  of  the functions to match against are formatted as
	      follows:

	      · The  source  file  name  is  followed  by  a  colon-separated
		function  name.  Source  file  names  should contain the full
		path, if available. For example:

		/home/joe/src/file.f:FOO_bar

	      · Classes and function names are separated  by  double  colons.
		For example:

		/home/joe/src/file.fpp:app::foo::bar

	      You   can   use  option  -opt-report  (Linux)  or  /Qopt-report
	      (Windows) to get a full list of file and	function  names  that
	      the  compiler  recognizes  from the compilation unit. This list
	      can be used as the basis for  filtering  in  the	configuration
	      file.

	      To  use  this  option, you must have the Intel® Trace Collector
	      installed and set up through one of its  set-up  scripts.  This
	      tool is a component of the Intel® Trace Analyzer and Collector.

	      For more details, see the Intel® Trace Collector User Guide.

	      Alternate Options:

	      None

       -threads

       -nothreads

	      Tells  the  linker  to  search  for  unresolved references in a
	      multithreaded run-time library.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      Systems using Intel® 64 architecture: threads
				On systems using Intel® 64 architectures, the
				linker	searches for unresolved references in
				a mutithreaded run-time library.

	      Systems using IA-32 architecture: nothreads
				On  systems  using  IA-32  architecture,  the
				linker	 does	not   search  for  unresolved
				references   in   a   mutithreaded   run-time
				library.

	      Description:

	      This   option   tells  the  linker  to  search  for  unresolved
	      references in a multithreaded run-time library.

	      This option sets option reentrancy threaded.

	      Windows systems: The following table  shows  which  options  to
	      specify for a multithreaded run-time library.

	      Alternate Options:

	      None

       -tprofile (L*X only)

	      Generates    instrumentation    to    analyze   multi-threading
	      performance. This is a deprecated option.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Instrumentation  is  not  generated  by   the
				compiler   for	 analysis  by  Intel®  Thread
				Profiler.

	      Description:

	      This    option	generates    instrumentation	to    analyze
	      multi-threading performance.

	      To  use  this  option,  you  must  have  Intel® Thread Profiler
	      installed, which is one of the Intel® Threading Analysis Tools.
	      If  you  do  not have this tool installed, the compilation will
	      fail. Remove the	-tprofile  (Linux)  or	/Qtprofile  (Windows)
	      option from the command line and recompile.

	      For more information about Intel® Thread Profiler (including an
	      evaluation copy), open the page associated with threading tools
	      at Intel® Software Development Products.

	      Alternate Options:

	      None

       -traceback

       -notraceback

	      Tells  the compiler to generate extra information in the object
	      file to provide source file traceback information when a severe
	      error occurs at run time.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      notraceback	No  extra  information	is  generated  in the
				object file to produce traceback information.

	      Description:

	      This option tells the compiler to generate extra information in
	      the  object  file  to provide source file traceback information
	      when a severe error occurs at run time.

	      When the severe error occurs, source file,  routine  name,  and
	      line  number  correlation  information  is displayed along with
	      call stack hexadecimal addresses (program counter trace).

	      Note that when a severe error occurs, advanced users  can  also
	      locate  the  cause  of  the  error  using  a  map  file and the
	      hexadecimal addresses of the stack  displayed  when  the	error
	      occurs.

	      This  option  increases the size of the executable program, but
	      has no impact on run-time execution speeds.

	      It functions independently of the debug option.

	      On Windows* systems, traceback  sets  the  /Oy-  option,	which
	      forces the compiler to use EBP as the stack frame pointer.

	      On   Windows*   systems,	 the   linker  places  the  traceback
	      information  in  the  executable	image,	in  a  section	named
	      ".trace".  To  see  which  sections  are	in  an image, use the
	      command:

	      link -dump -summary your_app_name.exe

	      To see more detailed information, use the command:

	      link -dump -headers your_app_name.exe

	      On Windows* systems, when requesting traceback,  you  must  set
	      Enable  Incremental  Linking in the VS .NET* IDE Linker Options
	      to No. You must also set Omit Frame Pointers (the  /Oy  option)
	      in the Optimization Options to "No."

	      On  Linux* systems, to display the section headers in the image
	      (including the header for the .trace section, if any), use  the
	      command:

	      objdump -h your_app_name.exe

	      On  Mac  OS*  X  systems, to display the section headers in the
	      image, use the command:

	      otool -l your_app_name.exe

	      Alternate Options:

	      None

       -tune keyword

	      Determines the  version  of  the	architecture  for  which  the
	      compiler generates instructions. This is a deprecated option.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies the processor type. Possible values
				are:

				pn1	       Optimizes   for	 the   Intel®
					       Pentium® processor.

				pn2	       Optimizes   for	 the   Intel®
					       Pentium® Pro, Intel®  Pentium®
					       II,  and  Intel®  Pentium® III
					       processors.

				pn3	       Optimizes   for	 the   Intel®
					       Pentium®  Pro, Intel® Pentium®
					       II, and	Intel®	Pentium®  III
					       processors.  This  is the same
					       as specifying pn2.

				pn4	       Optimizes   for	 the   Intel®
					       Pentium® 4 processor.

	      Default:

	      pn4		The   compiler	 optimizes   for  the  Intel®
				Pentium® 4 processor.

	      Description:

	      This option determines the  version  of  the  architecture  for
	      which the compiler generates instructions.

	      On  systems  using  Intel®  64 architecture, only keywordpn4 is
	      valid.

	      The recommended option to generate optimized  code  specialized
	      for the Intel processor that executes your program is option -x
	      (Linux and Mac OS X) or /Qx (Windows).

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's compilers may or may not optimize to  the  same  degree
	      for  non-Intel  microprocessors  for optimizations that are not
	      unique to Intel microprocessors.	These  optimizations  include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel does not guarantee the  availability,  functionality,  or
	      effectiveness   of  any  optimization  on  microprocessors  not
	      manufactured by Intel.  Microprocessor-dependent	optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors. Certain optimizations not  specific  to	Intel
	      microarchitecture   are  reserved  for  Intel  microprocessors.
	      Please refer to  the  applicable	product  User  and  Reference
	      Guides  for more information regarding the specific instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -Uname

	      Undefines any definition currently in effect for the  specified
	      symbol.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      name		Is the name of the symbol to be undefined.

	      Default:

	      OFF		Symbol	definitions  are in effect until they
				are undefined.

	      Description:

	      This option undefines any definition currently  in  effect  for
	      the specified symbol.

	      On   Windows  systems,  use  the	/u  option  to	undefine  all
	      previously defined preprocessor values.

	      Alternate Options:

	      Linux and Mac OS X: None

	      Windows: /undefine:name

       -unroll[=n]

	      Tells the compiler the maximum number of times to unroll loops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is the maximum number of times a loop can  be
				unrolled.  To disable loop enrolling, specify
				0.

	      Default:

	      -unroll		The compiler  uses  default  heuristics  when
				unrolling loops.

	      Description:

	      This  option  tells the compiler the maximum number of times to
	      unroll loops.

	      If you do not specify n,	the  optimizer	determines  how  many
	      times loops can be unrolled.

	      Alternate Options:

	      Linux and Mac OS X: -funroll-loops

       -unroll-aggressive

       -no-unroll-aggressive

	      Determines  whether the compiler uses more aggressive unrolling
	      for certain loops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -no-unroll-aggressive
				The compiler  uses  default  heuristics  when
				unrolling loops.

	      Description:

	      This   option   determines   whether  the  compiler  uses  more
	      aggressive unrolling for certain loops. The  positive  form  of
	      the option may improve performance.

	      This  option  enables  aggressive, complete unrolling for loops
	      with small constant trip counts.

	      Alternate Options:

	      None

       -v[filename]

	      Specifies that driver tool commands  should  be  displayed  and
	      executed.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      filename		Is the name of a file.

	      Default:

	      OFF		No tool commands are shown.

	      Description:

	      This  option  specifies  that  driver  tool  commands should be
	      displayed and executed.

	      If you use this option without  specifying  a  file  name,  the
	      compiler displays only the version of the compiler.

	      If you want to display processing information (pass information
	      and source file names), specify option watch:all.

	      Alternate Options:

	      Linux and Mac OS X: -watch cmd

	      Windows: /watch:cmd

       -vec

       -no-vec

	      Enables or disables vectorization.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -vec		Vectorization is enabled.

	      Description:

	      This option enables or disables vectorization.

	      To disable vectorization, specify -no-vec (Linux and Mac OS  X)
	      or /Qvec- (Windows).

	      To  disable  the	SIMD transformations, specify option -no-simd
	      (Linux and Mac OS X) or /Qsimd- (Windows).

	      NOTE:  Using  this  option  enables  vectorization  at  default
	      optimization   levels   for  both  Intel®  microprocessors  and
	      non-Intel  microprocessors.   Vectorization  may	call  library
	      routines	that  can  result  in  additional performance gain on
	      Intel microprocessors than on  non-Intel	microprocessors.  The
	      vectorization  can also be affected by certain options, such as
	      /arch or /Qx (Windows) or -m or -x (Linux and Mac OS X).

	      Alternate Options:

	      None

       -vec-guard-write

       -no-vec-guard-write

	      Tells  the  compiler  to	perform  a  conditional  check	in  a
	      vectorized loop.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -vec-guard-write	The   compiler	 performs a conditional check
				in a vectorized loop.

	      Description:

	      This option tells the compiler to perform a  conditional	check
	      in  a  vectorized loop. This checking avoids unnecessary stores
	      and may improve performance.

	      Alternate Options:

	      None

       -vec-report[n]

	      Controls the diagnostic information reported by the vectorizer.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is a value denoting which diagnostic messages
				to report. Possible values are:

				0	       Tells the vectorizer to report
					       no diagnostic information.

				1	       Tells the vectorizer to report
					       on vectorized loops.

				2	       Tells the vectorizer to report
					       on	vectorized	  and
					       non-vectorized loops.

				3	       Tells the vectorizer to report
					       on	vectorized	  and
					       non-vectorized  loops  and any
					       proven	or    assumed	 data
					       dependences.

				4	       Tells the vectorizer to report
					       on non-vectorized loops.

				5	       Tells the vectorizer to report
					       on  non-vectorized  loops  and
					       the reason why they  were  not
					       vectorized.

	      Default:

	      -vec-report1	If the vectorizer has been enabled and you do
				not   specify	n,   the   compiler   reports
				diagnostics  on  vectorized  loops. If you do
				not specify the option on the  command	line,
				the default is to display no messages.

	      Description:

	      This option controls the diagnostic information reported by the
	      vectorizer. The vectorizer report is sent to stdout.

	      If you  do  not  specify	n,  it	is  the  same  as  specifying
	      -vec-report1 (Linux and Mac OS X) or /Qvec-report1 (Windows).

	      If  this option is specified from within the IDE, the report is
	      included in the build log if the Generate Build Logs option  is
	      selected.

	      Alternate Options:

	      None

       -vec-threshold[n]

	      Sets a threshold for the vectorization of loops.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      n 		Is  an	integer  whose value is the threshold
				for  the  vectorization  of  loops.  Possible
				values are 0 through 100.

				If  n  is  0,  loops  get  vectorized always,
				regardless of computation work volume.

				If  n  is  100,  loops	get  vectorized  when
				performance  gains are predicted based on the
				compiler analysis data. Loops get  vectorized
				only   if  profitable  vector-level  parallel
				execution is almost certain.

				The intermediate 1 to 99 values represent the
				percentage    probability    for   profitable
				speed-up.  For	example,  n=50	directs   the
				compiler  to vectorize only if there is a 50%
				probability  of  the  code  speeding  up   if
				executed in vector form.

	      Default:

	      -vec-threshold100 Loops	get  vectorized  only  if  profitable
				vector-level  parallel	execution  is  almost
				certain.  This	is also the default if you do
				not specify  n.

	      Description:

	      This option sets a threshold for	the  vectorization  of	loops
	      based  on  the  probability  of  profitable  execution  of  the
	      vectorized loop in parallel.

	      This option is useful for loops whose computation  work  volume
	      cannot  be determined at compile-time. The threshold is usually
	      relevant when the loop trip count is unknown at compile-time.

	      The compiler applies a heuristic	that  tries  to  balance  the
	      overhead of creating multiple threads versus the amount of work
	      available to be shared amongst the threads.

	      Alternate Options:

	      None

       -vms

       -novms

	      Causes the run-time  system  to  behave  like  HP*  Fortran  on
	      OpenVMS* Alpha systems and VAX* systems (VAX FORTRAN*).

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      novms		The  run-time  system  follows default Intel®
				Fortran behavior.

	      Description:

	      This option causes the  run-time	system	to  behave  like  HP*
	      Fortran  on  OpenVMS*  Alpha  systems  and  VAX*	systems  (VAX
	      FORTRAN*).

	      It affects the following language features:

	      · Certain defaults In the absence of other  options,  vms  sets
		the defaults as check format and check output_conversion.

	      · Alignment  Option vms does not affect the alignment of fields
		in records or items in common blocks. For compatibility  with
		HP  Fortran  on  OpenVMS systems, use align norecords to pack
		fields of records on the next byte boundary.

	      · Carriage control default If option vms and  option  ccdefault
		default  are  specified, carriage control defaults to FORTRAN
		if the file is formatted and  the  unit  is  connected	to  a
		terminal.

	      · INCLUDE  qualifiers  /LIST  and /NOLIST are recognized at the
		end of the file name in an INCLUDE statement at compile time.
		If  the  file  name in the INCLUDE statement does not specify
		the complete path, the path used is  the  current  directory.
		Note  that  if	vms  is  not  specified, the path used is the
		directory where the file that contains the INCLUDE  statement
		resides.

	      · Quotation  mark  character  A quotation mark (") character is
		recognized as starting an octal constant ("0..7) instead of a
		character literal ("...").

	      · Deleted records in relative files When a record in a relative
		file is deleted, the first byte of that record is  set	to  a
		known  character  (currently  '@'  ).  Attempts  to read that
		record later result in ATTACCNON  errors.  The	rest  of  the
		record	(the whole record, if vms is not specified) is set to
		nulls for unformatted files and spaces for formatted files.

	      · ENDFILE records When an ENDFILE is performed on a  sequential
		unit,  an actual 1-byte record containing a Ctrl/Z is written
		to the file. If vms is not  specified,	an  internal  ENDFILE
		flag  is  set  and the file is truncated. The vms option does
		not  affect  ENDFILE  on  relative  files:  these  files  are
		truncated.

	      · Implied  logical  unit	numbers The vms option enables Intel®
		Fortran to recognize certain  environment  variables  at  run
		time  for ACCEPT, PRINT, and TYPE statements and for READ and
		WRITE statements that do not specify a unit number  (such  as
		READ (*,1000)).

	      · Treatment  of  blanks  in  input  The  vms  option causes the
		defaults for the keyword BLANK in OPEN statements  to  become
		'NULL'	for  an explicit OPEN and 'ZERO' for an implicit OPEN
		of an external or internal file.

	      · OPEN statement effects Carriage control defaults  to  FORTRAN
		if  the  file  is  formatted,  and the unit is connected to a
		terminal. Otherwise, carriage control defaults to  LIST.  The
		vms  option  affects  the record length for direct access and
		relative organization files. The buffer size is increased  by
		1 to accommodate the deleted record character.

	      · Reading  deleted  records  and	ENDFILE  records The run-time
		direct access READ routine  checks  the  first	byte  of  the
		retrieved  record. If this byte is '@' or NULL (" "), then an
		ATTACCNON error is returned. The run-time  sequential  access
		READ  routine checks to see if the record it just read is one
		byte long and contains a Ctrl/Z. If this is true, it  returns
		EOF.

	      Alternate Options:

	      Linux and Mac OS X: None

       -Wa,option1[,option2,...]

	      Passes options to the assembler for processing.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      option		Is  an	assembler  option. This option is not
				processed  by  the  driver  and  is  directly
				passed to the assembler.

	      Default:

	      OFF		No options are passed to the assembler.

	      Description:

	      This  option  passes  one  or more options to the assembler for
	      processing. If the assembler is not invoked, these options  are
	      ignored.

	      Alternate Options:

	      None

       -warn [keyword]

       -nowarn

	      Specifies diagnostic messages to be issued by the compiler.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Specifies   the  diagnostic  messages  to  be
				issued. Possible values are:

				none	       Disables all warning messages.

				[no]alignments Determines  whether   warnings
					       occur  for  data  that  is not
					       naturally aligned.

				[no]declarations
					       Determines  whether   warnings
					       occur   for   any   undeclared
					       names.

				[no]errors     Determines  whether   warnings
					       are changed to errors.

				[no]general    Determines   whether   warning
					       messages   and	informational
					       messages  are  issued  by  the
					       compiler.

				[no]ignore_loc Determines  whether   warnings
					       occur  when  %LOC  is stripped
					       from an actual argument.

				[no]interfaces Determines     whether	  the
					       compiler checks the interfaces
					       of all SUBROUTINEs called  and
					       FUNCTIONs   invoked   in  your
					       compilation     against	   an
					       external   set	of  interface
					       blocks.

				[no]stderrors  Determines  whether   warnings
					       about	 Fortran     standard
					       violations  are	 changed   to
					       errors.

				[no]truncated_source
					       Determines   whether  warnings
					       occur when source exceeds  the
					       maximum	  column   width   in
					       fixed-format files.

				[no]uncalled   Determines  whether   warnings
					       occur	when	a   statement
					       function is never called

				[no]unused     Determines  whether   warnings
					       occur  for  declared variables
					       that are never used.

				[no]usage      Determines  whether   warnings
					       occur	 for	 questionable
					       programming practices.

				all	       Enables all  warning  messages
					       except errors and stderrors.

	      Default:

	      alignments	Warnings  are  issued  about data that is not
				naturally aligned.

	      general		All   information-level   and	warning-level
				messages are enabled.

	      usage		Warnings    are   issued   for	 questionable
				programming practices.

	      nodeclarations	No warnings are issued for undeclared names.

	      noerrors		Warning-level messages	are  not  changed  to
				error-level messages.

	      noignore_loc	No  warnings are issued when %LOC is stripped
				from an argument.

	      nointerfaces	The compiler does  not	check  interfaces  of
				SUBROUTINEs  called  and FUNCTIONs invoked in
				your compilation against an external  set  of
				interface blocks.

	      nostderrors	Warning-level	 messages    about    Fortran
				standards  violations  are  not  changed   to
				error-level messages.

	      notruncated_source
				No  warnings  are  issued when source exceeds
				the  maximum  column  width  in  fixed-format
				files.

	      nouncalled	No  warnings  are  issued  when  a  statement
				function is not called.

	      nounused		No warnings are issued for variables that are
				declared but never used.

	      Description:

	      This  option  specifies the diagnostic messages to be issued by
	      the compiler.

	      Option		Description

	      warn none 	Disables all warning messages.	This  is  the
				same as specifying nowarn.

	      warn noalignments Disables  warnings  about  data  that  is not
				naturally aligned.

	      warn declarations Enables warnings about any undeclared  names.
				The  compiler  will  use the default implicit
				data typing rules for such undeclared  names.
				The  IMPLICIT  and  IMPLICIT  NONE statements
				override this option.

	      warn errors	Tells	the   compiler	  to	change	  all
				warning-level	 messages    to   error-level
				messages;  this   includes   warnings	about
				Fortran standards violations.

	      warn nogeneral	Disables    all    informational-level	  and
				warning-level diagnostic messages.

	      warn ignore_loc	Enables warnings when %LOC is  stripped  from
				an actual argument.

	      warn interfaces	Tells the compiler to check the interfaces of
				all SUBROUTINEs called and FUNCTIONs  invoked
				in   your   compilation   against  a  set  of
				interface blocks stored separately  from  the
				source being compiled.

	      The  compiler generates a compile-time message if the interface
	      used to invoke a routine does not match the  interface  defined
	      in  a  .mod  file  external  to  the source (that is, in a .mod
	      generated by option gen-interfaces as opposed to	a  .mod  file
	      USEd  in the source). The compiler looks for these .mods in the
	      current directory or in the directory specified by the  include
	      (-I)  or	-module  option.  If interface mismatches occur, some
	      will result in a compile-time error,
				others will only generate a warning.

	      By default, warn interfaces turns on option gen-interfaces. You
	      can   turn   off	 that	option	 by   explicitly   specifying
	      /gen-interfaces- (Windows OS) or -no-gen-interfaces  (Linux  OS
	      and Mac OS X).

	      warn stderrors	Tells	 the	compiler    to	 change   all
				warning-level	 messages    about    Fortran
				standards violations to error-level messages.
				This option sets the  std03  option  (Fortran
				2003   standard).  If  you  want  Fortran  95
				standards violations to  become  errors,  you
				must   specify	options  warn  stderrors  and
				std95.

	      warn truncated_source
				Enables warnings when a source	line  exceeds
				the  maximum  column  width  in  fixed-format
				source files. The maximum  column  width  for
				fixed-format   files   is  72,	80,  or  132,
				depending on the setting of the extend-source
				option.  The warn truncated_source option has
				no effect on truncation;  lines  that  exceed
				the   maximum	column	 width	 are   always
				truncated. This  option  does  not  apply  to
				free-format source files.

	      warn uncalled	Enables warnings when a statement function is
				never called.

	      warn unused	Enables  warnings  for	variables  that   are
				declared but never used.

	      warn nousage	Disables    warnings	about	 questionable
				programming	 practices.	 Questionable
				programming   practices,   although  allowed,
				often are the result of  programming  errors;
				for   example:	 a   continued	character  or
				Hollerith  literal  whose  first  part	 ends
				before the statement field and appears to end
				with   trailing   spaces.   Note   that   the
				/pad-source option can prevent this error.

	      warn all		This  is  the  same  as specifying warn. This
				option does not set options  warn  errors  or
				warn  stderrors. To enable all the additional
				checking  to  be  performed  and  force   the
				severity  of  the  diagnostic  messages to be
				severe enough to not generate an object file,
				specify  warn  allwarn errors or warn allwarn
				stderrors.

	      On Windows systems: In the Property Pages,  Custom  means  that
	      diagnostics will be specified on an individual basis.

	      Alternate Options:

	      warn none 	Linux  and  Mac OS X: -nowarn, -w, -W0, -warn
				nogeneral

	      warn declarations Linux and Mac OS X: -implicitnone, -u

	      warn nodeclarations
				Linux and Mac OS X: None

	      warn general	Linux and Mac OS X: -W1

	      warn nogeneral	Linux and Mac OS X: -W0, -w,  -nowarn,	-warn
				none

	      warn stderrors	Linux and Mac OS X: -e90, -e95, -e03

	      warn nousage	Linux	and   Mac  OS  X:  -cm	 (this	is  a
				deprecated option)

	      warn all		Linux and Mac OS X: -warn

       -watch [keyword]

       -nowatch

	      Tells the  compiler  to  display	certain  information  to  the
	      console output window.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      keyword		Determines  what  information  is  displayed.
				Possible values are:

				none	       Disables cmd and source.

				[no]cmd        Determines whether driver tool
					       commands   are  displayed  and
					       executed.

				[no]source     Determines whether the name of
					       the  file  being  compiled  is
					       displayed.

				all	       Enables cmd and source.

	      Default:

	      nowatch		Pass information and source  file  names  are
				not displayed to the console output window.

	      Description:

	      Tells  the  compiler  to	display  processing information (pass
	      information and  source  file  names)  to  the  console  output
	      window.

	      Option		Description

	      watch none	Tells	the  compiler  to  not	display  pass
				information and  source  file  names  to  the
				console  output  window.  This is the same as
				specifying nowatch.

	      watch cmd 	Tells the compiler  to	display  and  execute
				driver tool commands.

	      watch source	Tells the compiler to display the name of the
				file being compiled.

	      watch all 	Tells	the   compiler	 to   display	 pass
				information  and  source  file	names  to the
				console output window. This is	the  same  as
				specifying watch with no keyword.

	      Alternate Options:

	      watch cmd 	Linux and Mac OS X: -v

       -WB

	      Turns a compile-time bounds check into a warning.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Compile-time bounds checks are errors.

	      Description:

	      This option turns a compile-time bounds check into a warning.

	      Alternate Options:

	      None

       -what

	      Tells the compiler to display its detailed version string.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		The version strings are not displayed.

	      Description:

	      This  option tells the compiler to display its detailed version
	      string.

	      Alternate Options:

	      None

       -Winline

	      Enables diagnostics about what  is  inlined  and	what  is  not
	      inlined.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		No  diagnostics  are  produced	about what is
				inlined and what is not inlined.

	      Description:

	      This option enables diagnostics about what is inlined and  what
	      is  not inlined. The diagnostics depend on what interprocedural
	      functionality is available.

	      Alternate Options:

	      None

       -Wl,option1[,option2,...]

	      Passes options to the linker for processing.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      option		Is  a  linker  option.	This  option  is  not
				processed  by  the  driver  and  is  directly
				passed to the linker.

	      Default:

	      OFF		No options are passed to the linker.

	      Description:

	      This option passes one  or  more	options  to  the  linker  for
	      processing.  If  the  linker  is not invoked, these options are
	      ignored.

	      This   option    is    equivalent    to	 specifying    option
	      -Qoption,link,options.

	      Alternate Options:

	      None

       -Wp,option1[,option2,...]

	      Passes options to the preprocessor.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      option		Is  a preprocessor option. This option is not
				processed  by  the  driver  and  is  directly
				passed to the preprocessor.

	      Default:

	      OFF		No options are passed to the preprocessor.

	      Description:

	      This  option passes one or more options to the preprocessor. If
	      the preprocessor is not invoked, these options are ignored.

	      This option is equivalent to  specifying	option	-Qoption,fpp,
	      options.

	      Alternate Options:

	      None

       -xcode

	      Tells  the  compiler to generate optimized code specialized for
	      the Intel processor that executes your program.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      code		Indicates the instructions and	optimizations
				to  be generated for the set of processors in
				each  description.  Many  of  the   following
				descriptions  refer  to Intel® Streaming SIMD
				Extensions  (Intel®  SSE)  and	 Supplemental
				Streaming   SIMD  Extensions  (Intel®  SSSE).
				Possible values are:

				CORE-AVX2      May generate  Intel®  Advanced
					       Vector  Extensions  2  (Intel®
					       AVX2),  Intel®  AVX,   SSE4.2,
					       SSE4.1, SSSE3, SSE3, SSE2, and
					       SSE  instructions  for  Intel®
					       processors.   Optimizes	for a
					       future Intel processor.

				CORE-AVX-I     May generate  Intel®  Advanced
					       Vector	 Extensions   (Intel®
					       AVX),  including  instructions
					       in  Intel®  Core 2™ processors
					       in process technology  smaller
					       than   32nm,   Intel®  SSE4.2,
					       SSE4.1, SSSE3, SSE3, SSE2, and
					       SSE  instructions  for  Intel®
					       processors.  Optimizes  for  a
					       future Intel processor.

				AVX	       May  generate  Intel® Advanced
					       Vector	Extensions    (Intel®
					       AVX),  Intel®  SSE4.2, SSE4.1,
					       SSSE3,  SSE3,  SSE2,  and  SSE
					       instructions	for    Intel®
					       processors.  Optimizes  for  a
					       future Intel processor.

				SSE4.2	       May   generate	Intel®	 SSE4
					       Efficient  Accelerated  String
					       and	 Text	   Processing
					       instructions   supported    by
					       Intel®  Core™  i7  processors.
					       May   generate	Intel®	 SSE4
					       Vectorizing Compiler and Media
					       Accelerator,   Intel®   SSSE3,
					       SSE3,	 SSE2,	   and	  SSE
					       instructions   and   it	  may
					       optimize  for the Intel® Core™
					       processor family.

				SSE4.1	       May   generate	Intel®	 SSE4
					       Vectorizing Compiler and Media
					       Accelerator  instructions  for
					       Intel	 processors.	  May
					       generate Intel®	SSSE3,	SSE3,
					       SSE2, and SSE instructions and
					       it  may	optimize  for  Intel®
					       45nm   Hi-k   next  generation
					       Intel®			Core™
					       microarchitecture.	 This
					       replaces  value	S,  which  is
					       deprecated.

				SSE3_ATOM      This    option	 setting   is
					       deprecated. It  has  the  same
					       effect	   as	   specifying
					       SSSE3_ATOM.

				SSSE3_ATOM     May	 generate	MOVBE
					       instructions	for	Intel
					       processors, depending  on  the
					       setting	      of       option
					       -minstruction (Linux  and  Mac
					       OS)	or	/Qinstruction
					       (Windows). May  also  generate
					       Intel®  SSSE3, SSE3, SSE2, and
					       SSE  instructions  for	Intel
					       processors.  Optimizes for the
					       Intel®  Atom™  processor   and
					       Intel®	  Centrino®	Atom™
					       Processor Technology.

				SSSE3	       May  generate  Intel®   SSSE3,
					       SSE3,	 SSE2,	   and	  SSE
					       instructions	for	Intel
					       processors.  Optimizes for the
					       Intel®			Core™
					       microarchitecture.    For  Mac
					       OS* X systems, this  value  is
					       only  supported	on  Intel® 64
					       architecture.   This  replaces
					       value T, which is deprecated.

				SSE3	       May   generate	Intel®	SSE3,
					       SSE2, and SSE instructions for
					       Intel  processors.   Optimizes
					       for the	enhanced  Pentium®  M
					       processor    microarchitecture
					       and	Intel	    NetBurst®
					       microarchitecture. For Mac OS*
					       X systems, this value is  only
					       supported       on	IA-32
					       architecture.This     replaces
					       value P, which is deprecated.

				SSE2	       May  generate  Intel® SSE2 and
					       SSE  instructions  for	Intel
					       processors.  Optimizes for the
					       Intel		    NetBurst®
					       microarchitecture.  This value
					       is not available on Mac OS*  X
					       systems.   This replaces value
					       N, which is deprecated.

				You  can  also	 specify   Host.   For	 more
				information,  see  option  -xHost (Linux* and
				Mac OS* X) or /QxHost (Windows*).

	      Default:

	      Windows* systems: None Linux* systems: None Mac OS*  X  systems
	      using  IA-32  architecture: SSE3 Mac OS* X systems using Intel®
	      64 architecture: SSSE3
				On Windows systems, if neither /Qx nor	/arch
				is specified, the default is /arch:SSE2.

				On  Linux  systems,  if  neither -x nor -m is
				specified, the default is -msse2.

	      Description:

	      This option tells  the  compiler	to  generate  optimized  code
	      specialized for the Intel processor that executes your program.
	      It  also	 enables   optimizations   in	addition   to	Intel
	      processor-specific    optimizations.   The   specialized	 code
	      generated by this option may run only  on  a  subset  of	Intel
	      processors.

	      The resulting executables from these processor-specific options
	      can only be run on the specified or later Intel® processors, as
	      they incorporate optimizations specific to those processors and
	      use a specific version of the Intel® Streaming SIMD  Extensions
	      (Intel® SSE) instruction set.

	      The  binaries  produced  by these code values will run on Intel
	      processors that support all of the features  for	the  targeted
	      processor.

	      Do  not use code values to create binaries that will execute on
	      a processor that is not compatible with the targeted processor.
	      The  resulting  program  may  fail  with an illegal instruction
	      exception or display other unexpected behavior.

	      Compiling the main program with any of the code values produces
	      binaries	that  display  a  fatal  run-time  error  if they are
	      executed on unsupported  processors,  including  all  non-Intel
	      processors. .

	      Compiler options m and arch produce binaries that should run on
	      processors  not  made  by  Intel	that   implement   the	 same
	      capabilities as the corresponding Intel processors.

	      Previous	value O is deprecated and has been replaced by option
	      -msse3 (Linux and Mac OS X) and option /arch:SSE3 (Windows).

	      Previous values  W  and  K  are  deprecated.   The  details  on
	      replacements are as follows:

	      · Mac  OS  X  systems:  On  these  systems,  there  is no exact
		replacement for W or K. You can upgrade to the default option
		-msse3	(IA-32	architecture)  or  option  -mssse3 (Intel® 64
		architecture).

	      · Windows and Linux systems: The replacement for	W  is  -msse2
		(Linux)   or   /arch:SSE2   (Windows).	 There	is  no	exact
		replacement for K.  However,  on  Windows  systems,  /QxK  is
		interpreted   as   /arch:IA32;	 on  Linux  systems,  -xK  is
		interpreted as -mia32. You can also do one of the following:

		· Upgrade to  option  -msse2  (Linux)  or  option  /arch:SSE2
		  (Windows).   This  will  produce  one  code  path  that  is
		  specialized for Intel® SSE2. It will	not  run  on  earlier
		  processors

		· Specify  the	two option combination -mia32 -axSSE2 (Linux)
		  or /arch:IA32 /QaxSSE2  (Windows).  This  combination  will
		  produce an executable that runs on any processor with IA-32
		  architecture but with an additional specialized Intel® SSE2
		  code path.

	      The  -x  and  /Qx  options  enable additional optimizations not
	      enabled with options -m or /arch	(nor  with  options  –ax  and
	      /Qax).

	      On  Windows*  systems,  options  /Qx  and  /arch	are  mutually
	      exclusive.  If both are specified, the compiler uses  the  last
	      one specified and generates a warning. Similarly, on Linux* and
	      Mac OS* X systems, options -x and -m are mutually exclusive. If
	      both  are  specified,  the compiler uses the last one specified
	      and generates a warning.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's compilers may or may not optimize to  the  same  degree
	      for  non-Intel  microprocessors  for optimizations that are not
	      unique to Intel microprocessors.	These  optimizations  include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel does not guarantee the  availability,  functionality,  or
	      effectiveness   of  any  optimization  on  microprocessors  not
	      manufactured by Intel.  Microprocessor-dependent	optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors. Certain optimizations not  specific  to	Intel
	      microarchitecture   are  reserved  for  Intel  microprocessors.
	      Please refer to  the  applicable	product  User  and  Reference
	      Guides  for more information regarding the specific instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -X

	      Removes standard directories from the include file search path.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      OFF		Standard directories are in the include  file
				search path.

	      Description:

	      This  option removes standard directories from the include file
	      search path.  It	prevents  the  compiler  from  searching  the
	      default path specified by the CPATH environment variable.

	      On  Linux  and  Mac OS X systems, specifying -X (or -noinclude)
	      prevents the compiler from searching in /usr/include for	files
	      specified in an INCLUDE statement.

	      You  can	use  this  option  with  the  I option to prevent the
	      compiler from searching the default path for include files  and
	      direct it to use an alternate path.

	      This  option  affects  fpp  preprocessor	behavior  and the USE
	      statement.

	      Alternate Options:

	      Linux and Mac OS X: -nostdinc

       -xHost

	      Tells the compiler to generate  instructions  for  the  highest
	      instruction set
		     available on the compilation host processor.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      Windows*	systems:  None Linux* systems: None Mac OS* X systems
	      using IA-32 architecture: -xSSE3 Mac OS* X systems using Intel®
	      64 architecture: -xSSSE3
				On  Windows systems, if neither /Qx nor /arch
				is specified, the default is /arch:SSE2.

				On Linux systems, if neither  -x  nor  -m  is
				specified, the default is -msse2.

	      Description:

	      This option tells the compiler to generate instructions for the
	      highest instruction  set	available  on  the  compilation  host
	      processor.

	      The  instructions  generated  by	this  compiler	option differ
	      depending on the compilation host processor.

	      The following table describes the effects  of  specifying   the
	      -xHost  (Linux* and Mac OS* X) or /QxHost (Windows*) option and
	      it  tells  whether  the  resulting  executable  will   run   on
	      processors different from the host processor.

	      Descriptions  in	the  table  refer  to  Intel® Advanced Vector
	      Extensions  (Intel®  AVX),  Intel®  Streaming  SIMD  Extensions
	      (Intel® SSE), and Intel® Supplemental Streaming SIMD Extensions
	      (Intel® SSSE).

	      Instruction Set of Host Processor
				Effects When the -xHost or  /QxHost  Compiler
				Option is Specified

	      Intel® AVX2	When compiling on Intel® Processors:

	      Corresponds  to  option  -xCORE-AVX2  (Linux* and Mac OS* X) or
	      /QxCORE-AVX2 (Windows*). The generated executable will not  run
	      on   non-Intel  processors  and  it  will  not  run  on  Intel®
	      processors that do not support Intel® AVX2 instructions.

	      When compiling on non-Intel Processors:

	      Corresponds to option -march=core-avx2 (Linux and Mac OS X)  or
	      /arch:CORE-AVX2 (Windows). The
				generated   executable	will  run  on  Intel®
				processors  and  non-Intel  processors	 that
				support  at  least  Intel® AVX2 instructions.
				You may see a run-time error if the  run-time
				processor   does   not	support  Intel®  AVX2
				instructions.

	      Intel® AVX	When compiling on Intel® Processors:

	      Corresponds to option -xAVX (Linux* and Mac OS*  X)  or  /QxAVX
	      (Windows*).  The generated executable will not run on non-Intel
	      processors and it will not run on Intel® processors that do not
	      support Intel® AVX instructions.

	      When compiling on non-Intel Processors:

	      Corresponds  to  option -mavx (Linux and Mac OS X) or /arch:AVX
	      (Windows). The
				generated  executable  will  run  on   Intel®
				processors   and  non-Intel  processors  that
				support at  least  Intel®  AVX	instructions.
				You  may see a run-time error if the run-time
				processor  does  not   support	 Intel®   AVX
				instructions.

	      Intel® SSE4.2	When compiling on Intel® Processors:

	      Corresponds  to  option  -xSSE4.2  (Linux*  and  Mac  OS* X) or
	      /QxSSE4.2
				(Windows*). The generated executable will not
				run  on  non-Intel processors and it will not
				run on Intel® processors that do not  support
				Intel® SSE4.2 instructions.

	      When compiling on non-Intel Processors:

	      Corresponds  to  option  -msse4.2  (Linux  and  Mac  OS  X)  or
	      /arch:SSE4.2
				(Windows). The generated executable will  run
				on Intel® processors and non-Intel processors
				that   support	 at   least   Intel®   SSE4.2
				instructions. You may see a run-time error if
				the  run-time  processor  does	not   support
				Intel® SSE4.2 instructions.

	      Intel® SSE4.1	When compiling on Intel® Processors:

	      Corresponds  to  option  -xSSE4.1  (Linux*  and  Mac  OS* X) or
	      /QxSSE4.1
				(Windows*). The generated executable will not
				run  on  non-Intel processors and it will not
				run on Intel® processors that do not  support
				Intel® SSE4.1 instructions.

	      When compiling on non-Intel Processors:

	      Corresponds  to  option  -msse4.1  (Linux  and  Mac  OS  X)  or
	      /arch:SSE4.1
				(Windows). The generated executable will  run
				on Intel® processors and non-Intel processors
				that   support	 at   least   Intel®   SSE4.1
				instructions. You may see a run-time error if
				the  run-time  processor  does	not   support
				Intel® SSE4.1 instructions.

	      Intel® SSSE3	When compiling on Intel® Processors:

	      Corresponds  to  option  -xSSSE3	(Linux*  and  Mac  OS*	X) or
	      /QxSSSE3
				(Windows*). The generated executable will not
				run  on  non-Intel processors and it will not
				run on Intel® processors that do not  support
				Intel® SSSE3 instructions.

	      When compiling on non-Intel Processors:

	      Corresponds   to	option	-mssse3  (Linux  and  Mac  OS  X)  or
	      /arch:SSSE3
				(Windows). The generated  executable will run
				on Intel® processors and non-Intel processors
				that   support	 at   least   Intel®	SSSE3
				instructions. You may see a run-time error if
				the  run-time  processor  does	not   support
				Intel® SSSE3 instructions.

	      Intel® SSE3	When compiling on Intel® Processors:

	      Corresponds to option -xSSE3 (Linux* and Mac OS* X) or /QxSSE3
				(Windows*). The generated executable will not
				run on non-Intel processors and it  will  not
				run  on Intel® processors that do not support
				Intel® SSE3 instructions.

	      When compiling on non-Intel Processors:

	      Corresponds to option -msse3 (Linux and Mac OS X) or /arch:SSE3
				(Windows). The generated executable will  run
				on Intel® processors and non-Intel processors
				that   support	 at   least    Intel®	 SSE3
				instructions.  You may see a warning run-time
				error if  the  run-time  processor  does  not
				support Intel® SSE3 instructions.

	      Intel® SSE2	When   compiling   on  Intel®  Processors  or
				non-Intel Processors:

	      Corresponds  to  option  -msse2  (Linux*	and  Mac  OS*  X)  or
	      /arch:SSE2
				(Windows*). The generated executable will run
				on Intel® processors and non-Intel processors
				that	support    at	least	Intel®	 SSE2
				instructions. You may see a run-time error if
				the   run-time	processor  does  not  support
				Intel® SSE2 instructions.

	      For more information on other settings for  option  -x  (Linux*
	      and Mac OS* X) and /Qx (Windows*), see that option description.

	      Optimization Notice

	      = = = = = = = = = =

	      Intel's  compilers  may  or may not optimize to the same degree
	      for non-Intel microprocessors for optimizations  that  are  not
	      unique  to  Intel  microprocessors. These optimizations include
	      SSE2, SSE3, and SSSE3 instruction sets and other optimizations.
	      Intel  does  not	guarantee the availability, functionality, or
	      effectiveness  of  any  optimization  on	microprocessors   not
	      manufactured  by	Intel. Microprocessor-dependent optimizations
	      in   this   product   are   intended   for   use	 with	Intel
	      microprocessors.	Certain  optimizations	not specific to Intel
	      microarchitecture  are  reserved	for  Intel   microprocessors.
	      Please  refer  to  the  applicable  product  User and Reference
	      Guides for more information regarding the specific  instruction
	      sets covered by this notice.

	      Notice revision #20110804

	      = = = = = = = = = =

	      Alternate Options:

	      None

       -Xlinker option

	      Passes a linker option directly to the linker.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      option		Is a linker option.

	      Default:

	      OFF		No options are passed directly to the linker.

	      Description:

	      This  option passes a linker option directly to the linker.  If
	      -Xlinker -shared is specified, only -shared is  passed  to  the
	      linker and no special work is done to ensure proper linkage for
	      generating  a  shared  object.  -Xlinker	just  takes  whatever
	      arguments are supplied and passes them directly to the linker.

	      If you want to pass compound options to the linker, for example
	      "-L $HOME/lib", you must use the following method:

	      -Xlinker -L -Xlinker $HOME/lib

	      Alternate Options:

	      None

       -zero

       -nozero

	      Initializes to zero all local  scalar  variables	of  intrinsic
	      type  INTEGER, REAL, COMPLEX, or LOGICAL that are saved but not
	      yet initialized.

	      Architectures: IA-32, Intel® 64 architectures

	      Arguments:

	      None

	      Default:

	      -nozero		Local scalar variables are not initialized to
				zero.

	      Description:

	      This  option  initializes to zero all local scalar variables of
	      intrinsic type INTEGER, REAL,  COMPLEX,  or  LOGICAL  that  are
	      saved but not yet initialized.

	      Use  -save  (Linux  and  Mac  OS	X) or /Qsave (Windows) on the
	      command line to make all local variables specifically marked as
	      SAVE.

	      Alternate Options:

	      None

PREDEFINED SYMBOLS
       The   Intel(R)	Fortran   documentation   describes   the  predefined
       preprocessor symbols in detail. This section provides a brief  summary
       of the supported symbols.

       You  can  use  the  -U option to suppress an automatic definition of a
       preprocessor symbol. This  option  suppresses  any  symbol  definition
       currently  in  effect for the specified name. This option performs the
       same function as an #undef preprocessor directive.

       The following preprocessor symbols are available:

       Linux* OS/Mac OS* X Symbol Name
			 Description

       __INTEL_COMPILER=n
			 Identifies the Intel Fortran Compiler

       Default: On, n=1200

       __INTEL_COMPILER_BUILD_DATE

       =YYYYMMDD	 Identifies the Intel Fortran Compiler build date

       __linux__ (Linux only)

       __linux (Linux only)

       __gnu_linux__ (Linux only)

       linux (Linux only)

       __unix__ (Linux only)

       __unix (Linux only)

       unix (Linux only)

       __ELF__ (Linux only)
			 Defined at the start of compilation

       __APPLE__ (Mac OS X only)

       __MACH__ (Mac OS X only)
			 Defined at the start of compilation

       Architecture: IA-32 only

       __i386__

       __i386

       i386		 Identifies the architecture for the target  hardware
			 for which programs are being compiled

       Architecture: IA-32 only

       __x86_64

       __x86_64__	 Identifies  the architecture for the target hardware
			 for which programs are being compiled.

       Architecture: Intel® 64
			 only

       _OPENMP=n	 Takes the  form YYYYMM, where YYYY is the  year  and
			 MM  is the month of the OpenMP Fortran specification
			 supported. This preprocessor symbol can be  used  in
			 both	fpp  and  the  Fortran	compiler  conditional
			 compilation. It is available only  when  -openmp  is
			 specified.

       Default: n=200805

       _PGO_INSTRUMENT	 Defined when -prof-gen is specified.

       Default: OFF

       __PIC__

       __pic__		 Set  if  the  code  was  requested to be compiled as
			 position  independent	code.  On  Mac	OS  X,	these
			 symbols are always set.

       Default: Off for Linux OS; On for Mac OS X

ENVIRONMENT VARIABLES
       You  can customize your environment by using run-time and compile-time
       environment  variables,	or  by	using  OpenMP	or   Profile   Guided
       Optimization (PGO) environment variables.

       The  following table shows the compile-time environment variables that
       affect the Intel® Fortran Compiler:

       Compile-Time Environment Variable
			 Description

       IFORTCFG 	 Specifies a configuration  file  that	the  compiler
			 should  use  instead  of  the	default configuration
			 file.

       By  default,  the  compiler  uses  the  default	 configuration	 file
       (ifort.cfg)  from  the  same  directory	where the compiler executable
       resides.

       NOTE: On Windows* operating systems, this environment variable  cannot
       be set from the IDE.

       INTEL_LICENSE_FILE
			 Specifies the location of the product license file.

       PATH		 Specifies   the  directory  path  for	the  compiler
			 executable files.

       TMP, TMPDIR, TEMP Specifies the directory in which to store  temporary
			 files.  See  Temporary Files Created by the Compiler
			 or Linker.

       NOTE: On Windows operating systems, this environment  variable  cannot
       be set from the IDE.

       CPATH

       (Linux* OS and Mac OS* X)
			 Specifies the path for include and module files.

       GCCROOT

       (Linux OS and Mac OS X)
			 Specifies the location of the gcc binaries. Set this
			 variable only when the compiler  cannot  locate  the
			 gcc binaries when using the -gcc-name option.

       GXX_INCLUDE

       (Linux OS and Mac OS X)
			 Specifies  the location of the gcc headers. Set this
			 variable  to  specify	the  locations	of  the   GCC
			 installed  files when the compiler does not find the
			 needed  values  as   specified   by   the   use   of
			 -gcc-name=directory-name/gcc.

       GXX_ROOT

       (Linux OS and Mac OS X)
			 Specifies the location of the gcc binaries. Set this
			 variable  to  specify	the  locations	of  the   GCC
			 installed  files when the compiler does not find the
			 needed  values  as   specified   by   the   use   of
			 -gcc-name=directory-name/gcc.

       LIBRARY_PATH

       (Linux OS and Mac OS X)
			 Specifies  the  path for libraries to be used during
			 the link phase.

       LD_LIBRARY_PATH (Linux OS)

       Specifies the path for shared (.so) library files.

       DYLD_LIBRARY_PATH (Mac OS X)
			 Specifies the path for dynamic libraries.

       INCLUDE (Windows OS)
			 Specifies the directory path for the  include	files
			 (files  included  by  an INCLUDE statement, #include
			 files, RC INCLUDE files, and module files referenced
			 by a USE statement).

       LIB (Windows OS)  Specifies  the  directory  path  for  .LIB (library)
			 files,  which	the  linker  links  in.  If  the  LIB
			 environment  variable	is  not set, the linker looks
			 for .LIB files in the current directory.

       The following table summarizes Compiler environment variables that are
       recognized at run time

       Run-Time Environment Variable
			 Description

       decfort_dump_flag If  this variable is set to Y or y, a core dump will
			 be taken when	any  severe  Intel  Fortran  run-time
			 error occurs.

       F_UFMTENDIAN	 This  variable specifies the numbers of the units to
			 be used for  little-endian-to-big-endian  conversion
			 purposes.   See  Environment  Variable  F_UFMTENDIAN
			 Method.

       This variable specifies the numbers of the units to  have  a  specific
       record terminator. See Record Types.

       FOR_COARRAY_CONFIG_FILE
			 (Windows*  OS and Linux* OS) This variable specifies
			 the coarray configuration file and path to  be  used
			 at  execution	time.  It overrides, at runtime,  the
			 value specified by  the  /Qcoarray-config-file:value
			 (Windows*  OS) or -coarray-config-file=value (Linux*
			 OS) qualifier.

       FOR_COARRAY_NUM_IMAGES
			 (Windows* OS and Linux* OS) This variable  specifies
			 the  number  of  images  created  for	coarrays.  It
			 overrides, at runtime, the value  specified  by  the
			 /Qcoarray-num-images:value    (Windows*    OS)    or
			 -coarray-num-images=value qualifier.

       FOR_FMT_TERMINATOR
			 This variable specifies the numbers of the units  to
			 have a specific record terminator. See Record Types.

       FOR_ACCEPT	 The  ACCEPT  statement  does not include an explicit
			 logical unit number. Instead, it  uses  an  implicit
			 internal  logical  unit  number  and  the FOR_ACCEPT
			 environment variable. If FOR_ACCEPT is not  defined,
			 the code ACCEPT f,iolist reads from CONIN$ (standard
			 input). If FOR_ACCEPT is defined  (as	a  file  name
			 optionally  containing  a  path), the specified file
			 would be read.

       FOR_DEBUGGER_IS_PRESENT
			 This variable tells  the  Fortran  run-time  library
			 that  your program is executing under a debugger. If
			 set to True, it generates debug exceptions  whenever
			 severe  or  continuous  errors  are  detected. Under
			 normal  conditions  you  don't  need  to  set	 this
			 variable on Windows systems, as this information can
			 be extracted from the operating system. On Linux* OS
			 and Mac OS* X, you will need to set this variable if
			 you want debug exceptions. Setting this variable  to
			 True  when  your  program  is	not executing under a
			 debugger will cause unpredictable behavior.

       FOR_DEFAULT_PRINT_DEVICE (Windows* OS only)
			 This variable lets  you  specify  the	print  device
			 other	than  the default print device PRN (LPT1) for
			 files	 closed   (CLOSE    statement)	  with	  the
			 DISPOSE='PRINT'  specifier.  To  specify a different
			 print device for the file associated with the	CLOSE
			 statement     DISPOSE='PRINT'	   specifier,	  set
			 FOR_DEFAULT_PRINT_DEVICE  to  any  legal  DOS	print
			 device before executing the program.

       FOR_DIAGNOSTIC_LOG_FILE
			 If  this  variable  is  set  to  the name of a file,
			 diagnostic output is written to the specified file.

       The Fortran run-time system attempts to open that file (append output)
       and write the error information (ASCII text) to the file.

       The    setting	 of   FOR_DIAGNOSTIC_LOG_FILE	is   independent   of
       FOR_DISABLE_DIAGNOSTIC_DISPLAY, so you can disable the screen  display
       of  information but still capture the error information in a file. The
       text string you assign for the file name is  used  literally,  so  you
       must  specify  the  full  name.	If  the  file open fails, no error is
       reported and the run-time system continues diagnostic processing.

       See also Locating Run-Time Errors and Using Traceback Information.

       FOR_DISABLE_DIAGNOSTIC_DISPLAY
			 This variable disables  the  display  of  all	error
			 information.  This  variable is  helpful if you just
			 want to test the error status of your program and do
			 not  want the Fortran run-time system to display any
			 information about an abnormal program termination.

       See also Using Traceback Information.

       FOR_DISABLE_STACK_TRACE
			 Specifies that the call stack trace information that
			 typically follows the displayed severe error message
			 text should be disabled.

       The Fortran  run-time  error  message  is  displayed  whether  or  not
       FOR_DISABLE_STACK_TRACE	is  set  to true. If the program is executing
       under a debugger, the automatic output of the stack trace  information
       by  the	Fortran  library will be disabled to reduce noise. You should
       use the debugger's stack trace facility if you want to view the	stack
       trace.

       See also Locating Run-Time Errors and Using Traceback Information.

       FOR_IGNORE_EXCEPTIONS
			 Specifies  that default run-time exception handling,
			 for example, to allow just-in-time debugging, should
			 be  disabled.	The run-time system exception handler
			 returns EXCEPTION_CONTINUE_SEARCH to  the  operating
			 system,  which  looks	for other handlers to service
			 the exception.

       FOR_NOERROR_DIALOGS
			 Specifies that  the display of dialog	boxes  should
			 be disabled when certain exceptions or errors occur.
			 This is useful when running many  test  programs  in
			 batch	mode  to  prevent  a  failure  from  stopping
			 execution of the entire test stream.

       FOR_PRINT	 Neither the PRINT statement nor  a  WRITE  statement
			 with  an  asterisk  (*)  in  place  of a unit number
			 includes an explicit logical unit  number.  Instead,
			 both  use  an	implicit internal logical unit number
			 and the FOR_PRINT environment variable. If FOR_PRINT
			 is  not  defined,  the  code PRINT f,iolist or WRITE
			 (*,f) iolist writes to CONOUT$ (standard output). If
			 FOR_PRINT  is	defined  (as  a  file name optionally
			 containing a path),  the  specified  file  would  be
			 written to.

       FOR_READ 	 A  READ statement that uses an asterisk (*) in place
			 of a  unit  number  does  not	include  an  explicit
			 logical  unit	number.  Instead, it uses an implicit
			 internal  logical  unit  number  and  the   FOR_READ
			 environment  variable.  If  FOR_READ is not defined,
			 the code READ (*,f) iolist or	READ  f,iolist	reads
			 from CONIN$ (standard input). If FOR_READ is defined
			 (as a file name optionally containing a  path),  the
			 specified file would be read.

       FOR_TYPE 	 The  TYPE  statement  does  not  include an explicit
			 logical unit number. Instead, it  uses  an  implicit
			 internal   logical  unit  number  and	the  FOR_TYPE
			 environment variable. If FOR_TYPE  is	not  defined,
			 the  code  TYPE f,iolist writes to CONOUT$ (standard
			 output). If FOR_TYPE is  defined  (as	a  file  name
			 optionally  containing  a  path), the specified file
			 would be written to.

       FORT_BLOCKSIZE	 Specifies the default BLOCKSIZE  value  to  be  used
			 when  BLOCKSIZE=  is  omitted on the OPEN statement.
			 Valid values are 0 to 2147467264. Sizes are  rounded
			 up to the next 512-byte boundary.

       FORT_BUFFERCOUNT  Specifies  the  default  BUFFERCOUNTvalue to be used
			 when BUFFERCOUNT= is omitted on the OPEN  statement.
			 Valid	values	are  0 to 127. If 0 is specified, the
			 default value of 1 will be used.

       FORT_BUFFERED	 Specifies that buffered I/O should be	used  at  run
			 time  for  output  of	all Fortran I/O units, except
			 those with output to the terminal. This  provides  a
			 run-time    mechanism	 to   support	the   -assume
			 buffered_io   (Linux	OS   and   Mac	 OS   X)   or
			 /assume:buffered_io (Windows OS) compiler option.

       FORT_CONVERTn	 Specifies  the  data  format for an unformatted file
			 associated with a particular  unit  number  (n),  as
			 described in Methods of Specifying the Data Format.

       FORT_CONVERT.ext  and  FORT_CONVERT_ext	Specifies the data format for
			 unformatted files with a particular  file  extension
			 suffix  (ext), as described in Methods of Specifying
			 the Data Format.

       FORT_FMT_RECL	 Specifies the default record  length  (normally  132
			 bytes) for formatted files.

       FORT_UFMT_RECL	 Specifies  the  default record length (normally 2040
			 bytes) for unformatted files.

       FORTn		 Specifies the file name for a particular unit number
			 n,  when  a  file  name is not specified in the OPEN
			 statement or an  implicit  OPEN  is  used,  and  the
			 compiler  option -fpscomp filesfromcmd (Linux OS and
			 Mac OS X) or /fpscomp:filesfromcmd (Windows OS)  was
			 not  specified. Preconnected files attached to units
			 0, 5, and 6 are by default  associated  with  system
			 standard I/O files.

       NLSPATH (Linux OS and Mac OS X only)
			 Specifies  the  path  for the Intel Fortran run-time
			 error message catalog.

       TBK_ENABLE_VERBOSE_STACK_TRACE
			 Displays more detailed call stack information in the
			 event of an error.

       The  default  brief output is usually sufficient to determine where an
       error occurred. Brief output  includes  up  to  twenty  stack  frames,
       reported  one  line  per  stack	frame. For each frame, the image name
       containing the PC, routine name, line  number,  and  source  file  are
       given.

       The  verbose  output,  if  selected,  will provide (in addition to the
       information in brief output) the exception context record if the error
       was  a  machine exception (machine register dump), and for each frame,
       the return address, frame  pointer  and	stack  pointer	and  possible
       parameters  to the routine. This output can be quite long (but limited
       to   16K   bytes)   and	  use	 of    the    environment    variable
       FOR_DIAGNOSTIC_LOG_FILE	is  recommended  if  you  want to capture the
       output accurately. Most situations  should  not	require  the  use  of
       verbose output.

       The  variable  FOR_ENABLE_VERBOSE_STACK_TRACE  is  also recognized for
       compatibility with Compaq* Visual Fortran.

       See also Using Traceback Information.

       TBK_FULL_SRC_FILE_SPEC
			 By default, the traceback output displays  only  the
			 file name and extension in the source file field. To
			 display complete file name information including the
			 path,	    set      the     environment     variable
			 TBK_FULL_SRC_FILE_SPEC to true.

       The   variable	FOR_FULL_SRC_FILE_SPEC	 is   also   recognized   for
       compatibility with Compaq* Visual Fortran.

       See also Using Traceback Information.

       FORT_TMPDIR, TMP, TMPDIR, and TEMP
			 Specifies   an  alternate  working  directory	where
			 scratch files are created.

	GNU  extensions  (recognized  by  the  Intel®  OpenMP	compatibility
       library)

       GOMP_STACKSIZE	 GNU   extension   recognized  by  the	Intel  OpenMP
			 compatibility	      library.	       Same	   as
			 OMP_STACKSIZE.KMP_STACKSIZE		    overrides
			 GOMP_STACKSIZE, which overrides  OMP_STACKSIZE.

	Default: See OMP_STACKSIZE description

       GOMP_CPU_AFFINITY (Linux  OS  and  Mac  OS  X  only)   GNU   extension
			 recognized   by   the	 Intel	OpenMP	compatibility
			 library.  Specifies a list of OS processor IDs.

	Default: Affinity is disabled

	OpenMP* Environment Variables (OMP_) and Extensions (KMP_)

       OMP_DYNAMIC	 Enables (.TRUE.) or disables (.FALSE.)  the  dynamic
			 adjustment of the number of threads.

	Default:.FALSE.

	Syntax:

       export OMP_DYNAMIC=value

       OMP_MAX_ACTIVE_LEVELS
			 The maximum number of levels of parallel nesting for
			 the program.

	Default: 1

	Syntax:

       export OMP_MAX_ACTIVE_LEVEL=value

       OMP_NESTED	 Enables   (.TRUE.)   or   disables   (.FALSE.)nested
			 parallelism.

	Default: .FALSE.

	Syntax:

       export OMP_NESTED=value

       OMP_NUM_THREADS	 Sets  the  maximum  number  of  threads  to  use for
			 OpenMP*  parallel  regions  if  no  other  value  is
			 specified  in	the  application.  The value can be a
			 single integer,  in  which  case  it  specifies  the
			 number  of  threads for all parallel regions.	Or it
			 can be a comma-separated list of integers, in	which
			 case  each  integer  specifies the number of threads
			 for a parallel region at a nesting level.

       The first position in the  list	represents  the  outer-most  parallel
       nesting	level, the second position represents the next-inner parallel
       nesting level, and so on.  At any level, the integer can be  left  out
       of  the	list.  If the first integer in a list is left out, it implies
       the normal default value for threads is used at the outer-most  level.
       If  the	integer is left out of any other level, the number of threads
       for that level is inherited from the previous level.

       This environment  variable  applies  to	both  -openmp  and  -parallel
       options.

	Default: Number of processors visible to the operating system.

	Syntax:

       export OMP_NUM_THREADS=value[,value]*

       OMP_SCHEDULE	 Sets  the  run-time  schedule	type  and an optional
			 chunk size.

	Default:STATIC, no chunk size specified

	Syntax:

       export OMP_SCHEDULE="kind[,chunk_size]"

       This environment variable is available for both Intel®  and  non-Intel
       microprocessors	but it may perform additional optimizations for Intel
       microprocessors than it performs for non-Intel microprocessors.

       OMP_STACKSIZE	 Sets the number of bytes to allocate for each OpenMP
			 thread to use as the private stack for the thread.

       Recommended size is 16M.

       Use  the optional suffixes: B (bytes), K (Kilobytes), M (Megabytes), G
       (Gigabytes), or T (Terabytes) to specify the units. If only  value  is
       specified  and B, K, M, G, or T is not specified, then size is assumed
       to be K (Kilobytes).

       This variable does not affect  the  native  operating  system  threads
       created	by  the  user program nor the thread executing the sequential
       part  of  an  OpenMP  program  or  parallel  programs  created	using
       the-parallel option.

       The  kmp_{set,get}_stacksize_s()  routines set/retrieve the value. The
       kmp_set_stacksize_s() routine must be  called  from  sequential	part,
       before	first	parallel   region   is	created.  Otherwise,  calling
       kmp_set_stacksize_s() has no effect.

	Default for IA-32 architecture: 2M Default for Intel® 64architecture:
       4M

	Syntax:

       export OMP_STACKSIZE=value

	Related environment variables: KMP_STACKSIZE. KMP_STACKSIZE overrides
       OMP_STACKSIZE.

       OMP_THREAD_LIMIT  Limits  the  number  of   simultaneously   executing
			 threads in an OpenMP* program.

       If  this  limit	is reached and another native operating system thread
       encounters OpenMP* API calls or constructs, the program can abort with
       an  error  message.  If	this limit is reached when an OpenMP parallel
       region  begins,	a  one-time  warning  message  might   be   generated
       indicating that the number of threads in the team was reduced, but the
       program will continue.

       This environment variable is only used for programs compiled with  the
       -openmp or -openmp-profile or -parallel options.

       The omp_get_thread_limit() routine returns the value of the limit.

	Default: No enforced limit

	Syntax:

       export OMP_THREAD_LIMIT=value

	Related  environment  variable:  KMP_ALL_THREADS. Its value overrides
       OMP_THREAD_LIMIT.

       OMP_WAIT_POLICY	 Decides  whether  threads  spin  (active)  or	yield
			 (passive)	while	   they      are     waiting.
			 OMP_WAIT_POLICY=ACTIVE    is	 an	alias	  for
			 KMP_LIBRARY=turnaround,  and OMP_WAIT_POLICY=PASSIVE
			 is an alias for KMP_LIBRARY=throughtput.

	Default: Passive

	Syntax:

       export OMP_WAIT_POLICY=value

       KMP_AFFINITY	 Enables run-time library to bind threads to physical
			 processing units.

       Default: none

       This  environment  variable is available for both Intel® and non-Intel
       microprocessors but it may perform additional optimizations for	Intel
       microprocessors than it performs for non-Intel microprocessors.

       KMP_ALL_THREADS	 Limits   the	number	of  simultaneously  executing
			 threads in an OpenMP*	program.  If  this  limit  is
			 reached  and  another native operating system thread
			 encounters OpenMP* API calls or constructs, then the
			 program  may  abort  with  an error message. If this
			 limit is reached at  the  time  an  OpenMP  parallel
			 region  begins,  a  one-time  warning message may be
			 generated indicating that the number of  threads  in
			 the  team was reduced, but the program will continue
			 execution. This environment variable  is  only  used
			 for	programs    compiled	with	-openmp    or
			 -openmp-profile. Default: No enforced limit

       KMP_BLOCKTIME	 Sets the time, in milliseconds, that a thread should
			 wait,	after  completing the execution of a parallel
			 region, before sleeping.

       Use the optional character  suffixes:  s  (seconds),  m	(minutes),  h
       (hours), or d (days) to specify the units. Default: 200 milliseconds

       KMP_CPUINFO_FILE  Specifies an alternate file name for file containing
			 machine topology description. The file  must  be  in
			 the same format as /proc/cpuinfo.

	Default: None

       This  environment  variable is available for both Intel® and non-Intel
       microprocessors but it may perform additional optimizations for	Intel
       microprocessors than it performs for non-Intel microprocessors.

       KMP_DYNAMIC_MODE  Selects  the  method used to determine the number of
			 threads  to  use  for	 a   parallel	region	 when
			 OMP_DYNAMIC=true.     Possible   values:   (asat   |
			 load_balance | thread_limit), where,

       · asat: estimates number of threads based on parallel start time;

       · load_balance: tries to  avoid	using  more  threads  than  available
	 execution units on the machine;

       · thread_limit: tries to avoid using more threads than total execution
	 units on the machine.

	Default:   load_balance  (if  support  is  available);	 thread_limit
       (elsewhere)

       KMP_INHERIT_FP_CONTROL
			 Enables  (1)  or  disables  (0)  the  copying of the
			 floating point control settings of the master thread
			 to  the  floating  point  control  settings  of  the
			 OpenMP* worker threads at the start of each parallel
			 region.

	Default:1

       KMP_LIBRARY	 Selects  the OpenMP run-time library execution mode.
			 The values for this variable are serial, turnaround,
			 or throughput.

	Default:throughput

       KMP_MONITOR_STACKSIZE
			 Sets the number of bytes to allocate for the monitor
			 thread,  which  is  used  for	book-keeping   during
			 program execution.

       Use  the optional suffixes: b (bytes), k (kilobytes), m (megabytes), g
       (gigabytes), or t (terabytes) to specify the units. Default: max (32k,
       system minimum thread stack size)

       KMP_SETTINGS	 Enables  (1)  or disables (0) the printing of OpenMP
			 run-time  library   environment   variables   during
			 program   execution.  Two  lists  of  variables  are
			 printed: user-defined environment variables settings
			 and  effective  values  of  variables used by OpenMP
			 run-time library. Default: 0

       KMP_STACKSIZE	 Sets the  number  of  bytes  to  allocate  for  each
			 OpenMP*   thread   to	use  as  its  private  stack.
			 Recommended size is 16m. Use the optional suffix  b,
			 k,   m,  g,  or  t,  to  specify  bytes,  kilobytes,
			 megabytes,  gigabytes,  or  terabytes.This  variable
			 does  not affect the native operating system threads
			 created by the user program nor the thread executing
			 the   sequential  part  of  an  OpenMP*  program  or
			 parallel programs created using -parallel option.

	Default: IA-32 architecture: 2m, Intel® 64 architecture: 4m,.

       KMP_VERSION	 Enables (1) or disables (0) the printing of  OpenMP*
			 run-time  library version information during program
			 execution.

	Default:0

	PGO Environment Variables

       INTEL_PROF_DUMP_CUMULATIVE
			 When using interval profile  dumping  (initiated  by
			 INTEL_PROF_DUMP_INTERVAL     or     the     function
			 _PGOPTI_Set_Interval_Prof_Dump) during the execution
			 of an instrumented user application, allows creation
			 of  a	single	.dyn  file   to   contain   profiling
			 information  instead of multiple .dyn files. If this
			 environment  variable	is  not  set,  executing   an
			 instrumented  user  application  creates  a new .dyn
			 file for each	interval.  Setting  this  environment
			 variable  is  useful  for  applications  that do not
			 terminate or those that terminate abnormally (bypass
			 the normal exit code).

       INTEL_PROF_DUMP_INTERVAL
			 Initiates    interval	  profile   dumping   in   an
			 instrumented  user  application.  This   environment
			 variable  may	be  used to initiate Interval Profile
			 Dumping in an instrumented application.

       See Interval Profile Dumping for more information.

       PROF_DIR 	 Specifies the directory in which dynamic information
			 files	are  created.  This  variable  applies to all
			 three phases of the profiling process.

       PROF_DUMP_INTERVAL
			 Deprecated; use INTEL_PROF_DUMP_INTERVAL instead.

       PROF_NO_CLOBBER	 Alters the feedback compilation phase	slightly.  By
			 default,  during the feedback compilation phase, the
			 compiler merges data from  all  dynamic  information
			 files	and creates a new pgopti.dpi file if the .dyn
			 files are newer than an existing pgopti.dpi file.

       When this variable is set the compiler does not overwrite the existing
       pgopti.dpi  file.  Instead,  the  compiler  issues a warning. You must
       remove the pgopti.dpi file if  you  want  to  use  additional  dynamic
       information files.

TECHNICAL SUPPORT
       The  Intel(R)  Fortran  Compiler  product  web  site offers timely and
       comprehensive product information, including product  features,	white
       papers, and technical articles.

       For	 the	   latest	information,	   please	visit
       http://www.intel.com/software/products/.

       Intel also provides a support web site that contains a rich repository
       of  self-help  information,  including  getting	started  tips,	known
       product issues, product errata, license information, user forums,  and
       more.

       To  register  your  product,  to  contact  Intel,  or  to seek product
       support, please visit: http://www.intel.com/software/products/support.

SEE ALSO
       ifort(1), ld(1)

       In the Intel(R) Fortran Compiler Documentation, the  Intel(R)  Fortran
       Building  Applications  guide  and  the	Intel(R)  Fortran  Optimizing
       Applications guide provide detailed information	on  using  the	Intel
       Fortran Compiler.

       In addition, see these other documents provided with the Intel Fortran
       Compiler:

       · Product Release Notes

       · Intel(R) Fortran Compiler Documentation: the Intel Fortran  Compiler
	 Options reference

       · Intel(R)   Fortran   Compiler	 Documentation:   the  Intel  Fortran
	 Floating-point Operations manual

       · Intel(R) Fortran Compiler Documentation: the Intel Fortran  Language
	 Reference



Legal Information
       INFORMATION  IN	THIS DOCUMENT IS PROVIDED IN CONNECTION WITH INTEL(R)
       PRODUCTS. NO LICENSE, EXPRESS OR IMPLIED, BY ESTOPPEL OR OTHERWISE, TO
       ANY  INTELLECTUAL  PROPERTY RIGHTS IS GRANTED BY THIS DOCUMENT. EXCEPT
       AS PROVIDED IN INTEL'S TERMS AND CONDITIONS OF SALE FOR SUCH PRODUCTS,
       INTEL ASSUMES NO LIABILITY WHATSOEVER, AND INTEL DISCLAIMS ANY EXPRESS
       OR IMPLIED WARRANTY, RELATING TO SALE AND/OR  USE  OF  INTEL  PRODUCTS
       INCLUDING LIABILITY OR WARRANTIES RELATING TO FITNESS FOR A PARTICULAR
       PURPOSE, MERCHANTABILITY, OR INFRINGEMENT OF ANY PATENT, COPYRIGHT  OR
       OTHER INTELLECTUAL PROPERTY RIGHT.  UNLESS OTHERWISE AGREED IN WRITING
       BY INTEL, THE INTEL PRODUCTS ARE NOT DESIGNED  NOR  INTENDED  FOR  ANY
       APPLICATION  IN	WHICH THE FAILURE OF THE INTEL PRODUCT COULD CREATE A
       SITUATION WHERE PERSONAL INJURY OR DEATH MAY OCCUR.   Intel  may  make
       changes	to  specifications  and  product  descriptions	at  any time,
       without	notice.  Designers  must  not  rely   on   the	 absence   or
       characteristics	of  any features or instructions marked "reserved" or
       "undefined." Intel reserves these for future definition and shall have
       no   responsibility  whatsoever	for  conflicts	or  incompatibilities
       arising from future changes to them. The information here  is  subject
       to  change  without  notice.  Do  not  finalize	a  design  with  this
       information.  The products described  in  this  document  may  contain
       design  defects	or errors known as errata which may cause the product
       to deviate from published specifications. Current characterized errata
       are  available  on  request.  Contact your local Intel sales office or
       your distributor  to  obtain  the  latest  specifications  and  before
       placing	your  product order.  Copies of documents which have an order
       number and are referenced in this document, or other Intel literature,
       may  be obtained by calling 1-800-548-4725, or by visiting Intel's Web
       Site.

       Intel processor numbers are not a measure  of  performance.  Processor
       numbers	differentiate  features  within  each  processor  family, not
       across	     different	      processor 	families.	  See
       http://www.intel.com/products/processor_number for details.

       Centrino,  Cilk,  Intel,  Intel	Atom,  Intel  Core,  Intel  NetBurst,
       Itanium, MMX, Pentium, Xeon are trademarks of Intel Corporation in the
       U.S. and/or other countries.

       * Other names and brands may be claimed as the property of others.

       Copyright (C) 1996-2011, Intel Corporation. All rights reserved.

       Portions Copyright (C) 2001, Hewlett-Packard Development Company, L.P.



Copyright(C) 2005 - 2011      Intel Corporation 		     ifort(1)
```