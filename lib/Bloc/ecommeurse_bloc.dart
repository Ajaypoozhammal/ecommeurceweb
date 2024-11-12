
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
        ecommeurseModelclass= await ecommeurseApi.getEcommeurse();
        emit(EcommeurseBlocLoaded());
      }
      catch(e){
        emit(EcommeurseBlocError());
      }
      // TODO: implement event handler
    });
  }
}
