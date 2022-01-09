import 'package:meta/meta.dart';
import 'package:pockergui1/src/migration/logic/bet.dart';

abstract class BetQueue {
  final List<Bet> _pending = [];

  final List<Bet> _finished = [];

  @protected
  final List<Bet> bets;

  Bet _current;

  Bet get current => _current;

  List<Bet> get finished => _finished.toList(growable: false);

  BetQueue({
    required this.bets,
    required Bet opener,
  }) : _current = opener {
    List<Bet> bets = this.bets.toList();
    bets.remove(_current);

    _pending.addAll(bets);
  }

  @protected
  void resetTurn() {
    _pending.addAll(_finished);

    _finished.clear();
  }

  @protected
  void acceptBet() {
    _finished.add(_current);

    Bet? next = nextBet(_pending);

    if (next is Bet) {
      _current = next;
      _pending.remove(next);
    } else
      onEnd();
  }

  Bet? nextBet(List<Bet> pending);

  void onEnd();
}
