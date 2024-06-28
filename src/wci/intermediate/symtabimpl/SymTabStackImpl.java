package wci.intermediate.symtabimpl;

import java.util.ArrayList;
import wci.intermediate.*;

/**
 * <h1>SymTabStack</h1>
 *
 * <p>
 * An implementation of the symbol table stack.
 * </p>
 */
public class SymTabStackImpl
        extends ArrayList<SymTab>
        implements SymTabStack {
    private int currentNestingLevel; // current scope nesting level
    private SymTabEntry programId; // entry for the main program id

    /**
     * Constructor.
     */
    public SymTabStackImpl() {
        this.currentNestingLevel = 0;
        add(SymTabFactory.createSymTab(currentNestingLevel));
    }

    /**
     * Return the local symbol table which is at the top of the
     * stack.
     * 
     * @return the local symbol table.
     */
    public SymTab getLocalSymTab() {
        return get(currentNestingLevel);
    }

    /**
     * Create and enter a new entry into the local symbol table.
     * 
     * @param name the name of the entry.
     * @return the new entry.
     */
    public SymTabEntry enterLocal(String name) {
        return get(currentNestingLevel).enter(name);
    }

    /**
     * Look up an existing symbol table entry in the local symbol
     * table.
     * 
     * @param name the name of the entry.
     * @return the entry, or null if it does not exist.
     */
    public SymTabEntry lookupLocal(String name) {
        return get(currentNestingLevel).lookup(name);
    }

    /**
     * Getter for current nesting level
     * 
     * @return currentNestingLevel
     */
    public int getCurrentNestingLevel() {
        return currentNestingLevel;
    }

    /**
     * Push a new symbol table onto the symbol table stack.
     * 
     * @return the pushed symbol table.
     */
    public SymTab push() {
        SymTab symTab = SymTabFactory.createSymTab(++currentNestingLevel);
        add(symTab);
        return symTab;
    }

    /**
     * Push a symbol table onto the symbol table stack.
     * 
     * @return the pushed symbol table.
     */
    public SymTab push(SymTab symTab) {
        ++currentNestingLevel;
        add(symTab);
        return symTab;
    }

    /**
     * Pop a symbol table off the symbol table stack.
     * 
     * @return the popped symbol table.
     */
    public SymTab pop() {
        SymTab symTab = get(currentNestingLevel);
        remove(currentNestingLevel--);
        return symTab;
    }

    /**
     * Look up an existing symbol table entry throughout the stack.
     * 
     * @param name the name of the entry.
     * @return the entry, or null if it does not exist.
     */
    public SymTabEntry lookup(String name) {
        SymTabEntry foundEntry = null;
        // Search the current and enclosing scopes.
        for (int i = currentNestingLevel; (i >= 0) && (foundEntry == null); --i) {
            foundEntry = get(i).lookup(name);
        }
        return foundEntry;
    }

    @Override
    public void setProgramId(SymTabEntry entry) {
        this.programId=entry;
    }

    @Override
    public SymTabEntry getProgramId() {
        return programId;
    }
}