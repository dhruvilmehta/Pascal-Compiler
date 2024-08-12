.class public hello
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

.field private static ans C
.field private static booleanans Z
.field private static i I
.field private static k I
.field private static number I
.field private static str1 Ljava/lang/StringBuilder;
.field private static temp Ljava/lang/StringBuilder;
.field private static times I

.method public <init>()V

	aload_0
	invokenonvirtual	java/lang/Object/<init>()V
	return

.limit locals 1
.limit stack 1
.end method

.method private static printguide()V



.line 20
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 21
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|               Welcome to My Pascal Compiler       |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 22
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|---------------------------------------------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 23
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| This program showcases the features of the custom |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 24
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Pascal compiler, including predefined functions,  |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 25
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| procedures, and various Pascal constructs.        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 26
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| To run this program, run the following:           |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 27
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| java -cp classes Pascal execute guide.pas         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 28
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 29
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 32
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 33
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|-----------------Hello World Example--------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 34
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| PROGRAM hello (output);                           |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 35
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| BEGIN {hello}                                     |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 36
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     dwriteln('Hello, world.');             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 37
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| END;                                              |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 38
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| END {hello}.                                      |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 39
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 40
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 43
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 44
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------------If-Else Example-----------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 45
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| IF      i = 1 THEN f := 10                        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 46
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| ELSE IF i = 2 THEN f := 20                        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 47
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| ELSE IF i = 3 THEN t := 30                        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 48
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| ELSE IF i = 4 THEN f := 40                        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 49
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| ELSE               f := -1;                       |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 50
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 51
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 54
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 55
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------------Array Example-------------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 56
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Visit: arraytest.pas for the full array example.  |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 57
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 58
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 61
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 62
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------------Record Example------------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 63
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| rec1 = RECORD                                     |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 64
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     i : integer;                                  |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 65
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     r : real;                                     |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 66
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     b1, b2 : boolean;                             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 67
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     c : char                                      |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 68
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| END;                                              |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 69
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 70
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 73
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 74
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------------For Loop Example----------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 75
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| FOR k := j TO 5 DO n := k;                        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 76
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|                                                   |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 77
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| FOR k := n DOWNTO 1 DO j := k;                    |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 78
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|                                                   |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 79
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| FOR i := 1 TO 2 DO                                |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 80
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     BEGIN                                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 81
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         FOR j := 1 TO 3 DO                        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 82
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|             BEGIN                                 |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 83
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|                 k := i*j                          |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 84
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|             END                                   |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 85
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     END                                           |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 86
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 87
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 90
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 91
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|-----------------While Loop Example---------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 92
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| WHILE root*root - number > 0.000001 DO            |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 93
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     BEGIN                                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 94
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         root := (number/root + root)/2            |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 95
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     END                                           |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 96
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 97
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 100
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 101
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------------Case Statement------------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 102
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| CASE i+1 OF                                       |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 103
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     1:       j := i;                              |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 104
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     -8:      j := 8*i;                            |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 105
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     5, 7, 4: j := 574*i;                          |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 106
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| END;                                              |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 107
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 108
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 111
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 112
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|-------------Function and Procedure Example-------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 113
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| FUNCTION root(x : real) : real;                   |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 114
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     VAR r : real;                                 |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 115
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     BEGIN                                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 116
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         r := 1;                                   |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 117
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         REPEAT                                    |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 118
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|             r := (x/r + r)/2;                     |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 119
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         UNTIL abs(x/sqr(r) - 1) < epsilon;        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 120
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         root := r;                                |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 121
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     END;                                          |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 122
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|                                                   |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 123
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| PROCEDURE print(n : integer; root : real);        |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 124
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     BEGIN                                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 125
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         dwriteln('The square root of ',    |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 126
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         number:4, ' is ', root:8:4);            |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 127
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     END;                                          |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 128
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 129
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 132
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 133
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------------Read and Write------------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 134
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| write('Type an integer: ');                     |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 135
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| readln(i);                                       |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 136
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| writeln('You typed: ', i);                      |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 137
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 138
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 141
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 142
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|-----------------Repeat Statement-----------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 143
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| REPEAT                                           |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 144
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     r := (n/r + r)/2                             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 145
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| UNTIL r*r - n < epsilon;                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 146
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 147
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 150
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 151
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------------Subrange Example----------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 152
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| TYPE                                              |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 153
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     subrange = 10..20;                            |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 154
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 155
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 158
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 159
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|----------------Nested Procedures-----------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 160
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| PROCEDURE nested(VAR n, m : integer);             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 161
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     CONST ten = 10;                               |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 162
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     TYPE subrange = five..ten;                    |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 163
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     VAR a, b, c : integer; s : subrange;          |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 164
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|     PROCEDURE deeply;                             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 165
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         VAR w : real;                             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 166
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         BEGIN                                     |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 167
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|             w := i;                               |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 168
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|             nested(a, m);                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 169
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|             w := forwarded(b, w);                 |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 170
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|         END;                                      |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 171
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| END;                                              |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 172
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 173
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 176
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 177
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"|------------End of Showcase Program---------------|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 178
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 179
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V

	return

.limit locals 1
.limit stack 2
.end method

.method private static printcontact()V



.line 184
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 185
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Dhruvil Mehta                          |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 186
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Email: dhruvilmehta@csu.fullerton.edu             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 187
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Mobile: +1 (657) 631-8860                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 188
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Current location: Los Angeles                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 189
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Actively looking for Full-Time opportunities starting May 2025|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 190
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V

	return

.limit locals 1
.limit stack 2
.end method

.method private static printresume()V



