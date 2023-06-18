import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_cubit.dart';

abstract class MultiCubitProviderWidget extends StatelessWidget {
  const MultiCubitProviderWidget({Key? key}) : super(key: key);

  Widget buildWidget(BuildContext context);

  List<BaseCubit> createCubits(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: createCubits(context)
            .map((e) => BlocProvider(create: (BuildContext context) => e))
            .toList(),
        child: buildWidget(context));
  }
}
