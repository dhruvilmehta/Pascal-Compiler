package wci.ide.ideimpl;

import javax.swing.JInternalFrame;

import wci.ide.IDEControl;

/**
 * <h1>DebugFrame</h1>
 *
 * <p>
 * The debug window of the Pascal IDE.
 * </p>
 */
public class DebugFrame
        extends JInternalFrame
        implements ActionListener {
    private IDEControl control;

    /**
     * Constructor.
     */
    public DebugFrame() {
        try {
            initGuiComponents();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Constructor.
     * 
     * @param control the IDE control.
     */
    public DebugFrame(IDEControl control) {
        this();
        this.control = control;
    }

    /**
     * Single step button event handler.
     */
    private void singleStepAction() {
        control.sendToDebuggerProcess("step;");
        control.sendToDebuggerProcess("stack;");
        control.enableConsoleWindowInput();
    }
}
