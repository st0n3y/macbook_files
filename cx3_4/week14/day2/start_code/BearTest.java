import static org.junit.Assert.*;
import org.junit.*;

public class BearTest {
  
  Bear bear;
  Salmon salmon;
  Human human;
  Honeypot honeypot;
  Olive olive;
  Chicken chicken;

  @Before 
  public void before() {
    bear = new Bear("Baloo");
    salmon = new Salmon();
    human = new Human();
    honeypot = new Honeypot();
    olive = new Olive();
    chicken = new Chicken();
  }

  @Test
  public void hasName() {
    assertEquals("Baloo", bear.getName());
  }

  @Test
  public void bellyStartsEmpty() {
    assertEquals(0, bear.foodCount());
  }

  @Test
  public void canEatSalmon() {
    bear.eat(salmon);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void shouldEmptyBellyAfterSleeping() {
    bear.eat(salmon);
    bear.sleep();
    assertEquals(0, bear.foodCount());
  }

  @Test
  public void canEatHuman() {
    bear.eat(human);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void canEatHoneypot() {
    bear.eat(honeypot);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void canEatChicken() {
    bear.eat(chicken);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void canBoke() {
    bear.eat(salmon);
    Edible food = bear.boke();
    // assertNotNull(food);

    // This is an example of casting.
    Salmon original = (Salmon)food;
    assertEquals("swimming", original.swim());
  }

  @Test
  public void canCheckBellyContents() {
    bear.eat(salmon);
    bear.eat(human);
    bear.eat(chicken);

    assertEquals("Salmon, Human, Chicken, ", bear.bellyContents());
  }

  @Test
  public void willBokeIfEatsOlive() {
    bear.eat(human);
    bear.eat(olive);
    assertEquals(1, bear.foodCount());
  }

}