import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tabstream/bloc/defaultState/defaultState.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocEventListenreXEquatable.dart';
import 'package:tabstream/listenerXEquatable/bloc/blocState.dart';

class BlocListenerXEquatable extends Bloc<BlocEventListenerXEquatable, DefaultState> {


  @override
  DefaultState get initialState => Initial();

  @override
  Stream<DefaultState> mapEventToState(BlocEventListenerXEquatable event) async* {
    
    switch (event.runtimeType) {
     
      case FirstEvent:
        var e = event as FirstEvent;
        yield FirstEventLoaded(value: 'FirstEvent', bloc: e.bloc);
        break;

      case AddValueEvent:
        
       // yield Loading();
        yield AddValueLoaded(value: 1);
        break;

   
    }

  }


}