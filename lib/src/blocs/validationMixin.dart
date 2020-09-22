import 'dart:async';

class ValidationMixIn {
  static String substringEmail = '';
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      if (email.substring(email.indexOf('@')).contains('.') &&
          email.substring(email.indexOf('@')).length > 7) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid Email!');
      }
    } else {
      sink.addError('Enter a valid Email!');
    }
  });

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.isNotEmpty && data.length > 6) {
      sink.add(data);
    } else {
      if (data.isEmpty)
        sink.addError('Password cannot be Empty!');
      else
        sink.addError('password is weak');
    }
  });
}
