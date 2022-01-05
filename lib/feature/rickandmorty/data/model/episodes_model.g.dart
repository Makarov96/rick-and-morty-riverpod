// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodesModel _$EpisodesModelFromJson(Map<String, dynamic> json) =>
    EpisodesModel(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((dynamic e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodesModelToJson(EpisodesModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      count: json['count'] as num,
      pages: json['pages'] as num,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as num,
      name: json['name'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'image': instance.image,
    };
