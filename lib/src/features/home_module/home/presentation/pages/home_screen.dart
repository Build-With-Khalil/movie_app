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
        BlocProvider.of<TvShowsBloc>(context).add(
          FetchShowsEvent(),
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
      body: BlocBuilder<TvShowsBloc, TvShowsState>(
        builder: (context, state) {
          if (state.postAPIStatus == PostAPIStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.postAPIStatus == PostAPIStatus.success) {
            return ListView.builder(
              itemCount: state.tvShows.length,
              itemBuilder: (context, index) {
                final show = state.tvShows[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(show.imageThumbnailPath.toString()),
                    title: Text(show.name.toString()),
                  ),
                );
              },
            );
          } else if (state.postAPIStatus == PostAPIStatus.error) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Press button to load shows'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<TvShowsBloc>().add(FetchShowsEvent()),
        child: const Icon(Icons.download),
      ),
    );
  }
}
