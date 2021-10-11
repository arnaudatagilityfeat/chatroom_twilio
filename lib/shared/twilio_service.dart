import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TwilioFunctionsService {
  TwilioFunctionsService._();
  static final instance = TwilioFunctionsService._();

  final http.Client client = http.Client();
  final accessTokenUrl =
      'https://twiliochatroomaccesstoken-3265.twil.io/accessToken';

  Future<dynamic> createToken(String identity) async {
    /// TODO: implement the function to call the access token
  }
}
