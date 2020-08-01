class UserPreferences {
  final int id;
  final List<String> activityList;
  final List<String> outcomeList;
  final String theme;

  UserPreferences({this.id, this.activityList, this.theme, this.outcomeList});

  //
  //
  //Local Database Operations
  //
  //
  Map<String, dynamic> toMap() {
    return {
      'activityList': this.activityList,
      'outcomeList': this.outcomeList,
      'theme': this.theme,
    };
  }

  factory UserPreferences.fromMap(int id, Map<String, dynamic> map) {
    return UserPreferences(
      id: id,
      activityList: map['activityList'],
      outcomeList: map['outcomeList'],
      theme: map['theme'],
    );
  }

  UserPreferences copyWith({
    int id,
    List<String> activityList,
    List<String> outcomeList,
    String theme,
  }) {
    return UserPreferences(
      id: id ?? this.id,
      activityList: activityList ?? this.activityList,
      outcomeList: outcomeList ?? this.outcomeList,
      theme: theme ?? this.theme,
    );
  }
}
