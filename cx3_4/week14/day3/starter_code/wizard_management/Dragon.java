package wizard_management;
import behaviours.*;

public class Dragon extends MythicalBeast implements Flyable, CanAttack {

  public Dragon(String name){
    super(name);
  }

  public String getName() {
    return this.name;
  }

  public String fly(){
    return "Standing up tall, beating wings, lift off!";
  }

  public String attack(Wizard) {
    return "Grarrr!";
  }

}