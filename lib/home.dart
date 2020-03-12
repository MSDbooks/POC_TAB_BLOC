import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabstream/bloc/bloc.dart';
import 'package:tabstream/bloc/blocEvent.dart';
import 'package:tabstream/bloc/blocState.dart';
import 'package:tabstream/bloc/defaultState/defaultState.dart';
import 'package:tabstream/bloc/module.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  BlocStream _blocTab1;
  BlocStream _blocTab2;
  TabController _tabController;

  int _valueTab1 = 0;
  int _valueTab2 = 0;

  @override
  void initState() {
    super.initState();

    _blocTab1 = BlocStream();
    _blocTab2 = BlocStream();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
   // _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: false,
          labelColor: Colors.black,
          controller: _tabController,
          unselectedLabelColor: Colors.grey[400],
          tabs: [
            Tab(
              child: Text(
                'Tab 1',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Tab 2',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _tabController,
          children: [
            //TAB 1
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Contador Tab1:',
                ),
                BlocListener<BlocStream, DefaultState>(
                  bloc: _blocTab1,
                  listener: (context, state) {

                    setState(() {
                       if (state is AddValueTab1Loaded) {
                        _valueTab1 = state.value;
                        }
                    });
                   
                  },
                  child: Text(
                    _valueTab1.toString(),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                 Container(
                  child: BlocProvider<BlocStream>(
                      create: (context) {
                        return _blocTab1;
                      },
                      child: BlocModule(bloc: _blocTab1),
                    ),
                ),
              ],
            ),
            //TAB 2
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Contador Tab2',
                ),
                BlocListener<BlocStream, DefaultState>(
                  bloc: _blocTab2,
                  listener: (context, state) {

                    setState(() {
                       if (state is AddValueTab2Loaded) {
                        _valueTab2 = state.value;
                        }
                    });
                   
                  },
                  child: Text(
                    _valueTab2.toString(),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                 Container(
                  child: BlocProvider<BlocStream>(
                      create: (context) {
                        return _blocTab2;
                      },
                      child: BlocModule(bloc: _blocTab2),
                    ),
                ),
              ],
            )
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           
           if(_tabController.index == 0) {

              _blocTab1.add(AddValue(value: 1, tab: _tabController.index));

           } else {

             _blocTab2.add(AddValue(value: 1, tab: _tabController.index));

           }
          
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
