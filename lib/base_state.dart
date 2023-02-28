import 'package:cubit_core/single_life_event.dart';

class BaseState<D, E> {
  BaseState(
    this.data,
    E event,
  ) {
    _event.value = event;
  }

  final D data;
  final SingleLifeEvent<E> _event = SingleLifeEvent();

  E? get event => _event.value;

}
