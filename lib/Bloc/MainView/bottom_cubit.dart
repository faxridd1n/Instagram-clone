import 'package:bloc/bloc.dart';
//B
//nb=B

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void updateTab(int index) => emit(index);
}
