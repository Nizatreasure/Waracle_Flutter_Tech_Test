import 'package:cake_it_app/src/core/routes/route_names.dart';
import 'package:cake_it_app/src/core/widgets/app_error_view.dart';
import 'package:cake_it_app/src/core/widgets/app_loading.dart';
import 'package:cake_it_app/src/features/cakes/data/models/cake_model.dart';
import 'package:cake_it_app/src/features/cakes/presentation/bloc/cake_bloc.dart';
import 'package:cake_it_app/src/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_dependencies.dart';

class CakeListView extends StatelessWidget {
  const CakeListView({super.key});

  Future<void> _refreshCakes(BuildContext context) async {
    final bloc = context.read<CakeListBloc>();

    if (bloc.state is! CakeListLoaded && bloc.state is! CakeListError) {
      return;
    }

    bloc.add(LoadCakes());

    await bloc.stream.firstWhere(
      (state) => state is CakeListLoaded || state is CakeListError,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CakeListBloc(AppDependencies.cakeRepository)..add(LoadCakes()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('🎂CakeItApp🍰'),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.pushNamed(RouteNames.settings);
              },
            ),
          ],
        ),
        body: Builder(builder: (context) {
          if (Theme.of(context).platform == TargetPlatform.iOS) {
            return _buildCakeListIOS(context);
          }
          return _buildCakeListAndroid(context);
        }),
      ),
    );
  }

  Widget _buildCakeListIOS(BuildContext context) {
    return CustomScrollView(
      restorationId: 'cakeListView',
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () => _refreshCakes(context),
        ),
        BlocBuilder<CakeListBloc, CakeListState>(builder: (context, state) {
          if (state is CakeListLoaded || state is CakeListRefreshing) {
            final cakes = state is CakeListLoaded
                ? state.cakes
                : (state as CakeListRefreshing).cakes;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final cake = cakes[index];
                  return _buildCakeItem(cake, context);
                },
                childCount: cakes.length,
              ),
            );
          } else if (state is CakeListError) {
            return SliverToBoxAdapter(
              child: _buildErrorView(context),
            );
          }
          return const SliverFillRemaining(child: AppLoading());
        }),
      ],
    );
  }

  Widget _buildCakeListAndroid(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshCakes(context),
      child:
          BlocBuilder<CakeListBloc, CakeListState>(builder: (context, state) {
        if (state is CakeListLoaded || state is CakeListRefreshing) {
          final cakes = state is CakeListLoaded
              ? state.cakes
              : (state as CakeListRefreshing).cakes;
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            restorationId: 'cakeListView',
            itemCount: cakes.length,
            itemBuilder: (context, index) {
              final cake = cakes[index];
              return _buildCakeItem(cake, context);
            },
          );
        } else if (state is CakeListError) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: _buildErrorView(context),
          );
        }
        return AppLoading();
      }),
    );
  }

  Widget _buildErrorView(BuildContext context) {
    return AppErrorView(
        message: AppLocalizations.of(context)!.somethingWentWrong,
        onRetry: () {
          context.read<CakeListBloc>().add(LoadCakes());
        });
  }

  Widget _buildCakeItem(CakeModel cake, BuildContext context) {
    return ListTile(
        title: Text(
          '${cake.title}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${cake.description}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
  }
}
