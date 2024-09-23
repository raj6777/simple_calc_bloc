import 'package:bloc_demo2/events/screen_events.dart';
import 'package:bloc_demo2/states/screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenBloc extends Bloc<ScreenEvents,ScreenStates>{
  ScreenBloc():super(ResultState(0)){
    on<AddEvents> ((event,emit){
      double result = event.firstValue +event.secondValue;
      emit(ResultState(result));
    });
    on<SubtractEvents> ((event,emit){
      double result = event.firstValue - event.secondValue;
      emit(ResultState(result));
    });
    on<MultiplyEvents> ((event,emit){
      double result = event.firstValue * event.secondValue;
      emit(ResultState(result));
    });
    on<DivideEvents> ((event,emit){
      double result = event.firstValue / event.secondValue;
      if(event.secondValue == 0){
        emit(ErrorState("value isn't defined"));
      }else{
        emit(ResultState(result));
      };
    });
  }
}