import static org.junit.Assert.assertEquals;
import org.junit.*;

public class BearTest {

  Bear bear;
  Salmon salmon;

  @Before
  public void setup() {
    bear = new Bear("Baloo", 1.5, 90.0);
    salmon = new Salmon();
  }

  @Test
  public void hasName() {
    // Bear bear = new Bear("Baloo");
    assertEquals("Baloo", bear.getName());
  }

  @Test
  public void canEatSalmon() {
    bear.eat(salmon);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void tooManySalmon() {
    for(int i=0; i < 6; i++) {
      bear.eat(salmon);
    }
    assertEquals(5, bear.foodCount());
  }

  /* @Test
  public void hasAge() {
    Bear bear = new Bear("Baloo", 25);
    assertEquals(25, bear.getAge());
  } */

  /* @Test
  public void hasWeight() {
    Bear bear = new Bear("Baloo", 25, 42.4);
    assertEquals(42.4, bear.getWeight(), 0.1);
  } */

  @Test
  public void isReadyForHibernation() {
    assertEquals(true, bear.readyToHibernate());
  }
  
}