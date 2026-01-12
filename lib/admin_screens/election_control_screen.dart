import 'package:flutter/material.dart';
import '../../api.dart';

class ElectionControlScreen extends StatefulWidget {
  const ElectionControlScreen({super.key});

  @override
  State<ElectionControlScreen> createState() => ElectionControlScreenState();
}

class ElectionControlScreenState extends State<ElectionControlScreen> {
  final idCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Election Control")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: idCtrl, decoration: const InputDecoration(labelText: "Election ID")),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () => adminStart(idCtrl.text), child: const Text("Start Election")),
          ElevatedButton(onPressed: () => adminEnd(idCtrl.text), child: const Text("End Election")),
          ElevatedButton(onPressed: () => adminPublish(idCtrl.text), child: const Text("Publish Results")),
        ]),
      ),
    );
  }


}
