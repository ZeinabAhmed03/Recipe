import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('bloc: $bloc, change $change');
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('bloc created is $bloc');
    super.onCreate(bloc);
  }
}
