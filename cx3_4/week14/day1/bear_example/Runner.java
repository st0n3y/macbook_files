class Runner {
  
  public static void main(String[] args) {
    Bear bear = new Bear("Baloo", 25, 42.4);
    bear.setName("Yogi");
    // String name = bear.getName();
    bear.setName("Paddington");

    System.out.println(bear.getName());
  }
}