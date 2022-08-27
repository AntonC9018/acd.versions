module acd.versions;

/** 
	Lets you get a given version as a boolean expression.

	Examples:

	```d
	import acd.versions : Versions;
	mixin Versions;

	version = Hello;
	static assert(Version.Hello && !Version.Foo);

	// Setting version conditionally.
	static if (Version.Hello)
		version = World;
	static assert(Version.World);

	// Setting version if a version is not defined.
	static if (!Version.A)
		version = B;
	static assert(Version.B);

	// Using as boolean expressions and assigning to a variable.
	version = C;
	enum BC = Version.B && Version.C;
	static assert(BC);
	```

	Note: the following compiles, because `version = Bar` is evaluated before
	the template gets expanded. With a `version(Bar){}` it would just not compile,
	because versions cannot be defined after they have been used.

	```d
	static assert(Version.Bar);
	version = Bar;
	```

	Works when passing version flags when compiling as well.
	
	The other assumptions you have about the way this works will just hold true.
	Surprisingly, it just works!
*/
mixin template Versions()
{
	struct Version
	{
		@disable this();
		static template opDispatch(string id)
		{	
			mixin(`
				version (`, id, `) 
					enum opDispatch = true;
				else 
					enum opDispatch = false;
			`);
		}

		// a bunch of reserved known versions, for convenience and intellisense.
		// https://dlang.org/spec/version.html

		// DMD (Digital Mars D) is the compiler
		enum DigitalMars = opDispatch!("DigitalMars");
		
		// GDC (GNU D Compiler) is the compiler
		enum GNU = opDispatch!("GNU");
		
		// LDC (LLVM D Compiler) is the compiler
		enum LDC = opDispatch!("LDC");
		
		// SDC (Stupid D Compiler) is the compiler
		enum SDC = opDispatch!("SDC");
		
		// Microsoft Windows systems
		enum Windows = opDispatch!("Windows");
		
		// Microsoft 32-bit Windows systems
		enum Win32 = opDispatch!("Win32");
		
		// Microsoft 64-bit Windows systems
		enum Win64 = opDispatch!("Win64");
		
		// All Linux systems
		enum linux = opDispatch!("linux");
		
		// macOS
		enum OSX = opDispatch!("OSX");
		
		// iOS
		enum iOS = opDispatch!("iOS");
		
		// tvOS
		enum TVOS = opDispatch!("TVOS");
		
		// watchOS
		enum WatchOS = opDispatch!("WatchOS");
		
		// FreeBSD
		enum FreeBSD = opDispatch!("FreeBSD");
		
		// OpenBSD
		enum OpenBSD = opDispatch!("OpenBSD");
		
		// NetBSD
		enum NetBSD = opDispatch!("NetBSD");
		
		// DragonFlyBSD
		enum DragonFlyBSD = opDispatch!("DragonFlyBSD");
		
		// All other BSDs
		enum BSD = opDispatch!("BSD");
		
		// Solaris
		enum Solaris = opDispatch!("Solaris");
		
		// All POSIX systems (includes Linux, FreeBSD, OS X, Solaris, etc.)
		enum Posix = opDispatch!("Posix");
		
		// IBM Advanced Interactive eXecutive OS
		enum AIX = opDispatch!("AIX");
		
		// The Haiku operating system
		enum Haiku = opDispatch!("Haiku");
		
		// The SkyOS operating system
		enum SkyOS = opDispatch!("SkyOS");
		
		// System V Release 3
		enum SysV3 = opDispatch!("SysV3");
		
		// System V Release 4
		enum SysV4 = opDispatch!("SysV4");
		
		// GNU Hurd
		enum Hurd = opDispatch!("Hurd");
		
		// The Android platform
		enum Android = opDispatch!("Android");
		
		// The Emscripten platform
		enum Emscripten = opDispatch!("Emscripten");
		
		// The PlayStation platform
		enum PlayStation = opDispatch!("PlayStation");
		
		// The PlayStation 4 platform
		enum PlayStation4 = opDispatch!("PlayStation4");
		
		// The Cygwin environment
		enum Cygwin = opDispatch!("Cygwin");
		
		// The MinGW environment
		enum MinGW = opDispatch!("MinGW");
		
		// An environment without an operating system (such as Bare-metal targets)
		enum FreeStanding = opDispatch!("FreeStanding");
		
		// Bionic C runtime
		enum CRuntime_Bionic = opDispatch!("CRuntime_Bionic");
		
		// DigitalMars C runtime
		enum CRuntime_DigitalMars = opDispatch!("CRuntime_DigitalMars");
		
		// Glibc C runtime
		enum CRuntime_Glibc = opDispatch!("CRuntime_Glibc");
		
		// Microsoft C runtime
		enum CRuntime_Microsoft = opDispatch!("CRuntime_Microsoft");
		
		// musl C runtime
		enum CRuntime_Musl = opDispatch!("CRuntime_Musl");
		
		// newlib C runtime
		enum CRuntime_Newlib = opDispatch!("CRuntime_Newlib");
		
		// uClibc C runtime
		enum CRuntime_UClibc = opDispatch!("CRuntime_UClibc");
		
		// WASI C runtime
		enum CRuntime_WASI = opDispatch!("CRuntime_WASI");
		
		// Clang Cpp runtime
		enum CppRuntime_Clang = opDispatch!("CppRuntime_Clang");
		
		// DigitalMars Cpp runtime
		enum CppRuntime_DigitalMars = opDispatch!("CppRuntime_DigitalMars");
		
		// Gcc Cpp runtime
		enum CppRuntime_Gcc = opDispatch!("CppRuntime_Gcc");
		
		// Microsoft Cpp runtime
		enum CppRuntime_Microsoft = opDispatch!("CppRuntime_Microsoft");
		
		// Sun Cpp runtime
		enum CppRuntime_Sun = opDispatch!("CppRuntime_Sun");
		
		// Intel and AMD 32-bit processors
		enum X86 = opDispatch!("X86");
		
		// Intel and AMD 64-bit processors
		enum X86_64 = opDispatch!("X86_64");
		
		// The ARM architecture (32-bit) (AArch32 et al)
		enum ARM = opDispatch!("ARM");
		
		// ARM in any Thumb mode
		enum ARM_Thumb = opDispatch!("ARM_Thumb");
		
		// The ARM soft floating point ABI
		enum ARM_SoftFloat = opDispatch!("ARM_SoftFloat");
		
		// The ARM softfp floating point ABI
		enum ARM_SoftFP = opDispatch!("ARM_SoftFP");
		
		// The ARM hardfp floating point ABI
		enum ARM_HardFloat = opDispatch!("ARM_HardFloat");
		
		// The Advanced RISC Machine architecture (64-bit)
		enum AArch64 = opDispatch!("AArch64");
		
		// The asm.js intermediate programming language
		enum AsmJS = opDispatch!("AsmJS");
		
		// 8-bit Atmel AVR Microcontrollers
		enum AVR = opDispatch!("AVR");
		
		// The Epiphany architecture
		enum Epiphany = opDispatch!("Epiphany");
		
		// The PowerPC architecture, 32-bit
		enum PPC = opDispatch!("PPC");
		
		// The PowerPC soft float ABI
		enum PPC_SoftFloat = opDispatch!("PPC_SoftFloat");
		
		// The PowerPC hard float ABI
		enum PPC_HardFloat = opDispatch!("PPC_HardFloat");
		
		// The PowerPC architecture, 64-bit
		enum PPC64 = opDispatch!("PPC64");
		
		// The Itanium architecture (64-bit)
		enum IA64 = opDispatch!("IA64");
		
		// The MIPS architecture, 32-bit
		enum MIPS32 = opDispatch!("MIPS32");
		
		// The MIPS architecture, 64-bit
		enum MIPS64 = opDispatch!("MIPS64");
		
		// The MIPS O32 ABI
		enum MIPS_O32 = opDispatch!("MIPS_O32");
		
		// The MIPS N32 ABI
		enum MIPS_N32 = opDispatch!("MIPS_N32");
		
		// The MIPS O64 ABI
		enum MIPS_O64 = opDispatch!("MIPS_O64");
		
		// The MIPS N64 ABI
		enum MIPS_N64 = opDispatch!("MIPS_N64");
		
		// The MIPS EABI
		enum MIPS_EABI = opDispatch!("MIPS_EABI");
		
		// The MIPS soft-float ABI
		enum MIPS_SoftFloat = opDispatch!("MIPS_SoftFloat");
		
		// The MIPS hard-float ABI
		enum MIPS_HardFloat = opDispatch!("MIPS_HardFloat");
		
		// The MSP430 architecture
		enum MSP430 = opDispatch!("MSP430");
		
		// The Nvidia Parallel Thread Execution (PTX) architecture, 32-bit
		enum NVPTX = opDispatch!("NVPTX");
		
		// The Nvidia Parallel Thread Execution (PTX) architecture, 64-bit
		enum NVPTX64 = opDispatch!("NVPTX64");
		
		// The RISC-V architecture, 32-bit
		enum RISCV32 = opDispatch!("RISCV32");
		
		// The RISC-V architecture, 64-bit
		enum RISCV64 = opDispatch!("RISCV64");
		
		// The SPARC architecture, 32-bit
		enum SPARC = opDispatch!("SPARC");
		
		// The SPARC v8+ ABI
		enum SPARC_V8Plus = opDispatch!("SPARC_V8Plus");
		
		// The SPARC soft float ABI
		enum SPARC_SoftFloat = opDispatch!("SPARC_SoftFloat");
		
		// The SPARC hard float ABI
		enum SPARC_HardFloat = opDispatch!("SPARC_HardFloat");
		
		// The SPARC architecture, 64-bit
		enum SPARC64 = opDispatch!("SPARC64");
		
		// The System/390 architecture, 32-bit
		enum S390 = opDispatch!("S390");
		
		// The System Z architecture, 64-bit
		enum SystemZ = opDispatch!("SystemZ");
		
		// The HP PA-RISC architecture, 32-bit
		enum HPPA = opDispatch!("HPPA");
		
		// The HP PA-RISC architecture, 64-bit
		enum HPPA64 = opDispatch!("HPPA64");
		
		// The SuperH architecture, 32-bit
		enum SH = opDispatch!("SH");
		
		// The WebAssembly virtual ISA (instruction set architecture), 32-bit
		enum WebAssembly = opDispatch!("WebAssembly");
		
		// The WebAssembly System Interface
		enum WASI = opDispatch!("WASI");
		
		// The Alpha architecture
		enum Alpha = opDispatch!("Alpha");
		
		// The Alpha soft float ABI
		enum Alpha_SoftFloat = opDispatch!("Alpha_SoftFloat");
		
		// The Alpha hard float ABI
		enum Alpha_HardFloat = opDispatch!("Alpha_HardFloat");
		
		// Byte order, least significant first
		enum LittleEndian = opDispatch!("LittleEndian");
		
		// Byte order, most significant first
		enum BigEndian = opDispatch!("BigEndian");
		
		// The Executable and Linkable Format v1
		enum ELFv1 = opDispatch!("ELFv1");
		
		// The Executable and Linkable Format v2
		enum ELFv2 = opDispatch!("ELFv2");
		
		// D as Better C code (command line switch -betterC) is being generated
		enum D_BetterC = opDispatch!("D_BetterC");
		
		// Exception handling is supported. Evaluates to false when compiling with command line switch -betterC
		enum D_Exceptions = opDispatch!("D_Exceptions");
		
		// ModuleInfo is supported. Evaluates to false when compiling with command line switch -betterC
		enum D_ModuleInfo = opDispatch!("D_ModuleInfo");
		
		// Runtime type information (a.k.a TypeInfo) is supported. Evaluates to false when compiling with command line switch -betterC
		enum D_TypeInfo = opDispatch!("D_TypeInfo");
		
		// Code coverage analysis instrumentation (command line switch -cov) is being generated
		enum D_Coverage = opDispatch!("D_Coverage");
		
		// Ddoc documentation (command line switch -D) is being generated
		enum D_Ddoc = opDispatch!("D_Ddoc");
		
		// Inline assembler for X86 is implemented
		enum D_InlineAsm_X86 = opDispatch!("D_InlineAsm_X86");
		
		// Inline assembler for X86-64 is implemented
		enum D_InlineAsm_X86_64 = opDispatch!("D_InlineAsm_X86_64");
		
		// Pointers are 64 bits (command line switch -m64). (Do not confuse this with C's LP64 model)
		enum D_LP64 = opDispatch!("D_LP64");
		
		// Pointers are 32 bits, but words are still 64 bits (x32 ABI) (This can be defined in parallel to X86_64)
		enum D_X32 = opDispatch!("D_X32");
		
		// The target hardware has a floating-point unit
		enum D_HardFloat = opDispatch!("D_HardFloat");
		
		// The target hardware does not have a floating-point unit
		enum D_SoftFloat = opDispatch!("D_SoftFloat");
		
		// Position Independent Code (command line switch -fPIC) is being generated
		enum D_PIC = opDispatch!("D_PIC");
		
		// Position Independent Executable (command line switch -fPIE) is being generated
		enum D_PIE = opDispatch!("D_PIE");
		
		// Vector extensions (via __simd) are supported
		enum D_SIMD = opDispatch!("D_SIMD");
		
		// AVX Vector instructions are supported
		enum D_AVX = opDispatch!("D_AVX");
		
		// AVX2 Vector instructions are supported
		enum D_AVX2 = opDispatch!("D_AVX2");
		
		// This is a D version 2 compiler
		enum D_Version2 = opDispatch!("D_Version2");
		
		// Array bounds checks are disabled (command line switch -boundscheck=off)
		enum D_NoBoundsChecks = opDispatch!("D_NoBoundsChecks");
		
		// The target supports interfacing with Objective-C
		enum D_ObjectiveC = opDispatch!("D_ObjectiveC");
		
		// GC allocations being profiled (command line switch -profile=gc)
		enum D_ProfileGC = opDispatch!("D_ProfileGC");
		
		// Defined when building the standard runtime
		enum Core = opDispatch!("Core");
		
		// Defined when building the standard library
		enum Std = opDispatch!("Std");
		
		// Unit tests are enabled (command line switch -unittest)
		enum Unittest = opDispatch!("unittest");
		
		// Checks are being emitted for AssertExpressions
		enum Assert = opDispatch!("assert");
		
		// Checks are being emitted for in contracts
		enum D_PreConditions = opDispatch!("D_PreConditions");
		
		// Checks are being emitted for out contracts
		enum D_PostConditions = opDispatch!("D_PostConditions");
		
		// Checks are being emitted for class invariants and struct invariants
		enum D_Invariants = opDispatch!("D_Invariants");
	}
}