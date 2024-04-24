import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'statusRequesr.dart';

class Curd {
  Future<Either<StatusRequest, Map>> postdata(String link, Map body, Map<String, String> headers) async {
    try {
      var response = await http.post(Uri.parse(link), body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.errorServer);
      }
    } catch (e) {
      return const Left(StatusRequest.errorServer);
    }
  }
}
