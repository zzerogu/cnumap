import '../model/User.dart';

abstract class AuthRepository {
  Future<User> login(String accountId, String password);
  Future<User> signUp(String accountId, String name, int studentNumber, String password);
  Future<User?> getUserFromPreferences();
}