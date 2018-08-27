// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  factory LoginPage.forDesignTime() => LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 80.0),
              Column(
                children: <Widget>[
                  Image.asset('assets/diamond.png'),
                  SizedBox(height: 16.0),
                  Text('SHRINE'),
                ],
              ),
              SizedBox(height: 120.0),
              PrimaryColorOverride(
                color: kShrineBrown900,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              PrimaryColorOverride(
                color: kShrineBrown900,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      [_usernameController, _passwordController]
                          .forEach((c) => c.clear());
                    },
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                  RaisedButton(
                    elevation: 8.0,
                    child: Text('NEXT'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}

class PrimaryColorOverride extends StatelessWidget {
  final Color color;

  const PrimaryColorOverride({
    @required this.color,
    @required this.child,
    Key key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => Theme(
        child: child,
        data: Theme.of(context).copyWith(primaryColor: color),
      );
}
