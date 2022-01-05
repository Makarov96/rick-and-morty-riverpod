import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/feature/rickandmorty/presentation/episodesscreen/bloc/rick_and_morty_bloc.dart';
import 'package:template/injection_container.dart';

class RickAndMortyScreen extends StatelessWidget {
  const RickAndMortyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          switch (ref.watch(getEpisodesProvider).statusofdata) {
            case STATUSOFDATA.failure:
              return const Center(
                child: Text('Algo salio mal ...'),
              );

            case STATUSOFDATA.success:
              final episodes = ref.read(getEpisodesProvider).episodesData;
              return ListView.builder(
                itemCount: episodes.results.length,
                itemBuilder: (_, index) => Text(episodes.results[index].name),
              );

            case STATUSOFDATA.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
