import 'dart:async';
import 'dart:convert';

import 'package:coinone_model/coinone_model.dart';
import 'package:http/http.dart' as mHttp;
/*
curl --request GET \
     --url https://api.coinone.co.kr/public/v2/markets/KRW \
     --header 'accept: application/json'
 */

Future<List<Market>> fetchMarket() async {
  mHttp.Response response = await mHttp.get(
      Uri.parse("https://api.coinone.co.kr/public/v2/markets/KRW"),
      headers: {"accept": "application/json"});
  return Future(() => Markets.fromJson(jsonDecode(response.body)).markets);
}
