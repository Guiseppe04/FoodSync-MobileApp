class ApiService {
  static List<Map<String, String>> users = [];

  // REGISTER
  static Future<bool> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    users.add({
  "email": email,
  "password": password,
});

print("REGISTERED: $email / $password");
print("ALL USERS: $users");

    return true;
  }

  // LOGIN
  static Future<bool> login(String email, String password) async {
  await Future.delayed(Duration(seconds: 1));

  print("LOGIN TRY: $email / $password");
  print("USERS: $users");

  for (var user in users) {
    if (user["email"] == email && user["password"] == password) {
      return true;
    }
  }

  return false;
}
}