import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watering_can/models/tree.dart';
import 'package:watering_can/screens/home/tree_tile.dart';

class TreeList extends StatefulWidget {
  @override
  _TreeListState createState() => _TreeListState();
}

class _TreeListState extends State<TreeList> {
  @override
  Widget build(BuildContext context) {

    final trees = Provider.of<List<Tree>>(context) ?? [];

    return ListView.builder(
      itemCount: trees.length,
      itemBuilder: (context, index) {
        return TreeTile(tree: trees[index]);
      },
    );
  }
}
