Future<bool> login(String email, String password) async {
  return email == "admin@evote.com" && password == "123456";
}

Future<List<String>> getPositions() async {
  return ["President", "Secretary"];
}

Future<List<String>> getCandidates(String position) async {
  return ["Alice", "Bob"];
}

Future<bool> verifyIdentity() async {
  return true;
}

Future<bool> castVote(String candidate) async {
  return true;
}

Future<Map<String, int>> getResults() async {
  return {"Alice": 60, "Bob": 40};
}
