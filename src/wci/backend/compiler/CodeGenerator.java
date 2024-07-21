package wci.backend.compiler;

import static wci.message.MessageType.COMPILER_SUMMARY;
import static wci.intermediate.symtabimpl.SymTabKeyImpl.SLOT;
import static wci.intermediate.symtabimpl.DefinitionImpl.*;

import java.io.PrintWriter;
import java.io.PrintStream;
import java.io.File;

import wci.backend.Backend;
import wci.backend.compiler.generators.ProgramGenerator;
import wci.intermediate.Definition;
import wci.intermediate.ICode;
import wci.intermediate.ICodeNode;
import wci.intermediate.SymTabEntry;
import wci.intermediate.SymTabStack;
import wci.intermediate.TypeForm;
import wci.intermediate.TypeSpec;
import wci.intermediate.symtabimpl.Predefined;
import wci.message.Message;
import static wci.intermediate.typeimpl.TypeFormImpl.*;
import static wci.intermediate.typeimpl.TypeKeyImpl.*;
import static wci.backend.compiler.Instruction.*;

/**
 * <h1>CodeGenerator</h1>
 *
 * <p>
 * The code generator for a compiler back end.
 * </p>
 */
public class CodeGenerator extends Backend {
    private static PrintWriter assemblyFile;
    private static int instructionCount = 0;
    protected static String programName;
    protected LocalVariables localVariables;
    protected LocalStack localStack;

    /**
     * Constructor.
     */
    public CodeGenerator() {
    }

    /**
     * Constructor for subclasses.
     * 
     * @param the parent code generator.
     */
    public CodeGenerator(CodeGenerator parent) {
        super();
        this.localVariables = parent.localVariables;
        this.localStack = parent.localStack;
    }

    /**
     * Process the intermediate code and the symbol table generated
     * by the
     * parser to generate machine-language instructions.
     * 
     * @param iCode       the intermediate code.
     * @param symTabStack the symbol table stack.
     * @throws Exception if an error occurred.
     */
    public void process(ICode iCode, SymTabStack symTabStack)
            throws Exception {
        this.symTabStack = symTabStack;
        long startTime = System.currentTimeMillis();
        SymTabEntry programId = symTabStack.getProgramId();
        programName = programId.getName();
        String assemblyFileName = programName + ".j";
        // Open a new assembly file for writing.
        assemblyFile = new PrintWriter(new PrintStream(new File(assemblyFileName)));
        // Generate code for the main program.
        CodeGenerator programGenerator = new ProgramGenerator(this);
        programGenerator.generate(iCode.getRoot());
        assemblyFile.close();
        // Send the compiler summary message.
        float elapsedTime = (System.currentTimeMillis() - startTime) / 1000f;
        sendMessage(new Message(COMPILER_SUMMARY,
                new Number[] { instructionCount,
                        elapsedTime }));
    }

    /**
     * Generate code for a statement
     * To be overridden by the code generator subclasses.
     * 
     * @param node the root node of the statement.
     */
    public void generate(ICodeNode node)
            throws PascalCompilerException {
    }

    /**
     * Generate code for a routine.
     * To be overridden by the code generator subclasses.
     * 
     * @param routineId the routine's symbol table entry.
     */
    public void generate(SymTabEntry routineId)
            throws PascalCompilerException {
    }

