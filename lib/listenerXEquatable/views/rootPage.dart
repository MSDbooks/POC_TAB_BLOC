import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocEventListenreXEquatable.dart';

import 'package:tabstream/listenerXEquatable/bloc/blocListenerXEquatable.dart';
import 'package:tabstream/listenerXEquatable/views/rootPageModule.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  BlocListenerXEquatable _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = BlocListenerXEquatable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste BLocListener X Equatable'),
      ),
      body: BlocProvider<BlocListenerXEquatable>(
        create: (context) => _bloc..add(FirstEvent(bloc: _bloc)),
        child: RootPageModule(),
        ),      
    );
  }
}