.line 195
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 196
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Dhruvil Mehta                          |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 197
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Email: dhruvilmehta@csu.fullerton.edu             |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 198
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Mobile: +1 (657) 631-8860                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 199
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Current location: Los Angeles                         |\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 200
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"| Actively looking for Full-Time opportunities starting May 2025|\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 201
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"+---------------------------------------------------+\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V

	return

.limit locals 1
.limit stack 2
.end method

.method private static root(I)I

.var 0 is x I
.var 1 is root I


.line 206
	iload_0
	istore_1

	iload_1
	ireturn

.limit locals 2
.limit stack 1
.end method

.method private static printstr(Ljava/lang/StringBuilder;)V

.var 1 is i I
.var 0 is str Ljava/lang/StringBuilder;


.line 213
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%s\n"
	iconst_1
	anewarray	java/lang/Object
	dup
	iconst_0
	aload_0
	aastore
	invokestatic	java/lang/String/format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V

	return

.limit locals 2
.limit stack 7
.end method

.method public static main([Ljava/lang/String;)V

	new	RunTimer
	dup
	invokenonvirtual	RunTimer/<init>()V
	putstatic	hello/_runTimer LRunTimer;
	new	PascalTextIn
	dup
	invokenonvirtual	PascalTextIn/<init>()V
	putstatic	hello/_standardIn LPascalTextIn;

	bipush	12
	invokestatic	PaddedString.create(I)Ljava/lang/StringBuilder;
	putstatic	hello/str1 Ljava/lang/StringBuilder;
	bipush	12
	invokestatic	PaddedString.create(I)Ljava/lang/StringBuilder;
	putstatic	hello/temp Ljava/lang/StringBuilder;

.line 217
L001:
.line 218
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 219
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"-------------------------------\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 220
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"To print hello world, Press 1\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 221
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"To print my Contact details, Press 2\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 222
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"To print Resume, Press 3\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 223
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"To know more about this compiler, Press 4\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 224
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"To quit, Press 0\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 225
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"-------------------------------\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 226
	getstatic	hello/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.readInteger()I
	putstatic	hello/number I
.line 227
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"-------------------------------\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 229
	getstatic	hello/number I
	iconst_1
	if_icmpeq	L004
	iconst_0
	goto	L005
L004:
	iconst_1
L005:
	ifeq	L006
.line 230
	getstatic	hello/str1 Ljava/lang/StringBuilder;
	dup
	iconst_0
	invokevirtual	java/lang/StringBuilder.setLength(I)V
	ldc	"Hello, World"
	invokevirtual	java/lang/StringBuilder.append(Ljava/lang/String;)Ljava/lang/StringBuilder;
	pop
.line 231
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"How many times do you want print Hello, World?\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 232
	getstatic	hello/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.readInteger()I
	putstatic	hello/times I
.line 233
	iconst_0
	putstatic	hello/k I
.line 233
L007:
	getstatic	hello/k I
	getstatic	hello/times I
	iconst_1
	isub
	if_icmpgt	L009
	iconst_0
	goto	L010
L009:
	iconst_1
L010:
	ifne	L008
.line 234
	getstatic	hello/str1 Ljava/lang/StringBuilder;
	invokestatic	Cloner.deepClone(Ljava/lang/Object;)Ljava/lang/Object;
	checkcast	java/lang/StringBuilder
	invokestatic	hello/printstr(Ljava/lang/StringBuilder;)V
.line 233
	getstatic	hello/k I
	iconst_1
	iadd
	putstatic	hello/k I
	goto	L007
L008:
	goto	L003
L006:
.line 237
	getstatic	hello/number I
	iconst_2
	if_icmpeq	L012
	iconst_0
	goto	L013
L012:
	iconst_1
L013:
	ifeq	L014
.line 238
	invokestatic	hello/printcontact()V
	goto	L011
L014:
.line 240
	getstatic	hello/number I
	iconst_3
	if_icmpeq	L016
	iconst_0
	goto	L017
L016:
	iconst_1
L017:
	ifeq	L018
.line 241
	invokestatic	hello/printresume()V
	goto	L015
L018:
.line 243
	getstatic	hello/number I
	iconst_4
	if_icmpeq	L020
	iconst_0
	goto	L021
L020:
	iconst_1
L021:
	ifeq	L022
.line 244
	invokestatic	hello/printguide()V
	goto	L019
L022:
.line 246
	getstatic	hello/number I
	iconst_0
	if_icmplt	L024
	iconst_0
	goto	L025
L024:
	iconst_1
L025:
	ifeq	L026
.line 247
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"*** ERROR:  number < 0 not allowed\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
	goto	L023
L026:
.line 249
	getstatic	hello/number I
	iconst_0
	if_icmpeq	L028
	iconst_0
	goto	L029
L028:
	iconst_1
L029:
	ifeq	L030
.line 250
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Thank you for using my compiler\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 251
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Visit src/ folder to view source code for this project\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 252
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Here is my GitHub Link to view more projects https://github.com/dhruvilmehta/\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
	goto	L027
L030:
.line 254
	getstatic	hello/number I
	iconst_0
	if_icmpne	L032
	iconst_0
	goto	L033
L032:
	iconst_1
L033:
	ifeq	L031
.line 255
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Invalid input\n"
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
L031:
L027:
L023:
L019:
L015:
L011:
L003:
	getstatic	hello/number I
	iconst_0
	if_icmpeq	L034
	iconst_0
	goto	L035
L034:
	iconst_1
L035:
	ifne	L002
	goto	L001
L002:

	getstatic	hello/_runTimer LRunTimer;
	invokevirtual	RunTimer.printElapsedTime()V

	return

.limit locals 1
.limit stack 3
.end method
