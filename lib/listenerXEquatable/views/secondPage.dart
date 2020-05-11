import 'package:flutter/material.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocListenerXEquatable.dart';
import 'package:tabstream/listenerXEquatable/views/thirdPage.dart';

class SecondPage extends StatefulWidget {
   
 final BlocListenerXEquatable bloc;

 const SecondPage({Key key, @required this.bloc}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Second Pagee'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Linha $index'),
                    onTap: (){
                      Navigator.push(context, 
                       MaterialPageRoute(builder: (context) => ThirdPage(bloc: widget.bloc)));
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}