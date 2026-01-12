import 'package:flutter/material.dart';

class ManagePositionsScreen extends StatelessWidget {
  const ManagePositionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Positions")),
      body: Column(children: [
        const ListTile(title: Text("President")),
        const ListTile(title: Text("Secretary")),
        TextField(controller: posCtrl, decoration: const InputDecoration(labelText: "New Position")),
        ElevatedButton(onPressed: () {}, child: const Text("Add Position")),
      ]),
    );
  }
}
