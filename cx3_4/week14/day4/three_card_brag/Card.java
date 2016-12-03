package three_card_brag;

public abstract class Card {

  SuitType suit;
  ValueType value;

  public Card(String suit, int value) {
    this.suit = suit;
    this.value = value;
  }

}