class LoginModel {
  final String? email;
  final String? password;
  final bool? isLoading;

  LoginModel({this.email, this.password, this.isLoading});

  LoginModel copyWith({
    String? email,
    String? password,
    bool? isLoading,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'LoginModel(email: $email, password: $password , isLoading: $isLoading)';
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ isLoading.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || hashCode == other.hashCode;
  }
}
