import 'dart:async';

import 'package:bloc_orchestration/blocs/dam.bloc.dart';
import 'package:bloc_orchestration/blocs/warning.bloc.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DamNotifier extends StatelessWidget {
  const DamNotifier({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DamBloc, DamState>(
          listener: (_, state) {
            BlocProvider.of<WarningBloc>(context).add(
              UpdateWarning(
                (state.waterLevel / 2).floor(),
              ),
            );
          },
        ),
        BlocListener<WarningBloc, WarningState>(
          listener: (_, state) {
            // if it is flooding, some secs later, water level chills down
            if (state is FloodState) {
              Future.delayed(const Duration(seconds: 3), () {
                BlocProvider.of<DamBloc>(context).add(ResetWaterLevel());
              });
            }
          },
        ),
      ],
      child: child,
    );
  }
}
