import 'dart:ffi';

import 'package:moducnu/data/remote/api/auth/auth_api.dart';
import 'package:moducnu/data/remote/dto/auth/auth_dto.dart';
import 'package:moducnu/domain/model/User.dart';
import 'package:moducnu/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;

  AuthRepositoryImpl(this.api);

  @override
  Future<User> login(String accountId, String password) async {
    final responseDto = await api.login(LoginRequestDto(accountId: accountId, password: password));
    return User(userId: responseDto.userId, name: responseDto.name, accountId: responseDto.accountId, studentNumber: responseDto.studentNumber);
  }

  @override
  Future<User> signUp(String accountId, String name, int studentNumber, String password) async {
    final responseDto = await api.signUp(UserCreateRequestDto(accountId: accountId, name: name, studentNumber: studentNumber, password: password));
    return User(userId: responseDto.userId, name: responseDto.name, accountId: responseDto.accountId, studentNumber: responseDto.studentNumber);
  }
}