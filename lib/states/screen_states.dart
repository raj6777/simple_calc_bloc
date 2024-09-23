abstract class ScreenStates {}

class ResultState extends ScreenStates {
  final double result;

  ResultState(this.result);
}

class ErrorState extends ScreenStates {
  final String message;

  ErrorState(this.message);
}
