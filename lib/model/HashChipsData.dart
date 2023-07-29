class HashChipsData {
  final String label;

  HashChipsData({
    required this.label,
  });

  HashChipsData copy({
    String? label,
  }) =>
      HashChipsData(
        label: label ?? this.label,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HashChipsData &&
              runtimeType == other.runtimeType &&
              label == other.label;

  @override
  int get hashCode =>
      label.hashCode;
}