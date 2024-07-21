package wci.frontend.pascal.tokens;

import wci.frontend.Source;
import wci.frontend.pascal.PascalToken;
import wci.frontend.pascal.PascalTokenType;

import static wci.frontend.pascal.PascalTokenType.*;

public class PascalWordToken extends PascalToken {

    public PascalWordToken(Source source) throws Exception {
        super(source);
    }

    /**
     * Extract a Pascal word token from the source.
     * 
     * @throws Exception if an error occurred.
     */
    protected void extract()
            throws Exception {
        StringBuilder textBuffer = new StringBuilder();
        char currentChar = currentChar();
        // Get the word characters (letter or digit). The scanner has
        // already determined that the first character is a letter.
        while (Character.isLetterOrDigit(currentChar)) {
            textBuffer.append(currentChar);
            currentChar = nextChar(); // consume character
        }
        text = textBuffer.toString();
        // Is it a reserved word or an identifier?
        type = (RESERVED_WORDS.contains(text.toLowerCase()))
        ? PascalTokenType.valueOf(text.toUpperCase()) // reserved word
        : IDENTIFIER; // identifier
    }
}
