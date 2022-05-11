import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ndakikuy/models/basecamp_model.dart';
import 'package:ndakikuy/services/basecamap_service.dart';

part 'basecamp_state.dart';

class BasecampCubit extends Cubit<BasecampState> {
  BasecampCubit() : super(BasecampInitial());
  
  void fetchBasecamp()async{
    try{
      emit(BasecampLoading());

      List<BasecampModel> basecamp = await BasecampService().fetchBasecamp();

      emit (BasecampSuccess(basecamp));
    } catch (e) {
      emit(BasecampFailed(e.toString()));
    }
  }

}
