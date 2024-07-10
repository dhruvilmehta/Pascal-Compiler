package wci.backend.interpreter.memoryimpl;

import wci.backend.interpreter.ActivationRecord;
import wci.backend.interpreter.Cell;
import wci.backend.interpreter.MemoryFactory;
import wci.backend.interpreter.MemoryMap;
import wci.intermediate.SymTab;
import wci.intermediate.SymTabEntry;
import static wci.intermediate.symtabimpl.SymTabKeyImpl.*;

import java.util.ArrayList;

/**
 * <h1>ActivationRecordImpl</h1>
 *
 * <p>
 * The runtime activation record.
 * </p>
 */
public class ActivationRecordImpl implements ActivationRecord {
    private SymTabEntry routineId; // symbol table entry of the routine's name
    private ActivationRecord link; // dynamic link to the previous record
    private int nestingLevel; // scope nesting level of this record
    private MemoryMap memoryMap; // memory map of this stack record

    /**
     * Constructor.
     * 
     * @param routineId the symbol table entry of the routine's name.
     */
    public ActivationRecordImpl(SymTabEntry routineId) {
        SymTab symTab = (SymTab) routineId.getAttribute(ROUTINE_SYMTAB);
        this.routineId = routineId;
        this.nestingLevel = symTab.getNestingLevel();
        this.memoryMap = MemoryFactory.createMemoryMap(symTab);
    }

    /**
     * Getter.
     * 
     * @return the symbol table entry of the routine's name.
     */
    public SymTabEntry getRoutineId() {
        return routineId;
    }

    /**
     * Return the memory cell for the given name from the memory
     * map.
     * 
     * @param name the name.
     * @return the cell.
     */
    public Cell getCell(String name) {
        return memoryMap.getCell(name);
    }

    /**
     * @return the list of all the names in the memory map.
     */
    public ArrayList<String> getAllNames() {
        return memoryMap.getAllNames();
    }

    /**
     * Getter.
     * 
     * @return the scope nesting level.
     */
    public int getNestingLevel() {
        return nestingLevel;
    }

    /**
     * @return the activation record to which this record is
     *         dynamically linked.
     */
    public ActivationRecord linkedTo() {
        return link;
    }

    /**
     * Make a dynamic link from this activation record to another
     * one.
     * 
     * @param ar the activation record to link to.
     * @return this activation record.
     */
    public ActivationRecord makeLinkTo(ActivationRecord ar) {
        link = ar;
        return this;
    }
}