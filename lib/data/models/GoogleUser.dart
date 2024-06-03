class GoogleUser {
  final String displayName;
  final String email;
  final String password;

  GoogleUser({
    required this.displayName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': displayName,
      'email': email,
      'password': password,
    };
  }
}
