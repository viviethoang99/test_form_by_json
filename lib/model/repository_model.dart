import 'package:json_annotation/json_annotation.dart';

part 'repository_model.g.dart';

@JsonSerializable()
class RepositoryModel {
  const RepositoryModel(
    this.id,
    this.title,
    this.form,
  );

    factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);

  final String id;
  final String title;
  final List<Map<String, dynamic>> form;
}
