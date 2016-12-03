public abstract class Bear {

  public abstract String gatherFood();

  public String roar(){
    return "Roar!";
  }

  public void typicalDay() {
    wakeUp();
    System.out.println(gatherFood());
    eat();
    sleep();
  }

  public void wakeUp() {
    System.out.println("Waking up");
  }

  public void eat() {
    System.out.println("Eating");
  }

  public void sleep() {
    System.out.println("Zzzzzzz");
  }
  
}