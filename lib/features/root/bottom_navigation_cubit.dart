import 'package:flutter_bloc/flutter_bloc.dart';

final class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void onIndexChanged(int index) {
    emit(index);
  }
}
