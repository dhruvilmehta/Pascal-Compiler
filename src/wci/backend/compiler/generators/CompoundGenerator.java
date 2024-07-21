package wci.backend.compiler.generators;

import java.util.ArrayList;

import wci.backend.compiler.CodeGenerator;
import wci.backend.compiler.PascalCompilerException;
import static wci.backend.compiler.Instruction.*;
import wci.intermediate.ICodeNode;

public class CompoundGenerator extends StatementGenerator {

    /**
     * Constructor.
     * @param the parent executor.
     */
    public CompoundGenerator(CodeGenerator parent)
    {
        super(parent);
    }

    /**
     * Generate code for a compound statement.
     * 
     * @param node the root node of the compound statement.
     */
    public void generate(ICodeNode node)
            throws PascalCompilerException {
        ArrayList<ICodeNode> children = node.getChildren();
        // Loop over the statement children of the COMPOUND node and generate
        // code for each statement. Emit a NOP is there are no statements.
        if (children.size() == 0) {
            emit(NOP);
        } else {
            StatementGenerator statementGenerator = new StatementGenerator(this);
            for (ICodeNode child : children) {
                statementGenerator.generate(child);
            }
        }
    }
}
