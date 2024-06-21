Compile code: javac -d classes $(find src -name "*.java")

Run code: \
java -classpath classes Pascal compile <filename>.pas \
java -classpath classes Pascal compile -x <filename>.pas (For cross referencing)
java -classpath classes Pascal compile -i whileloop.txt