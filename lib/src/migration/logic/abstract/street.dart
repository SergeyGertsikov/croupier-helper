import 'package:pockergui1/src/migration/logic/abstract/player_info.dart';
import 'package:pockergui1/src/migration/logic/player.dart';

/// Этап раунда.
///
/// [T] — перечисляемый тип-имя улицы.
///
/// Пример:
/// ```
/// enum HoldemStreetType { preflop, flop, turn, river }
///
/// class HoldemStreet extends Street<T> {
///   ...
/// }
/// ```
abstract class Street<T> {
  /// Тип-имя улицы (flop, turn, etc).
  final T type;

  /// Конструктор по умолчанию.
  ///
  /// <br>
  /// [players] — список участников этапа.
  Street(this.type, List<Player> players);

  /// Информация об игроках и ставках для отображения.
  List<PlayerRoundInfo> get roundInfo;

  /// Изменяет ставку текущего игрока до переданного размера.
  ///
  /// [amount] — размер, до которого должна быть изменена ставка.
  ///
  /// Возвращает [true], если ставка изменена успешно,
  /// или [false] в противном случае.
  bool bet(int amount);

  /// Уравнивает ставку текущего игрока с наиболее подходящей
  /// в зависимости от правил.
  ///
  /// Возвращает [true], если ставка уравнена успешно,
  /// или [false] в противном случае.
  bool call();

  /// Выполняет фолд от имени текущего игрока.
  void fold();
}
