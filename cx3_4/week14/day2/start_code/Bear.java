import java.util.*;

public class Bear {
  
  private String name;
  private ArrayList<Edible> belly;


  public Bear(String name) {
    this.belly = new ArrayList<Edible>();
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public int foodCount(){
    /*int count = 0;
    for(Salmon salmon : belly) {
      if(salmon != null){
        count++;
      }
    }
    return count;*/
    
    return belly.size();
  }

  public void eat(Edible food) {
    belly.add(food);
    if(food instanceof Intolerant) {
      boke();
    }
  }

  public void sleep() {
    belly.clear();
  }

  public Edible boke() {
    if (foodCount() > 0) {
      return belly.remove(0);
    }
    return null;
  }

  public String bellyContents() {
    String contents = "";
    for(Edible food : belly) {
      contents += food.getClass() + ", ";
    }
    return contents;
  }

}