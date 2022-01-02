import 'package:pockergui1/src/logic/player.dart';
import 'package:pockergui1/src/logic/round.dart';

class Match {
  Player player1 = Player(201, 0);
  Player player2 = Player(300, 0);
  int bank = 0;
  Round round = Round();

  void bankSize() {
    bank = player1.bet + player2.bet;
  }

  void callBet(x) {
    if (x == 1) {
      player1.bet == player2.bet;
    } else {
      player2.bet == player1.bet;
    }
  }

  void devByIn(x) {
    if (x == 1) {
      player1.buyIn -= player1.bet;
    } else {
      player2.buyIn -= player2.bet;
    }
  }

  void roundChange() {
    if (player1.bet == player2.bet) {
      round.nextRound();
    }
  }
}
