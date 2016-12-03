import static org.junit.Assert.*;
import org.junit.*;
import jewellery.*;

public class RingTest {

  Ring ring;
  
  @Before 
  public void before() {
    ring = new Ring(MetalType.GOLD, GemType.AMETHYST);
  }

  @Test
  public void canGetMetal() {
    ring = new Ring(MetalType.GOLD);
    assertEquals(ring.getMetal(), MetalType.GOLD);
  }

  @Test
  public void canGetGem() {
    assertEquals(ring.getGem(), GemType.AMETHYST);
  }

  /*@Test
  public void metalCanBeMisspelt() {
    ring = new Ring("Glod");
    assertEquals(ring.getMetal(), "Glod");
  }

  @Test
  public void metalCanBeBanana() {
    ring = new Ring("Banana");
    assertEquals(ring.getMetal(), "Banana");
  }*/

}