
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocListenerXEquatable.dart';

class BlocEventListenerXEquatable  {
  BlocEventListenerXEquatable([List props = const []]) ;
}

class FirstEvent  extends BlocEventListenerXEquatable {
  
  final BlocListenerXEquatable bloc;

  FirstEvent({@required this.bloc}) : super([bloc]);

  @override
  String toString() => 'FirstEvent';

}

class AddValueEvent extends BlocEventListenerXEquatable {

  @override
  String toString() => 'AddValueEvent';
}

