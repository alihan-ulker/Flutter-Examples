class UserContext {
  final String name;

  UserContext(this.name);

  UserContext copyWith({
    String? name,
  }) {
    return UserContext(
      name ?? this.name,
    );
  }
}
