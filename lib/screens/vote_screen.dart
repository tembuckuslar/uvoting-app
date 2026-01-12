import 'package:flutter/material.dart';
import '../api.dart';
import 'verify_identity_screen.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  List<String> positions = [];
  List<String> candidates = [];
  String? selectedPosition;

  @override
  void initState() {
    super.initState();
    getPositions().then((data) => setState(() => positions = data));
  }

  void _loadCandidates(String pos) async {
    final data = await getCandidates(pos);
    setState(() {
      selectedPosition = pos;
      candidates = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vote")),
      body: Column(children: [
        ...positions.map((p) => ListTile(title: Text(p), onTap: () => _loadCandidates(p))),
        ...candidates.map((c) => ListTile(
          title: Text(c),
          trailing: ElevatedButton(
            child: const Text("Vote"),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VerifyIdentityScreen(candidate: c))),
          ),
        )),
      ]),
    );
  }
}
