import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/cubit/base_cubit.dart';

/// Create function type.
typedef Create<C extends StateStreamableSource<Object?>> = C Function();

/// BaseState is the base widget for all the states.
abstract base class BaseView<C extends BaseCubit<S>, S extends BaseState> extends StatefulWidget {
  /// Constructor for BaseView.
  const BaseView({
    this.cubit,
    this.value,
    super.key,
  })  : assert(
          !(cubit == null && value == null),
          'cubit and value can not be null at the same time!',
        ),
        assert(
          !(cubit != null && value != null),
          'cubit and value can not be assigned at the same time.',
        );

  /// Cubit for the view.
  final Create<C>? cubit;

  /// Value for the view.
  final Create<C>? value;

  /// Builder for the view.
  Widget builder(BuildContext context, C cubit);

  @override
  State<BaseView> createState() => _BaseViewState<C, S>();
}

/// _BaseViewState is the state for the BaseView.
final class _BaseViewState<C extends BaseCubit<S>, S extends BaseState> extends State<BaseView> {
  /// Cubit for the view.
  late final C? cubit;

  /// Value for the view.
  late final C? value;

  @override
  void initState() {
    super.initState();

    if (widget.cubit != null) {
      value = null;
      cubit = widget.cubit!() as C;
    } else if (widget.value != null) {
      cubit = null;
      value = widget.value!() as C;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cubit != null) {
      return BlocProvider<C>(
        create: (context) => cubit!,
        child: Builder(
          builder: (context) {
            return widget.builder(context, context.read<C>());
          },
        ),
      );
    } else {
      return BlocProvider<C>.value(
        value: value!,
        child: Builder(
          builder: (context) {
            return widget.builder(context, context.read<C>());
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
