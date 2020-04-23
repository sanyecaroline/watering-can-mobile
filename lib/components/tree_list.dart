import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TreeList extends StatelessWidget {
  TreeList({this.firestore});

  final Firestore firestore;  

  void _onReleaseChange(DocumentSnapshot document, bool value) {
    var data = document.data;
    data["watering"] = value;
    document.reference.setData(data);
  }

  @override
  Widget build(BuildContext context) {    
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection("trees")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int licenceCount = snapshot.data.documents.length;
        return ListView.builder(
          itemCount: licenceCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            final dynamic message = document['name'];
            final release = document['watering'] == true;
            return ListTile(
              trailing: Switch(value: release, onChanged: (value) =>_onReleaseChange(document, value)),
              title: Text(message.toString()),
              subtitle: Text('Id: ${document.documentID}'),
            );
          },
        );
      },
    );
  }
}