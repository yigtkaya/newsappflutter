import 'package:flutter_bloc/flutter_bloc.dart';

final class CarouselCubit extends Cubit<double> {
  CarouselCubit() : super(0);

  void updatePage(double page) {
    emit(page);
  }
}
