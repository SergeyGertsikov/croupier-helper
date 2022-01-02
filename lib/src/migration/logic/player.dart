class Player {
  String _name;
  int _balance;

  /// Текущее имя игрока.
  String get name => _name;

  /// Текущий баланс игрока.
  int get balance => _balance;

  /// Конструктор по умолчанию.
  Player(
    this._name, [
    this._balance = 0,
  ]);

  /// Переименовывает игрока.
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
