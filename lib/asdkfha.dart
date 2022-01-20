import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppCubitObserver extends BlocObserver {
  @override
  void onClose(BlocBase bloc) {
    print(bloc.toString());
    super.onClose(bloc);
  }
}
