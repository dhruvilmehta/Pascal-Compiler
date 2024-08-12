.class public fortest
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

.field private static ch C
.field private static grade I
.field private static i I
.field private static j I
.field private static k I
.field private static n I

.method public <init>()V

	aload_0
	invokenonvirtual	java/lang/Object/<init>()V
	return

.limit locals 1
.limit stack 1
.end method

.method public static main([Ljava/lang/String;)V

	new	RunTimer
	dup
	invokenonvirtual	RunTimer/<init>()V
	putstatic	fortest/_runTimer LRunTimer;
	new	PascalTextIn
	dup
	invokenonvirtual	PascalTextIn/<init>()V
	putstatic	fortest/_standardIn LPascalTextIn;


.line 12
	iconst_2
	putstatic	fortest/j I
.line 13
	bipush	120
	putstatic	fortest/ch C
.line 15
	iconst_1
	putstatic	fortest/k I
.line 15
L001:
	getstatic	fortest/k I
	iconst_5
	if_icmpgt	L003
	iconst_0
	goto	L004
L003:
	iconst_1
L004:
	ifne	L002
.line 16
	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%d\n"
	iconst_1
	anewarray	java/lang/Object
	dup
	iconst_0
	getstatic	fortest/k I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokestatic	java/lang/String/format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
	invokevirtual	java/io/PrintStream.print(Ljava/lang/String;)V
.line 15
	getstatic	fortest/k I
	iconst_1
	iadd
	putstatic	fortest/k I
	goto	L001
L002:

	getstatic	fortest/_runTimer LRunTimer;
	invokevirtual	RunTimer.printElapsedTime()V

	return

.limit locals 1
.limit stack 7
.end method
