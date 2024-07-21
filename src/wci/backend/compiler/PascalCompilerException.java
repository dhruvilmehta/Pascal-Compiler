package wci.backend.compiler;

/**
 * <h1>PascalCompilerException</h1>
 *
 * <p>
 * Error during the Pascal compiler's code generation.
 * </p>
 */
public class PascalCompilerException extends Exception {
    public PascalCompilerException(String message) {
        super(message);
    }
}