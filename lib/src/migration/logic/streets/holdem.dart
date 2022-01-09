import 'package:pockergui1/src/migration/logic/abstract/player_info.dart';
import 'package:pockergui1/src/migration/logic/abstract/street.dart';
import 'package:pockergui1/src/migration/logic/bet.dart';

enum HoldemStreetMarker {
  preflop,
  flop,
  tern,
  river,
}

class HoldemStreet extends Street<HoldemStreetMarker> {
  HoldemStreet({
    required HoldemStreetMarker marker,
    required List<Bet> bets,
    required Bet opener,
  }) : super(
          marker: marker,
          bets: bets,
          opener: opener,
        );

  @override
  bool bet(int amount) {
    int maxAmount = 0;
    for (Bet bet in finished)
      if (maxAmount < bet.amount) maxAmount = bet.amount;
    if (amount < maxAmount) return false;
    if (current.bet(amount)) {
      acceptBet();
      return true;
    }
    return false;
  }

  @override
  bool call() {
    int maxAmount = 0;
    for (Bet bet in finished)
      if (maxAmount < bet.amount) maxAmount = bet.amount;

    if (current.bet(maxAmount)) {
      acceptBet();
      return true;
    }
    return false;
  }

  @override
  void fold() {
    current.fold();
    acceptBet();
  }

  @override
  Bet? nextBet(List<Bet> pending) {
    // TODO: implement nextBet
    throw UnimplementedError();
  }

  @override
  // TODO: implement roundInfo
  List<PlayerRoundInfo> get roundInfo => throw UnimplementedError();

  @override
  void onStreetDone(int bank) {
    // TODO: implement onStreetDone
  }

  @override
  bool allIn() {
    if (current.allIn()) {
      acceptBet();
      return true;
    }
    return false;
  }
}
