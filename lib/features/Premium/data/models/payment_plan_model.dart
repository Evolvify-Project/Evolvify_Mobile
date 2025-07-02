class PaymentPlanModel {
  String? name;
  String? description;
  String? stripePriceId;
  int? price;
  String? currency;
  String? interval;

  PaymentPlanModel({
    this.name,
    this.description,
    this.stripePriceId,
    this.price,
    this.currency,
    this.interval,
  });

  factory PaymentPlanModel.fromJson(Map<String, dynamic> json) {
    return PaymentPlanModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      stripePriceId: json['stripePriceId'] as String?,
      price: json['price'] as int?,
      currency: json['currency'] as String?,
      interval: json['interval'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'stripePriceId': stripePriceId,
    'price': price,
    'currency': currency,
    'interval': interval,
  };
}
