PKG readme file
===============

The build process for the C# Xcode Plug-in creates an installation package in its last build phase. A script is used for this purpose, which read the contents of "Pkg Resources" and creates the pkg file.

The pkg file is created under the top directory. The version number of the package is coded in the Info.plist file.

To create the pkg file successfully you should configure sudo not to ask for a password when being invoked. Set the NOPASSWD flag:
<your username>  ALL=(ALL) NOPASSWD: ALL

Much effort has been put to create an error-free installation package. If you feel something's wrong or can be improved, drop a line to mono-osx@lists.ximian.com with some constructive comments.


2007-03-24 Jaume Llardén: sudo gotchas mentioned.
2007-03-16 Jaume Llardén: First version.