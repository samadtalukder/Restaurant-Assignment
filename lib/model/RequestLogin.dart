
import 'dart:convert';

RequestLogin requestLoginFromJson(String str) => RequestLogin.fromJson(json.decode(str));

String requestLoginToJson(RequestLogin data) => json.encode(data.toJson());

class RequestLogin {
  RequestLogin({
    this.email,
    this.restaurant,
    this.password,
    this.isTermsAccepted,
  });

  String email;
  String restaurant;
  String password;
  bool isTermsAccepted;

  factory RequestLogin.fromJson(Map<String, dynamic> json) => RequestLogin(
    email: json["email"],
    restaurant: json["restaurant"],
    password: json["password"],
    isTermsAccepted: json["is_terms_accepted"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "restaurant": restaurant,
    "password": password,
    "is_terms_accepted": isTermsAccepted,
  };
}
