enum Chip { none, dealer, smallBlind, bigBlind }

enum PlayerStatus {
  normal,
  unequalized,
  folded,
}

class PlayerRoundInfo {
  final String name;
  final int bet;
  final Chip chip;
  final PlayerStatus status;
  final bool isCurrent;

  const PlayerRoundInfo({
    required this.name,
    required this.bet,
    required this.chip,
    required this.status,
    required this.isCurrent,
  });

  PlayerRoundInfo copyWith({
    String? name,
    int? bet,
    Chip? chip,
    PlayerStatus? status,
    bool? isCurrent,
  }) =>
      PlayerRoundInfo(
        name: name ?? this.name,
        bet: bet ?? this.bet,
        chip: chip ?? this.chip,
        status: status ?? this.status,
        isCurrent: isCurrent ?? this.isCurrent,
      );
}
