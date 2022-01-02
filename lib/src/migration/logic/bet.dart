import 'package:pockergui1/src/migration/logic/player.dart';

class Bet {
  Player author;
  int _amount;
  bool _folded;

  int get amount => _amount;

  bool get folded => _folded;

  Bet(this.author, this._amount, this._folded);

  bool call(Bet another) => bet(another.amount);

  bool bet(int amount) {
    if (folded) return false;

    int toAdd = amount - _amount;
    bool charged = author.charge(toAdd);
    if (charged == true) {
      _amount += toAdd;
      return true;
    } else
      return false;
  }

  void fold() => _folded = true;
}
