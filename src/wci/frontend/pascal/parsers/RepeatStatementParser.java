package wci.frontend.pascal.parsers;

import wci.frontend.Token;
import wci.frontend.pascal.PascalParserTD;
import static wci.frontend.pascal.PascalTokenType.*;
import static wci.frontend.pascal.PascalErrorCode.*;
import wci.intermediate.ICodeFactory;
import wci.intermediate.ICodeNode;
import static wci.intermediate.icodeimpl.ICodeNodeTypeImpl.*;

public class RepeatStatementParser extends StatementParser {

    public RepeatStatementParser(PascalParserTD parent) {
        super(parent);
    }

    /**
     * Parse a REPEAT statement.
     * 
     * @param token the initial token.
     * @return the root node of the generated parse tree.
     * @throws Exception if an error occurred.
     */
    public ICodeNode parse(Token token)
            throws Exception {
        token = nextToken(); // consume the REPEAT
        // Create the LOOP and TEST nodes.
        ICodeNode loopNode = ICodeFactory.createICodeNode(LOOP);
        ICodeNode testNode = ICodeFactory.createICodeNode(TEST);
        // Parse the statement list terminated by the UNTIL token.
        // The LOOP node is the parent of the statement subtrees.
        StatementParser statementParser = new StatementParser(this);
        statementParser.parseList(token, loopNode, UNTIL, MISSING_UNTIL);
        token = currentToken();
        // Parse the expression.
        // The TEST node adopts the expression subtree as its only child.
        // The LOOP node adopts the TEST node.
        ExpressionParser expressionParser = new ExpressionParser(this);
        testNode.addChild(expressionParser.parse(token));
        loopNode.addChild(testNode);
        return loopNode;
    }
}
