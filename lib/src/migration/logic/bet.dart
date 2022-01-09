import 'package:pockergui1/src/migration/logic/player.dart';

class Bet {
  final Player author;
  int _amount;
  bool _folded;
  bool _isAllIn = false;

  int get amount => _amount;

  bool get folded => _folded;

  bool get isAllIn => _isAllIn;

  Bet(this.author, [this._amount = 0, this._folded = false]);

  bool call(Bet another) => bet(another.amount);

  bool bet(int amount) {
    if (folded) return false;

    int toAdd = amount - _amount;
    if (toAdd < 0) return false;

    final bool charged = author.charge(toAdd);
    if (charged == true) {
      _amount += toAdd;
      return true;
    } else
      return false;
  }

  bool allIn() {
    if (folded) return false;

    int toAdd = author.balance;

    if (!author.charge(toAdd)) throw StateError('Unable to charge credits');
    _amount += toAdd;
    _isAllIn = true;
    return true;
  }

  void fold() => _folded = true;
}
