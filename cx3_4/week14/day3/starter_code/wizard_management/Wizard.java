package wizard_management;
import behaviours.*;

public class Wizard {
  String name;
  // Broomstick broomstick;
  Flyable ride;
  CanAttack attacker;

  public Wizard(String name, Flyable ride){
    this.name = name;
    this.ride = ride;
  }

  public String getName() {
    return this.name;
  }

  public Flyable getRide() {
    return this.ride;
  }

  public void setRide(Flyable ride) {
    this.ride = ride;
  }

  public String fly() {
    return this.ride.fly();
  }

  public String defend(CanAttack attacker) {
    return "Begone, foul " + attacker.getName() + "!";
  }

}