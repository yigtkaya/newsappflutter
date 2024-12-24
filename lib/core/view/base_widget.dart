import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/cubit/base_cubit.dart';

/// BaseState is the base widget for all the states.
abstract base class BaseWidget<C extends BaseCubit<S>, S extends BaseState> extends StatefulWidget {
  /// Constructor for BaseWidget.
  const BaseWidget({super.key});

  /// Build method for the widget.
  Widget build(BuildContext context, C cubit, S state);

  @override
  State<BaseWidget> createState() => _BaseWidgetState<C, S>();
}

/// _BaseWidgetState is the state for the BaseWidget.
final class _BaseWidgetState<C extends BaseCubit<S>, S extends BaseState> extends State<BaseWidget> {
  /// Build method for the widget.
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return BlocBuilder<C, S>(
      builder: (context, state) {
        return widget.build(context, cubit, state);
      },
    );
  }
}
