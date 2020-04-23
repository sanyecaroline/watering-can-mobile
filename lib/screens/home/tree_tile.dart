import 'package:flutter/material.dart';
import 'package:watering_can/services/database.dart';
import 'package:watering_can/models/tree.dart';

class TreeTile extends StatelessWidget {

  final Tree tree;
  TreeTile({ this.tree });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          trailing: Switch(value: tree.watering, onChanged: (value) => DatabaseService(uid: tree.uid).updateUserData(tree.name, value)),
          title: Text(tree.name),
          subtitle: Text(tree.watering ? 'regando' : 'aguardando regação'),
        ),
      ),
    );
  }
}