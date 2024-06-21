package wci.backend.interpreter.executors;

import java.util.ArrayList;

import wci.backend.interpreter.Executor;
import wci.intermediate.ICodeNode;

public class CompoundExecutor extends StatementExecutor{
    
    public CompoundExecutor(Executor parent) {
        super(parent);
    }

    /**
     * Execute a compound statement.
     * 
     * @param node the root node of the compound statement.
     * @return null.
     */
    public Object execute(ICodeNode node) {
        // Loop over the children of the COMPOUND node and execute each child.
        StatementExecutor statementExecutor = new StatementExecutor(this);
        ArrayList<ICodeNode> children = node.getChildren();
        for (ICodeNode child : children) {
            statementExecutor.execute(child);
        }
        return null;
    }
}
