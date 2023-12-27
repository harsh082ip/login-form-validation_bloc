import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocObserver extends BlocObserver {
  // it is centralized observer which can observe very bloc of our app

  // will show which bloc is getting created
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
    print(bloc);
    print('${bloc.runtimeType} created!');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);

    print('$bloc changed - $change');
  }
}
