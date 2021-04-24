import 'dart:convert';

class ControlAwnsersModel {
  final bool isAwnsered;
  final dynamic selected;

  ControlAwnsersModel({
    required this.isAwnsered,
    required this.selected,
  });

  ControlAwnsersModel copyWith({
    bool? isAwnsered,
    dynamic? selected,
  }) {
    return ControlAwnsersModel(
      isAwnsered: isAwnsered ?? this.isAwnsered,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isAwnsered': isAwnsered,
      'selected': selected,
    };
  }

  factory ControlAwnsersModel.fromMap(Map<String, dynamic> map) {
    return ControlAwnsersModel(
      isAwnsered: map['isAwnsered'],
      selected: map['selected'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ControlAwnsersModel.fromJson(String source) =>
      ControlAwnsersModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ControlAwnsersModel(isAwnsered: $isAwnsered, selected: $selected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ControlAwnsersModel &&
        other.isAwnsered == isAwnsered &&
        other.selected == selected;
  }

  @override
  int get hashCode => isAwnsered.hashCode ^ selected.hashCode;
}
