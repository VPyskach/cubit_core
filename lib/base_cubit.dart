import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_state.dart';

abstract class BaseCubit<D, E> extends Cubit<BaseState<D, E?>> {
  BaseCubit(
    D initialData,
  ) : super(
          BaseState(
            initialData,
            null,
          ),
        );

  void emitData(D value) {
    emit(
      BaseState(
        value,
        state.event,
      ),
    );
  }

  void emitEvent(E value) {
    emit(
      BaseState(
        state.data,
        value,
      ),
    );
  }
}
