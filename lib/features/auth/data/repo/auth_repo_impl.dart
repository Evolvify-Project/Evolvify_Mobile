import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/auth/data/model/auth_model.dart';
import 'package:evolvify/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, AuthModel>> login({email, passWord}) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/login',
        data: {'email': email, 'passWord': passWord},
      );

      print('📩 MESSAGE: ${data['message']}');
      print(data);
      final token = data['data']['accessToken'];
      print('🟢 Extracted Token: $token');

      return right(AuthModel(token: token));
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
    confirmPassword,
  }) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/register',
        data: {
          'email': email,
          'passWord': passWord,
          'userName': userName,
          'confirmPassword': confirmPassword,
        },
      );
      print('📩 MESSAGE: ${data['message']}');
      if (data['data'] == null) {
        return left(ServerFailure(data['message'] ?? 'Something went wrong'));
      }

      return right(AuthModel.fromJson(data['data']));
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
      print('📩 MESSAGE: ${data['message']}');
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
      print('📩 MESSAGE: ${data['message']}');

      return Right(AuthModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> resetPassWord({
    code,
    email,
    confirmPassword,
    passWord,
  }) async {
    try {
      var data = await ApiServices().post(
        endPoint: 'Accounts/ResetPassword',
        data: {'email': email, 'code': code, 'password': passWord},
      );
      print('📩 MESSAGE: ${data['message']}');

      return Right(AuthModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
