import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  const LoginState({
    this.email = "",
    this.loginStatus = LoginStatus.initial,
    this.message = "",
    this.password = "",
  });

  LoginState copyWith({
    String? email,
    String? message,
    String? password,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object?> get props => [email, message, loginStatus, password];
}

enum LoginStatus { initial, success, loading, error }
