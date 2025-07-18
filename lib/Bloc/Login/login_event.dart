import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();
  @override
  List<Object?> get props => [];
}

class EmailEvents extends LoginEvents {
  final String email;
  const EmailEvents(this.email);
  @override
  List<Object?> get props => [email];
}

class PasswordEvents extends LoginEvents {
  final String password;
  const PasswordEvents({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginApiEvents extends LoginEvents {}
