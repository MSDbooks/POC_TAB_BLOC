import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabstream/bloc/bloc.dart';
import 'package:tabstream/bloc/blocState.dart';
import 'package:tabstream/bloc/defaultState/defaultState.dart';

class BlocModule extends StatefulWidget {

  final BlocStream bloc;

  const BlocModule({Key key, @required this.bloc}) : super(key: key);

  @override
  _BlocModuleState createState() => _BlocModuleState();
}

class _BlocModuleState extends State<BlocModule> {
  @override

  Widget build(BuildContext context) {
    return BlocBuilder<BlocStream, DefaultState>(
      bloc: widget.bloc,
      builder:(BuildContext context, DefaultState state) {


        if(state is AddValueTab1Loaded) {
           return Text('Contador Tab1 (${state.value})');
        }
         if(state is AddValueTab2Loaded) {
           
            return Text('Contador Tab2 (${state.value})');
          
        }

         return Center(
                child: Container(),
              );
      },
      
    );
  }
}