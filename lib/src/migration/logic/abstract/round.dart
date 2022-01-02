import 'package:meta/meta.dart';
import 'package:pockergui1/src/migration/logic/abstract/player_info.dart';
import 'package:pockergui1/src/migration/logic/abstract/result.dart';
import 'package:pockergui1/src/migration/logic/abstract/street.dart';

abstract class Round {
  @protected
  Street get street;

  List<PlayerRoundInfo> get info;

  BetResult bet(int amount);

  BetResult call();

  BetResult fold();

  BetResult check();
}
