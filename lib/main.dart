import 'package:bloc_orchestration/blocs/dam.bloc.dart';
import 'package:bloc_orchestration/blocs/dam.notifier.dart';
import 'package:bloc_orchestration/blocs/warning.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dam.screen.dart';

void main() {
  runApp(const DamApp());
}

class DamApp extends StatelessWidget {
  const DamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DamBloc()),
          BlocProvider(create: (_) => WarningBloc()),
        ],
        child: const DamNotifier(child: const DamScreen()),
      ),
    );
  }
}
