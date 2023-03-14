import 'package:hydrated_bloc/hydrated_bloc.dart';

class BottomNavigationTabCubit extends HydratedCubit<int> {
  BottomNavigationTabCubit() : super(0);

  void changeTab(int index) => emit(index);

  @override
  int? fromJson(Map<String, dynamic> json) => json[_indexKey];

  @override
  Map<String, dynamic>? toJson(int state) => {_indexKey: state};

  static const _indexKey = 'index';
}