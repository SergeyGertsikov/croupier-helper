import 'package:pockergui1/src/logic/match.dart';

class Round {
  String roundState = "PreFlop";
  int bankS = 0;

  Match match = Match();

  void nextRound() {
    switch (roundState) {
      case "PreFlop":
        {
          flop();
        }
        break;

      case "Flop":
        {
          tern();
        }
        break;

      case "Tern":
        {
          river();
        }
        break;

      case "River":
        {
          showDown();
        }
        break;
    }
  }

  void flop() {
    roundState = 'Flop';
    bankS += match.bank;
    match.player1.bet = 0;
    match.player2.bet = 0;
  }

  void tern() {
    roundState = 'Tern';
    bankS += match.bank;
    match.player1.bet = 0;
    match.player2.bet = 0;
  }

  void river() {
    roundState = 'River';
    bankS += match.bank;
    match.player1.bet = 0;
    match.player2.bet = 0;
  }

  void showDown() {}
}
