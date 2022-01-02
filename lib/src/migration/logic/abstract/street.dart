import 'package:meta/meta.dart';
import 'package:pockergui1/src/migration/logic/abstract/player_info.dart';
import 'package:pockergui1/src/migration/logic/bet.dart';
import 'package:pockergui1/src/migration/logic/player.dart';

typedef StreetFinishCallback = void Function(int bank);

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
  static List<Bet> betsFromPlayers(List<Player> players) => [
        for (Player player in players) Bet(player),
      ];

  /// Тип-имя улицы (flop, turn, etc).
  final T type;

  final StreetFinishCallback onFinish;

  @protected
  final List<Bet> bets;

  /// Конструктор по умолчанию.
  ///
  /// <br>
  /// [players] — список участников этапа.
  Street({
    required this.type,
    required this.onFinish,
    required List<Player> players,
  }) : bets = betsFromPlayers(players);

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

  @protected
  void commitBet();
}

mixin TurnHelper<T> on Street<T> {
  late final List<Player> _pending;

  late final List<Player> _finished;

  late Player _current;

  Bet get current => bets.firstWhere((bet) => bet.author == _current);

  void initTurnHelper({
    required List<Player> players,
    required Player starter,
  }) {
    assert(
      players.contains(starter),
      'Starter player shall participate street!',
    );

    _pending = List.of(players);
    _pending.remove(starter);

    _current = starter;

    _finished = [];
  }

  void resetTurn() {
    _pending.addAll(_finished);

    _finished.clear();
  }

  @override
  void commitBet(){
    _finished.add(_current);

    Player next = nextPlayer(_pending);
    _pending.remove(next);

    _current = next;
  }

  Player nextPlayer(List<Player> pending);
}
