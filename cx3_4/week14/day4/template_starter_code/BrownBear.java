public class BrownBear extends Bear {

  public String gatherFood() {
    return "Off to Farmfoods";
  }

  @Override
  public void wakeUp() {
    System.out.println("Slept in");
  }

}