    /**
     * Emit a directive.
     * 
     * @param directive the directive code.
     */
    protected void emitDirective(Directive directive) {
        assemblyFile.println(directive.toString());
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 1-operand directive.
     * 
     * @param directive the directive code.
     * @param operand   the directive operand.
     */
    protected void emitDirective(Directive directive, String operand) {
        assemblyFile.println(directive.toString() + " " + operand);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 1-operand directive.
     * 
     * @param directive the directive code.
     * @param operand   the directive operand.
     */
    protected void emitDirective(Directive directive, int operand) {
        assemblyFile.println(directive.toString() + " " + operand);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 2-operand directive.
     * 
     * @param directive the directive code.
     * @param operand   the operand.
     */
    protected void emitDirective(Directive directive,
            String operand1, String operand2) {
        assemblyFile.println(directive.toString() + " " + operand1 +
                " " + operand2);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a blank line.
     */
    protected void emitBlankLine() {
        assemblyFile.println();
        assemblyFile.flush();
    }

    /**
     * Emit a 3-operand directive.
     * 
     * @param directive the directive code.
     * @param operand   the operand.
     */
    protected void emitDirective(Directive directive,
            String operand1, String operand2,
            String operand3) {
        assemblyFile.println(directive.toString() + " " + operand1 +
                " " + operand2 +
                " " + operand3);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a label.
     * 
     * @param label the label.
     */
    protected void emitLabel(Label label) {
        assemblyFile.println(label + ":");
        assemblyFile.flush();
    }

    /**
     * Emit a label preceded by an integer value for a switch
     * table.
     * 
     * @param label the label.
     */
    protected void emitLabel(int value, Label label) {
        assemblyFile.println("\t " + value + ": " + label);
        assemblyFile.flush();
    }

    /**
     * Emit a label preceded by a string value for a switch table.
     * 
     * @param label the label.
     */
    protected void emitLabel(String value, Label label) {
        assemblyFile.println("\t " + value + ": " + label);
        assemblyFile.flush();
    }

    /**
     * Generate a type descriptor of an identifier's type.
     * 
     * @param id the symbol table entry of an identifier.
     * @return the type descriptor.
     */
    protected String typeDescriptor(SymTabEntry id) {
        TypeSpec type = id.getTypeSpec();
        if (type != null) {
            if (isWrapped(id)) {
                return "L" + varParmWrapper(type.baseType()) + ";";
            } else {
                return typeDescriptor(id.getTypeSpec());
            }
        } else {
            return "V";
        }
    }

    /**
     * Generate a type descriptor for a data type.
     * 
     * @param type the data type.
     * @return the type descriptor.
     */
    protected String typeDescriptor(TypeSpec type) {
        TypeForm form = type.getForm();
        StringBuffer buffer = new StringBuffer();
        while ((form == ARRAY) && !type.isPascalString()) {
            buffer.append("[");
            type = (TypeSpec) type.getAttribute(ARRAY_ELEMENT_TYPE);
            form = type.getForm();
        }
        type = type.baseType();
        if (type == Predefined.integerType) {
            buffer.append("I");
        } else if (type == Predefined.realType) {
            buffer.append("F");
        } else if (type == Predefined.booleanType) {
            buffer.append("Z");
        } else if (type == Predefined.charType) {
            buffer.append("C");
        } else if (type.isPascalString()) {
            buffer.append("Ljava/lang/StringBuilder;");
        } else if (form == ENUMERATION) {
            buffer.append("I");
        } else /* (form == RECORD) */ {
            buffer.append("Ljava/util/HashMap;");
        }
        return buffer.toString();
    }

    /**
     * Generate a Java type descriptor for a data type.
     * 
     * @param type the data type.
     * @return the type descriptor.
     */
    private String javaTypeDescriptor(TypeSpec type) {
        TypeForm form = type.getForm();
        StringBuffer buffer = new StringBuffer();
        boolean isArray = false;
        while ((form == ARRAY) && !type.isPascalString()) {
            buffer.append("[");
            type = (TypeSpec) type.getAttribute(ARRAY_ELEMENT_TYPE);
            form = type.getForm();
            isArray = true;
        }
        if (isArray) {
            buffer.append("L");
        }
        type = type.baseType();
        if (type == Predefined.integerType) {
            buffer.append("java/lang/Integer");
        } else if (type == Predefined.realType) {
            buffer.append("java/lang/Float");
        } else if (type == Predefined.booleanType) {
            buffer.append("java/lang/Boolean");
        } else if (type == Predefined.charType) {
            buffer.append("java/lang/Character");
        } else if (type.isPascalString()) {
            buffer.append("java/lang/StringBuilder");
        } else if (form == ENUMERATION) {
            buffer.append("java/lang/Integer");
        } else /* (form == RECORD) */ {
            buffer.append("java/util/HashMap");
        }
        if (isArray) {
            buffer.append(";");
        }
        return buffer.toString();
    }

    /**
     * Emit a 0-operand instruction.
     * 
     * @param opcode the operation code.
     */
    protected void emit(Instruction opcode) {
        assemblyFile.println("\t" + opcode.toString());
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 1-operand instruction.
     * 
     * @param opcode  the operation code.
     * @param operand the operand text.
     */
    protected void emit(Instruction opcode, String operand) {
        assemblyFile.println("\t" + opcode.toString() + "\t" + operand);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 1-operand instruction.
     * 
     * @param opcode  the operation code.
     * @param operand the operand value.
     */
    protected void emit(Instruction opcode, int operand) {
        assemblyFile.println("\t" + opcode.toString() + "\t" + operand);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 1-operand instruction.
     * 
     * @param opcode  the operation code.
     * @param operand the operand value.
     */
    protected void emit(Instruction opcode, float operand) {
        assemblyFile.println("\t" + opcode.toString() + "\t" + operand);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 1-operand instruction.
     * 
     * @param opcode the operation code.
     * @param label  the label operand.
     */
    protected void emit(Instruction opcode, Label label) {
        assemblyFile.println("\t" + opcode.toString() + "\t" + label);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 2-operand instruction.
     * 
     * @param opcode   the operation code.
     * @param operand1 the value of the first operand.
     * @param operand2 the value of the second operand.
     */
    protected void emit(Instruction opcode, int operand1, int operand2) {
        assemblyFile.println("\t" + opcode.toString() +
                "\t" + operand1 + " " + operand2);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a 2-operand instruction.
     * 
     * @param opcode   the operation code.
     * @param operand1 the text of the first operand.
     * @param operand2 the text of the second operand.
     */
    protected void emit(Instruction opcode, String operand1, String operand2) {
        assemblyFile.println("\t" + opcode.toString() +
                "\t" + operand1 + " " + operand2);
        assemblyFile.flush();
        ++instructionCount;
    }

    /**
     * Emit a load of an integer constant value.
     * 
     * @param value the constant value.
     */
    protected void emitLoadConstant(int value) {
        switch (value) {
            case -1:
                emit(ICONST_M1);
                break;
            case 0:
                emit(ICONST_0);
                break;
            case 1:
                emit(ICONST_1);
                break;
            case 2:
                emit(ICONST_2);
                break;
            case 3:
                emit(ICONST_3);
                break;
            case 4:
                emit(ICONST_4);
                break;
            case 5:
                emit(ICONST_5);
                break;
            default: {
                if ((-128 <= value) && (value <= 127)) {
                    emit(BIPUSH, value);
                } else if ((-32768 <= value) && (value <= 32767)) {
                    emit(SIPUSH, value);
                } else {
                    emit(LDC, value);
                }
            }
        }
    }

    /**
     * Emit a load of a real constant value.
     * 
     * @param value the constant value.
     */
    protected void emitLoadConstant(float value) {
        if (value == 0.0f) {
            emit(FCONST_0);
        } else if (value == 1.0f) {
            emit(FCONST_1);
        } else if (value == 2.0f) {
            emit(FCONST_2);
        } else {
            emit(LDC, value);
        }
    }

    /**
     * Emit a load of a string constant value.
     * 
     * @param value the constant value.
     */
    protected void emitLoadConstant(String value) {
        emit(LDC, "\"" + value + "\"");
    }

    /**
     * Emit a load instruction for a local variable.
     * 
     * @param type  the variable's data type.
     * @param index the variable's index into the local variables
     *              array.
     */
    protected void emitLoadLocal(TypeSpec type, int index) {
        TypeForm form = null;
        if (type != null) {
            type = type.baseType();
            form = type.getForm();
        }
        if ((type == Predefined.integerType) ||
                (type == Predefined.booleanType) ||
                (type == Predefined.charType) ||
                (form == ENUMERATION)) {
            switch (index) {
                case 0:
                    emit(ILOAD_0);
                    break;
                case 1:
                    emit(ILOAD_1);
                    break;
                case 2:
                    emit(ILOAD_2);
                    break;
                case 3:
                    emit(ILOAD_3);
                    break;
                default:
                    emit(ILOAD, index);
            }
        } else if (type == Predefined.realType) {
            switch (index) {
                case 0:
                    emit(FLOAD_0);
                    break;
                case 1:
                    emit(FLOAD_1);
                    break;
                case 2:
                    emit(FLOAD_2);
                    break;
                case 3:
                    emit(FLOAD_3);
                    break;
                default:
                    emit(FLOAD, index);
            }
        } else {
            switch (index) {
                case 0:
                    emit(ALOAD_0);
                    break;
                case 1:
                    emit(ALOAD_1);
                    break;
                case 2:
                    emit(ALOAD_2);
                    break;
                case 3:
                    emit(ALOAD_3);
                    break;
                default:
                    emit(ALOAD, index);
            }
        }
    }

    /**
     * Emit code to load the value of a variable, which can be
     * a program variable, a local variable, or a VAR parameter.
     * 
     * @param variableId the variable's symbol table entry.
     */
    protected void emitLoadVariable(SymTabEntry variableId) {
        TypeSpec variableType = variableId.getTypeSpec().baseType();
        int nestingLevel = variableId.getSymTab().getNestingLevel();
        // Program variable.
        if (nestingLevel == 1) {
            String programName = symTabStack.getProgramId().getName();
            String variableName = variableId.getName();
            String name = programName + "/" + variableName;
            emit(GETSTATIC, name, typeDescriptor(variableType));
        }
        // Wrapped variable.
        else if (isWrapped(variableId)) {
            int index = (Integer) variableId.getAttribute(SLOT);
            emitLoadLocal(null, index);
            emit(GETFIELD, varParmWrapper(variableType) + "/value",
                    typeDescriptor(variableType));
        }
        // Local variable.
        else {
            int index = (Integer) variableId.getAttribute(SLOT);
            emitLoadLocal(variableType, index);
        }
    }

    /**
     * Return whether or not a variable is wrapped to pass by reference.
     * 
     * @param variableId the symbol table entry of the variable.
     * @return true if wrapped, false if not.
     */
    protected boolean isWrapped(SymTabEntry variableId) {
        TypeSpec type = variableId.getTypeSpec();
        TypeForm form = type.getForm();
        Definition defn = variableId.getDefinition();

        // Arrays and records are not wrapped.
        return (defn == VAR_PARM) && (form != ARRAY) && (form != RECORD);
    }

    /**
     * Emit a load of an array element.
     * 
     * @param elmtType the element type if character, else null.
     */
    protected void emitLoadArrayElement(TypeSpec elmtType) {
        TypeForm form = null;
        if (elmtType != null) {
            elmtType = elmtType.baseType();
            form = elmtType.getForm();
        }
        // Load a character from a string.
        if (elmtType == Predefined.charType) {
            emit(INVOKEVIRTUAL, "java/lang/StringBuilder.charAt(I)C");
        }
        // Load an array element.
        else {
            emit(elmtType == Predefined.integerType ? IALOAD
                    : elmtType == Predefined.realType ? FALOAD
                            : elmtType == Predefined.booleanType ? BALOAD
                                    : elmtType == Predefined.charType ? CALOAD
                                            : form == ENUMERATION ? IALOAD
                                                    : AALOAD);
        }
    }

    /**
     * Emit a store instruction into a local variable.
     * 
     * @param type  the data type of the variable.
     * @param index the local variable index.
     */
    protected void emitStoreLocal(TypeSpec type, int index) {
        TypeForm form = null;
        if (type != null) {
            type = type.baseType();
            form = type.getForm();
        }
        if ((type == Predefined.integerType) ||
                (type == Predefined.booleanType) ||
                (type == Predefined.charType) ||
                (form == ENUMERATION)) {
            switch (index) {
                case 0:
                    emit(ISTORE_0);
                    break;
                case 1:
                    emit(ISTORE_1);
                    break;
                case 2:
                    emit(ISTORE_2);
                    break;
                case 3:
                    emit(ISTORE_3);
                    break;
                default:
                    emit(ISTORE, index);
            }
        } else if (type == Predefined.realType) {
            switch (index) {
                case 0:
                    emit(FSTORE_0);
                    break;
                case 1:
                    emit(FSTORE_1);
                    break;
                case 2:
                    emit(FSTORE_2);
                    break;
                case 3:
                    emit(FSTORE_3);
                    break;
                default:
                    emit(FSTORE, index);
            }
        } else {
            switch (index) {
                case 0:
                    emit(ASTORE_0);
                    break;
                case 1:
                    emit(ASTORE_1);
                    break;
                case 2:
                    emit(ASTORE_2);
                    break;
                case 3:
                    emit(ASTORE_3);
                    break;
                default:
                    emit(ASTORE, index);
            }
        }
    }

    /**
     * Emit code to store a value into a variable, which can be
     * a program variable, a local variable, or a VAR parameter.
     * 
     * @param variableId the symbol table entry of the variable.
     */
    protected void emitStoreVariable(SymTabEntry variableId) {
        int nestingLevel = variableId.getSymTab().getNestingLevel();
        int index = (Integer) variableId.getAttribute(SLOT);
        emitStoreVariable(variableId, nestingLevel, index);
    }

    /**
     * Emit code to store a value into a variable, which can be
     * a program variable, a local variable, or a VAR parameter.
     * 
     * @param variableId   the symbol table entry of the variable.
     * @param nestingLevel the variable's nesting level.
     * @param index        the vaiable's index.
     */
    protected void emitStoreVariable(SymTabEntry variableId, int nestingLevel,
            int index) {
        TypeSpec variableType = variableId.getTypeSpec();
        // Program variable.
        if (nestingLevel == 1) {
            String targetName = variableId.getName();
            String programName = symTabStack.getProgramId().getName();
            String name = programName + "/" + targetName;
            emitRangeCheck(variableType);
            emit(PUTSTATIC, name, typeDescriptor(variableType.baseType()));
        }
        // Wrapped parameter: Set the wrapper's value field.
        else if (isWrapped(variableId)) {
            emitRangeCheck(variableType);
            emit(PUTFIELD, varParmWrapper(variableType.baseType()) + "/value", typeDescriptor(variableType.baseType()));
        }
        // Local variable.
        else {
            emitRangeCheck(variableType);
            emitStoreLocal(variableType.baseType(), index);
        }
    }

    /**
     * Emit a function return of a value.
     * 
     * @param type the type of the return value.
     */
    protected void emitReturnValue(TypeSpec type) {
        TypeForm form = null;

        if (type != null) {
            type = type.baseType();
            form = type.getForm();
        }

        if ((type == Predefined.integerType) ||
                (type == Predefined.booleanType) ||
                (type == Predefined.charType) ||
                (form == ENUMERATION)) {
            emit(IRETURN);
        } else if (type == Predefined.realType) {
            emit(FRETURN);
        } else {
            emit(ARETURN);
        }
    }

    /**
     * Emit a store of an array element.
     * 
     * @param elmtType the element type.
     */
    protected void emitStoreArrayElement(TypeSpec elmtType) {
        TypeForm form = null;
        if (elmtType != null) {
            elmtType = elmtType.baseType();
            form = elmtType.getForm();
        }
        if (elmtType == Predefined.charType) {
            emit(INVOKEVIRTUAL, "java/lang/StringBuilder.setCharAt(IC)V");
        } else {
            emit(elmtType == Predefined.integerType ? IASTORE
                    : elmtType == Predefined.realType ? FASTORE
                            : elmtType == Predefined.booleanType ? BASTORE
                                    : elmtType == Predefined.charType ? CASTORE
                                            : form == ENUMERATION ? IASTORE
                                                    : AASTORE);
        }
    }

    /**
     * Emit the CHECKCAST instruction for a scalar type.
     * 
     * @param type the data type.
     */
    protected void emitCheckCast(TypeSpec type) {
        String descriptor = typeDescriptor(type);
        // Don't bracket the type with L; if it's not an array.
        if (descriptor.charAt(0) == 'L') {
            descriptor = descriptor.substring(1, descriptor.length() - 1);
        }
        emit(CHECKCAST, descriptor);
    }

    /**
     * Emit the CHECKCAST instruction for a class.
     * 
     * @param type the data type.
     */
    protected void emitCheckCastClass(TypeSpec type) {
        String descriptor = javaTypeDescriptor(type);
        // Don't bracket the type with L; if it's not an array.
        if (descriptor.charAt(0) == 'L') {
            descriptor = descriptor.substring(1, descriptor.length() - 1);
        }
        emit(CHECKCAST, descriptor);
    }

    /**
     * Emit code to perform a runtime range check before an
     * assignment.
     * 
     * @param targetType the type of the assignment target.
     */
    protected void emitRangeCheck(TypeSpec targetType) {
        if (targetType.getForm() == SUBRANGE) {
            int min = (Integer) targetType.getAttribute(SUBRANGE_MIN_VALUE);
            int max = (Integer) targetType.getAttribute(SUBRANGE_MAX_VALUE);
            emit(DUP);
            emitLoadConstant(min);
            emitLoadConstant(max);
            emit(INVOKESTATIC, "RangeChecker/check(III)V");
            localStack.use(3);
        }
    }

    /**
     * Generate the name of the wrapper to use to pass an actual parameter
     * by reference.
     * 
     * @param type the parameter type..
     * @return the name of the wrapper.
     */
    protected String varParmWrapper(TypeSpec type) {
        type = type.baseType();

        TypeForm form = type.getForm();

        return type == Predefined.integerType ? "IWrap"
                : type == Predefined.realType ? "RWrap"
                        : type == Predefined.booleanType ? "BWrap"
                                : form == ENUMERATION ? "IWrap"
                                        : "CWrap";
    }
}