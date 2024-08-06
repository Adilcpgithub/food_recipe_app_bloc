import 'package:bloc/bloc.dart';
import 'package:food_recipe_app_bloc/Models/recipe_model_online.dart';
import 'package:food_recipe_app_bloc/Repository/recipe_online_repository.dart';
part 'recipe_online_event.dart';
part 'recipe_online_state.dart';

class RecipeOnlineBloc extends Bloc<RecipeOnlineEvent, RecipeOnlineState> {
  final RecipeOnlineRepository repository;
  RecipeOnlineBloc(this.repository) : super(RecipeOnlineInitial()) {
    on<RecipeOnlineEvent>((event, emit) async {
      switch (event) {
        case RecipeOnlineEvent.fetEntries:
          emit(RecipeOnlineLoading());
          try {
            print('ssssssssssssssssssssssssss');
            final onlineRecipes = await repository.getRecipe();
            emit(RecipeOnlineLoaded(onlineRecipes: onlineRecipes));
          } catch (e) {
            throw Exception(e);
          }
          break;
        case RecipeOnlineEvent.isloading:
          emit(RecipeOnlineLoading());
      }
    });
  }
}
