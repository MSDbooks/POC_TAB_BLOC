
import 'package:flutter/material.dart';
import 'package:tabstream/bloc/defaultState/defaultState.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocListenerXEquatable.dart';

class FirstEventLoaded extends DefaultState {

  final String value;
  final BlocListenerXEquatable bloc;

  FirstEventLoaded({@required this.value, @required this.bloc}) : super([value, bloc]);

  @override
  String toString() => 'FirstEventLoaded';

}


class AddValueLoaded extends DefaultState {

  final int value;

  AddValueLoaded({@required this.value});

  @override
  String toString() => 'AddValueLoaded';

}
