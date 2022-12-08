import 'package:bloc/bloc.dart';

class DamBloc extends Bloc<DamEvent, DamState> {
  DamBloc() : super(DamState(0)) {
    on<IncrementWaterLevel>((event, emit) {
      final waterLevel = state.waterLevel + 1;

      emit(DamState(waterLevel));
    });

    on<ResetWaterLevel>((event, emit) {
      emit(DamState(0));
    });
  }
}

abstract class DamEvent {}

class IncrementWaterLevel extends DamEvent {}

class ResetWaterLevel extends DamEvent {}

class DamState {
  int waterLevel;

  DamState(this.waterLevel);
}
