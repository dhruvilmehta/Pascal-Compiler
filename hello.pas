PROGRAM hello (output);
    {Write 'Hello, world.' ten times.}

    TYPE
        rootInput = ARRAY [0..11] OF char;
        ansType=char;

    VAR
        i : integer;
        str1: rootInput;
        temp: ARRAY[0..11] OF char;
        ans: char;
        number: integer;
        booleanAns: boolean;
        times : integer;
        k : integer;

    PROCEDURE printGuide;
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
            dwriteln('|------------------For Loop Example----------------|');
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
            dwriteln('|-------------Function and Procedure Example-------|');
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
            dwriteln('|------------------Read and Write------------------|');
            dwriteln('| write(''Type an integer: '');                     |');
            dwriteln('| readln(i);                                       |');
            dwriteln('| writeln(''You typed: '', i);                      |');
            dwriteln('+---------------------------------------------------+');
            dwriteln;

            { Example: Repeat Statement }
            dwriteln('+---------------------------------------------------+');
            dwriteln('|-----------------Repeat Statement-----------------|');
            dwriteln('| REPEAT                                           |');
            dwriteln('|     r := (n/r + r)/2                             |');
            dwriteln('| UNTIL r*r - n < epsilon;                         |');
            dwriteln('+---------------------------------------------------+');
            dwriteln;

            { Example: Subrange }
            dwriteln('+---------------------------------------------------+');
            dwriteln('|------------------Subrange Example----------------|');
            dwriteln('| TYPE                                              |');
            dwriteln('|     subrange = 10..20;                            |');
            dwriteln('+---------------------------------------------------+');
            dwriteln;

            { Example: Nested Procedures }
            dwriteln('+---------------------------------------------------+');
            dwriteln('|----------------Nested Procedures-----------------|');
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
            dwriteln('|------------End of Showcase Program---------------|');
            dwriteln('+---------------------------------------------------+');
            dwriteln;
        END;

    PROCEDURE PrintContact;
        BEGIN
            dwriteln('+---------------------------------------------------+');
            dwriteln('| Dhruvil Mehta                          |');
            dwriteln('| Email: dhruvilmehta@csu.fullerton.edu             |');
            dwriteln('| Mobile: +1 (657) 631-8860                         |');
            dwriteln('| Current location: Los Angeles                         |');
            dwriteln('| Actively looking for Full-Time opportunities starting May 2025|');
            dwriteln('+---------------------------------------------------+');
        END
    
    PROCEDURE PrintResume;
        BEGIN
            dwriteln('+---------------------------------------------------+');
            dwriteln('| Dhruvil Mehta                          |');
            dwriteln('| Email: dhruvilmehta@csu.fullerton.edu             |');
            dwriteln('| Mobile: +1 (657) 631-8860                         |');
            dwriteln('| Current location: Los Angeles                         |');
            dwriteln('| Actively looking for Full-Time opportunities starting May 2025|');
            dwriteln('+---------------------------------------------------+');
        END

    FUNCTION root(x : integer) : integer;
        BEGIN
            root:= x;
        END;
 
    PROCEDURE printStr(str: rootInput);
        VAR
            i: integer;
        BEGIN
            dwriteln(str);
        END;

    BEGIN {hello}
        REPEAT
            dwriteln;
            dwriteln('-------------------------------');
            dwriteln('To print hello world, Press 1');
            dwriteln('To print my Contact details, Press 2');
            dwriteln('To print Resume, Press 3');
            dwriteln('To know more about this compiler, Press 4');
            dwriteln('To quit, Press 0');
            dwriteln('-------------------------------');
            dread(number);
            dwriteln('-------------------------------');

            IF number = 1 THEN BEGIN
                str1:='Hello, World';
                dwriteln('How many times do you want print Hello, World?');
                dread(times);
                FOR k := 0 TO times-1 DO BEGIN
                    printStr(str1);
                END;
            END
            ELSE IF number = 2 THEN BEGIN
                PrintContact;
            END
            ELSE IF number = 3 THEN BEGIN
                PrintResume;
            END
            ELSE IF number = 4 THEN BEGIN
                printGuide;
            END
            ELSE IF number < 0 THEN BEGIN
                dwriteln('*** ERROR:  number < 0 not allowed');
            END
            ELSE IF number = 0 THEN BEGIN
                dwriteln('Thank you for using my compiler');
                dwriteln('Visit src/ folder to view source code for this project');
                dwriteln('Here is my GitHub Link to view more projects https://github.com/dhruvilmehta/');
            END
            ELSE IF number <> 0 THEN BEGIN
                dwriteln('Invalid input');
            END
        UNTIL number = 0
    END.
    
END {hello}.