package jewellery;

public class Ring {

  // MetalType is the name of the enum to which metal belongs.
  MetalType metal;
  GemType gem;

  public Ring(MetalType metal, GemType gem) {
    this.metal = metal;
    this.gem = gem;
  }

  public Ring(MetalType metal) {
    this.metal = metal;
  }

  public MetalType getMetal() {
    return this.metal;
  }

  public GemType getGem() {
    return this.gem;
  }

}