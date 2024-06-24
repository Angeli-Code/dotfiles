import java.util.ArrayList;

/**
 * Represents GUI Objects.
 *
 * @author Angeli-Code
 * @version 1.0
 * @since 5/26/2024
 */
public class GUI implements GuiInterface {
  /**
   * Prints out the List to the user.
   * 
   * @param inList  ArrayList containing To-Do Items.
   * @param inTitle Title of the header.
   */
  @Override
  public void displayList(ArrayList<String> inList, String inTitle) {
    String divider = "========================================================================";
    pause(30);
    System.out.println(divider);
    pause(30);
    System.out.println("|   _____ _    _____    _____    ______             ___                |");
    pause(30);
    System.out.println("|  /  __ \\ |  |_   _|  |_   _|   |  _  \\           / _ \\               |");
    pause(30);
    System.out.println("|  | /  \\/ |    | |______| | ___ | | | |___ ______/ /_\\ \\_ __  _ __    |");
    pause(30);
    System.out.println("|  | |   | |    | |______| |/ _ \\| | | / _ \\______|  _  | '_ \\| '_ \\   |");
    pause(30);
    System.out.println("|  \\ \\__/\\ |____| |_     | | (_) | |/ / (_) |     | | | | |_) | |_) |  |");
    pause(30);
    System.out.println("|   \\____|_____|___/     \\_/\\___/|___/ \\___/      \\_| |_/ .__/| .__/   |");
    pause(30);
    System.out.println("|                                                       | |   | |      |");
    System.out.println("|                                                       |_|   |_|      |");
    System.out.println(divider);
    pause(30);

    for (int i = 0; i < inList.size(); i++) {
      System.out.printf("%2d: %s\n", (i + 1), inList.get(i));
      pause(85);
    }

    if (inList.size() > 1 && inList.size() != 0) {
      System.out.println(divider);
      System.out
          .println("|                            " + inList.size() + " things to do                            |");
      System.out.println(divider);
    } else {
      System.out.println(divider);
      System.out
          .println("|                            " + inList.size() + " thing to do                             |");
      System.out.println(divider);
    }

  }

  /**
   * Displays the options that the user can choose from to interact with the
   * application.
   */
  @Override
  public void displayOptions() {
    System.out.println("Options:");
    System.out.println("1. Add a to-do item");
    System.out.println("2. Remove a to-do item");
    System.out.println("3. Exit application");
    System.out.print("Enter Choice: ");
  }

  /**
   * Pause animations. Aesthetic intentions.
   * 
   * @param timeLength length of time in milliseconds that the application will
   *                   pause.
   */
  @Override
  public void pause(int timeLength) {
    try {
      Thread.sleep(timeLength);
    } catch (InterruptedException e) {
      System.out.println("Pause interrupted: " + e.getMessage());
    }
  }

  /**
   * Clears the console. Adding a repaint effect for the user.
   */
  @Override
  public void clearConsole() {
    System.out.print("\033[H\033[2J");
    System.out.flush();
  }
}
