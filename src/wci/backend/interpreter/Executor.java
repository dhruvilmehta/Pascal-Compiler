package wci.backend.interpreter;

import wci.backend.Backend;
import wci.intermediate.ICode;
import wci.intermediate.SymTabStack;
import wci.message.Message;

import static wci.message.MessageType.INTERPRETER_SUMMARY;;

public class Executor extends Backend {
    /**
     * Process the intermediate code and the symbol table generated
     * by the
     * parser to execute the source program.
     * 
     * @param iCode  the intermediate code.
     * @param symTab the symbol table.
     * @throws Exception if an error occurred.
     */
    public void process(ICode iCode, SymTabStack symTabStack)
            throws Exception {
        long startTime = System.currentTimeMillis();
        float elapsedTime = (System.currentTimeMillis() - startTime) / 1000f;
        int executionCount = 0;
        int runtimeErrors = 0;
        // Send the interpreter summary message.
        sendMessage(new Message(INTERPRETER_SUMMARY,
                new Number[] { executionCount,
                        runtimeErrors,
                        elapsedTime }));
    }
}
