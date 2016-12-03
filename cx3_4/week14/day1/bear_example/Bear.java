class Bear {

  //////////////
  // ATTRIBUTES
  //////////////

  private String name;
  private int age;
  private String colour;
  private double weight;
  private Salmon[] belly;
  private int salmonCount;
  private double height;

  ////////////////
  // CONSTRUCTORS
  ////////////////

  public Bear(String name, double height, double weight) {
    this.name = name;
    this.belly = new Salmon[5];
    salmonCount = 0;
    this.height = height;
    this.weight = weight;
  }

  public Bear(String name, String colour) {
    this.name = name;
    this.colour = colour;
  }

  public Bear(String name, int age, double weight) {
    this.name = name;
    this.age = age;
    this.weight = weight;
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

  public int getAge() {
    return this.age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public double getWeight() {
    return this.weight;
  }

  public void setWeight(double weight) {
    this.weight = weight;
  }

  public double getHeight() {
    return this.height;
  }

  public void setHeight(double height) {
    this.height = height;
  }

  public boolean readyToHibernate() {
    if ( weight / Math.pow(height, 2) >= 30 ) {
      return true;
    } else {
      return false;
    }
  }

  public void eat(Salmon salmon) {
    if (isBellyFull()) return;
    belly[salmonCount] = salmon;
    salmonCount++;
  }

  public int foodCount() {
    return salmonCount;
  }

  public boolean isBellyFull() {
    if (salmonCount >= belly.length) {
      return true;
    } else {
      return false;
    }
  }

  public void sleep() {
    for(int i=0; i < belly.length; i++) {
      belly[i] = null;
    }
    salmonCount = 0;
  }
}