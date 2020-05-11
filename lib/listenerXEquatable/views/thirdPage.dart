import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocEventListenreXEquatable.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocListenerXEquatable.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocState.dart';

import '../../bloc/defaultState/defaultState.dart';

class ThirdPage extends StatefulWidget {
 
 final BlocListenerXEquatable bloc;

  const ThirdPage({Key key, @required this.bloc}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocListenerXEquatable, DefaultState>(
      bloc: widget.bloc,
      listener: (BuildContext context, DefaultState state) {

        if(state is AddValueLoaded) {
          setState(() {
            _contador += state.value;
          });

        }

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page')
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(bottom: 3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                
                  Text(
                    _contador.toString(),
                    style: TextStyle(
                      fontSize: 34.0
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: FlatButton(
                      child: Text('Add'),
                      onPressed: () => widget.bloc.add(AddValueEvent()),
                    ),
                  )
                

              ],
            ),
          ),
        ),
      ),
    );
     
  }
}