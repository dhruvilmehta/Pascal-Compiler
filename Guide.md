Github: https://github.com/dhruvilmehta/Pascal-Compiler
The whole compiler which you are running is made by me and the source code can be found at the above Github link or in the src/ directory. I have created this compiler in Java and you can view how parser and executors run. In this document I have tried to give a brief high-level overview of what I have built. I have also included my name in some of the inbuilt functions to show proof-of-work. Each and everything here is made from scratch using java.
Details on how to run the code is found in Readme.md file.

Hello world into my compiler:(hello.pas for more details) 
    PROGRAM hello (output);
        BEGIN {hello}
            writelndhruvil('Hello, world.');
        END;
    END {hello}.

Example If-Else statement: (iftest.pas for more details)
    IF      i = 1 THEN f := 10
    ELSE IF i = 2 THEN f := 20
    ELSE IF i = 3 THEN t := 30
    ELSE IF i = 4 THEN f := 40
    ELSE               f := -1;

Example array program:
    Visit: arraytest.pas (in current directory)

A record in Pascal: (declarations.pas for more details)
    rec1 = RECORD
        i : integer;
        r : real;
        b1, b2 : boolean;
        c : char
    END;

For and nested for loops: (fortest.pas for more details)
    FOR k := j TO 5 DO n := k;

    FOR k := n DOWNTO 1 DO j := k;

    FOR i := 1 TO 2 DO 
        BEGIN
            FOR j := 1 TO 3 DO 
                BEGIN
                    k := i*j
                END
        END

While loop: (whileloop.pas for more details)
    WHILE root*root - number > 0.000001 DO 
        BEGIN
            root := (number/root + root)/2
        END

Example Switch case: (casetest.pas for more details)
    CASE i+1 OF
        1:       j := i;
        -8:      j := 8*i;
        5, 7, 4: j := 574*i;
    END;

Example function and procedure:
    FUNCTION root(x : real) : real;
        VAR
            r : real;

        BEGIN
            r := 1;
            REPEAT
                r := (x/r + r)/2;
            UNTIL abs(x/sqr(r) - 1) < epsilon;
            root := r;
        END;

    PROCEDURE print(n : integer; root : real);
        BEGIN
            writeln('The square root of ', number:4, ' is ', root:8:4);
        END;

Example read and write function: (readtest.pas for more details)
    write('Type an integer: ');
    readln(i);
    writeln('You typed: ', i);
    writeln;

Example Repeat statement in Pascal: (repeattest.pas for more details)
    REPEAT
        r := (n/r + r)/2
    UNTIL r*r - n < epsilon;

Subrange type declaration: (range1.pas for more details)
    TYPE
    subrange = 10..20;

Nested Procedures: (routines.pas for more details)
    PROCEDURE nested(VAR n, m : integer);
        CONST
            ten = 10;

        TYPE
            subrange = five..ten;

        VAR
            a, b, c : integer;
            s : subrange;

        PROCEDURE deeply;

            VAR
                w : real;

            BEGIN
                w := i;
                nested(a, m);
                w := forwarded(b, w);
            END;

        BEGIN {nested}
            s := m;
            deeply;
            a := s;
        END {nested};

Assignment and decision making operations: (StringTest.pas for more details)
    PROCEDURE testStrings(VAR s5 : string5; s8 : string8);

        VAR
            b1, b2, b3 : boolean;

        BEGIN
            b1 := s5 > s8;
            b2 := s5 < 'goodbye';
            b3 := 'nobody' >= s8;

            writeln(b1:6, b2:6, b3:6);
        END;

Some inbuilt or Predefined Functions:
    Procedures
    1. writedhruvil: Writes a string or expression to standard output.
    2. writelndhruvil: Writes a string or expression to standard output with a new line at the end.
    3. readdhruvil: Reads input from standard input (keyboard) and assigns it to a variable.
    4. readlndhruvil: Reads a line of input from standard input (keyboard) and assigns it to a variable.

    Functions
    1. abs: Returns the absolute value of a number.
    2. arctan: Returns the arctangent of a number.
    3. chr: Converts an integer value to its corresponding character.
    4. cos: Returns the cosine of a number (in radians).
    5. eof: Returns true if the end of a file has been reached, false otherwise.
    6. eoln: Returns true if the end of a line has been reached in the standard input, false otherwise.
    7. exp: Returns e raised to the power of a given number.
    8. ln: Returns the natural logarithm of a number.
    9. odd: Returns true if a number is odd, false otherwise.
    10. ord: Converts a character to its corresponding integer value.
    11. pred: Returns the predecessor of a given ordinal value.
    12. round: Rounds a number to the nearest integer.
    13. sin: Returns the sine of a number (in radians).
    14. sqr: Returns the square of a number.
    15. sqrt: Returns the square root of a number.
    16. succ: Returns the successor of a given ordinal value.
    17. trunc: Truncates a floating-point number to its integer part, removing the fractional part.