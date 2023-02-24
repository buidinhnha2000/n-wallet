import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/local_storage.dart';
import '../../di/service_locator.dart';
import '../../navigation/navigation.dart';

class OnboardingCubit extends HydratedCubit<bool> {
  OnboardingCubit() : super(true);
  static const onboardingStateKey = 'navigation_state';

  void setNavigationOnboarding() => emit(false);

  void setBackNavigationOnboarding() => emit(true);


  @override
  bool? fromJson(Map<String, dynamic> json) =>
      json[onboardingStateKey] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) => {onboardingStateKey: state};
}
