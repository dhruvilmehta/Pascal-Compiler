Notes: https://ripple-hardboard-566.notion.site/Notes-d7d25793fa0843e18cca7444c3e755e0

Compile code: javac -d classes $(find src -name "*.java")

Run code: \
java -classpath classes Pascal compile <filename>.pas \
java -classpath classes Pascal compile -x <filename>.pas (For cross referencing)
java -classpath classes Pascal compile -i whileloop.txt
java -classpath classes Pascal compile -ix routines.pas (x is for printing cross-references)
java -cp classes Pascal execute -lafcr newton.pas
cmd flags: -i, -x, -l, -a, -f, -c, and -r 
