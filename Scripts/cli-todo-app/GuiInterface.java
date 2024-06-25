import java.util.*;

/**
 * Used to create GUI Objects
 *
 * @author Angeli-Code
 * @version 1.0
 * @since 5/26/2024
 */
public interface GuiInterface {
  /**
   * Prints out the List to the user.
   * 
   * @param inList  ArrayList containing To-Do Items.
   * @param inTitle Title of the header.
   */
  void displayList(ArrayList<String> inList, String title);

  /**
   * Displays the options that the user can choose from to interact with the
   * application.
   */
  void displayOptions();

  /**
   * Pause animations. Aesthetic intentions.
   * 
   * @param timeLength length in milliseconds the application will pause.
   */
  void pause(int timeLength);

  /**
   * Clears the console. Adding a repaint effect for the user.
   */
  void clearConsole();
}
