class Giant {

  //////////////
  // ATTRIBUTES
  //////////////

  private String name;
  private int height;
  private Chiddler[] belly;
  private int chiddlerCount;

  ////////////////
  // CONSTRUCTORS
  ////////////////

  public Giant(String name, int height) {
    this.name = name;
    this.height = height;
    this.belly = new Chiddler[8];
    chiddlerCount = 0;
  }

  ///////////
  // METHODS
  ///////////

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getHeight() {
    return this.height;
  }

  public void setHeight(int height) {
    this.height = height;
  }

  public void eat(Chiddler chiddler) {
    if (isBellyFull()) return;
    belly[chiddlerCount] = chiddler;
    chiddlerCount++;
  }

  public int foodCount() {
    return chiddlerCount;
  }

  public boolean isBellyFull() {
    if (chiddlerCount >= belly.length) {
      return true;
    } else {
      return false;
    }
  }

}