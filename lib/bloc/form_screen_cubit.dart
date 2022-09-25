import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:test_form_by_json/api_service/api_service.dart';

part 'form_screen_state.dart';

class FormScreenCubit extends Cubit<FormScreenState> {
  FormScreenCubit() : super(const FormScreenState());

  final _apiService = ApiService();

  final Map<String, dynamic> _submit = {};
  
  Future<void> loadData() async {
    final result = await _apiService.getData();
    emit(FormScreenState(
      data: result.form,
      title: result.title,
      isLoading: false,
    ));
  }

  void changeValue({String key = 'error', String? value}) {
    if (value == null) return;
    if (!checkRegex()) return;
    _submit[key] = value;
  }

  /// Xử lý regex nếu đc trả về ở đây. Trường pattern đấy
  bool checkRegex() {
    return true;
  }

  void submit() {
    if (kDebugMode) {
      print(_submit);
    }
  }
}
