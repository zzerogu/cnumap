import 'dart:ffi';

import 'package:moducnu/data/mapper/auth_mapper.dart';
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
    return UserMapper.mapToUser(responseDto);
  }

  @override
  Future<User> signUp(String accountId, String name, int studentNumber, String password) async {
    final responseDto = await api.signUp(UserCreateRequestDto(accountId: accountId, name: name, studentNumber: studentNumber, password: password));
    return UserMapper.mapToUserFromSignUp(responseDto);
  }

  @override
  Future<User?> getUserFromPreferences() {
    // TODO : SharedPreferences를 이용하여 사용자 정보를 가져오는 로직 구현
    return Future.value(null);
  }
}