---
layout: post
title: "xlf Man Page"
date: 2013-12-03 20:48
comments: true
categories: [man, xlf, Fortran]
---

本文用于收集IBM XL Fortran 2012编译器帮助文档。

<!--more-->

```
  xlf(1)		     IBM (2012)			     xlf(1)

  NAME
	 xlf, xlf_r, xlf_r7, f77, fort77, xlf90, xlf90_r, xlf90_r7,
	 f90, xlf95, xlf95_r, xlf95_r7,	f95, xlf2003, xlf2003_r,
	 f2003,	xlf2008, xlf2008_r, f2008 - invoke the IBM XL
	 Fortran compiler.

  SYNTAX
	 <invocation-command> [	<option> | <inputfile> ] ...

  DESCRIPTION
	 The invocation	commands compile Fortran source	files.
	 The commands and their	recommended usages are described
	 below.

	 Invocations		       Usage (supported	standards)
	 _________________________________________________________

	 xlf, xlf_r, xlf_r7,	       Compile FORTRAN 77 source
	 f77, fort77		       files.

	 xlf90,	xlf90_r, xlf90_r7,     Compile Fortran 90 source
	 f90			       files.

	 xlf95,	xlf95_r, xlf95_r7,     Compile Fortran 95 source
	 f95			       files.

	 xlf2003, xlf2003_r,	       Compile Fortran 2003 source
	 f2003			       files.

	 xlf2008, xlf2008_r,	       Compile Fortran 2008 source
	 f2008			       files.

	 The main difference between these commands is that they
	 use different default options (which are set in the
	 configuration file /etc/xlf.cfg.XX, where XX represents
	 the AIX version).
	 See the XL Fortran Compiler Reference for more	information
	 on these invocation commands.

	 All invocations with a	suffix of _r allow for thread-safe
	 compilation. Use these	commands to create threaded
	 applications or to link programs that use multi-threading.

	 These commands	also process assembler source files and
	 object	files. The compiler calls the link editor to
	 produce a single executable unless you	specify	the
	 compiler options that prevent object files from being
	 linked.

	 The input file	may have any of	the following suffixes:

	  .f, .f77, .f90, .f95,	       Fortran source file
	  .f03,	.f08

	  .o or	.a		       Object file for ld command

	  .s			       Assembler source	file

	  .so			       Shared object file

	  .F, .F77, .F90, .F95,	       Fortran source file
	  .F03,	.F08		       with cpp	preprocessor
						directives

  OPTIONS
	 Compiler options are categorized by their functions and
	 may be	used to	set the	compiler behavior. Options can be
	 flag options or keyword options.

	 Keyword options are specified in one of the following
	 ways:
	 -q<option>
	 -q<option>=<suboption>
	 -q<option>=<suboption>:<suboption>

	 Keyword options with no suboptions represent switches that
	 may be	either enabled or disabled. -qx	enables	the option,
	 and -qnox disables it.	For example, -qsource tells the
	 compiler to produce a source listing and -qnosource tells
	 the compiler not to produce a source listing.

  Output control options
	 -c	Instructs the compiler to pass source files to the
		compiler only. The compiled source files are not
		sent to	the linker. This option	produces an object
		file, file_name.o, for each valid source file.

	 -d	Keeps temporary	files produced by C preprocessor
		(cpp), instead of deleting them. By default,
		temporary files	produced by cpp	are deleted.

	 -qmoddir=<directory>
		Specifies the location for any .mod files that the
		compiler writes.

		Default:
		     .mod files	are placed in the current
		    directory.

	 -G	Generates a shared object enabled for runtime
		linking.

	 -qmkshrobj
		Creates	a shared object	from the generated object
		files.
		By default, the	output object is linked	with the
		runtime	libraries and startup routines to create an
		executable file.
		Specifying -qmkshrobj implies -qpic.
		You can	also use the following related options with
		-qmkshrobj.
		-o shared_file
		-e name
		-qexpfile=filename
		-q[no]weakexp

	 -o <path>
		Specifies an output location for the object,
		assembler, or executable files created by the
		compiler. When the -o option is	used during
		compiler invocation, <path> can	be the name of
		either a file or a directory.

		Default: -o a.out

	 -S	Generates an assembler language	file (.s) for each
		source file. The resulting .s files can	be
		assembled to produce object .o files or	an
		executable file	(a.out).

	 -qtimestamps |	-qnotimestamps
		Controls whether or not	implicit time stamps are
		inserted into an object	file.

		This option does not affect time stamps	inserted by
		pragmas	and other explicit mechanisms.

		Default: -qtimestamps

  Input	control	options
	 -qcclines | -qnocclines
		Enables	recognition of conditional compilation
		lines.

		Default:
		     o -qcclines if -qsmp=omp is specified
		     o -qnocclines otherwise

	 -qci=<numbers>
		Activates the specified	INCLUDE	lines. Specifies
		identification numbers (from 1 to 255) of
		conditional includes.

		Default: No default value

	 -qcr |	-qnocr
		Controls how the compiler interprets the carriage
		return (CR) character.

		Default: -qnocr

	 -qdirective[=<directive_list>]	| -qnodirective[=<directive_list>]
		Specifies sequences of characters, known as trigger
		constants, that	identify comment lines as compiler
		comment	directives.

		Default: -qnodirective

	 -qfixed[=<right_margin>]
		Indicates that the input source	program	is in fixed
		source form and	optionally specifies the maximum
		line length.

		Default:
		     o -qfixed=72 for the xlf, xlf_r, xlf_r7, f77,
		     and fort77	invocation commands
		     o -qfree=f90 for the xlf90, xlf90_r, xlf90_r7,
		     f90, xlf95, xlf95_r, xlf95_r7, f95, xlf2003,
		     xlf2003_r,	f2003, xlf2008,	xlf2008_r and f2008
		     invocation	commands

	 -WF,-qfpp[=<suboptions_list>] | -WF,-qnofpp
		Controls Fortran-specific preprocessing	in the C
		preprocessor.
		Note: This is a	C preprocessor option, and must
		therefore be specified using the -WF option.

		Default: -WF,-qnofpp

		<suboptions_list> is a colon-separated list of one
		or more	of the following:

		comment	| nocomment
		     Instructs the C preprocessor (cpp)	to
		     recognize the ! character as a comment
		     delimiter in macro	expansion. When	this
		     suboption is enabled, the ! character and all
		     characters	following it on	that line will be
		     ignored.
		     Default: comment
		linecont | nolinecont
		     Instructs cpp to recognize	the & character	as
		     a line continuation character. When this
		     suboption is enabled, cpp treats the &
		     character and the C-style	line continuation
		     character equivalently.
		     Default: linecont

	 -qfree[=f90|ibm]
		Indicates that the source code is free form.

		ibm
		     Specifies compatibility with the free source
		     form defined for VS FORTRAN.
		f90
		     Specifies compatibility with the free source
		     form defined for Fortran 90, Fortran 95,
		     Fortran 2003, and Fortran 2008.

		Default:
		     o -qfixed=72 for the xlf, xlf_r, xlf_r7, f77,
		     and fort77	invocation commands
		     o -qfree=f90 for the xlf90, xlf90_r, xlf90_r7,
		     f90, xlf95, xlf95_r, xlf95_r7, f95, xlf2003,
		     xlf2003_r,	f2003, xlf2008,	xlf2008_r and f2008
		     invocation	commands

	 -I<directory_path>
		Adds a directory to the	search path for	#include
		files and .mod files. Before checking the default
		directories for	include	and .mod files,	the
		compiler checks	each directory in the search path.
		For include files, this	path is	only used if the
		file name in an	INCLUDE	line is	not provided with
		an absolute path.

		Default:
		     The following directories are searched, in	the
		     following order, after any	paths that are
		     specified by the -I option:
		     1)	The current directory.
		     2)	The directory where the	source file is
		     located.
		     3)	/usr/include.

	 -k	Indicates that the source code is in free source
		form.
		This option is the short form of -qfree=f90.

	 -qmixed | -qnomixed
		The long form of the -U	option.	Makes the compiler
		case sensitive for names.

		Default: -qnomixed

	 -qsuffix=<suboption>=<suffix>
		Specifies the source-file suffix on the	command
		line. Suboptions include:

		f=<suffix>
		     where <suffix> is the new source-file suffix.
		o=<suffix>
		     where <suffix> is the new object-file suffix.
		s=<suffix>
		     where <suffix> is the new assembler source-
		     file suffix.
		cpp=<suffix>
		     where <suffix> is the new preprocessor
		     source-file suffix.

	 -U	Makes the compiler case	sensitive for names.
		Suppresses lowercase folding of	Fortran	code. By
		default, the compiler interprets all names as if
		they were in lowercase.

	 -qxlines | -qnoxlines
		Specifies whether fixed	source form lines with a X
		in column 1 are	compiled or treated as comments.

		Default: -qnoxlines

	 -WF,-q[no]ppsuborigarg
		Instructs the C	preprocessor to	substitute original
		macro arguments	before further macro expansion.
		Note: -qppsuborigarg is	a C preprocessor option,
		and must therefore be specified	using the -WF
		option.

		Default: -WF,-qnoppsuborigarg

  Language element control options
	 -D	Specifies whether the compiler compiles	fixed
		source form lines with a D in column 1 or treats
		them as	comments.

	 -qdlines | -qnodlines
		The long form of the -D	option.

		Default: -qnodlines

	 -qlanglvl=<suboptions_list>
		Determines which language standard (or superset, or
		subset of a standard) to consult for
		nonconformance.	It identifies nonconforming source
		code and also options that allow such
		nonconformances.
		<suboptions_list> is a colon-separated list of the
		following suboptions:

		77std
		     Accepts the language that the ANSI	FORTRAN	77
		     standard specifies	and reports anything else
		     using language-level messages.
		90std
		     Accepts the language that the ISO Fortran 90
		     standard specifies	and reports anything else
		     using language-level messages.
		90pure
		     The same as 90std except that it also reports
		     language-level messages for any obsolescent
		     Fortran 90	features used.
		90ext
		     Obsolete suboption	that is	equivalent to
		     extended. To avoid	problems in the	future,	use
		     the extended suboption instead.
		95std
		     Accepts the language that the ISO Fortran 95
		     standard specifies	and reports anything else
		     using language-level messages.
		95pure
		     The same as 95std except that it also reports
		     language-level messages for any obsolescent
		     Fortran 95	features used.
		2003std
		     Accepts the language that the ISO Fortran 2003
		     standard specifies	and reports anything else
		     using language-level messages.
		2003pure
		     The same as 2003std except	that it	also
		     reports language-level messages for any
		     obsolescent Fortran 2003 features used.
		2008std
		     Accepts the language that the ISO Fortran 2003
		     standard specifies	and all	Fortran	2008
		     features supported	by XL Fortran, and reports
		     anything else using language-level	messages.
		2008pure
		     The same as 2008std except	that it	also issues
		     language-level messages for any obsolescent
		     Fortran 2008 features used.
		extended
		     Accepts the full Fortran 2003 language
		     standard, all Fortran 2008	features supported
		     by	XL Fortran, and	all extensions,	effectively
		     turning off language-level	checking.

		Default: -qlanglvl=extended

	 -qmbcs	| -qnombcs
		Specifies that string literals and comments can
		contain	multi-byte characters.

		Default: -qnombcs

	 -qnullterm | -qnonullterm
		Appends	a null character to each character
		expression that	is passed as a dummy argument,
		making it more convenient to pass strings to C
		functions.

		Default: -qnonullterm

	 -1	Executes each DO loop in the compiled program at
		least once if its DO statement is executed, even if
		the iteration count is 0. This is the short form of
		the -qonetrip option.

	 -qonetrip | -qnoonetrip
		The long form of the -1	option.

		Default: -qnoonetrip

	 -qposition={appendold|appendunknown}
		Positions the file pointer at the end of the file
		when data is written after an OPEN statement with
		no POSITION= specifier,	and the	corresponding
		STATUS=value (OLD or UNKNOWN) is specified. The
		default	setting	depends	on the I/O specifiers in
		the OPEN statement and on the compiler invocation
		command.

		Default:
		     o -qposition=appendold for	the xlf, xlf_r,
		     xlf_r7, f77 and fort77 invocation commands.
		     o The defined Fortran 90 and Fortran 95
		     behaviors for the xlf90, xlf90_r, xlf90_r7,
		     f90, xlf95, xlf95_r, xlf95_r7, f95, xlf2003,
		     xlf2003_r,	f2003, xlf2008,	xlf2008_r and f2008
		     invocation	commands.

	 -qqcount | -qnoqcount
		Accepts	the character-count Q edit descriptor(Q) as
		well as	the extended-precision Q edit descriptor
		(Qw.d).	With -qnoqcount, all Q edit descriptors	are
		interpreted as the extended-precision Q	edit
		descriptor.

		Default: -qnoqcount

	 -qsaa | -qnosaa
		Checks for conformance to the SAA Fortran language
		definition. It identifies nonconforming	source code
		and also options that allow such nonconformances.

		Default: -qnosaa

	 -qsave[={all|defaultinit}] | -qnosave
		Specifies the default storage class for	local
		variables.

		all
		     The default storage class for all local
		     variables is STATIC. Specifying this suboption
		     is	the same as specifying the -qsave option
		     without any suboptions.
		defaultinit
		     The default storage class is STATIC for local
		     variables of derived type that have default
		     initialization specified.

		Default:
		     o -qsave for the xlf, xlf_r, xlf_r7, f77 and
		     fort77 invocation commands
		     o -qnosave	otherwise. -qnosave sets the
		     default storage class to AUTOMATIC.

	 -qsclk={centi|micro}
		Specifies the resolution that the SYSTEM_CLOCK
		intrinsic procedure uses in a program.

		centi
		     Uses centisecond resolution for the values
		     returned.
		micro
		     Uses microsecond resolution.

		Default: -qsclk=centi

	 -u	Specifies that no implicit typing of variable names
		is permitted. It has the same effect as	using the
		IMPLICIT NONE statement	in each	scope that allows
		implicit statements.

	 -qundef | -qnoundef
		The long form of the -u	option.

		Default: -qnoundef

	 -qxlf77=<settings>
		Provides compatibility with FORTRAN 77 aspects of
		language semantics and I/O data	format that have
		changed. Most of these changes are required by the
		Fortran	90 standard.
		Suboptions include:

		blankpad | noblankpad
		     Pads an internal or direct-access file if the
		     format requires more characters than the
		     record contains.
		gedit77	| nogedit77
		     Uses FORTRAN 77 semantics for the output of
		     REAL objects with the G edit descriptor.
		intarg | nointarg
		     Converts all the integer arguments	of an
		     intrinsic procedure to the	kind of	the longest
		     argument, if they are of different	kinds.
		intxor | nointxor
		     Treats .XOR. as a logical binary intrinsic
		     operator rather than a defined operator.
		leadzero | noleadzero
		     Produces a	leading	zero in	realoutput under
		     the D, E, F and Q edit descriptors.
		oldboz | nooldboz
		     Turns blanks into zeros for data read by B, O,
		     and Z edit	descriptors, regardless	of the
		     BLANK= specifier or any BN	or BZ control edit
		     descriptors.
		persistent | nopersistent
		     Saves the addresses of arguments to
		     subprograms with ENTRY statements in static
		     storage.
		softeof	| nosofteof
		     Allows READ and WRITE operations when a unit
		     is	positioned after its endfile record, unless
		     that position is the result of executing an
		     ENDFILE statement.

		Default:
		     o blankpad, nogedit77, nointarg, nointxor,
		     leadzero, nooldboz, nopersistent and nosofteof
		     for the xlf90, xlf90_r, xlf90_r7, xlf95,
		     xlf95_r, xlf95_r7,	f95, xlf2003, xlf2003_r,
		     f2003, xlf2008, xlf2008_r and f2008 commands.
		     o The exact opposite for the xlf, xlf_r,
		     xlf_r7, and f77/fort77 commands.

	 -qxlf90=<suboption>
		Determines whether the compiler	provides the
		Fortran	90 or the Fortran 95 level of support for
		certain	aspects	of the language. <suboption> can be
		one of the following:

		signedzero | nosignedzero
		     Determines	how the	SIGN(A,B) function handles
		     signed real 0.0. In addition, determines
		     whether negative internal values will be
		     prefixed with a minus when	formatted output
		     would produce a negative sign zero.
		autodealloc | noautodealloc
		     Determines	whether	the compiler deallocates
		     allocatable arrays	that are declared locally
		     without either the	SAVE or	the STATIC
		     attribute and have	a status of currently
		     allocated when the	subprogram terminates.
		oldpad | nooldpad
		     When the PAD=specifier is present in the
		     INQUIRE statement,	specifying -qxlf90=nooldpad
		     returns UNDEFINED when there is no	connection,
		     or	when the connection is for unformatted I/O.
		     This behavior conforms to the Fortran 95
		     standard and above. Specifying -qxlf90=oldpad
		     preserves the Fortran 90 behavior.

		Default:
		     o signedzero, autodealloc and nooldpad for	the
		     xlf95, xlf95_r, xlf95_r7, f95, xlf2003,
		     xlf2003_r,	f2003, xlf2008,	xlf2008_r and f2008
		     invocation	commands
		     o nosignedzero, noautodealloc and oldpad for
		     all other invocation commands

	 -qxlf2003=<suboptions_list>
		Provides the ability to	use language features
		introduced in the Fortran 2003 standard.
		<suboptions_list> is a colon-separated list of one
		or more	of the following suboptions:

		autorealloc | noautorealloc
		     Controls whether the compiler automatically
		     reallocates the left-hand-side (LHS) with the
		     shape of the right-hand-side RHS when
		     assigning into an allocatable variable. This
		     suboption has no effect on	reallocation when
		     the values	of length type parameters in the
		     LHS and RHS differ.
		bozlitargs | nobozlitargs
		     The bozlitargs suboption ensures that the
		     passing of	boz-literal constants as arguments
		     to	the INT, REAL, CMPLX, or DBLE intrinsic
		     function conforms to the Fortran 2003
		     standard. The -qlanglvl=2003pure or
		     -qlanglvl=2003std option must be specified, as
		     well. If -qport=typlssarg and
		     -qxlf2003=bozlitargs are specified, passing
		     boz-literal constants to the CMPLX	intrinsic
		     will yield	non-standard results.
		dynamicacval | nodynamicacval
		     When dynamicacval is in effect, the dynamic
		     types of array constructor	values are used	to
		     determine the type	of the array constructors
		     and you can use unlimited polymorphic entities
		     in	array constructors. When nodynamicacval	is
		     in	effect,	the declared types of array
		     constructor values	are used to determine the
		     type of the array constructors and	you cannot
		     use unlimited polymorphic entities	in array
		     constructors. To make the
		     -qxlf2003=dynamicacval option effective, you
		     must also specify -qxlf2003=polymorphic.
		oldnaninf | nooldnaninf
		     When oldnaninf is in effect, the compiler uses
		     old XL Fortran behavior for output	of IEEE	NaN
		     and infinity exceptional values in	real or
		     complex editing.
		     When nooldnaninf is in effect, the	compiler
		     uses the Fortran 2003 standard for	output of
		     IEEE NaN and infinity exceptional values in
		     real or complex editing.
		polymorphic | nopolymorphic
		     When polymorphic is in effect, the	compiler
		     allows polymorphic	entities in Fortran source
		     files and runtime type information	is
		     generated for each	derived	type definition.
		     When nopolymorphic	is in effect, polymorphic
		     entities cannot be	specified in the Fortran
		     source files and no runtime type information
		     is	generated.
		signdzerointr |	nosigndzerointr
		     When signdzerointr	is in effect, the passing
		     of	signed zeros to	the SQRT, LOG, and ATAN2
		     intrinsic functions returns results consistent
		     with the Fortran 2003 standard. The
		     -qxlf90=signedzero	option must be in effect,
		     as	well. For the xlf90, xlf77 and xlf
		     invocations, specify both options to have the
		     Fortran 2003 behavior.
		stopexcept | nostopexcept
		     When stopexcept is	in effect, STOP	statements
		     will display informational	messages about
		     signaling IEEE floating-point exceptions.
		     When nostopexcept is in effect, informational
		     messages are suppressed.
		volatile | novolatile
		     When volatile is in effect, a non-VOLATILE
		     entity that is use- or host-associated can	be
		     specified as VOLATILE in inner or local scope.

		Default:
		     o autorealloc, bozlitargs,	nodynamicacval,
		     nooldnaninf, polymorphic, signdzerointr,
		     stopexcept	and volatile for the f2003,
		     xlf2003, xlf2003_r, xlf2008, xlf2008_r or
		     f2008 invocation commands
		     o noautorealloc, nobozlitargs, nodynamicacval,
		     oldnaninf,	nopolymorphic, nosigndzerointr,
		     nostopexcept and novolatile for all other
		     invocation	commands

	 -qxlf2008=<suboption>
		Provides the ability to	use language features
		specific to the	Fortran	2008 standard when
		compiling with compiler	invocations that conform
		with earlier Fortran standards,	as well	as the
		ability	to disable these features when compiling
		with compiler invocations that conform with the
		Fortran	2008 standard. The suboptions are:

		checkpresence |	nocheckpresence
		     When checkpresence	is in effect, presence of
		     optional dummy argument is	checked	according
		     to	the Fortran 2008 standard. When
		     nocheckpresence is	in effect, dummy argument
		     presence is checked according to previous
		     Fortran standards.

		Default:
		     o checkpresence for the f2008, xlf2008 or
		     xlf2008_r invocation commands
		     o nocheckpresence for all the other invocation
		     commands

  Floating-point and integer control options
	 -qautodbl=<suboption>
		Provides an automatic means of converting single-
		precision floating-point calculations to double-
		precision and of converting double-precision
		calculations to	extended-precision. The	suboptions
		are:

		none
		     Does not promote or pad any objects that share
		     storage.
		dbl4
		     Promotes floating-point objects that are
		     single-precision (4 bytes in size)	to double-
		     precision.
		     This suboption requires the libxlfpmt4.a
		     library during linking.
		dbl8
		     Promotes floating-point objects that are
		     double-precision (8 bytes in size)	to
		     extended-precision.
		     This suboption requires the libxlfpmt8.a
		     library during linking.
		dbl
		     Combines the promotions that dbl4 and dbl8
		     perform.
		     This suboption requires the libxlfpmt4.a and
		     libxlfpmt8.a libraries during linking.
		dblpad4
		     Performs the same promotions as dbl4 and pads
		     objects of	other types (except CHARACTER) if
		     they could	possibly share storage with
		     promoted objects.
		     This suboption requires the libxlfpmt4.a and
		     libxlfpad.a libraries during linking.
		dblpad8
		     Performs the same promotions as dbl8 and pads
		     objects of	other types (except CHARACTER) if
		     they could	possibly share storage with
		     promoted objects.
		     This suboption requires the libxlfpmt8.a and
		     libxlfpad.a libraries during linking.
		dblpad
		     Combines the promotions done by dbl4 and dbl8
		     and pads objects of other types (except
		     CHARACTER)	if they	could possibly share
		     storage with promoted objects.
		     This suboption requires the libxlfpmt4.a,
		     libxlfpmt8.a, and libxlfpad.a libraries during
		     linking.

		Default: -qautodbl=none

	 -qdpc[=e] | -qnodpc
		Increases the precision	of real	constants, for
		maximum	accuracy when assigning	real constants to
		DOUBLE PRECISION variables. -qdpc=e also promotes
		constants with an e exponent.

		Default: -qnodpc

	 -qenum=<suboption>
		Specifies the range for	an enumerator's	value.
		<suboption> can	be:

		1
		     The enumerator value must fit into	1 byte of
		     storage. The enumerator is	of type	integer(4).
		2
		     The enumerator value must fit into	2 bytes	of
		     storage. The enumerator is	of type	integer(4).
		4
		     The enumerator value must fit into	4 bytes	of
		     storage. The enumerator is	of type	integer(4).
		8
		     The enumerator value must fit into	8 bytes	of
		     storage. The enumerator is	of type	integer(8).

		Default: -qenum=4

	 -qfloat=<suboptions_list>
		Specifies various floating-point suboptions. This
		provides different strategies for speeding up or
		improving the accuracy of floating-point
		calculations. <suboptions_list>	is a colon-
		separated list of one or more of the following:

		fenv | nofenv
		     Specifies whether the code	depends	on the
		     hardware environment and whether to suppress
		     optimizations that	could cause unexpected
		     results due to this dependency.
		     When nofenv is in effect, the compiler assumes
		     that the program does not depend on the
		     hardware environment, and that aggressive
		     compiler optimizations that change	the
		     sequence of floating-point	operationsare
		     allowed to	be performed. When fenv	is in
		     effect, such optimizations	are suppressed.
		     Default: nofenv
		fltint | nofltint
		     Speeds up floating-point-to-integer
		     conversions by using faster inline	code that
		     does not check for	overflows. -qfloat=nofltint
		     checks floating-point-to-integer conversions
		     for out-of-range values.
		     If	-qarch is set to a processor that has an
		     instruction to convert from floating point	to
		     integer, that instruction will be used
		     regardless	of the [no]fltint setting. This
		     conversion	also applies to	all Power
		     processors	in 64-bit mode.
		     Default:
		       o nofltint at -O2 optimization.
		       o fltint	when -qnostrict	or -O3 or higher
		       optimization level is in	effect.
		fold | nofold
		     Specifies that constant floating-point
		     expressions are to	be evaluated at	compile
		     time rather than at run time.
		     Default: fold
		hscmplx	| nohscmplx
		     Speeds up operations involving complex
		     division and complex absolute value. This
		     suboption,	which provides a subset	of the
		     optimizations of the hsflt	suboption, is
		     preferred for complex calculations.
		     Default: nohscmplx
		hsflt |	nohsflt
		     The hsflt option speeds up	calculations by
		     truncating	instead	of rounding computed values
		     to	single precision before	storing	and on
		     conversions from floating-point to	integer.
		     The nohsflt suboption specifies that single-
		     precision expressions are rounded after
		     expression	evaluation and that floating-
		     point-to-integer conversions are to be checked
		     for out-of-range values.
		     Default: nohsflt
		hssngl | nohssngl
		     The hssngl	option specifies that single-
		     precision expressions are rounded only when
		     the results are stored into float memory
		     locations.	The nohssngl option specifies that
		     single-precision expressions are rounded after
		     expression	evaluation. Using hssngl can
		     improve runtime performance and is	safer than
		     using -qfloat=hsflt.
		     Default: nohssngl
		maf | nomaf
		     Makes floating-point calculations faster and
		     more accurate by using floating-point
		     multiply-add instructions where appropriate.
		     Default: maf
		nans | nonans
		     Generates extra instructions to detect
		     signaling NaN when	converting from	single-
		     precision to double-precision at run time.	The
		     option nonans specifies that this conversion
		     need not be detected.
		     Default: nonans
		rndsngl	| norndsngl
		     Specifies that the	result of each single-precision	(float)
		     operation is to be	rounded	to single precision.
		     -qfloat=norndsngl specifies that rounding to
		     single-precision happens only after full expressions have
		     been evaluated.
		     Default: rndsngl
		rngchk | norngchk
		     Specifying	norngchk instructs the compiler	to
		     skip range	checking, allowing for increased
		     performance where division	and sqrt operations
		     are performed repeatedly within a loop.
		     When rngchk is specified, range checking is
		     performed for input arguments for software
		     divide and	inlined	sqrt operations.
		     When -qstrict, -qstrict=infinities,
		     -qstrict=operationprecision, or
		     -qstrict=exceptions is active, the	setting	of
		     this option is forced to -qfloat=rngchk. When
		     -qnostrict	is active, the setting of this
		     option is -qfloat=norngchk	unless the
		     -qfloat=rngchk option is explicitly set by	the
		     user.
		     Default: rngchk
		rrm | norrm
		     Prevents floating-point optimizations that	are
		     incompatible with runtime rounding	to plus	and
		     minus infinity modes.
		     Default: norrm
		rsqrt |	norsqrt
		     Specifies whether a sequence of code that
		     involves division by the result of	a square
		     root can be replaced by calculating the
		     reciprocal	of the square root and multiplying.
		     Allowing this replacement produces	code that
		     runs faster. -qfloat=rsqrt	has no effect
		     unless -qignerrno is also specified.
		     Default:
		       o norsqrt at -O2	optimization
		       o rsqrt when  -qnostrict	or -O3 or higher
		       optimization level is in	effect
		single | nosingle
		     Allows single-precision arithmetic
		     instructions to be	generated for single-
		     precision floating-point values. All Power
		     processors	support	single-precision
		     instructions; however, if you wish	to preserve
		     the behavior of applications compiled for
		     earlier architectures, in which all floating-
		     point arithmetic was performed in double-
		     precision and then	truncated to single-
		     precision,	you can	use
		     -qfloat=nosingle:norndsngl. This suboption
		     provides computation precision results
		     compatible	with those provided by the
		     deprecated	options
		     -qarch=com|pwr|pwrx|pwr2|p2sc|601|602|603.
		     Default: single
		strictnmaf | nostrictnmaf
		     Ensures that the compiler does not	perform
		     optimizations that	introduce multiply-add
		     operations	that do	not preserve the sign of a
		     zero value.
		     Default: nostrictnmaf

	 -qieee=<suboption>
		Specifies the rounding mode for	the compiler to	use
		when evaluating	constant floating-point	expressions
		at compile time. <suboption> can be one	of the
		following:

		Near
		     Round to nearest representable number
		Minus
		     Round towards minus infinity
		Plus
		     Round towards plus	infinity
		Zero
		     Round towards zero

		Default: -qieee=near

	 -qintlog | -qnointlog
		Allows mixing of INTEGER and LOGICAL values in
		expressions and	statements.

		Default: -qnointlog

	 -qintsize={2|4|8)
		Sets the size of default INTEGER and LOGICAL
		values.

		Default: -qintsize=4

	 -qrealsize=(4|8}
		Sets the default size in bytes of REAL,	DOUBLE
		PRECISION, COMPLEX and DOUBLE COMPLEX values.

		Default: -qrealsize=4

	 -qstrictieeemod | -qnostrictieeemod
		Specifies that the compiler will adhere	to the
		Fortran	2003 IEEE arithmetic rules for the
		ieee_arithmetic	and ieee_exceptions intrinsic
		modules.

		Default: -qstrictieeemod

	 -y<rounding_mode>
		Equivalent to the -qieee option.
		Specifies the compile-time rounding mode of
		constant floating-point	expressions, where
		<rounding_mode>	is one of the following:

		m = round towards minus	infinity
		n = round to the nearest representable number, ties
		to even
		p = round towards plus infinity
		z = round towards zero

		Default: -yn

  Object code control options
	 -q32, -q64
		Selects	either 32-bit or 64-bit	compilation mode.
		Use the	-q32 and -q64 options, along with the
		-qarch and -qtune compiler options, to optimize	the
		output of the compiler to the architecture on which
		that output will be used.

		Default: -q32

	 -qexpfile=<file_name>
		When used together with	the -qmkshrobj or -G
		option,	saves all exported symbols in a	designated
		file.

	 -qinlglue | -qnoinlglue
		This option inlines glue code that optimizes
		external function calls	when compiling at -q64 and
		-O2 and	higher.

		Default: -qnoinlglue

	 -qpic[={small|large}] | -qnopic
		Generates position-independent code (pic).

		Specify	-qpic=small if the Table of Contents must
		be 64 Kb or smaller, or	specify	-qpic=large if it
		must be	larger than 64 Kb to avoid the overflow
		conditions.

		Default: -qpic=small

	 -qsaveopt | -qnosaveopt
		Saves the command-line options used for	compiling a
		source file, the user's	configuration file name	and
		the options specified in the configuration files,
		the version and	level of each compiler component
		invoked	during compilation, and	other information
		to the corresponding object file.
		This option must be used with the -c option.

		Default: -qnosaveopt

	 -qtbtable=<suboption>
		Generates a traceback table that contains
		information about each function, including the type
		of function as well as stack frame and register
		information. The traceback table is placed in the
		text segment at	the end	of its code.  Suboptions
		include:

		none
		     No	traceback table	is generated.
		small
		     A traceback table is generated with no name or
		     parameter information. This is the	default
		     with optimization if -g is	not specified.
		full
		     A full traceback table is generated. This is
		     the default with -qnoopt or -g specified.

		Default:
		     o -qtbtable=full when compiling non-optimized
		     (without -O) or for debugging (with -g)
		     o -qtbtable=small otherwise

	 -qthreaded
		Ensures	that all optimizations will be thread-safe
		for executing in a multi-threaded environment.

		Default:
		     -qthreaded	for the	xlf90_r, xlf90_r7, xlf95_r,
		     xlf95_r7, xlf_r, xlf_r7 and xlf2003_r,
		     xlf2008_r commands.

	 -qweakexp | -qnoweakexp
		When used with the -qmkshrobj or -G options,
		includes or excludes global symbols marked as weak
		from the export	list generated when you	create a
		shared object.

		Default: -qweakexp

  Error	checking and debugging options
	 -#	Traces the compilation and generates information on
		the progress of	the compilation	without	invoking
		the preprocessor, compiler, or linkage editor.

	 -C	Checks each reference to an array element, array
		section, or character substring	for correctness.

	 -qcheck | -qnocheck
		The long form of the -C	option.

		Default: -qnocheck

	 -qdbg[=<level>] | -qnodbg
		The long form of the -g	option.

		-qdbg=level=0
		     Equivalent	to -qnodbg or -g0.
		-qdbg=level=1
		     Equivalent	to -g1.
		-qdbg=level=2
		     Equivalent	to -g2.
		-qdbg=level=3
		     Equivalent	to -g3.
		-qdbg=level=4
		     Equivalent	to -g4.
		-qdbg=level=5
		     Equivalent	to -g5.
		-qdbg=level=6
		     Equivalent	to -g6.
		-qdbg=level=7
		     Equivalent	to -g7.
		-qdbg=level=8
		     Equivalent	to -g8.
		-qdbg=level=9
		     Equivalent	to -g9.

		Default: -qnodbg or -qdbg=level=0

	 -qdbgfmt=<suboption>
		Specifies the stabstring or DWARF format for the
		debugging information produced in object files.
		<suboption> is one of the following:

		stabstring
		     Generates debugging information in	stabstring
		     format.
		     Note: This	suboption does not generate
		     debugging information for Fortran 2003 or
		     Fortran 2008 features. Use	the dwarf suboption
		     instead for these features.
		dwarf
		     Generates debugging information in	DWARF
		     format.

		Default: -qdbgfmt=stabstring

	 -qdpcl	| -qnodpcl
		Generates symbols that can be used by tools based
		on the Dynamic Probe Class Library (DPCL) to see
		the structure of an executable file.

		Default: -qnodpcl

	 -qextchk | -qnoextchk
		Generates bind-time type-checking information and
		checks for compile-time	consistency.

		Default: -qnoextchk

	 -qflttrap[=<suboptions_list>] | -qnoflttrap
		Determines what	types of floating-point	exceptions
		to detect at run time. <suboptions_list> is a
		colon-separated	list of	one or more of the
		following suboptions:

		enable
		     Enables trapping of the specified exceptions.
		imprecise
		     Only checks for the specified exceptions on
		     subprogram	entry and exit.
		inexact
		     Detects floating-point inexact exceptions.
		invalid
		     Detects floating-point invalid operation
		     exceptions.
		nanq
		     Generates code to detect and trap NaNQ (Quiet
		     Not-a-Number) exceptions handled or generated
		     by	floating-point operations.
		overflow
		     Detects floating-point overflow.
		underflow
		     Detects floating-point underflow.
		zerodivide
		     Detects floating-point division by	zero.

		Default: -qnoflttrap

	 -qfullpath | -qnofullpath
		Records	the full or absolute path names	of source
		and include files in object files compiled with
		debugging information (when you	use the	-g option).

		Default: -qnofullpath

	 -g	Generates debugging information	for use	by a
		symbolic debugger, and makes the program state
		available to the debugging session at selected
		source locations.

		When the -O2 optimization level	is in effect, the
		debug capability is completely supported. When an
		optimization level higher than -O2 is in effect,
		the debug capability is	limited.

		-g has the following levels:

		-g0
		     Generates no debugging information. No program
		     state is preserved.
		-g1
		     Generates minimal read-only debugging
		     information about line numbers and	source file
		     names. No program state is	preserved.
		-g2
		     Generates read-only debugging information
		     about line	numbers, source	file names, and
		     variables.	When the -O2 optimization level	is
		     in	effect,	no program state is preserved.
		-g3, -g4
		     Generates read-only debugging information
		     about line	numbers, source	file names, and
		     variables.	When the -O2 optimization level	is
		     in	effect,	no program state is preserved, and
		     procedure parameter values	are available to
		     the debugger at the beginning of each
		     procedure.
		-g5, -g6, -g7
		     Generates read-only debugging information
		     about line	numbers, source	file names, and
		     variables.	When the -O2 optimization level	is
		     in	effect,	program	state is available to the
		     debugger at IF constructs,	loop constructs,
		     procedure definitions, and	procedure calls,
		     and procedure parameter values are	available
		     to	the debugger at	the beginning of each
		     procedure.
		-g8
		     Generates read-only debugging information
		     about line	numbers, source	file names, and
		     variables.	When the -O2 optimization level	is
		     in	effect,	program	state is available to the
		     debugger at the beginning of every	executable
		     statement,	and procedure parameter	values are
		     available to the debugger at the beginning	of
		     each procedure.
		-g9
		     Generates debugging information about line
		     numbers, source file names, and variables.	You
		     can modify	the value of the variables in the
		     debugger. When the	-O2 optimization level is
		     in	effect,	program	state is available to the
		     debugger at the beginning of every	executable
		     statement,	and procedure parameter	values are
		     available to the debugger at the beginning	of
		     each procedure.

		Default:
		o -g0 ,	equivalent to -qnodbg
		o When no optimization is enabled (-qnoopt), -g	is
		equivalent to -g9 or -qdbg=level=9.
		o When the -O2 optimization level is in	effect,	-g
		is equivalent to -g2 or	-qdbg=level=2.

	 -qfunctrace[<suboption>] | -qnofunctrace
		Traces entry and exit points of	procedures in your
		program. If your program contains C++ compilation
		units, this option also	traces C++ catch blocks.

		-qfunctrace+<suboption>
		     Instructs the compiler to trace the specified
		     <suboption>. All their internal procedures	are
		     traced by default.
		-qfunctrace-<suboption>
		     Instructs the compiler not	to trace the
		     specified <suboption>.

		The suboptions are:

		procedure_name
		     The name of a program, external procedure,	or
		     module procedure.
		module_name
		     The name of a module.

		procedure_name or module_name is case sensitive
		when -qmixed is	in effect. The -qfunctrace+ and
		-qfunctrace- suboptions	enable tracing for a
		specific list of procedures and	are not	affected by
		-qnofunctrace. The list	of procedures is
		cumulative.

		Default: -qnofunctrace

	 -qfunctrace_xlf_catch=<catch_routine>
		Specifies the name of the catch	tracing	subroutine.
		<catch_routine>	indicates the name of the catch
		tracing	subroutine. You	can use	the
		-qfunctrace_xlf_catch option to	specify	that the
		external or module procedure being compiled must be
		used as	a catch	tracing	procedure.

	 -qfunctrace_xlf_enter=<enter_routine>
		Specifies the name of the entry	tracing	subroutine.
		<enter_routine>	indicates the name of the entry
		tracing	subroutine. You	can use	the
		-qfunctrace_xlf_enter option to	specify	that the
		external or module procedure being compiled must be
		used as	an entry tracing procedure.

	 -qfunctrace_xlf_exit=<exit_routine>
		Specifies the name of the exit tracing subroutine.
		<exit_routine> indicates the name of the exit
		tracing	subroutine. You	can use	the
		-qfunctrace_xlf_exit option to specify that the
		external or module procedure being compiled must be
		used as	an exit	tracing	procedure.

	 -qhalt=<sev>
		Stops the compiler after the first phase if the
		severity level of errors detected equals or exceeds
		the specified level, <sev>. The	severity levels	in
		increasing order of severity are:

		i = informational messages
		l = language-level messages
		w = warning messages
		e = error messages
		s = severe error messages
		u = unrecoverable error	messages

		Default: -qhalt=s

	 -qhaltonmsg=<msg_id_list> | -qnohaltonmsg
		Stops compilation before producing any object
		files, executable files, or assembler source files
		if a specified error message is	generated.

		<msg_id_list> can be one message identifier or a
		list of	message	identifiers. To	specify	a list of
		messages, separate each	message	number with a
		colon.

		Messsage identifiers must be in	format 15cc-nnn
		where:
		o 15 Indicates an XL Fortran message;
		o cc is	a two-digit integer code that represents
		the compiler component;
		o nnn is any three-digit integer code (with leading
		zeros if necessary) that represents the	message
		number.

		Default: -qnohaltonmsg

	 -qinfo[=<suboption>] |	-qnoinfo
		Produces or suppresses informational messages.
		The suboptions are:

		all
		     Enables all diagnostic messages for all
		     groups.
		noall
		     Disables all diagnostic messages for all
		     groups.
		stp | nostp
		     Issues warnings for procedures that are not
		     protected against stack corruption. -qinfo=stp
		     has no effects unless the -qstackprotect
		     option is also enabled. Like other	-qinfo
		     options, -qinfo=stp is enabled or disabled
		     through -qinfo=all	/ noall. -qinfo=nostp is
		     the default option.

		Default: -qnoinfo
		Specifying -qinfo with no suboptions is	equivalent
		to -qinfo=all.

	 -qinit=f90ptr
		Makes the initial association status of	pointers
		disassociated instead of undefined.
		This option applies to Fortran 90 and above.

		Default:
		     The default association status of pointers	is
		     undefined.

	 -qinitalloc=[<hex_value>] | -qnoinitalloc
		Initializes allocatable	and pointer variables that
		are allocated but not initialized to a specific
		value, for debugging purposes. This option can slow
		down the execution of your program and should only
		be used	for error determination. If you	specify
		-qinitalloc without a <hex_value>, the compiler
		initializes the	value of each byte of allocated
		storage	to zero.

		Default: -qnoinitalloc

	 -qinitauto=[<hex_value>] | -qnoinitauto
		Initializes each byte or word of storage for
		automatic variables to the specified hexadecimal
		value <hex_value>. This	generates extra	code and
		should only be used for	error determination.  If
		you specify -qinitauto without a <hex_value>, the
		compiler initializes the value of each byte of
		automatic storage to zero.

		Default: -qnoinitauto

	 -qkeepparm | -qnokeepparm
		Ensures	that function parameters are stored on the
		stack even if the application is optimized. As a
		result,	parameters remain in the expected memory
		location, providing access to the values of these
		incoming parameters to tools such as debuggers.

		Default: -qnokeepparm

	 -qlinedebug | -qnolinedebug
		Generates only abbreviated line	number and source
		file name information for the debugger.

		Default: -qnolinedebug

	 -qmaxerr=<num>[:<sev>]	| -qnomaxerr
		Stops compilation when the number of error messages
		of a specified severity	level (by default, the
		value of -qhalt) or higher reaches a specified
		number.	<num> must be a	positive integer. The
		severity levels, <sev>,	are:

		i = informational messages
		l = language-level messages
		w = warning messages
		e = error messages
		s = severe error messages

		Default: -qnomaxerr

	 -qobject | -qnoobject
		Specifies whether to produce an	object file or to
		stop immediately after checking	the syntax of the
		source files.

		Default: -qobject

	 -qoptdebug | -qnooptdebug
		When used with high levels of optimization,
		-qoptdebug produces source files containing
		optimized pseudocode that can be read by a
		debugger.
		An output file with a .optdbg extension	is created
		for each input file compiled with -qoptdebug. You
		can use	the information	contained in this file to
		help you understand how	your code actually behaves
		under optimization.

		Default: -qnooptdebug

	 -qsigtrap[=<tap_handler>]
		Sets up	the specified trap handler to catch SIGTRAP
		exceptions when	compiling a file that contains a
		main program.
		This option enables you	to install a handler for
		SIGTRAP	signals	without	calling	the SIGNAL
		subprogram in the program.

	 -qwarn64 | -qnowarn64
		Enables	checking for possible data conversion
		problems between 32-bit	and 64-bit compiler modes.

		Default: -qnowarn64

	 -qxflag=dvz
		Specifying -qxflag=dvz causes the compiler to
		generate code to detect	floating-point divide-by-
		zero operations. With this option on, the extra
		code calls the external	handler	function __xl_dzx
		when the divisor is zero.
		By default, no code is generated to detect
		floating-point divide-by-zero operations.

  Listing and messages options
	 -qattr[=full] | -qnoattr
		Produces a compiler listing that includes an
		attribute listing for all identifiers. If -qattr is
		specified, the listing contains	only those
		identifiers that are used. If -qattr=full is
		specified, the listing contains	all names. If
		-qnoattr is specified, no listing is produced.

		Default: -qnoattr

	 -qflag=<listing_severity>:<terminal_severity>
		Defines	the minimum severity level of diagnostic
		messages to be written to the listing file and to
		the user terminal. <listing_severity> is the
		minimum	level for the listing file, and
		<terminal_severity> is the minimum level for the
		terminal. The message severity levels are:

		i = informational messages
		l = language-level messages
		w = warning messages
		e = error messages
		s = severe error messages
		u = unrecoverable error	messages
		q = no messages, even if the compiler encounters
		    unrecoverable errors

		Default: -qflag=i:i

	 -qlist[={offset|nooffset}] | -qnolist
		Produces a compiler listing that includes an object
		listing. You can use the object	listing	to help
		understand the performance characteristics of the
		generated code and to diagnose execution problems.

		offset | nooffset
		     Changes the offset	of the PDEF header from
		     00000 to the offset of the	start of the text
		     area.

		Specifying -qlist without the suboption	is
		equivalent to list=nooffset.

		Default: -qnolist

	 -qlistfmt={xml|html}[=<suboptions_list>]
		Creates	a report to assist with	finding
		optimization opportunities.

		xml
		     Indicates that the	report should be generated
		     in	XML format.
		html
		     Indicates that the	report should be generated
		     in	HTML format.  If an XML	report has been
		     generated before, you can convert the report
		     to	the HTML format	using the genhtml command.

		<suboptions_list> is a colon-separated list of the
		following options:

		contentSelectionList
		     Provides a	filter to limit	the type and
		     quantity of information in	the report.
		     <contentSelectionList> is a colon-separated
		     list of any of the	following suboptions:

			       data | nodata
				    Produces information about data
				    reorganizations.
			       inlines | noinlines
				    Produces inlining information.
			       pdf | nopdf
				    Produce profile-directed
				    feedback information.
			       transforms | notransforms
				    Produces information about loop
				    transformations.
			       all
				    Produces all available report
				    information.
			       none
				    Does not produce a report.

		filename
		     Specifies the name	of the report file. One
		     file is produced during the compile phase,	and
		     one file is produced during the IPA link
		     phase. If no filename is specified, a file
		     with the suffix .xml is generated in a way
		     that is consistent	with the rules of name
		     generation	for the	given platform.
		stylesheet
		     Specifies the name	of an existing XML
		     stylesheet	for which an xml-stylesheet
		     directive is embedded in the resulting report.
		     The default behavior is to	not include a
		     stylesheet. The stylesheet	shipped	with XL
		     Fortran is	xlstyle.xsl. This stylesheet
		     renders the XML to	an easily read format when
		     viewed using a browser that supports XSLT.
		version
		     Specifies the major version name of the report
		     to	be generated. If you have written a tool
		     that requires a certain version of	this
		     report, you need to specify the version.

		When used with an option that enables inlining such
		as -qinline, the report	shows which functions were
		inlined	and why	others were not	inlined.

		To generate a loop transformation listing, you must
		also specify one of the	following options on the
		command	line:
		o -qsimd=auto
		o -qsmp
		o -O5
		o -qipa=level=2

		To generate a parallel transformation listing or
		parallel performance messages, you must	also
		specify	one of the following options on	the command
		line:
		o -qsmp
		o -O5
		o -qipa=level=2

		When used with the option that enables profiling,
		-qpdf, the report contains information about call
		and block counts and cache misses.

		When used with an option that produces data
		reorganizations	such as	-qipa=level=2, the report
		contains information about those reorganizations.

		Default: This option is	not on by default. If no
		<contentSelectionList> options are selected in
		their positive form, all available report
		information is produced. For example, specifying
		-qlistfmt=xml is equivalent to -qlistfmt=xml=all.

	 -qlistopt | -qnolistopt
		Produces a compiler listing that displays all the
		options	that were in effect when the compiler was
		invoked.

		Default: -qnolistopt

	 -qphsinfo | -qnophsinfo
		Reports	the time taken in each compilation phase.
		Phase information is sent to standard output. The
		output takes the form <number1>/<number2> for each
		phase where <number1> represents the CPU time used
		by the compiler	and <number2> represents the total
		of the compiler	time and the time that the CPU
		spends handling	system calls.

		Default: -qnophsinfo

	 -qnoprint
		Prevents the compiler from creating the	listing
		file, regardless of the	settings of other listing
		options.

	 -qreport[={smplist|hotlist}] |	-qnoreport
		Determines whether to produce transformation
		reports	showing	how the	program	is parallelized	and
		how loops are optimized. The compiler also reports
		the number of streams created for a given loop.
		A listing file is generated with a .lst	suffix for
		each source file named on the command line.
		To generate data reorganization	information,
		specify	the optimization level -qipa=level=2 or	-O5
		together with -qreport.
		To generate information	about data prefetch
		insertion locations, use the optimization level	of
		-qhot, or any other option that	implies	-qhot
		together with -qreport.

		Suboptions are:

		smplist	| hotlist
		     smplist produces a	report showing how the
		     program is	parallelized.
		     hotlist produces a	report showing how loops
		     are transformed.

		Specifying -qreport with no suboptions is
		equivalent to -qreport=hotlist.

		Default: -qnoreport

	 -qsource | -qnosource
		Produces a compiler listing that includes source
		code.

		Default: -qnosource

	 -qstackprotect[={all |	size=N}] | -qnostackproteck
		Provides protection against malicious code or
		programming errors that	overwrite or corrupt the
		stack. The suboptions are:

		all
		     Protects all procedures whether or	not there
		     are vulnerable objects. This option is not	set
		     by	default.
		size=N
		     Protects all procedures containing	automatic
		     objects greater or	equal to N bytes in size.
		     The default size is 8 when	-qstackprotect is
		     enabled.

		Note:
		     o This option cannot be used with @PROCESS
		     options.
		     o This feature can	only be	utilized in the
		     following OS levels:
		       - AIX 5.3/TL11 and up.
		       - AIX 6.1/TL4 and up.

		Default: -qnostackprotect

	 -qsuppress[={<msg_nums_list>|cmpmsg}] | -qnosuppress
		Determines which messages to suppress from the
		output stream. The suboptions are:

		<msg_nums_list>
		     A colon-separated list of 7-digit compiler
		     message numbers.
		cmpmsg
		     Suppresses	the informational messages that
		     report compilation	progress and a successful
		     completion.

		Default: -qnosuppress

	 -v	Instructs the compiler to report information on	the
		progress of the	compilation, and names the programs
		being invoked within the compiler and the options
		being specified	to each	program. Information is
		displayed in a comma-separated list.

	 -V	Instructs the compiler to report information on	the
		progress of the	compilation, and names the programs
		being invoked within the compiler and the options
		being specified	to each	program. Information is
		displayed in a space-separated list.

	 -qversion[=verbose] | -qnoversion
		Displays the official compiler product name and
		version	information and	exits; compilation is
		stopped.

		verbose
		     Displays component	information in the
		     following format:
		     comp_name Version:	VV.RR(product_name) Level:
		     comp_level
		     where:
		     comp_name specifies an installed component,
		     such as the low-level optimizer.
		     comp_level	represents the level of	the
		     installed component.

		Default: -qnoversion

	 -w	Suppresses informational, language-level and
		warning	messages.
		Specifying this	option is equivalent to	specifying
		-qflag=e:e.

	 -qxref[=full] | -qnoxref
		Specifies whether to produce a compiler	listing
		that includes a	cross-reference	listing	of all
		identifiers.
		Specifying -qxref will report only identifiers that
		are used, -qxref=full reports all identifiers in
		the program, and -qnoxref does not report any
		identifiers in the program. The	-qnoprint option
		overrides this option.

		Default: -qnoxref

  Optimization and tuning options
	 -qalias=<suboptions_list>
		Indicates whether a program contains certain
		categories of aliasing to determine whether certain
		optimizations are performed. <suboptions_list> is a
		colon-separated	list of	the following suboptions:

		aryovrlp | noaryovrlp
		     When enabled the program contains array
		     assignments of overlapping	or storage-
		     associated	arrays.
		     Default: aryovrlp
		intptr | nointptr
		     When enabled, the program contains	integer
		     pointer declarations.
		     Default: nointptr
		pteovrlp | nopteovrlp
		     When selected, the	program	contains pointee
		     variables that refer to non-pointee variables,
		     or	two pointee variables that refer to the
		     same storage location.
		     Default: pteovrlp
		std | nostd
		     When selected, the	program	contains only
		     standard-conforming aliasing.
		     Default: std
		     (-qalias=nostd replaces the obsolete
		     -qxflag=xalias option.)

		Default:
		     o -qalias=aryovrlp:intptr:pteovrlp:std for	the
		     xlf, xlf_r, xlf_r7, f77, and fort77 commands.
		     o -qalias=aryovrlp:nointptr:pteovrlp:std for
		     all other invocation commands.

	 -qarch=<suboption>
		Specifies the general processor	architecture for
		which the code (instructions) should be	generated.
		In general, the	-qarch option allows you to target
		a specific architecture	for the	compilation.  For
		any given -qarch setting, the compiler defaults	to
		a specific, matching -qtune setting, which can
		provide	additional performance improvements.  The
		suboptions are:

		auto
		     Automatically detects the specific
		     architecture of the compiling machine. It
		     assumes that the execution	environment will be
		     the same as the compilation environment.
		604
		     Produces an object	that contains instructions
		     that run on PowerPC 604 systems.
		pwr3
		     Produces an object	that contains instructions
		     that run on the POWER3 and	POWER3 compatible
		     hardware platforms.
		pwr4
		     Produces an object	that contains instructions
		     that run on the POWER4 and	POWER4 compatible
		     hardware platforms.
		pwr5
		     Produces an object	that contains instructions
		     that run on the POWER5 and	POWER5 compatible
		     hardware platforms.
		pwr5x
		     Produces an object	that contains instructions
		     that run on the POWER5+ and POWER5+ compatible
		     hardware platforms.
		pwr6
		     Produces object code containing instructions
		     that will run on the POWER6 or POWER6
		     compatible	hardware platforms running in
		     POWER6 or POWER6 compatible architected mode.
		     If	you would like support for decimal
		     floating-point instructions, be sure to
		     specify this suboption during compilation.
		pwr6e
		     Produces object code containing instructions
		     that will run on the POWER6 hardware platforms
		     running in	POWER6 enhanced	mode.
		pwr7
		     Produces object code containing instructions
		     that will run on the POWER7 hardware
		     platforms.
		ppc
		     Produces an object	that contains instructions
		     that run on any of	the 32-bit Power hardware
		     platforms.	 Using -q64 with ppc upgrades the
		     architecture to ppc64.
		ppc64
		     Produces object code that will run	on any 64-
		     bit Power hardware	platform. When compiled	in
		     32-bit mode, the resulting	object code may
		     include instructions that are not recognized
		     or	behave differently when	run on 32-bit Power
		     platforms.
		ppcgr
		     In	32-bit mode, produces object code
		     containing	optional graphics instructions for
		     Power hardware platforms.
		     In	64-bit mode, produces object code
		     containing	optional graphics instructions that
		     will run on 64-bit	Power platforms, but not on
		     32-bit-only platforms. Using -q64 with ppcgr
		     upgrades the architecture to ppc64gr.
		ppc64gr
		     Produces object code that will run	on any 64-
		     bit Power hardware	platform that supports the
		     optional graphics instructions.
		ppc64grsq
		     Produces object code that will run	on any 64-
		     bit Power hardware	platform that supports the
		     optional graphics and square root
		     instructions.
		ppc64v
		     Produces object code that will run	on any 64-
		     bit Power hardware	platform that supports the
		     optional vector instructions, such	as a
		     PowerPC 970.
		ppc970
		     Generates instructions specific to	PowerPC	970
		     processors.
		rs64a
		     Produces an object	that contains instructions
		     that run on an RS64I hardware platform.
		rs64b
		     Produces an object	that contains instructions
		     that run on an RS64II hardware platform.
		rs64c
		     Produces an object	that contains instructions
		     that run on an RS64III hardware platform.

		Default: -qarch=ppc

	 -qassert=<suboption>
		Provides information about the program to help
		fine-tune optimizations. Suboptions include:

		deps | nodeps
		     Specifies whether or not any loop-carried
		     dependencies exist.
		itercnt=<n>
		     The iteration count of a typical loop is <n>.
		minitercnt=<n>
		     Specifies the expected minimum iteration count
		     of	the loops in the program. n must be a
		     positive integer.
		maxitercnt=<n>
		     Specifies the expected maximum iteration count
		     of	the loops in the program. n must be a
		     positive integer.
		CONTIGuous | NOCONTIGuous
		     When -qassert=contiguous is enabled, the
		     compiler assumes that:
		     o For all compilation units in the	program,
		     all array pointers	are pointer associated with
		     contiguous	targets.
		     o All assumed shape arrays	are argument
		     associated	with contiguous	actual arguments.
		     When -qassert=contig is specified,	the
		     compiler can perform optimizations	according
		     to	the memory layout of the objects occupying
		     contiguous	blocks of memory.
		     Default:  NOCONTIGuous
		     Note:
		     o The contiguous suboption	is not supported
		     through the IBM ASSERT directive.
		     o For Fortran 2008, to ensure proper results,
		     use the CONTIGUOUS	attribute, which undergoes
		     syntax and	semantic checking.
		refalign | norefalign
		     Specifies that all	pointers inside	the
		     compilation unit only point to data that is
		     naturally aligned according to the	length of
		     the pointer types.

		Default:  -qassert=deps:norefalign:nocontig

	 -qcache=<suboptions_list>
		Describes the cache configuration for a	specific
		target execution machine, where	<suboptions_list>
		is a colon-separated list of one or more of the
		following suboptions:

		assoc=<number>
		     Specifies the set associativity of	the cache,
		     where <number> is one of the following:
			  0	    Direct-mapped cache
			  1	    Fully associative cache
			  (n > 1)   n-way set associative cache
		auto
		     Automatically detects the specific	cache
		     configuration of the compiling machine. It
		     assumes that the execution	environment will be
		     the same as the compilation environment.
		cost=<cycles>
		     Specifies the performance penalty,	in CPU
		     cycles, resulting from a cache miss.
		level=<level>
		     Specifies which level of cache is affected,
		     where level is one	of the following:
			  1	Basic cache
			  2	Level-2	cache
			  3	Table Lookaside	Buffer (TLB)
		     If	a machine has more than	one level of cache,
		     use a separate -qcache option.
		line=<bytes>
		     Specifies the line	size of	the cache.
		size=<Kbytes>
		     Specifies the total size of the cache.
		type=<cache_type>
		     The settings apply	to the specified type of
		     cache, where <cache_type> is one of the
		     following:
			  c = Combined data and	instruction cache
			  d = Data cache
			  i = Instruction cache

		Default:
		     The -qtune	setting	determines the optimal
		     default -qcache settings for most typical
		     compilations. -O4,	-O5, or	-qipa must be
		     specified with the	-qcache	option.

	 -qcompact | -qnocompact
		Reduces	code size where	possible, at the expense of
		execution speed. Code size is reduced by inhibiting
		optimizations that replicate or	expand code inline.
		This option takes effect only if -O2 or	higher is
		also used.

		Default: -qnocompact

	 -qdirectstorage | -qnodirectstorage
		Informs	the compiler that write-through-enabled	or
		cache-inhibited	storage	may be referenced.

		Default: -qnodirectstorage

	 -qessl	| -qnoessl
		Specifies that,	if either -lessl or -lesslsmp are
		also specified,	then Engineering and Scientific
		Subroutine Library (ESSL) routines should be used
		in place of some Fortran 90 intrinsic procedures
		when there is a	safe opportunity to do so.

		Default: -qnoessl

	 -qfdpr	| -qnofdpr
		Collects information about programs for	use with
		the IBM	Feedback Directed Program Restructuring
		(FDPR) performance-tuning utility.

		Default: -qnofdpr

	 -qhot[=<suboption>] | -qnohot
		Specifies whether or not to perform high-order
		transformations	during optimization. The suboptions
		are:

		arraypad[=<number>] | noarraypad
		     When <number> is specified, the compiler will
		     pad every array in	the code. The pad amount
		     must be a positive	integer	value. Otherwise,
		     the compiler will pad any arrays where it
		     infers that there may be a	benefit.
		level={0|1|2}
		     Specifies the level of high-order
		     transformation to perform during compilation.
		     0
			  The compiler performs	a subset of the
			  high-order transformations. Some of these
			  include early	distribution, loop
			  interchange, and loop	tiling,	as
			  examples. Optimization level -O3 implies
			  -qhot=level=0.
		     1
			  At level=1, full high-order
			  transformation is performed.
			  -qhot=level=1	is equivalent to -qhot and
			  the compiler options that imply -qhot
			  also imply -qhot=level=1, unless
			  -qhot=level=0	is explicitly specified.
		     2
			  The compiler performs	the default set	of
			  high-order transformations and some more
			  aggressive loop transformations.
			  -qhot=level=2	must be	used with -qsmp.
		vector | novector
		     When specified with -qnostrict, or	an
		     optimization level	of -O3 or higher (otherwise
		     -qhot=vector has no effect), the compiler
		     converts certain operations in a loop that
		     apply to successive elements of an	array into
		     a call to a routine in the	Mathematical
		     Acceleration Subsystem (MASS) library, part of
		     the libxlopt.a library.
		     If	you specify -qhot=novector, the	compiler
		     performs optimizations on loops and arrays,
		     but avoids	replacing certain code with calls
		     to	vector library routines.
		fastmath | nofastmath
		     Tunes your	application to either use fast
		     scalar versions of	math functions or use the
		     default versions.
		     -qhot=fastmath enables the	replacement of math
		     routines with available math routines from	the
		     XLOPT library only	if -qstrict=nolibrary is
		     enabled. -qhot=fastmath is	enabled	by default
		     if	-qhot is specified regardless of the hot
		     level.

		Default:
		     o -qnohot
		     o -qhot=noarraypad:level=0:novector:fastmath
		     when -O3 is in effect.
		     o -qhot=noarraypad:level=1:vector:fastmath	when -qsmp,
		     -O4 or -O5	is in effect.

	 -qipa[=<suboptions_list>] | -qnoipa
		Turns on or customizes a class of optimizations
		known as interprocedural analysis (IPA).
		<suboptions_list> is a colon-separated list of the
		following suboptions:

		exits=<procedure_names>
		     Specifies names of	procedures which represent
		     program exits.  <procedure_names> is a comma-
		     separated list of procedure names.
		isolated=<procedures>
		     Specifies a comma-separated list of procedures
		     that are not compiled with	-qipa and do not
		     directly refer to any global variable.
		level=<level>
		     Determines	the amount of IPA analysis and
		     optimization performed, where <level> can be
		     equal to:
		     0
			  Performs only	minimal	interprocedural
			  analysis and optimization.
		     1
			  Turns	on inlining, limited alias
			  analysis, and	limited	call-site
			  tailoring.
		     2
			  Full interprocedural data flow and alias
			  analysis.
			  To generate data reorganization
			  information, specify the optimization
			  level	-qipa=level=2 or -O5 together with
			  -qreport.
		     Default: 1
		list[={<file_name>|short|long}]
		     Specifies an output listing file name during
		     the link phase. The default name is "a.lst".
		     Specifying	'long' or 'short' can be used to
		     request more or less information in the
		     listing file to determine which listing
		     sections will be included.
		     Default: short
		lowfreq=<procedures>
		     Specifies a comma-separated list of procedures
		     that are likely to	be called infrequently
		     during the	course of a typical program run.
		malloc16 | nomalloc16
		     Informs the compiler that the dynamic memory
		     allocation	routines will return 16-byte
		     aligned memory addresses. The compiler can
		     then optimize the code based on that
		     assertion.
		     Default: malloc16
		missing={unknown|safe|isolated|pure}
		     Specifies the default assumption for
		     procedures	not compiled with -qipa.
		     unknown
			  Greatly restricts the	amount of
			  interprocedural optimization for calls to
			  unknown procedures.
		     safe
			  Procedures which do not indirectly call a
			  visible (not missing)	procedure either
			  through direct call or procedure pointer.
		     isolated
			  Procedures which do not directly
			  reference global variables accessible	to
			  visible procedures.
		     pure
			  Procedures which are safe and	isolated
			  and which do not indirectly alter storage
			  accessible to	procedures.
		     Default: missing=unknown
		object | noobject
		     Specifies whether to include standard object
		     code in the object	files. Specifying
		     'noobject'	can substantially reduce overall
		     compile time by not generating object code
		     during the	first IPA phase.
		partition={small|medium|large}
		     Specifies the size	of program sections that
		     are analyzed together. Larger partitions may
		     produce better analysis but require more
		     storage.
		     Default: partition=medium
		pure=<procedures>
		     Specifies a comma-separated list of procedures
		     not compiled with -qipa and that are
		     "isolated", "safe", and do	not modify any data
		     objects that are visible to the caller.
		relink=<functions>
		     Creates relinkable	objects	by packaging them
		     into a nonexecutable file.	You must use the -r
		     option along with this suboption. If you use
		     -qipa=noobject (either directly or	indirectly)
		     and use the relink	suboption, you must link
		     the resulting object files	with -qipa.
		safe=<procedures>
		     Specifies a comma-separated list of procedures
		     not compiled with -qipa and that do not call
		     any other part of the program.
		stdexits | nostdexits
		     Specifies that compiler-defined exit routines
		     can be optimized as with the "exits"
		     suboption.	The procedures are abort, exit,
		     _exit, and	_assert.
		     Default: nostdexits
		threads[=<suboption>] |	nothreads
		     Runs portions of the IPA optimization process
		     during pass 2 in parallel threads,	which can
		     speed up the linking process on multi-
		     processor systems.	<suboption> can	be one of
		     the following:
		     auto | noauto
			  When auto is in effect, the compiler
			  selects a number of threads heuristically
			  based	on machine load. When noauto is	in
			  effect, the compiler spawns one thread
			  per machine processor.
		     <number>
			  Instructs the	compiler to use	a specific
			  number of threads. <number> can be any
			  integer value	in the range of	1 to 32767.
			  However, <number> is effectively limited
			  to the number	of processors available	on
			  your system.
		     Specifying	threads	with no	suboptions implies
		     threads=auto.
		     Default: -qipa=threads
		unknown=<procedures>
		     Specifies a comma-separated list of procedures
		     that are not compiled with	-qipa and that may
		     update global variables and dummy arguments
		     and call other parts of the program compiled
		     with -qipa.
		<file_name>
		     Specifies the name	of a file that contains
		     suboption information in a	special	format.

		Regular	expressions are	supported when specifying
		procedure names	for these suboptions:
		exits, isolated, lowfreq, pure,	safe, unknown.

		Default:
		     o -qnoipa
		     o -qipa=level=1:missing=unknown:
		     partition=medium:threads=auto when	-O4 is in
		     effect.
		     o -qipa=level=2:missing=unknown:
		     partition=medium:threads=auto when	-O5 is in
		     effect.
		     o -qipa=level=0:missing=unknown:
		     partition=medium:threads=auto when	-qpdf1 or
		     -qpdf2 is in effect.

	 -qlargepage | -qnolargepage
		Indicates that a program, designed to execute in a
		large page memory environment, can take	advantage
		of large pages provided	on certain Power systems.

		Default: -qnolargepage

	 -qlibansi | -qnolibansi
		Assumes	that all functions with	the name of an ANSI
		C defined library function are,	in fact, the
		library	functions.

		Default: -qnolibansi

	 -qlibessl | -qnolibessl
		Assumes	that all functions with	the name of an ESSL
		defined	library	functions are, in fact,	the library
		functions.

		Default: -qnolibessl

	 -qlibposix | -qnolibposix
		Assumes	that all functions with	the name of an IEEE
		1003.1-2001 (POSIX) defined library function are,
		in fact, the system functions.

		Default: -qnolibposix

	 -qlibmpi | -qnolibmpi
		Asserts	that all functions with	Message	Passing
		Interface (MPI)	names are in fact MPI functions	and
		not a user function with different semantics.
		-qlibmpi allows	the compiler to	generate better
		code because it	knows about the	behavior of a given
		function, such as whether or not it has	any side
		effects.

		Default: -qnolibmpi

	 -qmaxmem=<size>
		Limits the amount of memory used by certain
		memory-intensive optimizations to <size> kilobytes.
		When <size> is -1, the optimizer will use as much
		memory as needed.

		Default:
		     o -qmaxmem=8192 when -O2 level optimization is
		     set.
		     o -qmaxmem=-1 when	-O3 level or greater
		     optimization is set.

	 -qminimaltoc |	-qnominimaltoc
		Avoids Table of	Contents (TOC) overflow	conditions
		by placing TOC entries into a separate data section
		for each object	file. By default, the compiler will
		allocate at least one TOC entry	for each unique
		non-automatic variable reference in your program.

		Default: -qnominimaltoc

	 -O[<level>]
		Optimizes code at a choice of levels during
		compilation. This is equivalent	to
		-qoptimize[=<level>]. <level> can be:

		0
		     Performs only quick local optimizations such
		     as	constant folding and elimination of local
		     common subexpressions.
		2
		     Performs optimizations that the compiler
		     developers	considered the best combination	for
		     compilation speed and runtime performance.	The
		     optimizations may change from product release
		     to	release.
		3
		     Performs some memory and compile-time
		     intensive optimizations in	addition to those
		     executed with -O2.	The -O3	specific
		     optimizations have	the potential to alter the
		     semantics of a program. The compiler guards
		     against these optimizations at -O2	and the
		     option -qstrict is	provided at -O3	to turn	off
		     these aggressive optimizations.
		     Specifying	-O3 implies -qhot=level=0.
		4
		     This option is the	same as	-O3, but also:
		       o sets the -qarch and -qtune options to the
		       architecture of the compiling machine.
		       o sets the -qcache option most appropriate
		       to the characteristics of the compiling
		       machine.
		       o sets the -qipa	option.
		       o sets the -qhot	option to level=1.
		5
		     Equivalent	to -O4 -qipa=level=2.

		Specifying -O with no <level> is equivalent to
		specifying -O2.

		Default: -O0

	 -qoptimize[=<level>] |	-qnooptimize
		The long form of the -O	option.	-qoptimize=<level>
		is equivalent to -O<level>. See	the -O option.

		Default: -qnooptimize

	 -p[g]	Sets up	the object files produced by the compiler
		for profiling.
		-pg is like -p,	but it produces	more extensive
		statistics.

	 -qpdf1[=<suboption_list>] | -qnopdf1
		Tunes optimizations through profile-directed
		feedback (PDF),	where results from sample program
		execution are used to improve optimization near
		conditional branches and in frequently executed
		code sections.	Optimizes an application for a
		typical	usage scenario based on	an analysis of how
		often branches are taken and blocks of code are
		run.
		<suboptions_list> is a colon-separated list of the
		following suboptions:

		pdfname=<file_path>
		     Specifies the directories and names for PDF
		     files and any existing PDF	map files. By
		     default, if the PDFDIR environment	variable is
		     set, the compiler places the PDF and PDF map
		     files in the directory specified by PDFDIR.
		     Otherwise,	if the PDFDIR environment variable
		     is	not set, the compiler places these files in
		     the current working directory. If the PDFDIR
		     environment variable is set but the specified
		     directory does not	exist, the compiler issues
		     a warning message.	The name of the	PDF map
		     file follows the name of the PDF file.
		level =	0 | 1 |	2
		     Supports multiple-pass profiling, cache miss,
		     block counter, call counter and extended value
		     profiling.	You can	compile	your application
		     with -qpdf1=level=0|1|2 to	generate profiling
		     data with different levels	of optimization.
		     The following is a	list of	detailed
		     descriptions for each level of optimization:
		       o 0  is the basic compiler instrumentation
		       which generates lower overhead than
		       -qpdf1=level=1.
		       o 1 is the default compiler instrumentation
		       which is	equivalent to -qpdf1 in	previous
		       releases.
		       o 2 is a	more aggressive	compiler
		       instrumentation which supports multiple pass
		       profiling. This suboption is supported at
		       all PDF optimization levels.
		exename
		     Generates the name	of the PDF file	based on
		     what you specify with the -o option. You can
		     use this suboption	with -qpdf1.
		defname
		     Reverts the PDF file to its default file name.
		     You can use this suboption	with -qpdf1.

		Default: -qnopdf1

	 -qpdf2[=<suboption_list>] | -qnopdf2
		Tunes optimizations through profile-directed
		feedback (PDF),	where results from sample program
		execution are used to improve optimization near
		conditional branches and in frequently executed
		code sections.	Optimizes an application for a
		typical	usage scenario based on	an analysis of how
		often branches are taken and blocks of code are
		run.

		pdfname=<file_path>
		     Specifies the directories and names for PDF
		     files and any existing PDF	map files. By
		     default, if the PDFDIR environment	variable is
		     set, the compiler places the PDF and PDF map
		     files in the directory specified by PDFDIR.
		     Otherwise,	if the PDFDIR environment variable
		     is	not set, the compiler places these files in
		     the current working directory. If the PDFDIR
		     environment variable is set but the specified
		     directory does not	exist, the compiler issues
		     a warning message.	The name of the	PDF map
		     file follows the name of the PDF file.
		exename
		     Generates the name	of the PDF file	based on
		     what you specify with the -o option. You can
		     use this suboption	with -qpdf2.
		defname
		     Reverts the PDF file to its default file name.
		     You can use this suboption	with -qpdf2.

		Default: -qnopdf2

	 -qprefetch [=<suboption_list>]	| -qnoprefetch
		Enables	generation of prefetching instructions such
		as dcbt	and dcbz in compiled code.
		<suboptions_list> is a colon-separated list of the
		following suboptions:

		assistthread | noassistthread
		     Use this supoption	to work	with applications
		     that generate a high cache-miss rate. When	you
		     run -qprefetch=assistthread, the compiler uses
		     the delinquent load information to	perform
		     analysis and generates prefetching	assist
		     threads.
		aggressive | noaggressive
		     When you run this supoption, the system guides
		     the compiler to generate aggressive data
		     prefetching at optimization level -O3 -qhot or
		     higher.
		     Default: noaggressive
		You can	specify	system architectures when using
		-qprefetch=assistthread:
		     CMP
			  For systems based on the chip	multi-
			  processor architecture (CMP),	use
			  -qprefetch=assistthread=cmp.
		     SMT
			  For systems based on the simultaneous
			  multi-threading architecture (SMT), use
			  -qprefetch=assistthread=smt.

		     Default:
		     o -qprefetch
		     o -qprefetch=noassistthread
		     o -qprefetch=noassistthread:noaggressive

	 -qinline[<suboption>] | -qnoinline
		Attempts to inline procedures instead of generating
		calls to those procedures, for improved
		performance.

		You must specify a minimum optimization	level of
		-O2 along with -qinline	to enable inlining of
		procedures. You	can also use the -qinline option to
		specify	restrictions on	the procedures that should
		or should not be inlined.

		-qinline+<procedure_name>
		     Attempts to inline	the procedures listed in
		     <procedure_name> and any other appropriate
		     procedures, where <procedure_name>	is a
		     colon-separated list.
		-qinline-<procedure_name>
		     Specifies that procedures listed in
		     <procedure_name> do not get inlined, where
		     <procedure_name> is a colon-separated list.
		auto | noauto
		     Enables or	disables auto inlining.
		level=number
		     The values	you specify must be positive
		     integers between 0	and 10 inclusive. The
		     default value for number is 5. Larger values
		     increase the likelihood of	inlining.

		Default:
		     o -qinline=noauto:level=5
		     o At an optimization level	of -O0,	-qinline
		     implies -qinline=noauto:level=5
		     o At an optimization level	of -O2 or higher,
		     -qinline implies -qinline=auto:level=5

	 -qshowpdf | -qnoshowpdf
		Used with -qpdf1 and a minimum optimization level
		of -O2 to create a PDF map file	containing
		additional profiling information to be consumed	by
		the showpdf tool.

		Default: -qshowpdf

	 -qsimd[=<suboption>]
		Controls whether the compiler can automatically
		take advantage of vector instructions for
		processors that	support	them. -qsimd can take the
		following suboption:

		auto | noauto
		     Enables or	disables the automatic generation
		     of	vector instructions for	processors that
		     support them.

		Default: -qsimd=noauto

	 -qsmallstack[=<suboption>] | -qnosmallstack
		Specifies that the compiler will minimize stack
		usage where possible. This option can take the
		form:

		-qsmallstack
		     Enables only general small	stack
		     transformations.
		-qsmallstack=dynlenonheap
		     Asserts that automatic variables which are
		     dynamically-sized are allocated from the heap
		     and enables general small stack
		     transformations.
		-qsmallstack=nodynlenonheap
		     Disables dynamic-length variable allocation.
		-qnosmallstack
		     Disables only the general small stack
		     transformations.

		Default: -qnosmallstack

	 -qsmp[=<suboptions_list>] | -qnosmp
		Enables	parallelization	of program code.
		<suboptions_list> is a colon-separated list of one
		or more	of the following suboptions:

		auto | noauto
		     Enables automatic parallelization and
		     optimization. If noauto is	specified,
		     automatic parallelization of program code is
		     disabled; only program code explicitly
		     parallelized with OpenMP directives is
		     optimized.
		     Default: auto
		nested_par | nonested_par
		     If	nested_par is specified, prescriptive
		     nested parallel constructs	are parallelized by
		     the compiler.
		     Default: nonested_par
		omp | noomp
		     Enables strict OpenMP compliance. Only OpenMP
		     parallelization directives	are recognized.
		     Default: noomp
		opt | noopt
		     Enables automatic parallelization but disables
		     optimization of parallelized program code.	If
		     noopt is specified, optimization of
		     parallelized program code is disabled.
		     Default: opt
		ostls |	noostls
		     Enables Thread Local Storage (TLS)	provided by
		     the operating system to be	used for
		     threadprivate data. The noostls suboption is
		     to	enable the non-TLS for threadprivate.
		     Default: ostls
		rec_locks | norec_locks
		     Specifies whether to use recursive	locks.
		     Default: norec_locks
		schedule=<type>
		     Specifies what kinds of scheduling	algorithms
		     and chunking are used for loops to	which no
		     other scheduling algorithm	has been explicitly
		     assigned in the source code. <type> can be:
		       o affinity[=<num>]
		       o auto
		       o dynamic[=<num>]
		       o guided[=<num>]
		       o runtime
		       o static[=<num>],
		     where <num> is the	number of loop iterations.
		     Default: schedule=auto
	   stackcheck |	nostackcheck
		Causes the compiler to check for stack overflow	by
		worker threads at run time, and	issue a	warning	if
		the remaining stack size is less than the number of
		bytes specified	by the stackcheck option of the
		XLSMPOPTS environment variable.	This suboption is
		intended for debugging purposes, and only takes
		effect when XLSMPOPTS=stackcheck is also set.
		Default: nostackcheck
	   threshold[=<num>]
		When -qsmp=auto	is in effect, controls the amount
		of automatic loop parallelization that occurs. The
		value of <num> represents the lower limit allowed
		for parallelization of a loop, based on	the level
		of "work" present in a loop.
		Default:
		  <num>	must be	a positive integer of 0	or greater.
		  If you specify threshold with	no suboption, the
		  program uses a default value of 100.

	   Specifying -qsmp without suboptions is equivalent to
	   -qsmp=auto:explicit:opt:noomp:norec_locks:
	   nonested_par:schedule=auto:nostackcheck:threshold=100:ostls

	   Default: -qnosmp

	 -qstacktemp=<num>
		Determines where to allocate applicable	compiler
		temporaries at run time. The allocation	depends	on
		the value of <num>. The	values are:

		0
		     Indicates that the	compiler will decide
		     whether to	allocate the applicable	compiler
		     temporaries on the	heap or	the stack.
		-1
		     Indicates that applicable compiler	temporaries
		     are to be always allocated	on the stack. This
		     is	the best-performing setting but	uses the
		     most amount of stack storage.
		(1 or greater)
		     Indicates that applicable compiler	temporaries
		     less than this value (bytes) should be
		     allocated on the stack and	those greater than
		     or	equal to this value should be allocated	on
		     the heap.

		Default: -qstacktemp=0

	 -qstrict[=<suboptions_list>] |	-qnostrict
		Ensures	that optimizations done	by default at
		optimization levels -O3, and higher, and optionally
		at -O2,	do not alter the semantics of a	program.

		The -qstrict=all, -qstrict=precision,
		-qstrict=exceptions, -qstrict=ieeefp, and
		-qstrict=order suboptions and their negative forms
		are group suboptions that affect multiple,
		individual suboptions. Group suboptions	act as if
		either the positive or the no form of every
		suboption of the group is specified.

		Default:

		     o Always -qstrict or -qstrict=all when the
		     -qnoopt or	-O0 optimization level is in effect
		     o -qstrict	or -qstrict=all	is the default when
		     the -O2 or	-O optimization	level is in effect
		     o -qnostrict or -qstrict=none is the default
		     when -O3 or a higher optimization level is	in
		     effect

		<suboptions_list> is a colon-separated list of one
		or more	of the following:

		all | none
		     all disables all semantics-changing
		     transformations, including	those controlled by
		     the ieeefp, order,	library, precision, and
		     exceptions	suboptions.  none enables these
		     transformations.
		precision | noprecision
		     precision disables	all transformations that
		     are likely	to affect floating-point precision,
		     including those controlled	by the subnormals,
		     operationprecision, association,
		     reductionorder, and library suboptions.
		     noprecision enables these transformations.
		exceptions | noexceptions
		     exceptions	disables all transformations likely
		     to	affect exceptions or be	affected by them,
		     including those controlled	by the nans,
		     infinities, subnormals, guards, and library
		     suboptions. noexceptions enables these
		     transformations.
		ieeefp | noieeefp
		     ieeefp disables transformations that affect
		     IEEE floating-point compliance, including
		     those controlled by the nans, infinities,
		     subnormals, zerosigns, and	operationprecision
		     suboptions. noieeefp enables these
		     transformations.
		nans | nonans
		     nans disables transformations that	may produce
		     incorrect results in the presence of, or that
		     may incorrectly produce IEEE floating-point
		     NaN (not-a-number)	values.	nonans enables
		     these transformations.
		infinities | noinfinities
		     infinities	disables transformations that may
		     produce incorrect results in the presence of,
		     or	that may incorrectly produce floating-point
		     infinities.  noinfinities enables these
		     transformations.
		subnormals | nosubnormals
		     subnormals	disables transformations that may
		     produce incorrect results in the presence of,
		     or	that may incorrectly produce IEEE
		     floating-point subnormals (formerly known as
		     denorms). nosubnormals enables these
		     transformations.
		zerosigns | nozerosigns
		     zerosigns disables	transformations	that may
		     affect or be affected by whether the sign of a
		     floating-point zero is correct. nozerosigns
		     enables these transformations.
		operationprecision | nooperationprecision
		     operationprecision	disables transformations
		     that produce approximate results for
		     individual	floating-point operations.
		     nooperationprecision enables these
		     transformations.
		vectorprecision	| novectorprecision
		     vectorprecision disables vectorization in
		     loops where it might produce different results
		     in	vectorized iterations than in nonvectorized
		     residue iterations, to ensure that	every loop
		     iteration of identical floating point
		     operations	on identical data produces
		     identical results.	novectorprecision enables
		     vectorization even	when different iterations
		     might produce different results from the same
		     inputs.
		order |	noorder
		     order disables all	code reordering	between
		     multiple operations that may affect results or
		     exceptions, including those controlled by the
		     association, reductionorder, and guards
		     suboptions. noorder enables code reordering.
		association | noassociation
		     association disables reordering operations
		     within an expression. noassociation enables
		     reordering	operations.
		reductionorder | noreductionorder
		     reductionorder disables parallelizing
		     floating-point reductions.	noreductionorder
		     enables parallelizing these reductions.
		guards | noguards
		     guards disables moving operations past guards
		     (that is, past IF statements, out of loops, or
		     past subroutine or	function calls which might
		     end the program) which control whether the
		     operation should be executed. noguards enables
		     moving operations past guards.
		library	| nolibrary
		     library disables transformations that affect
		     floating-point library functions. nolibrary
		     enables these transformations.

	 -qstrict_induction | -qnostrict_induction
		Turns off loop induction variable optimizations
		that have the potential	to alter the semantics of
		your program.

		Default:
		     -qnostrict_induction at -O2 or higher.
		     -qstrict_induction	otherwise.

	 -qtune=<suboption>
		Specifies the architecture system for which the
		executable program is optimized.
		<suboption> must be one	of the following:

		604
		     Generates object code optimized for all the
		     PowerPC 604 processors.
		auto
		     Generates object code optimized for the
		     hardware platform on which	the program is
		     compiled.
		balanced
		     Optimizations are tuned across a selected
		     range of recent hardware.
		ppc970
		     Generates instructions specific to	PowerPC	970
		     hardware platforms.
		pwr3
		     Generates object code optimized for the POWER3
		     hardware platforms.
		pwr4
		     Generates object code optimized for the POWER4
		     hardware platforms.
		pwr5
		     Generates object code optimized for the POWER5
		     hardware platforms.
		pwr6
		     Generates object code optimized for the POWER6
		     hardware platforms.
		pwr7
		     Generates object code optimized for the POWER7
		     hardware platforms.
		rs64a
		     Generates object code optimized for the RS64I
		     processor.
		rs64b
		     Generates object code optimized for the RS64II
		     processor.
		rs64c
		     Generates object code optimized for the
		     RS64III processor.

		Default:
		     -qtune=balanced when the default -qarch
		     setting is	in effect. Otherwise, the default
		     depends on	the effective -qarch setting.

	 -qunroll[={auto|yes}] | -qnounroll
		Unrolls	inner loops in the program. This can help
		improve	program	performance.

		auto
		     Instructs the compiler to perform basic loop
		     unrolling.
		yes
		     Instructs the compiler to search for more
		     opportunities for loop unrolling than that
		     performed with auto. In general, this
		     suboption is more likely to increase compile
		     time or program size than auto processing,	but
		     it	may also improve your application's
		     performance.

		Default:
		     -qunroll=auto if -qunroll is not specified	on
		     the command line.

	 -qunwind | -qnounwind
		Informs	the compiler that the stack can	be unwound
		while a	routine	in the compilation is active.
		Specifying -qnounwind can improve the optimization
		of non-volatile	register saves and restores.

		Default: -qunwind

	 -qzerosize | -qnozerosize
		Improves performance of	some programs by preventing
		checking for zero-sized	character strings and
		arrays.

		Default:
		     o -qzerosize for the xlf90, xlf90_r, xlf90_r7,
		     f90, xlf95, xlf95_r, xlf95_r7, f95, xlf2003,
		     xlf2003_r,	f2003, xlf2008,	xlf2008_r and f2008
		     invocation	commands.
		     o -qnozerosize for	the xlf, xlf_r,	xlf_r7,	f77
		     and fort77	invocation commands.

  Linking options
	 -b64	Instructs the ld command to bind with 64-bit
		objects	in 64-bit mode.

	 -bhalt:<error_level>
		Specifies the maximum error level for linker (ld)
		command	processing to continue.

		Default:
		     -bhalt:4 (as specified in the configuration
		     file)

	 -b{dynamic|shared|static}
		Controls how shared objects are	processed by the
		linkage	editor.	The suboptions are:

		dynamic, shared
		     Causes the	linker to process subsequent shared
		     objects in	dynamic	mode. In dynamic mode,
		     shared objects are	not statically included	in
		     the output	file. Instead, the shared objects
		     are listed	in the loader section of the output
		     file.
		     -bdynamic and -bshared are	synonymous.
		static
		     Causes the	linker to process subsequent shared
		     objects in	static mode. In	static mode, shared
		     objects are statically linked in the output
		     file.

		Default: -bshared

	 -bloadmap:<name>
		Requests that a	log of linker actions and messages
		be saved in file <name>.

	 -bmaxdata:<bytes>
		Specifies the maximum amount of	space to reserve
		for the	program	data segment for programs where	the
		size of	these regions is a constraint. Combined
		data space is slightly less than 256MB,	or lower,
		depending onthe	limits for the user ID.

		Default: -bmaxdata:0

	 -bmaxstack:<bytes>
		Specifies the maximum amount of	space to reserve
		for the	program	stack segment for programs where
		the size of these regions is a constraint.

		Default:
		     Combined stack space is slightly less than
		     256MB, or lower, depending	on the limits for
		     the user ID.

	 -brtl | -bnortl
		Controls runtime linking for the output	file.
		When used in conjunction with either -bdynamic or
		-bshared, the search for libraries that	you
		specified with the -l option is	satisfied by the
		suffix .so or .a.

		Default: -bnortl

	 -e <name>
		When used together with	the -qmkshrobj or -G
		option,	specifies an entry point for a shared
		object.

		Default: none

	 -L<dir>
		Searches the path directory for	library	files
		specified by the -l<key> option.

		Default:
		     The default is to search only the standard
		     directories.

	 -l<key>
		Searches the file lib<key>.so and then lib<key>.a
		for dynamic linking, or	only lib<key>.a	for static
		linking.

		Default:
		     The default is to search only some	of the
		     compiler runtime libraries.

  Portability and migration options
	 -qalign=<suboption>
		Specifies the alignment	of data	objects	in storage
		to avoid performance problems with misaligned data.
		Suboptions include:

		4k | no4k
		     Specifies whether to align	large data objects
		     on	page (4	KB) boundaries,	for improved
		     performance with data-striped I/O.	 Use of
		     this option may help to improve the
		     performance of programs using data	striping.
		bindc=<suboption>
		     Specifies that the	alignment and padding for
		     an	XL Fortran derived type	with the BIND(C)
		     attribute is compatible with a C struct type
		     that is compiled with the corresponding XL	C
		     alignment option. The compatible alignment
		     options are:
		       o -qalign=bindc=bit_packed
		       (The corresponding XL C option is
		       -qalign=bit_packed.)
		       o -qalign=bindc={full|power}
		       o -qalign=bindc=packed
		       o -qalign=bindc={twobyte|mac68k}
		       (It is valid only in 32-bit mode.)
		       o -qalign=bindc=natural
		struct=natural
		     Objects of	a derived type declared	using a
		     STRUCTURE declaration are stored such that
		     each component of each element is stored on
		     its natural alignment boundary, unless storage
		     association requires otherwise.
		struct=packed
		     Objects of	a derived type declared	using a
		     STRUCTURE declaration are stored with no space
		     between components, other than any	padding
		     represented by %FILL components.
		struct=port
		     Storage padding is	the same as described above
		     for the struct=natural suboption, except that
		     the alignment of components of type complex is
		     the same as the alignment of components of
		     type real of the same kind. The padding for an
		     object that is immediately	followed by a union
		     is	inserted at the	beginning of the first map
		     component for each	map in that union.

		Default: -qalign=no4k:struct=natural:bindc=power

	 -qbindcextname	| -qnobindcextname
		Controls whether the -qextname option affects
		BIND(C)	entities.

		The -q[no]bindcextname option has effect only if
		the -qextname option is	also specified.	If the
		-qextname option is specified with a list of named
		entities, the -q[no]bindcextname option	only
		affects	these named entities.

		Default: -qbindcextname

	 -qctyplss[={arg|noarg}] | -qnoctyplss
		Specifies whether character constant expressions
		are allowed wherever typeless constants	may be
		used.

		arg
		     This suboption provides the same behavior as
		     the -qctyplss option with no suboptions, with
		     the exception that	if a Hollerith constant	is
		     used as an	actual argument, it is passed to
		     the procedure as if it were an integer actual
		     argument.
		noarg
		     This suboption provides the same behavior as
		     the -qctyplss option with no suboptions.

		Default: -qnoctyplss

	 -qddim	| -qnoddim
		Specifies that the bounds of pointee arrays are
		re-evaluated each time the arrays are referenced
		and removes some restrictions on the bounds
		expressions for	pointee	arrays.

		Default: -qnoddim

	 -qdescriptor[={v1|v2}]
		Specifies which	descriptor format the compiler will
		use for	non-object-oriented compiler entities. The
		possible choices are:

		v1
		     All object	code will use the version 1
		     descriptor	format,	where possible,	for
		     backwards compatibility with V10.1	and older
		     XL	Fortran	object code.
		v2
		     All object	code will use the version 2
		     descriptor	format for all relevant	code
		     constructs.

		Default: -qdescriptor=v1

	 -qescape | -qnoescape
		Specifies whether the backslash	is treated as an
		escape character in character strings, Hollerith
		constants, H edit descriptors, and character string
		edit descriptors.

		Default: -qescape

	 -qextern=<procedures>
		Allows user-written procedures to be called instead
		of XL Fortran intrinsics. <procedures> is a list of
		one or more colon-separated procedure names. The
		procedure names	are treated as if they appear in an
		EXTERNAL statement in each compilation unit being
		compiled.

	 -qextname[=<names>] | -qnoextname
		Adds a trailing	underscore to the names	of the
		global entities	(external names) specified by
		<names>, a colon-separated list	of one or more
		names of global	entities. If no	names are
		specified, -qextname adds an underscore	to the
		names of all global entities, except for main
		program	names.

		Default: -qnoextname

	 -qlog4	| -qnolog4
		Specifies whether the result of	a logical operation
		with logical operands is a LOGICAL(4) or is a
		LOGICAL	with the maximum length	of the operands.

		Default: -qnolog4

	 -qmodule=mangle81 | nomangle81
		Provides compatibility for module files	that are
		compiled with the V14.1	compiler to be linked to an
		existing set of	object files compiled with the
		Version	8.1 compiler. The naming convention is not
		compatible with	that used by V8.1 of the compiler.
		Default: nomangle81

	 -qport=<suboption> | -qnoport
		Increases flexibility when porting programs to XL
		Fortran, providing a number of options to
		accommodate other Fortran language extensions.
		Suboptions include:

		clogicals | noclogicals
		     If	you specify this option, the compiler
		     treats all	non-zero integers that are used	in
		     logical expressions as TRUE. You must specify
		     -qintlog for -qport=clogicals to take effect.
		     Default: noclogicals
		hexint | nohexint
		     If	you specify this option, typeless constant
		     hexadecimal strings are converted to integers
		     when passed as actual arguments to	the int
		     intrinsic function. Typeless constant
		     hexadecimal strings not passed as actual
		     arguments to INT remain unaffected.
		     Default: nohexint
		mod |nomod
		     Specifying	this option relaxes existing
		     constraints on the	MOD intrinsic function,
		     allowing two arguments of the same	data type
		     parameter to be of	different kind type
		     parameters. The result will be of the same
		     type as the argument, but with the	larger kind
		     type parameter value.
		     Default: nomod
		nullarg	| nonullarg
		     For an external or	internal procedure
		     reference,	specifying this	option causes the
		     compiler to treat an empty	argument, which	is
		     delimited by a left parenthesis and a comma,
		     two commas, or a comma and	a right
		     parenthesis, as a null argument. This
		     suboption has no effect if	the argument list
		     is	empty.
		     Default: nonullarg
		sce | nosce
		     By	default, the compiler performs short
		     circuit evaluation	in selected logical
		     expressions using XL Fortran rules. Specifying
		     sce allows	the compiler to	use non-XL Fortran
		     rules. The	compiler will perform short circuit
		     evaluation	if the current rules allow it.
		     Default: nosce
		typestmt | notypestmt
		     The TYPE statement, which behaves in a manner
		     similar to	the PRINT statement, is	supported
		     whenever this option is specified.
		     Default: notypestmt
		typlssarg | notyplssarg
		     Converts all typeless constants to	default
		     integers if the constants are actual arguments
		     to	an intrinsic procedure whose associated
		     dummy arguments are of integer type. Dummy
		     arguments associated with typeless	actual
		     arguments of noninteger type remain unaffected
		     by	this option.
		     Default: notyplssarg

		Default: -qnoport

	 -qswapomp | -qnoswapomp
		Specifies that the compiler should reorganize and
		substitute OpenMP routines in XL Fortran programs.

		Default: -qswapomp

	 -qvecnvol | -qnovecnvol
		Specifies whether to use volatile or non-volatile
		vector registers. Volatile vector registers are
		registers whose	value is not preserved across
		function calls or in the context of save, jump or
		switch system library functions.

		Default: -qnovecnvol

	 -qxflag=oldtab
		For fixed source form programs,	interprets a tab in
		columns	1 to 5 as a single character.

  Compiler customization options
	 -qalias_size=<size>
		Specifies the initial size (in bytes) of the
		aliasing table.	This option has	effect only when
		optimization is	enabled.

	 -B[<prefix>]
		Determines substitute path names for programs used
		during compilation, such as the	compiler,
		assembler, linkage editor, and preprocessor, where
		<prefix> can be	the path of any	program	name
		recognized by the -t compiler option. The optional
		<prefix> defines part of a path	name to	the new
		programs. The -t parameter, <program>, specifies
		the program to which the <prefix> is to	be
		appended. When specifying <prefix>, there must be a
		slash (/) after	the folder name.

	 -F[<config_file>][:<stanza>]
		Names an alternative configuration file	(.cfg) for
		the compiler. <config_file> is the name	of a
		compiler configuration file. <stanza> is the name
		of the command used to invoke the compiler. This
		directs	the compiler to	use the	entries	under
		<stanza> in the	<config_file> to set up	the
		compiler environment. At least one of the arguments
		must be	supplied.

	 -qoptfile=<filename>
		Specifies a file containing a list of additional
		command	line options to	be used	for the
		compilation. <filename>	specifies the name of the
		file that contains a list of additional	command
		line options. It can contain a relative	path or
		absolute path, or it can contain no path. It is	a
		plain text file	with one or more command line
		options	per line.

	 -NS<bytes>
		Specifies the size of internal program storage
		areas, in bytes.

		Default: -NS512

	 -qspillsize=<bytes>
		This is	the long form of the -NS option. Refer to
		-NS for	more information.

	 -t<programs_list>
		Applies	the prefix from	the -B option to the
		specified programs in <programs_list>.
		<programs_list>	is a chain (i.e: -tbcI)	of one or
		more of	the following:

		a = Assembler
		b = Low-level optimizer
		c = Compiler front end
		d = Disassembler
		E = CreateExportList utility
		h = Array language optimizer
		F = C preprocessor
		I = High-level optimizer
		l = Linker
		p = VAST-2 or KAP preprocessor
		z = Binder

		*Note*:	The XL Fortran compiler	does not include
		the VAST or KAP	third-party preprocessor products.
		The p suboption	is provided for	user convenience
		only.

	 -W<program>,<options_list>
		Gives the specified option(s) to the compiler
		program, <program>. <options_list> is a	comma-
		separated list of one or more options. <program>
		can be one of the following:

		a = Assembler
		b = Low-level optimizer
		c = Compiler front end
		d = Disassembler
		E = CreateExportList utility
		F = C preprocessor
		h = Array language optimizer
		I = High-level optimizer
		l = Linker
		p = VAST-2 or KAP preprocessor
		z = Binder

		*Note*:	The XL Fortran compiler	does not include
		the VAST or KAP	third-party preprocessor products.
		The p suboption	is provided for	user convenience
		only.

  SEE ALSO
	 showpdf(1), mergepdf(1), resetpdf(1), cleanpdf(1).

	 For more information, refer to	the following Web sites:
	 http://www.ibm.com/software/awdtools/fortran/xlfortran/aix/library/
	 http://www.ibm.com/software/awdtools/fortran/xlfortran/aix/support/

  COPYRIGHT
	 Licensed Materials - Property of IBM.

	 IBM XL	Fortran	for AIX, V14.1

	 5765-J04; 5725-C74

	 Copyright IBM Corp. 1991, 2012.

	 IBM, the IBM logo, ibm.com, AIX, Power, POWER,	POWER6,
	 POWER6+, POWER7, PowerPC, and Power PC	604 are	trademarks
	 or registered trademarks of International Business
	 Machines Corp., registered in many jurisdictions
	 worldwide. Other product and service names might be
	 trademarks of IBM or other companies. A current list of
	 IBM trademarks	is available on	the Web	at "Copyright and
	 trademark information"	at
	 www.ibm.com/legal/copytrade.shtml.

	 US Government Users Restricted	Rights - Use, duplication
	 or disclosure restricted by GSA ADP Schedule Contract with
	 IBM Corp.
```
