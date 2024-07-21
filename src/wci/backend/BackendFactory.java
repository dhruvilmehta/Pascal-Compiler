package wci.backend;

import wci.backend.compiler.CodeGenerator;
import wci.backend.interpreter.Debugger;
import wci.backend.interpreter.DebuggerType;
import wci.backend.interpreter.Executor;
import wci.backend.interpreter.RuntimeStack;
import wci.backend.interpreter.debuggerimpl.CommandLineDebugger;
import wci.intermediate.TypeSpec;
import wci.intermediate.symtabimpl.Predefined;

/**
 * <h1>BackendFactory</h1>
 *
 * <p>
 * A factory class that creates compiler and interpreter
 * components.
 * </p>
 */
public class BackendFactory {
    /**
     * Create a compiler or an interpreter back end component.
     * 
     * @param operation either "compile" or "execute"
     * @return a compiler or an interpreter back end component.
     * @throws Exception if an error occurred.
     */
    public static Backend createBackend(String operation, String inputPath)
            throws Exception {
        if (operation.equalsIgnoreCase("compile")) {
            return new CodeGenerator();
        } else if (operation.equalsIgnoreCase("execute")) {
            return new Executor(inputPath);
        } else {
            throw new Exception("Backend factory: Invalid operation '" + operation + "'");
        }
    }

    /**
     * Return the default value for a data type.
     * 
     * @param type the data type.
     * @return the type descriptor.
     */
    public static Object defaultValue(TypeSpec type) {
        type = type.baseType();
        if (type == Predefined.integerType) {
            return Integer.valueOf(0);
        } else if (type == Predefined.realType) {
            return Float.valueOf(0.0f);
        } else if (type == Predefined.booleanType) {
            return Boolean.valueOf(false);
        } else if (type == Predefined.charType) {
            return Character.valueOf('#');
        } else /* string */ {
            return new String("#");
        }
    }

    /**
     * Create a debugger.
     * 
     * @param type         the type of debugger (COMMAND_LINE or GUI).
     * @param backend      the backend.
     * @param runtimeStack the runtime stack
     * @return the debugger
     */
    public static Debugger createDebugger(DebuggerType type, Backend backend,
            RuntimeStack runtimeStack) {
        switch (type) {
            case COMMAND_LINE: {
                return new CommandLineDebugger(backend, runtimeStack);
            }
            case GUI: {
                return null;
            }
            default: {
                return null;
            }
        }
    }
}