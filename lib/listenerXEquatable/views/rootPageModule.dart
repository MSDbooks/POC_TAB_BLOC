import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocListenerXEquatable.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocState.dart';
import 'package:tabstream/listenerXEquatable/views/secondPage.dart';

import '../../bloc/defaultState/defaultState.dart';

class RootPageModule extends StatefulWidget {

  @override
  _RootPageModuleState createState() => _RootPageModuleState();
}

class _RootPageModuleState extends State<RootPageModule> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: (context, constraints)  => SafeArea(
            top: false,
            bottom: false,
            child:BlocBuilder<BlocListenerXEquatable, DefaultState>(
                  bloc: BlocProvider.of<BlocListenerXEquatable>(context),
                  builder: (BuildContext context, DefaultState state) {
                    if (state is Initial) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is Loading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if(state is FirstEventLoaded) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(state.value),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.all(1),
                                child: FlatButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                        builder: (context) => SecondPage(bloc: state.bloc)
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Second Page',
                                     style: TextStyle(
                                      backgroundColor: Colors.black,
                                      color: Colors.white
                                     ),
                                  )),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                   
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
          );
  }
}