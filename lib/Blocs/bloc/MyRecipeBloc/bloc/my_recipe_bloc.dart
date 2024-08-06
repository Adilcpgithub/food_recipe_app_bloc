import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe_app_bloc/Models/custome_recipe_model.dart';
import 'package:food_recipe_app_bloc/Repository/custome_recipe_repository.dart';
part 'my_recipe_event.dart';
part 'my_recipe_state.dart';

class MyRecipeBloc extends Bloc<MyRecipeEvent, MyRecipeState> {
  final CustomRecipeRepository customRecipeRepository;
  MyRecipeBloc(this.customRecipeRepository) : super(MyRecipeInitial()) {
    on<MyRecipeEvent>((event, emit) async {
      print('''''' '''''' '''''' '''''' '');
      switch (event) {
        case MyRecipeEvent.fetEntries:
          emit(MyRecipeLoading());
          try {
            print('kkkkkkkkkkkkkkkkkkkkkkkkkkk');
            final customRecipes = await customRecipeRepository.getCustomData();
            emit(MyRecipeLoaded(customRecipes: customRecipes));
          } catch (e) {
            throw Exception();
          }
          break;
        case MyRecipeEvent.isloading:
          emit(MyRecipeLoading());
        case MyRecipeEvent.deleted:
      }
    });
  }
}
