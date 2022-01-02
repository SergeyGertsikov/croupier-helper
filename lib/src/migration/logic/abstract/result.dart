import 'package:meta/meta.dart';
import 'package:pockergui1/src/logic/player.dart';

@immutable
class BetResult {
  final bool success;
  final Player? winner;

  const BetResult({
    required this.success,
    this.winner,
  });

  bool get isRoundFinished => winner is Player;
}
