package wci.backend.compiler.generators;

import static wci.backend.compiler.Instruction.GOTO;
import static wci.backend.compiler.Instruction.IFNE;
import static wci.intermediate.icodeimpl.ICodeNodeTypeImpl.TEST;

import java.util.ArrayList;

import wci.backend.compiler.CodeGenerator;
import wci.backend.compiler.Label;
import wci.backend.compiler.PascalCompilerException;
import wci.intermediate.ICodeNode;
import wci.intermediate.icodeimpl.ICodeNodeTypeImpl;

public class LoopGenerator extends StatementGenerator {

    public LoopGenerator(CodeGenerator parent) {
        super(parent);
    }

    /**
     * Generate code for a looping statement.
     * 
     * @param node the root node of the statement.
     */
    public void generate(ICodeNode node)
            throws PascalCompilerException {
        ArrayList<ICodeNode> loopChildren = node.getChildren();
        ExpressionGenerator expressionGenerator = new ExpressionGenerator(this);
        StatementGenerator statementGenerator = new StatementGenerator(this);
        Label loopLabel = Label.newLabel();
        Label nextLabel = Label.newLabel();
        emitLabel(loopLabel);
        // Generate code for the children of the LOOP node.
        for (ICodeNode child : loopChildren) {
            ICodeNodeTypeImpl childType = (ICodeNodeTypeImpl) child.getType();
            // TEST node: Generate code to test the boolean expression.
            if (childType == TEST) {
                ICodeNode expressionNode = child.getChildren().get(0);
                expressionGenerator.generate(expressionNode);
                emit(IFNE, nextLabel);
                localStack.decrease(1);
            }
            // Statement node: Generate code for the statement.
            else {
                statementGenerator.generate(child);
            }
        }
        emit(GOTO, loopLabel);
        emitLabel(nextLabel);
    }

}
