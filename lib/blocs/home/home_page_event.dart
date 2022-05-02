part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomeTabChangeEvent extends HomePageEvent {
  final int newIndex;

  const HomeTabChangeEvent({this.newIndex = 0});

  // Para que equatable identifique que sean clases iguales
  @override
  // TODO: implement props
  List<Object> get props => [newIndex];
}
