import 'package:moducnu/domain/repository/auth_repository.dart';

import '../model/User.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> execute(String accountId, String password) {
    return repository.login(accountId, password);
  }
}