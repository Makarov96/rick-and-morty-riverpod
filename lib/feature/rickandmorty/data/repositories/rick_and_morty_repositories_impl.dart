import 'package:dartz/dartz.dart';
import 'package:template/core/error/exception.dart';

import 'package:template/core/error/failure.dart';
import 'package:template/core/util/network_info.dart';
import 'package:template/feature/rickandmorty/data/episodesremotedatasource/episodes_remote_data_source.dart';
import 'package:template/feature/rickandmorty/data/model/episodes_model.dart';
import 'package:template/feature/rickandmorty/domain/repositories/rick_and_morty_repositories.dart';

class RickAndMortyRepositoriesImpl implements RickAndMortyRepository {
  RickAndMortyRepositoriesImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final EpisodesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, EpisodesModel>> getEpisodes({
    String offset = '0',
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final right = await remoteDataSource.getEpisodes(offset: offset);
        return Right(right);
      } on GenericException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
