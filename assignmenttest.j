.class public assignmenttest
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

.field private static centigrade F
.field private static fahrenheit F
.field private static freezing Z
.field private static ratio F
.field private static tempc I
.field private static tempf I

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
	putstatic	assignmenttest/_runTimer LRunTimer;
	new	PascalTextIn
	dup
	invokenonvirtual	PascalTextIn/<init>()V
	putstatic	assignmenttest/_standardIn LPascalTextIn;

.line 9
	bipush	72
	dup
	iconst_0
	sipush	200
	invokestatic	RangeChecker/check(III)V
	putstatic	assignmenttest/tempf I
.line 10
	bipush	25
	dup
	iconst_0
	sipush	200
	invokestatic	RangeChecker/check(III)V
	putstatic	assignmenttest/tempc I
.line 11
	ldc	5.0
	ldc	9.0
	fdiv
	putstatic	assignmenttest/ratio F
.line 13
	getstatic	assignmenttest/tempf I
	putstatic	assignmenttest/fahrenheit F
.line 14
	getstatic	assignmenttest/fahrenheit F
	bipush	32
	i2f
	fsub
	getstatic	assignmenttest/ratio F
	fmul
	putstatic	assignmenttest/centigrade F
.line 16
	getstatic	assignmenttest/tempc I
	putstatic	assignmenttest/centigrade F
.line 17
	bipush	32
	i2f
	getstatic	assignmenttest/centigrade F
	getstatic	assignmenttest/ratio F
	fdiv
	fadd
	putstatic	assignmenttest/fahrenheit F
.line 19
	getstatic	assignmenttest/fahrenheit F
	bipush	32
	i2f
	fcmpg
	iflt	L001
	iconst_0
	goto	L002
L001:
	iconst_1
L002:
	putstatic	assignmenttest/freezing Z

	getstatic	assignmenttest/_runTimer LRunTimer;
	invokevirtual	RunTimer.printElapsedTime()V

	return

.limit locals 1
.limit stack 4
.end method
