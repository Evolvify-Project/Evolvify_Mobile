import 'package:dartz/dartz.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/features/Premium/data/models/payment_plan_model.dart';

abstract class PaymentRepo {
 Future<Either<Failure, List<PaymentPlanModel>>> getPaymentPlans();
}