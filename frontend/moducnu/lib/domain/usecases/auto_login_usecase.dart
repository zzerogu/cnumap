import 'package:moducnu/domain/repository/auth_repository.dart';

import '../model/User.dart';

class AutoLoginUseCase {
  final AuthRepository repository;

  AutoLoginUseCase(this.repository);

  Future<User?> execute() {
    return repository.getUserFromPreferences();
  }
}