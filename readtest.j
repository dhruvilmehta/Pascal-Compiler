.class public readtest
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;


.method public <init>()V

	aload_0
	invokenonvirtual	java/lang/Object/<init>()V
	return

.limit locals 1
.limit stack 1
.end method

.method private static doread()V

.var 3 is b Z
.var 2 is c C
.var 0 is i I
.var 1 is x F


.line 12
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Type an integer: "
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 13
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.readInteger()I
	istore_0
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.nextLine()V
.line 14
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"You typed: %d\n"
	iconst_1
	anewarray	java/lang/Object
	dup
	iconst_0
	iload_0
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokestatic	java/lang/String/format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 15
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 17
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Type a real: "
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 18
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.readReal()F
	fstore_1
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.nextLine()V
.line 19
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"You typed: %f\n"
	iconst_1
	anewarray	java/lang/Object
	dup
	iconst_0
	fload_1
	invokestatic	java/lang/Float.valueOf(F)Ljava/lang/Float;
	aastore
	invokestatic	java/lang/String/format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 20
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 22
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Type a character: "
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 23
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.readChar()C
	istore_2
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.nextLine()V
.line 24
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"You typed: %c\n"
	iconst_1
	anewarray	java/lang/Object
	dup
	iconst_0
	iload_2
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokestatic	java/lang/String/format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 25
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V
.line 27
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"Type a boolean: "
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 28
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.readBoolean()Z
	istore_3
	getstatic	readtest/_standardIn LPascalTextIn;
	invokevirtual	PascalTextIn.nextLine()V
.line 29
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"You typed: %s\n"
	iconst_1
	anewarray	java/lang/Object
	dup
	iconst_0
	iload_3
	ifne	L001
	ldc	"false"
	goto	L002
L001:
	ldc	"true"
L002:
	aastore
	invokestatic	java/lang/String/format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 30
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	invokevirtual	java/io/PrintStream.println()V

	return

.limit locals 4
.limit stack 8
.end method

.method public static main([Ljava/lang/String;)V

	new	RunTimer
	dup
	invokenonvirtual	RunTimer/<init>()V
	putstatic	readtest/_runTimer LRunTimer;
	new	PascalTextIn
	dup
	invokenonvirtual	PascalTextIn/<init>()V
	putstatic	readtest/_standardIn LPascalTextIn;


.line 34
	invokestatic	readtest/doread()V

	getstatic	readtest/_runTimer LRunTimer;
	invokevirtual	RunTimer.printElapsedTime()V

	return

.limit locals 1
.limit stack 3
.end method
