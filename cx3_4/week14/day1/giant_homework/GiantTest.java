import static org.junit.Assert.assertEquals;
import org.junit.*;

public class GiantTest {

  Giant giant;
  Chiddler chiddler;

  @Before
  public void setup() {
    giant = new Giant("Fleshlumpeater", 45);
    chiddler = new Chiddler();
  }

  @Test
  public void hasName() {
    assertEquals("Fleshlumpeater", giant.getName());
  }

  @Test
  public void canEatChiddler() {
    giant.eat(chiddler);
    assertEquals(1, giant.foodCount());
  }

}