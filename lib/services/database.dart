import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watering_can/models/tree.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference treeCollection = Firestore.instance.collection('trees');

  Future updateUserData(String name, bool watering) async {
    return await treeCollection.document(uid).setData({
      'name': name,
      'watering': watering,      
    });
  }

  // tree list from snapshot
  List<Tree> _treeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Tree(
        uid: doc.documentID ?? '',
        name: doc.data['name'] ?? '',
        watering: doc.data['watering'] ?? false,
      );
    }).toList();
  }

  //get trees streams
  Stream<List<Tree>> get trees {
    return treeCollection.snapshots()
      .map(_treeListFromSnapshot);
  }
}