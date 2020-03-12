import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabstream/bloc/blocEvent.dart';
import 'package:tabstream/bloc/blocState.dart';

import 'package:tabstream/bloc/defaultState/defaultState.dart';

class BlocStream extends Bloc<BlocEvent, DefaultState> {

  int _valueTab1 = 0;
  int _valueTab2 = 0;

  @override
  DefaultState get initialState => Initial();

  @override
  Stream<DefaultState> mapEventToState(BlocEvent event) async* {


    switch(event.runtimeType) {


      case AddValue:
        
        var e = event as AddValue;

        if(e.tab == 0) {
          _valueTab1 += e.value;
          yield AddValueTab1Loaded(value: _valueTab1);
        } else {
          _valueTab2 += e.value;
          yield AddValueTab2Loaded(value: _valueTab2);
        }
       
        

        break;

      

    }

  }
}