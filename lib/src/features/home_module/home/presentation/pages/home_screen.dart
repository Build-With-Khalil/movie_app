import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/routes/routes_name.dart';
import 'package:movie_app/src/core/services/storage/token_storage.dart';

import '../../../../../core/utils/enum/enums.dart';
import '../bloc/movies_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<MoviesBloc>(context, listen: false).add(
          MoviesFetchedEvent(page: 1),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            TokenStorage.removeToken().then(
              (value) {
                Navigator.pushNamed(context, RoutesName.login);
              },
            );
          },
        ),
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          switch (state.moviesModel.status) {
            case PostAPIStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostAPIStatus.error:
              return Center(
                child: Text(
                  state.moviesModel.message.toString(),
                ),
              );
            case PostAPIStatus.success:
              if (state.moviesModel.data == null ||
                  state.moviesModel.data!.tvShows!.isEmpty) {
                return const Center(child: Text('No TV shows available.'));
              }
              final tvShows = state.moviesModel.data!.tvShows;
              return ListView.builder(
                itemCount: tvShows!.length,
                itemBuilder: (context, index) {
                  final tvShow = tvShows[index];
                  return ListTile(
                    title: Text(tvShow.name.toString()),
                    subtitle: Text(tvShow.network.toString()),
                    leading:
                        Image.network(tvShow.imageThumbnailPath.toString()),
                  );
                },
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
