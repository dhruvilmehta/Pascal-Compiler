package wci.backend.interpreter;

import wci.backend.interpreter.memoryimpl.ActivationRecordImpl;
import wci.backend.interpreter.memoryimpl.CellImpl;
import wci.backend.interpreter.memoryimpl.MemoryMapImpl;
import wci.backend.interpreter.memoryimpl.RuntimeDisplayImpl;
import wci.backend.interpreter.memoryimpl.RuntimeStackImpl;
import wci.intermediate.SymTab;
import wci.intermediate.SymTabEntry;

/**
 * <h1>MemoryFactory</h1>
 *
 * <p>
 * A factory class that creates runtime components.
 * </p>
 */
public class MemoryFactory {
    /**
     * Create a runtime stack.
     * 
     * @return the new runtime stack.
     */
    public static RuntimeStack createRuntimeStack() {
        return new RuntimeStackImpl();
    }

    /**
     * Create a runtime display.
     * 
     * @return the new runtime display.
     */
    public static RuntimeDisplay createRuntimeDisplay() {
        return new RuntimeDisplayImpl();
    }

    /**
     * Create an activation record for a routine.
     * 
     * @param routineId the symbol table entry of the routine's
     *                  name.
     * @return the new activation record.
     */
    public static ActivationRecord createActivationRecord(SymTabEntry routineId) {
        return new ActivationRecordImpl(routineId);
    }

    /**
     * Create a memory map from a symbol table.
     * 
     * @param value the value for the cell.
     * @return the new memory map.
     */
    public static MemoryMap createMemoryMap(SymTab symTab) {
        return new MemoryMapImpl(symTab);
    }

    /**
     * Create a memory cell.
     * 
     * @param value the value for the cell.
     * @return the new memory cell.
     */
    public static Cell createCell(Object value) {
        return new CellImpl(value);
    }
}
