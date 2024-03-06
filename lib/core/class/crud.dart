import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:semo/core/functions/checkconnection.dart';
import 'package:http/http.dart' as http;

import 'statusrequiest.dart';

class Crud {
  Future<Either<StatusRequiest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkConnection()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (kDebugMode) {
          print(response.statusCode);
        }
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          if (kDebugMode) {
            print(responsebody);
          }
          return Right(responsebody);
        } else {
          return const Left(StatusRequiest.serverfaliure);
        }
      } else {
        return const Left(StatusRequiest.offlinefaliure);
      }
    } catch (_) {
      return const Left(StatusRequiest.serverException);
    }
  }
}
