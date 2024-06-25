import java.util.*;

/**
 * Application Description:
 * Command Line Interface To-Do Application. Intended for use by those who
 * actively
 * interact with CLI and allows for quick access to a todolist so the user can
 * keep
 * track of daily tasks.
 *
 * @author Angeli-Code
 * @version 1.0
 * @since 5/26/2024
 */
public class AppDriver {

  public static void main(String[] args) {

    GUI guiHandler = new GUI();
    DataHandler dataHandler = new DataHandler();
    List toDoList = new List("CLI-TODO-APP");
    dataHandler.loadData(toDoList);

    Scanner keyboard = new Scanner(System.in);
    boolean continueProgram = true;

    while (continueProgram) {
      guiHandler.clearConsole();
      guiHandler.displayList(toDoList.getItems(), toDoList.getTitle());
      guiHandler.displayOptions();

      while (!keyboard.hasNextInt()) {
        System.out.print("Invalid Option. Please Try Again.");
        guiHandler.pause(1000);
        guiHandler.clearConsole();
        guiHandler.displayList(toDoList.getItems(), toDoList.getTitle());
        guiHandler.displayOptions();
        keyboard.nextLine();
      }
      int userChoice = keyboard.nextInt();
      keyboard.nextLine();

      switch (userChoice) {
        case 1:
          dataHandler.addItem(toDoList);
          break;
        case 2:
          dataHandler.removeItem(toDoList);
          break;
        case 3:
          return;
        default:
          System.out.println("Invalid option. Please try again.");
          guiHandler.pause(1000);
      }
      dataHandler.saveData(toDoList);
    }
    keyboard.close();
  }
}
