package wci.frontend.pascal.parsers;

import wci.frontend.Token;
import wci.frontend.pascal.PascalParserTD;
import wci.intermediate.ICodeFactory;
import wci.intermediate.ICodeNode;
import static wci.intermediate.icodeimpl.ICodeKeyImpl.*;
import static wci.intermediate.icodeimpl.ICodeNodeTypeImpl.CALL;

import wci.intermediate.SymTabEntry;

public class CallDeclaredParser extends CallParser {
    public CallDeclaredParser(PascalParserTD parent) {
        super(parent);
    }

    /**
     * Parse a call to a declared procedure or function.
     * 
     * @param token the initial token.
     * @return the root node of the generated parse tree.
     * @throws Exception if an error occurred.
     */
    public ICodeNode parse(Token token)
            throws Exception {
        // Create the CALL node.
        ICodeNode callNode = ICodeFactory.createICodeNode(CALL);
        SymTabEntry pfId = symTabStack.lookup(token.getText().toLowerCase());
        callNode.setAttribute(ID, pfId);
        callNode.setTypeSpec(pfId.getTypeSpec());
        token = nextToken(); // consume procedure or function identifier
        ICodeNode parmsNode = parseActualParameters(token, pfId,
                true, false, false);
        callNode.addChild(parmsNode);
        return callNode;
    }
}
