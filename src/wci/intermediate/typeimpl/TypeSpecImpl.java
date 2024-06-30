package wci.intermediate.typeimpl;

import java.util.HashMap;
import wci.intermediate.*;
import wci.intermediate.symtabimpl.Predefined;
import static wci.intermediate.typeimpl.TypeFormImpl.ARRAY;
import static wci.intermediate.typeimpl.TypeFormImpl.SUBRANGE;
import static wci.intermediate.typeimpl.TypeKeyImpl.*;

/**
 * <h1>TypeSpecImpl</h1>
 *
 * <p>
 * A Pascal type specification implementation.
 * </p>
 */
public class TypeSpecImpl
        extends HashMap<TypeKey, Object>
        implements TypeSpec {
    private TypeForm form; // type form
    private SymTabEntry identifier; // type identifier

    /**
     * Constructor.
     * 
     * @param form the type form.
     */
    public TypeSpecImpl(TypeForm form) {
        this.form = form;
        this.identifier = null;
    }

    /**
     * Constructor.
     * 
     * @param value a string value.
     */
    public TypeSpecImpl(String value) {
        this.form = ARRAY;
        TypeSpec indexType = new TypeSpecImpl(SUBRANGE);
        indexType.setAttribute(SUBRANGE_BASE_TYPE, Predefined.integerType);
        indexType.setAttribute(SUBRANGE_MIN_VALUE, 1);
        indexType.setAttribute(SUBRANGE_MAX_VALUE, value.length());
        setAttribute(ARRAY_INDEX_TYPE, indexType);
        setAttribute(ARRAY_ELEMENT_TYPE, Predefined.charType);
        setAttribute(ARRAY_ELEMENT_COUNT, value.length());
    }

    /**
     * Set an attribute of the specification.
     * 
     * @param key   the attribute key.
     * @param value the attribute value.
     */
    public void setAttribute(TypeKey key, Object value) {
        this.put(key, value);
    }

    /**
     * Get the value of an atvaluetribute of the specification.
     * 
     * @param key the attribute key.
     * @return the attribute value.
     */
    public Object getAttribute(TypeKey key) {
        return this.get(key);
    }

    /**
     * @return true if this is a Pascal string type.
     */
    public boolean isPascalString() {
        if (form == ARRAY) {
            TypeSpec elmtType = (TypeSpec) getAttribute(ARRAY_ELEMENT_TYPE);
            TypeSpec indexType = (TypeSpec) getAttribute(ARRAY_INDEX_TYPE);
            return (elmtType.baseType() == Predefined.charType) &&
                    (indexType.baseType() == Predefined.integerType);
        } else {
            return false;
        }
    }

    /**
     * @return the base type of this type.
     */
    public TypeSpec baseType() {
        return (TypeFormImpl) form == SUBRANGE
                ? (TypeSpec) getAttribute(SUBRANGE_BASE_TYPE)
                : this;
    }

    @Override
    public TypeForm getForm() {
        return form;
    }

    @Override
    public void setIdentifier(SymTabEntry identifier) {
        this.identifier = identifier;
    }

    @Override
    public SymTabEntry getIdentifier() {
        return identifier;
    }
}