import 'package:bloc/bloc.dart';
import 'package:bloc_orchestration/blocs/constant.dart';

class WarningBloc extends Bloc<WarningEvent, WarningState> {
  WarningBloc() : super(ChillState()) {
    on<UpdateWarning>((event, emit) {
      if (event.warningLevel < chillThresshold) {
        emit(ChillState());
      } else if (event.warningLevel < bewareThreshold) {
        emit(BewareState());
      } else if (event.warningLevel < dangerousThreshold) {
        emit(DangerousState());
      } else {
        emit(FloodState());
      }
    });
  }
}

abstract class WarningEvent {}

class UpdateWarning extends WarningEvent {
  int warningLevel;

  UpdateWarning(this.warningLevel);
}

abstract class WarningState {}

class ChillState extends WarningState {}

class BewareState extends WarningState {}

class DangerousState extends WarningState {}

class FloodState extends WarningState {}
