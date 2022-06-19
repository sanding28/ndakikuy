import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ndakikuy/models/forms_model.dart';
import 'package:ndakikuy/services/forms_services.dart';

part 'forms_state.dart';

class FormsCubit extends Cubit<FormsState> {
  FormsCubit() : super(FormsInitial());

  void fetchForms() async {
    try {
      emit(FormsLoading());

      List<FormsModel> forms = await FormsServices().fetchForms();

      emit(FormsSuccess(forms));

    } catch (e) {
      emit(FormsFailed(e.toString()));
    }
  }

}
