import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomeTabChangeEvent>(_onTabChange);
  }

  void _onTabChange(HomeTabChangeEvent event, Emitter<HomePageState> emit) {
    emit(BottomNavigationInitial(indexBottomNav: event.newIndex));
  }
}
