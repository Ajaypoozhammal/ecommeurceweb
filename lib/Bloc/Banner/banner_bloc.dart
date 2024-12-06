import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/Repository/api/EcommeurseApi.dart';
import 'package:untitled4/Repository/model%20class/BannerModelClass.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  late  List<BannerModelClass> BannerModel;
  EcommeurseApi ecommeurseApi=EcommeurseApi();
  BannerBloc() : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {

      emit(BannerBlocLoading());
      try{
        BannerModel= await ecommeurseApi.getBanner();
        emit(BannerBlocLoaded());
      }
      catch(e){
        print(e.toString());
        emit(BannerBlocError());
      }
    });
  }
}
