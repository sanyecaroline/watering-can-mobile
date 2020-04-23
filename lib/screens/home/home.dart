import 'package:flutter/material.dart';
import 'package:watering_can/services/auth.dart';
import 'package:watering_can/services/database.dart';
import 'package:provider/provider.dart';
import 'package:watering_can/screens/home/tree_list.dart';
import 'package:watering_can/models/tree.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Tree>>.value(
      value: DatabaseService().trees,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(        
          title: Text('Home'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('sair'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),            
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/water_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: TreeList(),
          ),
      ),
    );
  }
}
