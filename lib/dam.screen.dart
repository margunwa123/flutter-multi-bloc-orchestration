import 'package:bloc_orchestration/blocs/dam.bloc.dart';
import 'package:bloc_orchestration/blocs/warning.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DamScreen extends StatelessWidget {
  const DamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BlocBuilder<WarningBloc, WarningState>(
          builder: (context, state) {
            String text = "";
            Color color = Colors.white;

            if (state is ChillState) {
              text = "We cool";
              color = Colors.green;
            }
            if (state is BewareState) {
              text = "Warning: possible flood";
              color = Colors.yellow;
            }
            if (state is DangerousState) {
              text = "Danger: high possibility of flood";
              color = Colors.red;
            }
            if (state is FloodState) {
              text = "It's flooding, pray to your Gods";
              color = Colors.orange;
            }
            return Text(text, style: TextStyle(color: color));
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<DamBloc, DamState>(
          builder: (context, state) => Text(
            "Water Level: ${state.waterLevel}",
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          BlocProvider.of<DamBloc>(context).add(IncrementWaterLevel());
        },
      ),
    );
  }
}
