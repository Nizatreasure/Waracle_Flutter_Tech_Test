import 'package:cake_it_app/src/core/routes/route_names.dart';
import 'package:cake_it_app/src/core/widgets/app_error_view.dart';
import 'package:cake_it_app/src/core/widgets/app_loading.dart';
import 'package:cake_it_app/src/features/cakes/presentation/bloc/cake_bloc.dart';
import 'package:cake_it_app/src/localization/app_localizations.dart';
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
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CakeListBloc>().add(LoadCakes());
                await context.read<CakeListBloc>().stream.firstWhere(
                    (state) => state is! CakeListLoading); // Wait for load
              },
              child: ListView.builder(
                restorationId: 'cakeListView',
                itemCount: cakes.length,
                itemBuilder: (context, index) {
                  final cake = state.cakes[index];
                  return ListTile(
                      title: Text('${cake.title}'),
                      subtitle: Text('${cake.description}'),
                      leading: Hero(
                        tag: '${cake.title}${cake.description}',
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey.shade600,
                          child: ClipOval(
                            child: Image.network(
                              cake.image!,
                              fit: BoxFit.cover,
                              width: 48,
                              height: 48,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image, size: 30);
                              },
                              frameBuilder: (context, child, frame, _) {
                                return AnimatedOpacity(
                                  opacity: frame == null ? 0 : 1,
                                  duration: const Duration(milliseconds: 300),
                                  child: child,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        context.pushNamed(RouteNames.details, extra: cake);
                      });
                },
              ),
            );
          } else if (state is CakeListError) {
            return AppErrorView(
                message: AppLocalizations.of(context)!.somethingWentWrong,
                onRetry: () {
                  context.read<CakeListBloc>().add(LoadCakes());
                });
          }
          return AppLoading();
        }),
      ),
    );
  }
}
