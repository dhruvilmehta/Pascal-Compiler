package wci.intermediate.symtabimpl;

import wci.intermediate.Definition;

/**
 * <h1>DefinitionImpl</h1>
 *
 * <p>
 * How a Pascal symbol table entry is defined.
 * </p>
 */
public enum DefinitionImpl implements Definition {
    CONSTANT, ENUMERATION_CONSTANT("enumeration constant"),
    TYPE, VARIABLE, FIELD("record field"),
    VALUE_PARM("value parameter"), VAR_PARM("VAR parameter"),
    PROGRAM_PARM("program parameter"),
    PROGRAM, PROCEDURE, FUNCTION,
    UNDEFINED;

    private String text;

    /**
     * Constructor.
     */
    DefinitionImpl() {
        this.text = this.toString().toLowerCase();
    }

    /**
     * Constructor.
     * 
     * @param text the text for the definition code.
     */
    DefinitionImpl(String text) {
        this.text = text;
    }

    /**
     * Getter.
     * 
     * @return String the text of the definition code.
     */
    public String getText() {
        return text;
    }
}