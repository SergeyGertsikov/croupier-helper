import 'package:meta/meta.dart';
import 'package:pockergui1/src/migration/logic/abstract/bet_queue.dart';
import 'package:pockergui1/src/migration/logic/abstract/player_info.dart';
import 'package:pockergui1/src/migration/logic/bet.dart';
import 'package:pockergui1/src/migration/logic/player.dart';

/// Этап раунда.
///
/// [M] — перечисляемый тип-имя улицы.
///
/// Пример:
/// ```
/// enum HoldemStreetType { preflop, flop, turn, river }
///
/// class HoldemStreet extends Street<T> {
///   ...
/// }
/// ```
abstract class Street<M> extends BetQueue {
  static List<Bet> betsFromPlayers(List<Player> players) => [
        for (Player player in players) Bet(player),
      ];

  /// Маркер покерной улицы (flop, turn, etc).
  final M marker;

  /// Конструктор по умолчанию.
  ///
  /// <br>
  /// [players] — список участников этапа.
  Street({
    required this.marker,
    required List<Player> players,
    required Player opener,
  }) : super(
          bets: betsFromPlayers(players),
          opener: betsFromPlayers(players)
              .firstWhere((bet) => bet.author == opener),
        );

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

  @override
  void acceptBet();

  @protected
  void streetDone(int bank);

  @override
  void onEnd() {
    int bank = 0;
    for(Bet bet in bets) bank += bet.amount;

    streetDone(bank);
  }
}
