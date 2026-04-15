import 'package:cake_it_app/src/core/routes/route_names.dart';
import 'package:cake_it_app/src/core/widgets/app_error_view.dart';
import 'package:cake_it_app/src/core/widgets/app_loading.dart';
import 'package:cake_it_app/src/features/cakes/presentation/bloc/cake_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_dependencies.dart';

class CakeListView extends StatelessWidget {
  const CakeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CakeListBloc(AppDependencies.cakeRepository)..add(LoadCakes()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('🎂CakeItApp🍰'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.pushNamed(RouteNames.settings);
              },
            ),
          ],
        ),
        body:
            BlocBuilder<CakeListBloc, CakeListState>(builder: (context, state) {
          if (state is CakeListLoaded) {
            final cakes = state.cakes;
            return ListView.builder(
              restorationId: 'cakeListView',
              itemCount: cakes.length,
              itemBuilder: (context, index) {
                final cake = state.cakes[index];
                return ListTile(
                    title: Text('${cake.title}'),
                    subtitle: Text('${cake.description}'),
                    leading: CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(cake.image!),
                    ),
                    onTap: () {});
              },
            );
          } else if (state is CakeListError) {
            return AppErrorView();
          }
          return AppLoading();
        }),
      ),
    );
  }
}
