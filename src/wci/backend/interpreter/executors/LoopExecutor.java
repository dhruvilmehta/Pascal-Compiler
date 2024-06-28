package wci.backend.interpreter.executors;

import static wci.intermediate.icodeimpl.ICodeNodeTypeImpl.TEST;

import java.util.List;

import wci.backend.interpreter.Executor;
import wci.intermediate.ICodeNode;
import wci.intermediate.icodeimpl.ICodeNodeTypeImpl;

public class LoopExecutor extends StatementExecutor {
    public LoopExecutor(Executor parent) {
        super(parent);
    }

    /**
     * Execute a loop statement.
     * 
     * @param node the root node of the statement.
     * @return null.
     */
    public Object execute(ICodeNode node) {
        boolean exitLoop = false;
        ICodeNode exprNode = null;
        List<ICodeNode> loopChildren = node.getChildren();
        ExpressionExecutor expressionExecutor = new ExpressionExecutor(this);
        StatementExecutor statementExecutor = new StatementExecutor(this);
        // Loop until the TEST expression value is true.
        while (!exitLoop) {
            ++executionCount; // count the loop statement itself
            // Execute the children of the LOOP node.
            for (ICodeNode child : loopChildren) {
                ICodeNodeTypeImpl childType = (ICodeNodeTypeImpl) child.getType();
                // TEST node?
                if (childType == TEST) {
                    if (exprNode == null) {
                        exprNode = child.getChildren().get(0);
                    }
                    exitLoop = (Boolean) expressionExecutor.execute(exprNode);
                }
                // Statement node.
                else {
                    statementExecutor.execute(child);
                }
                // Exit if the TEST expression value is true,
                if (exitLoop) {
                    break;
                }
            }
        }
        return null;
    }
}
