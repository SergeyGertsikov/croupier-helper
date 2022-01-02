class Player {
  String _name;
  int _balance;

  String get name => _name;

  int get balance => _balance;

  Player(
    this._name, [
    this._balance = 0,
  ]);

  void rename(String newName) => _name = newName;

  /// Взымает с баланса игрока указанную сумму.
  ///
  /// [amount] — сумма, подлежащая списанию.
  ///
  /// Возвращает true, если списание произошло успешно
  /// или false в противном случае.
  bool charge(int amount) {
    if (_balance >= amount) {
      _balance -= amount;
      return true;
    } else
      return false;
  }

  /// Начисляет в баланс игрока указанную сумму.
  ///
  /// [amount] — сумма, подлежащая начислению.
  void replenish(int amount) => _balance += amount;
}
