import java.util.ArrayList;

/**
 * Contains List Objects.
 *
 * @author Angel-Code
 * @version 1.0
 * @since 5/26/2024
 */
public class List {
  private String title;
  private ArrayList<String> items = new ArrayList<>();

  /**
   * Constructor that sets the title of the current List Object.
   * 
   * @param title title of the current List Object.
   */
  public List(String title) {
    this.title = title;
  }

  /**
   * Sets the title of the current List object.
   * 
   * @param inTitle title of the current List object.
   */
  public void setTitle(String inTitle) {
    title = inTitle;
  }

  /**
   * Getter for title.
   * 
   * @return title of the current List Object.
   */
  public String getTitle() {
    return title;
  }

  /**
   * Getter for the ArrayList containing To-Do Items.
   * 
   * @return ArrayList containing To-Do Items.
   */
  public ArrayList<String> getItems() {
    return items;
  }

  /**
   * Adds Items to the ArrayList containing To-Do Items.
   * 
   * @param item Item that will be added.
   */
  public void addItem(String item) {
    items.add(item);
  }

  /**
   * Removes Items from the ArrayList contaiing To-Do Items.
   * 
   * @param index the index in the array of what item to remove.
   */
  public void removeItem(int index) {
    if (index >= 0 && index < items.size()) {
      items.remove(index);
    } else {
      System.out.println("Invalid item number.");
    }
  }
}
