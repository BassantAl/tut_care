import 'dart:developer';

import 'package:bloc/bloc.dart';

class MyBlockObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
     log(
      'STATE CHANGE -> ${bloc.runtimeType}\n'
      '${change.currentState} -> ${change.nextState}',
    );
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    log('CLOSE -> ${bloc.runtimeType}');
   
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log('Created-> ${bloc.runtimeType}');
  }

  


}
