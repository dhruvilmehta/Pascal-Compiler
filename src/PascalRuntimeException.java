/**
 * <h1>PascalRuntimeException</h1>
 *
 * <p>
 * Pascal Runtime Library:
 * Exception thrown for an error while executing the generated
 * code.
 * </p>
 */
public class PascalRuntimeException extends Exception {
    public PascalRuntimeException(String message) {
        super(message);
    }
}