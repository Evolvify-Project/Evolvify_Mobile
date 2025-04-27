import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/auth/data/model/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> login({email, passWord});
  Future<Either<Failure, AuthModel>> register({
    email,
    passWord,
    userName,
    confirmPassword,
  });
  Future<Either<Failure, String>> forgetPassWord({email});
  Future<Either<Failure, AuthModel>> verifyPassWord({code, email});
  Future<Either<Failure, AuthModel>> resetPassWord({
    code,
    email,
    confirmPassword,
    passWord,
  });
}
