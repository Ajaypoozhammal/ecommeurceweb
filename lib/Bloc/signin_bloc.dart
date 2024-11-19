import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/Repository/model%20class/SigninmodelClass.dart';

import '../Repository/api/EcommeurseApi.dart';
import '../Repository/model class/EcommeurseModelclass.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  late SigninmodelClass signinmodelClass;
  EcommeurseApi ecommeurseApi =EcommeurseApi();
  SigninBloc() : super(SigninInitial()) {
    on<FetchSignin>((event, emit) async {
      emit(SigninBlocLoading());
      try{
        signinmodelClass= await ecommeurseApi.getSignin(event.fullname, event.email,);
        emit(SigninBlocLoaded());
      }
      catch(e){
        emit(SigninBlocError());
      }

    });
  }
}
