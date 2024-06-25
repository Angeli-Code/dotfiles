import java.util.*;
import java.io.*;

/**
 * Class Description:
 * Handler for the data of any list that gets passed in.
 *
 * @author Angeli-Code
 * @version 1.0
 * @since 5/26/2024
 */
public class DataHandler {
  private String dataFile = "data.txt";
  GUI guiHandler = new GUI();

  /**
   * loads the List object with the contents of the data file.
   * 
   * @param inList list object that will be filled
   */
  public void loadData(List inList) {
    try {
      File inFile = new File(dataFile);
      while (!inFile.exists()) {
        createDatabase();
      }

      Scanner listReader = new Scanner(inFile);
      while (listReader.hasNextLine()) {
        String listItem = listReader.nextLine();
        inList.addItem(listItem);
      }

      listReader.close();
    } catch (FileNotFoundException e) {
      System.out.println("Data file not found. Creating a new one.");
      createDatabase();
    }
  }

  /**
   * Saves the data in the current ArrayList and stores it in the data file.
   * 
   * @param inList list object containing the contents that will be written to
   *               file.
   */
  public void saveData(List inList) {
    try {
      PrintWriter outWriter = new PrintWriter(new FileWriter(dataFile));
      for (String item : inList.getItems()) {
        outWriter.println(item);
      }
      outWriter.close();
    } catch (IOException e) {
      System.out.println("An error occurred while saving data: " + e.getMessage());
    }
  }

  /**
   * Adds item to an ArrayList stored in a passed in List Object.
   * 
   * @param inList list object containing the storage to add items.
   */
  public void addItem(List inList) {
    Scanner keyboard = new Scanner(System.in);
    System.out.print("Enter To-Do you wish to add: ");
    String itemAdded = keyboard.nextLine();
    inList.addItem(itemAdded);
  }

  /**
   * Removes item from an ArrayList stored in a passed in List Object.
   * 
   * @param inList list object ocntaining the storage to remove items.
   */
  public void removeItem(List inList) {
    Scanner keyboard = new Scanner(System.in);
    System.out.print("Enter number of To-Do you wish to remove: ");
    int toDoNum = keyboard.nextInt();
    inList.removeItem(toDoNum - 1);
  }

  /**
   * Helper method that creates a text file to store contents of the
   * ArrayList. Called during loadList if text file does not exist.
   */
  private void createDatabase() {
    try {
      guiHandler.clearConsole();
      System.out.println("Welcome to your CLI-TODO-APP");
      guiHandler.pause(1000);
      System.out.print("Setting Up Database");
      for (int i = 0; i <= 2; i++) {
        System.out.print(".");
        guiHandler.pause(1500);
      }
      guiHandler.pause(1000);
      File listCreator = new File(dataFile);
      System.out.println("\nDatabase Created...");
      guiHandler.pause(1000);
      PrintWriter creator = new PrintWriter(new FileWriter(listCreator));
      System.out.print("Adding Default To-Do Item");
      for (int i = 0; i <= 2; i++) {
        System.out.print(".");
        guiHandler.pause(1500);
      }
      guiHandler.pause(1000);
      creator.println("Default To-Do Item");
      creator.close();
      System.out.println("\nApplication Ready!!Enjoy!!");
      guiHandler.pause(2000);
    } catch (IOException e) {
      System.out.println("Error: " + e.getMessage());
    }
  }
}
