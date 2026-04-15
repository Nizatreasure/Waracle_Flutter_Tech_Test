import 'package:flutter/material.dart';

/// Displays a loading indicator to indicate that the app
/// is waiting for an asynchronous task to complete.
///
/// This widget should be used when the entire page is loading, not when a
/// small portion of the page is loading.
class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
