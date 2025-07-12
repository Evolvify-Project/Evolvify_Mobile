import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Premium/data/models/payment_plan_model.dart';
import 'package:evolvify/features/Premium/data/repo/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  @override
  Future<Either<Failure, List<PaymentPlanModel>>> getPaymentPlans() async {
    try {
      var data = await ApiServices().get(
        endPoint: 'Payment/GetSubscriptionPlans',
      );
      List<PaymentPlanModel> paymentPlansList =
          (data["data"] as List)
              .map((plan) => PaymentPlanModel.fromJson(plan))
              .toList();
      print(paymentPlansList);
      return right(paymentPlansList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createSubscription(
    String stripePriceId,
  ) async {
    try {
      if (stripePriceId.isEmpty) {
        return left(ServerFailure("Invalid priceId"));
      }

      final response = await ApiServices().post(
        endPoint: 'Payment/create-subscription',
        data: {'PriceId': stripePriceId},
      );

      print(" Full API Response: $response");

      final url = response["data"]?["checkoutSessionUrl"];
      if (url == null || url is! String) {
        return left(
          ServerFailure("No valid checkoutSessionUrl returned from server"),
        );
      }

      return right(url);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
