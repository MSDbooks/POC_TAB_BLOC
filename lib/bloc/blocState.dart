
import 'package:flutter/material.dart';
import 'package:tabstream/bloc/defaultState/defaultState.dart';

class AddValueTab1Loaded extends DefaultState {

  final int value;

  AddValueTab1Loaded({@required this.value}) : super([value]);

  @override
  String toString() => 'AddValueTab1Loaded';

}


class AddValueTab2Loaded extends DefaultState {

  final int value;

  AddValueTab2Loaded({@required this.value}) : super([value]);

  @override
  String toString() => 'AddValueTab2Loaded';

}
