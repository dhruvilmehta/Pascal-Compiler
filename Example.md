Compile code: javac -d classes $(find src -name "*.java")

Run code: \
java -cp classes Pascal execute -<flags> <filename>.pas
java -cp classes Pascal execute -lafcr newton.pas (example)
java -classpath classes Pascal compile <filename>.pas \
java -classpath classes Pascal compile -x <filename>.pas (For cross referencing)
java -classpath classes Pascal compile -i whileloop.txt
java -classpath classes Pascal compile -ix routines.pas (x is for printing cross-references)
cmd flags: -i, -x, -l, -a, -f, -c, and -r

private boolean intermediate; // true to print intermediate code
private boolean xref; // true to print cross-reference listing
private boolean lines; // true to print source line tracing
private boolean assign; // true to print value assignment tracing
private boolean fetch; // true to print value fetch tracing
private boolean call; // true to print routine call tracing
private boolean returnn; // true to print routine return tracing
