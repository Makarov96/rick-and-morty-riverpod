import 'package:flutter/cupertino.dart';
import 'package:template/feature/rickandmorty/data/model/episodes_model.dart';
import 'package:template/feature/rickandmorty/domain/usecase/get_episodes.dart';

enum STATUSOFDATA { failure, success, loading }

abstract class BaseModel extends ChangeNotifier {
  STATUSOFDATA statusofdata = STATUSOFDATA.loading;

  late EpisodesModel episodesData;
  GetEpisodes get getEpisodesBridge;
  Future<void> callEpisodes() async {
    final either = await getEpisodesBridge(
      const OffsetParam('19'),
    );
    either.fold((failure) {
      statusofdata = STATUSOFDATA.failure;
    }, (episodes) {
      statusofdata = STATUSOFDATA.success;
      episodesData = episodes;
    });
    notifyListeners();
  }
}

class RickAndMortyBloc extends BaseModel {
  RickAndMortyBloc(this.getEpisodes) {
    Future.delayed(Duration.zero, callEpisodes);
  }

  final GetEpisodes getEpisodes;

  @override
  GetEpisodes get getEpisodesBridge => getEpisodes;
}
