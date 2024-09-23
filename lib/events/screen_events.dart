abstract class ScreenEvents {}
  class AddEvents extends ScreenEvents {
    final double firstValue;
    final double secondValue;
    AddEvents({required this.firstValue, required this.secondValue});}


  class SubtractEvents extends ScreenEvents{
  final double firstValue;
  final double secondValue;
  SubtractEvents({required this.firstValue, required this.secondValue});
}

class MultiplyEvents extends ScreenEvents{
  final double firstValue;
  final double secondValue;
  MultiplyEvents({required this.firstValue, required this.secondValue});
}

class DivideEvents extends ScreenEvents{
  final double firstValue;
  final double secondValue;
  DivideEvents({required this.firstValue, required this.secondValue});
}

