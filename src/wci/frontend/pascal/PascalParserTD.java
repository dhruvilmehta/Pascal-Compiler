package wci.frontend.pascal;

import wci.frontend.*;
import wci.frontend.pascal.parsers.BlockParser;
import wci.intermediate.*;
import wci.intermediate.symtabimpl.DefinitionImpl;
import wci.intermediate.symtabimpl.Predefined;
import static wci.intermediate.symtabimpl.SymTabKeyImpl.*;
import wci.message.*;

import static wci.frontend.pascal.PascalTokenType.*;
import static wci.frontend.pascal.PascalErrorCode.*;
import static wci.message.MessageType.PARSER_SUMMARY;

import java.util.EnumSet;

/**
 * <h1>PascalParserTD</h1>
 *
 * <p>
 * The top-down Pascal parser.
 * </p>
 *
 * <p>
 * Copyright (c) 2009 by Ronald Mak
 * </p>
 * <p>
 * For instructional purposes only. No warranties.
 * </p>
 */
public class PascalParserTD extends Parser {
    protected static PascalErrorHandler errorHandler = new PascalErrorHandler();

    /**
     * Constructor.
     * 
     * @param scanner the scanner to be used with this parser.
     */
    public PascalParserTD(Scanner scanner) {
        super(scanner);
    }

    /**
     * Constructor for subclasses.
     * 
     * @param parent the parent parser.
     */
    public PascalParserTD(PascalParserTD parent) {
        super(parent.getScanner());
    }

    private SymTabEntry routineId; // name of the routine being parsed

    /**
     * Parse a Pascal source program and generate the symbol table
     * and the intermediate code.
     * 
     * @throws Exception if an error occurred.
     */
    public void parse()
            throws Exception {
        long startTime = System.currentTimeMillis();
        ICode iCode = ICodeFactory.createICode();
        Predefined.initialize(symTabStack);
        Predefined.initialize(symTabStack);
        // Create a dummy program identifier symbol table entry.
        routineId = symTabStack.enterLocal("DummyProgramName".toLowerCase());
        routineId.setDefinition(DefinitionImpl.PROGRAM);
        symTabStack.setProgramId(routineId);
        // Push a new symbol table onto the symbol table stack and set
        // the routine's symbol table and intermediate code.
        routineId.setAttribute(ROUTINE_SYMTAB, symTabStack.push());
        routineId.setAttribute(ROUTINE_ICODE, iCode);
        BlockParser blockParser = new BlockParser(this);
        try {
            Token token = nextToken();
            // Parse a block.
            ICodeNode rootNode = blockParser.parse(token, routineId);
            iCode.setRoot(rootNode);
            symTabStack.pop();
            // Look for the final period.
            token = currentToken();
            if (token.getType() != DOT) {
                errorHandler.flag(token, MISSING_PERIOD, this);
            }
            token = currentToken();
            // Send the parser summary message.
            float elapsedTime = (System.currentTimeMillis() - startTime) / 1000f;
            sendMessage(new Message(PARSER_SUMMARY,
                    new Number[] { token.getLineNumber(),
                            getErrorCount(),
                            elapsedTime }));
        } catch (java.io.IOException ex) {
            errorHandler.abortTranslation(IO_ERROR, this);
        }
    }

    /**
     * Synchronize the parser.
     * 
     * @param syncSet the set of token types for synchronizing the
     *                parser.
     * @return the token where the parser has synchronized.
     * @throws Exception if an error occurred.
     */
    public Token synchronize(EnumSet<PascalTokenType> syncSet)
            throws Exception {
        Token token = currentToken();
        // If the current token is not in the synchronization set,
        // then it is unexpected and the parser must recover.
        if (!syncSet.contains(token.getType())) {
            // Flag the unexpected token.
            errorHandler.flag(token, UNEXPECTED_TOKEN, this);
            // Recover by skipping tokens that are not
            // in the synchronization set.
            do {
                token = nextToken();
            } while (!(token instanceof EofToken) &&
                    !syncSet.contains(token.getType()));
        }
        return token;
    }

    /**
     * Return the number of syntax errors found by the parser.
     * 
     * @return the error count.
     */
    public int getErrorCount() {
        return errorHandler.getErrorCount();
    }
}