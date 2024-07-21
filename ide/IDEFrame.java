package wci.ide;

import javax.swing.JFrame;

import wci.ide.ideimpl.DebugFrame;

/**
 * <h1>IDEFrame</h1>
 *
 * <p>
 * The main window of the Pascal IDE.
 * </p>
 */
public class IDEFrame
        extends JFrame
        implements IDEControl {
    private EditFrame editFrame;
    private DebugFrame debugFrame;
    private ConsoleFrame consoleFrame;
    private CallStackFrame stackFrame;
    private DebuggerProcess debuggerProcess;

    /**
     * Send a command or runtime input text to the debugger
     * process.
     * 
     * @param text the command string or input text.
     */
    public void sendToDebuggerProcess(String text) {
        debuggerProcess.writeToDebuggerStandardInput(text);
    }

    /**
     * Enable runtime input from the console window.
     */
    public void enableConsoleWindowInput() {
        consoleFrame.enableInput();
    }
}
