package wci.backend.interpreter.executors;

import static wci.message.MessageType.ASSIGN;
import static wci.intermediate.icodeimpl.ICodeKeyImpl.*;
import static wci.intermediate.symtabimpl.SymTabKeyImpl.*;
import static wci.intermediate.typeimpl.TypeKeyImpl.ARRAY_ELEMENT_COUNT;

import java.util.ArrayList;

import wci.backend.interpreter.Cell;
import wci.backend.interpreter.Executor;
import wci.intermediate.ICodeNode;
import wci.intermediate.SymTabEntry;
import wci.intermediate.TypeSpec;
import wci.intermediate.symtabimpl.Predefined;
import wci.message.Message;

public class AssignmentExecutor extends StatementExecutor {

    public AssignmentExecutor(Executor parent) {
        super(parent);
    }

    /**
     * Execute an assignment statement.
     * 
     * @param node the root node of the statement.
     * @return null.
     */
    public Object execute(ICodeNode node) {
        // The ASSIGN node's children are the target variable
        // and the expression.
        ArrayList<ICodeNode> children = node.getChildren();
        ICodeNode variableNode = children.get(0);
        ICodeNode expressionNode = children.get(1);
        SymTabEntry variableId = (SymTabEntry) variableNode.getAttribute(ID);
        // Execute the target variable to get its reference and
        // execute the expression to get its value.
        ExpressionExecutor expressionExecutor = new ExpressionExecutor(this);
        Cell targetCell = (Cell) expressionExecutor.executeVariable(variableNode);
        TypeSpec targetType = variableNode.getTypeSpec();
        TypeSpec valueType = expressionNode.getTypeSpec().baseType();
        Object value = expressionExecutor.execute(expressionNode);
        assignValue(node, variableId, targetCell, targetType, value, valueType);
        ++executionCount;
        return null;
    }

    /**
     * Assign a value to a target cell.
     * 
     * @param node       the ancester parse tree node of the assignment.
     * @param targetId   the symbol table entry of the target
     *                   variable or parm.
     * @param targetCell the target cell.
     * @param targetType the target type.
     * @param value      the value to assign.
     * @param valueType  the value type.
     */
    protected void assignValue(ICodeNode node, SymTabEntry targetId,
            Cell targetCell, TypeSpec targetType,
            Object value, TypeSpec valueType) {
        // Range check.
        value = checkRange(node, targetType, value);
        // Set the target's value.
        // Convert an integer value to real if necessary.
        if ((targetType == Predefined.realType) &&
                (valueType == Predefined.integerType)) {
            targetCell.setValue(Float.valueOf((Integer) value).intValue());
        }
        // String assignment:
        // target length < value length: truncate the value
        // target length > value length: blank pad the value
        else if (targetType.isPascalString()) {
            int targetLength = (Integer) targetType.getAttribute(ARRAY_ELEMENT_COUNT);
            int valueLength = (Integer) valueType.getAttribute(ARRAY_ELEMENT_COUNT);
            String stringValue = (String) value;
            // Truncate the value string.
            if (targetLength < valueLength) {
                stringValue = stringValue.substring(0, targetLength);
            }
            // Pad the value string with blanks at the right end.
            else if (targetLength > valueLength) {
                StringBuilder buffer = new StringBuilder(stringValue);
                for (int i = valueLength; i < targetLength; ++i) {
                    buffer.append(" ");
                }
                stringValue = buffer.toString();
            }
            targetCell.setValue(copyOf(toPascal(targetType, stringValue),
                    node));
        }
        // Simple assignment.
        else {
            targetCell.setValue(copyOf(toPascal(targetType, value), node));
        }
        sendAssignMessage(node, targetId.getName(), value);
    }

    /**
     * Send a message about the assignment operation.
     * 
     * @param node         the ASSIGN node.
     * @param variableName the name of the target variable.
     * @param value        the value of the expression.
     */
    private void sendMessage(ICodeNode node, String variableName, Object value) {
        Object lineNumber = node.getAttribute(LINE);
        // Send an ASSIGN message.
        if (lineNumber != null) {
            sendMessage(new Message(ASSIGN, new Object[] { lineNumber,
                    variableName,
                    value }));
        }
    }
}
