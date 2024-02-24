import 'market.dart';

class Markets {
  Markets({
    required this.result,
    required this.errorCode,
    required this.serverTime,
    required this.markets,
  });

  String result;
  String errorCode;
  int serverTime;
  List<Market> markets;

  factory Markets.fromJson(Map<String, dynamic> json) => Markets(
    result: json["result"],
    errorCode: json["error_code"],
    serverTime: json["server_time"],
    markets: List<Market>.from(json["markets"].map((x) => Market.fromJson(x))),
  );
}
