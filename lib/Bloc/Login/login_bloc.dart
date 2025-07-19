import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailEvents>(_emailMethod);
    on<PasswordEvents>(_passwordMethod);
    on<LoginApiEvents>(_fetchLoginApi);
  }

  void _emailMethod(EmailEvents events, Emitter<LoginState> emit) {
    emit(state.copyWith(email: events.email));
  }

  void _passwordMethod(PasswordEvents events, Emitter<LoginState> emit) {
    emit(state.copyWith(password: events.password));
  }

  void _fetchLoginApi(LoginApiEvents event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    Map<String, dynamic> data = {
      "email": state.email,
      "password": state.password,
    };
    try {
      final response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        body: data,
      );
      var codedData = jsonDecode(response.body);
      var code = response.statusCode;

      if (response.statusCode == code) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.success,
            message: "Login Successful",
          ),
        );
      } else {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
            message: codedData["error"],
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(loginStatus: LoginStatus.error, message: e.toString()),
      );
      print(e.toString());
    }
  }
}
