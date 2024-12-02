import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/Repository/model%20class/PopularProductModel.dart';

import '../Repository/api/EcommeurseApi.dart';

part 'popular_product_event.dart';
part 'popular_product_state.dart';

class PopularProductBloc extends Bloc<PopularProductEvent, PopularProductState> {
  late  List<PopularProductModel> PopularProduct;
  EcommeurseApi ecommeurseApi=EcommeurseApi();
  PopularProductBloc() : super(PopularProductInitial()) {
    on<PopularProductEvent>((event, emit)async {
      emit(PopularProductBlocLoading());
      try{
        PopularProduct= await ecommeurseApi.getPopularProduct();
        emit(PopularProductBlocLoaded());
      }
      catch(e){
        emit(PopularProductBlocError());
      }    });
  }
}
