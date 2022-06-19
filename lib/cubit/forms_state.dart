part of 'forms_cubit.dart';

abstract class FormsState extends Equatable {
  const FormsState();

  @override
  List<Object> get props => [];
}

class FormsInitial extends FormsState {}

class FormsLoading extends FormsState {}

class FormsSuccess extends FormsState {
  final List<FormsModel> forms;

  FormsSuccess(this.forms);

  @override
  List<Object> get props => [forms];
}

class FormsFailed extends FormsState {
  final String error;

  FormsFailed(this.error);

  @override
  List<Object> get props => [error];
}

