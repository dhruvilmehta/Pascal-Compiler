package wci.backend.compiler.generators;

import static wci.intermediate.icodeimpl.ICodeKeyImpl.ID;
import static wci.intermediate.symtabimpl.SymTabKeyImpl.*;

import wci.backend.compiler.CodeGenerator;
import wci.intermediate.ICodeNode;
import wci.intermediate.RoutineCode;
import static wci.intermediate.symtabimpl.RoutineCodeImpl.*;
import wci.intermediate.SymTabEntry;

public class CallGenerator extends StatementGenerator {

    public CallGenerator(CodeGenerator parent) {
        super(parent);
    }

    /**
     * Generate code to call a procedure or function.
     * 
     * @param node the root node of the call.
     */
    public void generate(ICodeNode node) {
        SymTabEntry routineId = (SymTabEntry) node.getAttribute(ID);
        RoutineCode routineCode = (RoutineCode) routineId.getAttribute(ROUTINE_CODE);
        CallGenerator callGenerator = routineCode == DECLARED
                ? new CallDeclaredGenerator(this)
                : new CallStandardGenerator(this);
        callGenerator.generate(node);
    }
}
