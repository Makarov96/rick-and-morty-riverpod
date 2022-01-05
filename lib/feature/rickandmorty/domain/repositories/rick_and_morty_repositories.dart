import 'package:dartz/dartz.dart';
import 'package:template/core/error/failure.dart';
import 'package:template/feature/rickandmorty/data/model/episodes_model.dart';

abstract class RickAndMortyRepository {
  Future<Either<Failure, EpisodesModel>> getEpisodes({
    String offset = '0',
  });
}
