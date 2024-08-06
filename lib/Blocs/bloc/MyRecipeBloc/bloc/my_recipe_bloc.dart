import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_recipe_event.dart';
part 'my_recipe_state.dart';

class MyRecipeBloc extends Bloc<MyRecipeEvent, MyRecipeState> {
  MyRecipeBloc() : super(MyRecipeInitial()) {
    on<MyRecipeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
