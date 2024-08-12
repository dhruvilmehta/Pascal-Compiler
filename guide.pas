{java -cp classes Pascal execute guide.pas : Run this on terminal}
PROGRAM showcase (output);

BEGIN
    dwriteln('+---------------------------------------------------+');
    dwriteln('|               Welcome to My Pascal Compiler       |');
    dwriteln('|---------------------------------------------------|');
    dwriteln('| This program showcases the features of the custom |');
    dwriteln('| Pascal compiler, including predefined functions,  |');
    dwriteln('| procedures, and various Pascal constructs.        |');
    dwriteln('| To run this program, run the following:           |');
    dwriteln('| java -cp classes Pascal execute guide.pas         |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Hello World }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|-----------------Hello World Example--------------|');
    dwriteln('| PROGRAM hello (output);                           |');
    dwriteln('| BEGIN {hello}                                     |');
    dwriteln('|     dwriteln(''Hello, world.'');             |');
    dwriteln('| END;                                              |');
    dwriteln('| END {hello}.                                      |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: If-Else }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------------If-Else Example-----------------|');
    dwriteln('| IF      i = 1 THEN f := 10                        |');
    dwriteln('| ELSE IF i = 2 THEN f := 20                        |');
    dwriteln('| ELSE IF i = 3 THEN t := 30                        |');
    dwriteln('| ELSE IF i = 4 THEN f := 40                        |');
    dwriteln('| ELSE               f := -1;                       |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Arrays }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------------Array Example-------------------|');
    dwriteln('| Visit: arraytest.pas for the full array example.  |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Record }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------------Record Example------------------|');
    dwriteln('| rec1 = RECORD                                     |');
    dwriteln('|     i : integer;                                  |');
    dwriteln('|     r : real;                                     |');
    dwriteln('|     b1, b2 : boolean;                             |');
    dwriteln('|     c : char                                      |');
    dwriteln('| END;                                              |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: For Loops }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------------For Loop Example-----------------|');
    dwriteln('| FOR k := j TO 5 DO n := k;                        |');
    dwriteln('|                                                   |');
    dwriteln('| FOR k := n DOWNTO 1 DO j := k;                    |');
    dwriteln('|                                                   |');
    dwriteln('| FOR i := 1 TO 2 DO                                |');
    dwriteln('|     BEGIN                                         |');
    dwriteln('|         FOR j := 1 TO 3 DO                        |');
    dwriteln('|             BEGIN                                 |');
    dwriteln('|                 k := i*j                          |');
    dwriteln('|             END                                   |');
    dwriteln('|     END                                           |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: While Loop }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|-----------------While Loop Example---------------|');
    dwriteln('| WHILE root*root - number > 0.000001 DO            |');
    dwriteln('|     BEGIN                                         |');
    dwriteln('|         root := (number/root + root)/2            |');
    dwriteln('|     END                                           |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Switch Case }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------------Case Statement------------------|');
    dwriteln('| CASE i+1 OF                                       |');
    dwriteln('|     1:       j := i;                              |');
    dwriteln('|     -8:      j := 8*i;                            |');
    dwriteln('|     5, 7, 4: j := 574*i;                          |');
    dwriteln('| END;                                              |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Function and Procedure }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|-------------Function and Procedure Example--------|');
    dwriteln('| FUNCTION root(x : real) : real;                   |');
    dwriteln('|     VAR r : real;                                 |');
    dwriteln('|     BEGIN                                         |');
    dwriteln('|         r := 1;                                   |');
    dwriteln('|         REPEAT                                    |');
    dwriteln('|             r := (x/r + r)/2;                     |');
    dwriteln('|         UNTIL abs(x/sqr(r) - 1) < epsilon;        |');
    dwriteln('|         root := r;                                |');
    dwriteln('|     END;                                          |');
    dwriteln('|                                                   |');
    dwriteln('| PROCEDURE print(n : integer; root : real);        |');
    dwriteln('|     BEGIN                                         |');
    dwriteln('|         dwriteln(''The square root of '',    |');
    dwriteln('|         number:4, '' is '', root:8:4);            |');
    dwriteln('|     END;                                          |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Read and Write }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------------Read and Write-------------------|');
    dwriteln('| write(''Type an integer: '');                     |');
    dwriteln('| readln(i);                                        |');
    dwriteln('| writeln(''You typed: '', i);                      |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Repeat Statement }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|-----------------Repeat Statement------------------|');
    dwriteln('| REPEAT                                            |');
    dwriteln('|     r := (n/r + r)/2                              |');
    dwriteln('| UNTIL r*r - n < epsilon;                          |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Subrange }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------------Subrange Example-----------------|');
    dwriteln('| TYPE                                              |');
    dwriteln('|     subrange = 10..20;                            |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Example: Nested Procedures }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|----------------Nested Procedures------------------|');
    dwriteln('| PROCEDURE nested(VAR n, m : integer);             |');
    dwriteln('|     CONST ten = 10;                               |');
    dwriteln('|     TYPE subrange = five..ten;                    |');
    dwriteln('|     VAR a, b, c : integer; s : subrange;          |');
    dwriteln('|     PROCEDURE deeply;                             |');
    dwriteln('|         VAR w : real;                             |');
    dwriteln('|         BEGIN                                     |');
    dwriteln('|             w := i;                               |');
    dwriteln('|             nested(a, m);                         |');
    dwriteln('|             w := forwarded(b, w);                 |');
    dwriteln('|         END;                                      |');
    dwriteln('| END;                                              |');
    dwriteln('+---------------------------------------------------+');
    dwriteln;

    { Final Message }
    dwriteln('+---------------------------------------------------+');
    dwriteln('|------------End of Showcase Program----------------|');
    dwriteln('+---------------------------------------------------+');
    dwriteln;
END.
