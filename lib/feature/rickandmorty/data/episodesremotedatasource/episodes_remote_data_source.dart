import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:template/core/error/exception.dart';
import 'package:template/feature/rickandmorty/data/model/episodes_model.dart';

abstract class EpisodesRemoteDataSource {
  Future<EpisodesModel> getEpisodes({String offset = '0'});
}

class EpisodesRemoteDataSourceImpl implements EpisodesRemoteDataSource {
  @override
  Future<EpisodesModel> getEpisodes({String offset = '0'}) async {
    try {
      final response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character/?page=19'));
      final model = EpisodesModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      return model;
    } catch (e) {
      throw RemoteException();
    }
  }
}
