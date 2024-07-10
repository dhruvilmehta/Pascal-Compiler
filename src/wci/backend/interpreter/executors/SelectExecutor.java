package wci.backend.interpreter.executors;

import static wci.intermediate.icodeimpl.ICodeKeyImpl.VALUE;
import static wci.intermediate.icodeimpl.ICodeNodeTypeImpl.STRING_CONSTANT;

import java.util.ArrayList;
import java.util.HashMap;

import wci.backend.interpreter.Executor;
import wci.intermediate.ICodeNode;

public class SelectExecutor extends StatementExecutor {

    public SelectExecutor(Executor parent) {
        super(parent);
    }

    // Jump table cache: entry key is a SELECT node,
    // entry value is the jump table.
    // Jump table: entry key is a selection value,
    // entry value is the branch statement.
    private static HashMap<ICodeNode, HashMap<Object, ICodeNode>> jumpCache = new HashMap<>();

    /**
     * Execute SELECT statement.
     * 
     * @param node the root node of the statement.
     * @return null.
     */
    public Object execute(ICodeNode node) {
        // Is there already an entry for this SELECT node in the
        // jump table cache? If not, create a jump table entry.
        HashMap<Object, ICodeNode> jumpTable = jumpCache.get(node);
        if (jumpTable == null) {
            jumpTable = createJumpTable(node);
            jumpCache.put(node, jumpTable);
        }
        // Get the SELECT node's children.
        ArrayList<ICodeNode> selectChildren = node.getChildren();
        ICodeNode exprNode = selectChildren.get(0);
        // Evaluate the SELECT expression.
        ExpressionExecutor expressionExecutor = new ExpressionExecutor(this);
        Object selectValue = expressionExecutor.execute(exprNode);
        // If there is a selection, execute the SELECT_BRANCH's statement.
        ICodeNode statementNode = jumpTable.get(selectValue);
        if (statementNode != null) {
            StatementExecutor statementExecutor = new StatementExecutor(this);
            statementExecutor.execute(statementNode);
        }
        ++executionCount; // count the SELECT statement itself
        return null;
    }

    /**
     * Create a jump table for a SELECT node.
     * 
     * @param node the SELECT node.
     * @return the jump table.
     */
    private HashMap<Object, ICodeNode> createJumpTable(ICodeNode node) {
        HashMap<Object, ICodeNode> jumpTable = new HashMap<Object, ICodeNode>();
        // Loop over children that are SELECT_BRANCH nodes.
        ArrayList<ICodeNode> selectChildren = node.getChildren();
        for (int i = 1; i < selectChildren.size(); ++i) {
            ICodeNode branchNode = selectChildren.get(i);
            ICodeNode constantsNode = branchNode.getChildren().get(0);
            ICodeNode statementNode = branchNode.getChildren().get(1);
            // Loop over the constants children of the branch's CONSTANTS_NODE.
            ArrayList<ICodeNode> constantsList = constantsNode.getChildren();
            for (ICodeNode constantNode : constantsList) {
                // Create a jump table entry.
                // Convert a single-character string constant to a character.
                Object value = constantNode.getAttribute(VALUE);
                if (constantNode.getType() == STRING_CONSTANT) {
                    value = ((String) value).charAt(0);
                }
                jumpTable.put(value, statementNode);
            }
        }
        return jumpTable;
    }

    /**
     * Search the SELECT_BRANCHes to find a match.
     * 
     * @param selectValue    the value to match.
     * @param selectChildren the children of the SELECT node.
     * @return ICodeNode
     */
    private ICodeNode searchBranches(Object selectValue,
            ArrayList<ICodeNode> selectChildren) {
        // Loop over the SELECT_BRANCHes to find a match.
        for (int i = 1; i < selectChildren.size(); ++i) {
            ICodeNode branchNode = selectChildren.get(i);
            if (searchConstants(selectValue, branchNode)) {
                return branchNode;
            }
        }
        return null;
    }

    /**
     * Search the constants of a SELECT_BRANCH for a matching
     * value.
     * 
     * @param selectValue the value to match.
     * @param branchNode  the SELECT_BRANCH node.
     * @return boolean
     */
    private boolean searchConstants(Object selectValue, ICodeNode branchNode) {
        // Are the values integer or string?
        boolean integerMode = selectValue instanceof Integer;
        // Get the list of SELECT_CONSTANTS values.
        ICodeNode constantsNode = branchNode.getChildren().get(0);
        ArrayList<ICodeNode> constantsList = constantsNode.getChildren();
        // Search the list of constants.
        if (selectValue instanceof Integer) {
            for (ICodeNode constantNode : constantsList) {
                int constant = (Integer) constantNode.getAttribute(VALUE);
                if (((Integer) selectValue) == constant) {
                    return true; // match
                }
            }
        } else {
            for (ICodeNode constantNode : constantsList) {
                String constant = (String) constantNode.getAttribute(VALUE);
                if (((String) selectValue).equals(constant)) {
                    return true; // match
                }
            }
        }
        return false; // no match
    }
}
