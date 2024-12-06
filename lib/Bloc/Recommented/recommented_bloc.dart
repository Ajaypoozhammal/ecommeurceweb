import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/Repository/model%20class/RecommentedproductModelClass.dart';

import '../../Repository/api/EcommeurseApi.dart';

part 'recommented_event.dart';
part 'recommented_state.dart';

class RecommentedBloc extends Bloc<RecommentedEvent, RecommentedState> {
  late  List<RecommentedproductModelClass> RecommentedProduct;
  RecommentedBloc() : super(RecommentedInitial()) {
    EcommeurseApi ecommeurseApi=EcommeurseApi();
    on<RecommentedEvent>((event, emit) async {
    emit(RecommentedBlocLoading());
    try{
    RecommentedProduct= await ecommeurseApi.getRecommentedProduct();
    emit(RecommentedBlocLoaded());
    }
    catch(e){
    emit(RecommentedBlocError());
    }     });
  }
}
