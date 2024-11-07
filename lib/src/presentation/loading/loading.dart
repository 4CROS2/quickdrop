import 'package:flutter/material.dart';
import 'package:quickdrop/src/presentation/widgets/loading_status.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  static Page<LoadingPage> page() => const MaterialPage<LoadingPage>(
        child: LoadingPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingStatus(),
    );
  }
}
