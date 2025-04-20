import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/auth/data/model/auth_model.dart';
import 'package:evolvify/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Dio dio = Dio();
  Future<Either<Failure, AuthModel>> login({email, passWord}) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/login',
        data: {'email': email, 'passWord': passWord},
      );
      print(AuthModel.fromJson(data).toString());
      return right(AuthModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> register({
    email,
    passWord,
    userName,
  }) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/register',
        data: {'email': email, 'passWord': passWord, 'userName': userName},
      );
      return right(AuthModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassWord({email}) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/ForgetPassword',
        data: {'Email': email},
      );
      return Right(data['message'] ?? 'Check your inbox');
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> verifyPassWord({code, email}) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/ResetPassword',
        data: {'code': code, 'email': email},
      );
      return Right(AuthModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
