package wci.backend.compiler;

import wci.backend.Backend;
import wci.intermediate.ICode;
import wci.intermediate.SymTabStack;
import wci.message.Message;

import static wci.message.MessageType.COMPILER_SUMMARY;

public class CodeGenerator extends Backend {
    /**
     * Process the intermediate code and the symbol table generated
     * by the
     * parser to generate machine-language instructions.
     * 
     * @param iCode  the intermediate code.
     * @param symTab the symbol table.
     * @throws Exception if an error occurred.
     */
    public void process(ICode iCode, SymTabStack symTabStack)
            throws Exception {
        long startTime = System.currentTimeMillis();
        float elapsedTime = (System.currentTimeMillis() - startTime) / 1000f;
        int instructionCount = 0;
        // Send the compiler summary message.
        sendMessage(new Message(COMPILER_SUMMARY,
                new Number[] { instructionCount,
                        elapsedTime }));
    }
}
