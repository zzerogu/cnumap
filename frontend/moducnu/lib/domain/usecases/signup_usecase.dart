import 'package:moducnu/domain/model/User.dart';
import 'package:moducnu/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User> execute(String accountId, String name, int studentNumber, String password) {
    return repository.signUp(accountId, name, studentNumber, password);
  }
}