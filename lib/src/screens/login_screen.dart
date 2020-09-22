import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_login_block/src/blocs/block.dart';
import 'package:flutter_app_login_block/src/blocs/login_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginProvider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(height: 20.0),
          emailField(loginBloc),
          SizedBox(height: 20.0),
          passwordField(loginBloc),
          SizedBox(height: 20.0),
          loginRaisedButton(loginBloc),
          SizedBox(height: 20.0),
          gotoAnimation(context),
        ],
      ),
    );
  }

  Widget emailField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.addEmail,
          decoration: InputDecoration(
              hintText: 'you@email.com',
              labelText: 'Enter Email',
              errorText: snapshot.error,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              )),
        );
      },
    );
  }

  Widget passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: bloc.addPassword,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              hintText: 'Enter Password',
              labelText: 'Enter Password',
              errorText: snapshot.error,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              )),
        );
      },
    );
  }

  Widget loginRaisedButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("Login"),
          color: CupertinoColors.systemBlue,
          onPressed: snapshot.hasData?bloc.submit:null,
        );
      },
    );
  }
}
