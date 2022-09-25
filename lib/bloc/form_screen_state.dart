part of 'form_screen_cubit.dart';

class FormScreenState extends Equatable {
  const FormScreenState({
    this.data = const [],
    this.isLoading = true,
    this.title = 'Tiêu đề gì đó ở đây',
  });

  final List<Map<String, dynamic>> data;
  final bool isLoading;
  final String title;

  FormScreenState copyWith({
    List<Map<String, dynamic>>? data,
    Map<String, dynamic>? submit,
    bool? isLoading,
    String? title,
  }) {
    return FormScreenState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      title: title ?? this.title,
    );
  }

  @override
  List<Object> get props => [
        data,
        isLoading,
        title,
      ];
}
