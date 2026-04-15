import 'package:cake_it_app/src/features/cake.dart';
import 'package:cake_it_app/src/features/cakes/data/models/cake_model.dart';
import 'package:cake_it_app/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a cake.
class CakeDetailsView extends StatelessWidget {
  const CakeDetailsView({
    super.key,
    required this.cake,
  });

  final CakeModel cake;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cakeDetails),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Hero(
              tag: '${cake.title}${cake.description}',
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade600,
                child: ClipOval(
                  child: Image.network(
                    cake.image!,
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 60);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('${cake.title}',
                style: Theme.of(context).textTheme.titleLarge),
            Text('${cake.description}'),
          ],
        ),
      ),
    );
  }
}
