import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app_login_block/src/blocs/validationMixin.dart';

class LoginBloc extends Object with ValidationMixIn {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  Function(String) get addEmail => _email.sink.add;

  Function(String) get addPassword => _password.sink.add;

  submit(){

    final validEmail=_email.value;
    final validPassword=_password.value;
    print('Email is $validEmail & password is $validPassword');

  }
  dispose() {
    _email.close();
    _password.close();
  }
}
