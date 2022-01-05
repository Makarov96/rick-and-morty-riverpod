import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:template/core/error/failure.dart';
import 'package:template/core/usecase/uses_case.dart';
import 'package:template/feature/rickandmorty/data/model/episodes_model.dart';
import 'package:template/feature/rickandmorty/domain/repositories/rick_and_morty_repositories.dart';

class GetEpisodes extends UseCase<EpisodesModel, OffsetParam> {
  GetEpisodes({required this.repository});

  final RickAndMortyRepository repository;
  @override
  Future<Either<Failure, EpisodesModel>> call(OffsetParam params) =>
      repository.getEpisodes(offset: params.params);
}

class OffsetParam extends Equatable {
  const OffsetParam(this.params);

  final String params;
  @override
  List<Object?> get props => [params];
}
