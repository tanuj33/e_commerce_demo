import 'package:e_commerce_demo/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthService {
  late Box<User> _userBox;
  static const String _loggedInKey = 'isLoggedIn';
  static const String _currentUsernameKey = 'currentUsername';

  AuthService() {
    _userBox = Hive.box<User>('users');
  }

  // Register a new user
  Future<bool> registerUser(String username, String password) async {
    if (_userBox.containsKey(username)) {
      return false; // User already exists
    }
    await _userBox.put(username, User(username: username, password: password));
    return true;
  }

  // Authenticate user login
  Future<bool> loginUser(String username, String password) async {
    final user = _userBox.get(username);
    if (user != null && user.password == password) {
      // Store login status
      await Hive.box('appSettings').put(_loggedInKey, true);
      await Hive.box('appSettings').put(_currentUsernameKey, username);
      return true;
    }
    return false;
  }

  // Check if a user is currently logged in
  bool isLoggedIn() {
    return Hive.box('appSettings').get(_loggedInKey, defaultValue: false);
  }

  // Get the current logged-in username
  String? getCurrentUsername() {
    return Hive.box('appSettings').get(_currentUsernameKey);
  }

  // Logout user
  Future<void> logoutUser() async {
    await Hive.box('appSettings').put(_loggedInKey, false);
    await Hive.box('appSettings').delete(_currentUsernameKey);
  }
}