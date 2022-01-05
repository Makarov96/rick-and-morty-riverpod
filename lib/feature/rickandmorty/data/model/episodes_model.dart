import 'package:json_annotation/json_annotation.dart';

part 'episodes_model.g.dart';

@JsonSerializable()
class EpisodesModel {
  EpisodesModel({
    required this.info,
    required this.results,
  });

  factory EpisodesModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodesModelFromJson(json);
  @JsonKey(name: 'info')
  final Info info;

  @JsonKey(name: 'results')
  final List<Result> results;

  Map<String, dynamic> toJson() => _$EpisodesModelToJson(this);
}

@JsonSerializable()
class Info {
  Info({
    required this.count,
    required this.pages,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  @JsonKey(name: 'count')
  final num count;
  @JsonKey(name: 'pages')
  final num pages;

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  num id;
  String name;
  String gender;
  String image;

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
