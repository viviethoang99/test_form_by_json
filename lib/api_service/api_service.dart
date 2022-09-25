import 'dart:convert';

import 'package:flutter/services.dart';

import '../gen/assets.gen.dart';
import '../model/repository_model.dart';

class ApiService {
  Future<RepositoryModel> getData() async {
    final response = await rootBundle.loadString(Assets.test);
    final jsonData = json.decode(response);
    return RepositoryModel.fromJson(jsonData['data']);
  }
}
