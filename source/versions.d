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
	}
}