# acd.versions

Adds `Version`, that can be used to find out whether a given version is set, getting it as a boolean expression.

Example:

```d
import acd.versions : Versions;
mixin Versions;

version = Hello;
static assert(Version.Hello && !Version.Foo);
```