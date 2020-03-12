
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BlocEvent extends Equatable {
  BlocEvent([List props = const []]) : super(props);
}

class AddValue extends BlocEvent {

  final int value;
  final int tab;

  AddValue({@required this.value, @required this.tab}) : super([value, tab]);

  @override
  String toString() => 'AddValue';

}