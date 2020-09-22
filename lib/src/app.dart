import 'package:flutter/material.dart';
import 'package:flutter_app_login_block/src/blocs/login_provider.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: MaterialApp(
        title: 'Log me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
