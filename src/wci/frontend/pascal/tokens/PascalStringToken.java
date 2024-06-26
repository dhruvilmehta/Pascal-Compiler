package wci.frontend.pascal.tokens;

import wci.frontend.Source;
import wci.frontend.pascal.PascalToken;
import static wci.frontend.pascal.PascalErrorCode.*;
import static wci.frontend.pascal.PascalTokenType.*;
import static wci.frontend.Source.EOF;

public class PascalStringToken extends PascalToken{
    
    public PascalStringToken(Source source) throws Exception {
        super(source);
    }

    /**
     * Extract a Pascal string token from the source.
     * 
     * @throws Exception if an error occurred.
     */
    protected void extract()
            throws Exception {
        StringBuilder textBuffer = new StringBuilder();
        StringBuilder valueBuffer = new StringBuilder();
        char currentChar = nextChar(); // consume initial quote
        textBuffer.append('\'');
        // Get string characters.
        do {
            // Replace any whitespace character with a blank.
            if (Character.isWhitespace(currentChar)) {
                currentChar = ' ';
            }
            if ((currentChar != '\'') && (currentChar != EOF)) {
                textBuffer.append(currentChar);
                valueBuffer.append(currentChar);
                currentChar = nextChar(); // consume character
            }
            // Quote? Each pair of adjacent quotes represents a single-quote.
            if (currentChar == '\'') {
                while ((currentChar == '\'') && (peekChar() == '\'')) {
                    textBuffer.append("''");
                    valueBuffer.append(currentChar); // append single-quote
                    currentChar = nextChar(); // consume pair of quotes
                    currentChar = nextChar();
                }
            }
        } while ((currentChar != '\'') && (currentChar != EOF));
        if (currentChar == '\'') {
            nextChar(); // consume final quote
            textBuffer.append('\'');
            type = STRING;
            value = valueBuffer.toString();
        } else {
            type = ERROR;
            value = UNEXPECTED_EOF;
        }
        text = textBuffer.toString();
    }
}
