import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_cubit.dart';
import 'base_state.dart';

abstract class CubitConsumerWidget<C extends BaseCubit<D, E?>, D, E> extends StatelessWidget {
  const CubitConsumerWidget({Key? key}) : super(key: key);

  void subscribe(BuildContext context, E event);

  Widget buildWidget(BuildContext context, D data);

  C cubit(BuildContext context) {
    return BlocProvider.of<C>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, BaseState<D, E?>>(
      listener: (context, state) {
        var event = state.event;
        if (event != null) {
          subscribe.call(context, event);
        }
      },
      builder: (context, state) {
        return buildWidget(context, state.data);
      },
    );
  }

}
