import 'package:connection/models/student.dart';
import 'package:connection/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  static final Profile _instance = Profile._internal();
  Profile._internal({
    this.token = ""
  });
  factory Profile() {
    return _instance;
  }
  SharedPreferences? _pref;
  
  late String token;
  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
    token = "";
  }
Student student = Student();
User user = User();

  Future<void> setUsernamePassword(String username, String password) async {
    _pref?.setString("username", username);
    _pref?.setString("password", password);
  }

  String get name => _pref?.getString('username') ?? '';
  String get password => _pref?.getString('password') ?? '';
}
