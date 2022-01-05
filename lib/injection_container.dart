import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/util/network_info.dart';
import 'package:template/feature/rickandmorty/data/episodesremotedatasource/episodes_remote_data_source.dart';
import 'package:template/feature/rickandmorty/data/repositories/rick_and_morty_repositories_impl.dart';
import 'package:template/feature/rickandmorty/domain/repositories/rick_and_morty_repositories.dart';
import 'package:template/feature/rickandmorty/domain/usecase/get_episodes.dart';
import 'package:template/feature/rickandmorty/presentation/episodesscreen/bloc/rick_and_morty_bloc.dart';

final getEpisodesProvider = ChangeNotifierProvider<BaseModel>(
  (ref) => RickAndMortyBloc(
    ref.read(_diUseCase),
  ),
);

final _diUseCase = Provider<GetEpisodes>(
  (ref) => GetEpisodes(
    repository: ref.read(_diRickAndMortyRepositories),
  ),
);

final _diRickAndMortyRepositories = Provider<RickAndMortyRepository>(
  (ref) => RickAndMortyRepositoriesImpl(
    remoteDataSource: ref.read(_diRemoteDataSource),
    networkInfo: ref.read(_networkInfo),
  ),
);
final _diRemoteDataSource = Provider<EpisodesRemoteDataSource>(
  (ref) => EpisodesRemoteDataSourceImpl(),
);

final _networkInfo = Provider<NetworkInfo>((ref) => NetworkInfoImpl());
