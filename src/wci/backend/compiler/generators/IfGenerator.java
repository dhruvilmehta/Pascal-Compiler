package wci.backend.compiler.generators;

import static wci.backend.compiler.Instruction.GOTO;
import static wci.backend.compiler.Instruction.IFEQ;

import java.util.ArrayList;

import wci.backend.compiler.CodeGenerator;
import wci.backend.compiler.Label;
import wci.backend.compiler.PascalCompilerException;
import wci.intermediate.ICodeNode;

/**
 * IfGenerator
 */
public class IfGenerator extends StatementGenerator {

    public IfGenerator(CodeGenerator parent) {
        super(parent);
    }

    /**
     * Generate code for an IF statement.
     * 
     * @param node the root node of the statement.
     */
    public void generate(ICodeNode node)
            throws PascalCompilerException {
        ArrayList<ICodeNode> children = node.getChildren();
        ICodeNode expressionNode = children.get(0);
        ICodeNode thenNode = children.get(1);
        ICodeNode elseNode = children.size() > 2 ? children.get(2) : null;
        ExpressionGenerator expressionGenerator = new ExpressionGenerator(this);
        StatementGenerator statementGenerator = new StatementGenerator(this);
        Label nextLabel = Label.newLabel();
        // Generate code for the boolean expression.
        expressionGenerator.generate(expressionNode);
        // Generate code for a THEN statement only.
        if (elseNode == null) {
            emit(IFEQ, nextLabel);
            localStack.decrease(1);
            statementGenerator.generate(thenNode);
        }
        // Generate code for a THEN statement and an ELSE statement.
        else {
            Label falseLabel = Label.newLabel();
            emit(IFEQ, falseLabel);
            localStack.decrease(1);
            statementGenerator.generate(thenNode);
            emit(GOTO, nextLabel);
            emitLabel(falseLabel);
            statementGenerator.generate(elseNode);
        }
        emitLabel(nextLabel);
    }
}