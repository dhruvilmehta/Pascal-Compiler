Notes: https://ripple-hardboard-566.notion.site/Notes-d7d25793fa0843e18cca7444c3e755e0

Compile code: javac -d classes $(find src -name "*.java")
Note: Code is already compiled if you see a classes/ directory. No need to use this command then.

Run the interpretor to see the output.
Run Compiler to see Jasmin object code file. (.j file extension)(It will be a JVM object file)

Run code:
Interpretor: java -cp classes Pascal execute hello.pas
Compiler: java -classpath classes Pascal compile hello.pas

Run with flags:
cmd flags: -i, -x, -l, -a, -f, -c, and -r
private boolean intermediate; // true to print Syntax Tree
private boolean xref; // true to print cross-reference listing
private boolean lines; // true to print source line tracing
private boolean assign; // true to print value assignment tracing
private boolean fetch; // true to print value fetch tracing
private boolean call; // true to print routine call tracing
private boolean returnn; // true to print routine return tracing
