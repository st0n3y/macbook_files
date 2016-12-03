package wizard_management;
import behaviours.*;

public class Ogre extends MythicalBeast implements CanAttack {
  
  public Ogre(String name){
    super(name);
  }

  public String getName() {
    return this.name;
  }

  public String attack(Wizard) {
    return "Ogre smash!";
  }

}