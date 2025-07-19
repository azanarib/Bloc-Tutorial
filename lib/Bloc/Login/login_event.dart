import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();
  @override
  List<Object?> get props => [];
}

// Email events
class EmailEvents extends LoginEvents {
  final String email;
  const EmailEvents({required this.email});
  @override
  List<Object?> get props => [email];
}

// Password events
class PasswordEvents extends LoginEvents {
  final String password;
  const PasswordEvents({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginApiEvents extends LoginEvents {}
