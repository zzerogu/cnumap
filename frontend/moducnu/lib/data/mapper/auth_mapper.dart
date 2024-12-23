// Define the mapper function for converting ResponseDto to User
import 'package:moducnu/data/remote/dto/auth/auth_dto.dart';
import 'package:moducnu/domain/model/User.dart';

class UserMapper {
  static User mapToUser(LoginResponseDto dto) {
    return User(
      userId: dto.userId,
      name: dto.name,
      accountId: dto.accountId,
      studentNumber: dto.studentNumber,
    );
  }

  static User mapToUserFromSignUp(UserCreateResponseDto dto) {
    return User(
      userId: dto.userId,
      name: dto.name,
      accountId: dto.accountId,
      studentNumber: dto.studentNumber,
    );
  }
}