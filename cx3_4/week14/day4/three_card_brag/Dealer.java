package three_card_brag;

import java.util.Collections;

public class Dealer {

  private ArrayList<Card> deck;
  Card card;
  

  public ArrayList makeDeck() {
    for(SuitType suit : SuitType.values()) {
      for(ValueType value : ValueType.values()) {
        Card card = new Card(suit, value);
        deck.add(card);
      }
    }
    System.out.println(deck);
    return deck;
  }

  public void shuffle() {
    Collections.shuffle(deck);
  }

  public void deal() {

  }

}