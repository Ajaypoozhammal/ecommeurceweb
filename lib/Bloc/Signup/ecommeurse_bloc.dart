
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/Repository/api/EcommeurseApi.dart';
import 'package:untitled4/Repository/model%20class/EcommeurseModelclass.dart';

part 'ecommeurse_event.dart';
part 'ecommeurse_state.dart';

class EcommeurseBloc extends Bloc<EcommeurseEvent, EcommeurseState> {
  late EcommeurseModelclass ecommeurseModelclass;
  EcommeurseApi ecommeurseApi =EcommeurseApi();
  EcommeurseBloc() : super(EcommeurseInitial()) {
    on<FetchEcommeurse>((event, emit) async {
      emit(EcommeurseBlocLoading());
      try{
       ecommeurseModelclass= await ecommeurseApi.getSignup(event.fullname, event.email, event.password);
        emit(EcommeurseBlocLoaded());
      }
      catch(e){
        emit(EcommeurseBlocError());
        print('ajay error '+ e.toString());
      }
      // TODO: implement event handler
    });
  }
}
