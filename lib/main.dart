import 'package:flutter/material.dart';
import 'package:watering_can/models/user.dart';
import 'package:watering_can/services/auth.dart';
import 'package:watering_can/screens/wrapper.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        ),
    );
  }
}
