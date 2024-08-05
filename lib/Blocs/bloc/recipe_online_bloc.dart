import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe_app_bloc/Models/recipe_model_online.dart';
import 'package:food_recipe_app_bloc/Repository/recipe_online_repository.dart';
part 'recipe_online_event.dart';
part 'recipe_online_state.dart';

class RecipeOnlineBloc extends Bloc<RecipeOnlineEvent, RecipeOnlineState> {
  final RecipeOnlineRepository repository;
  RecipeOnlineBloc(this.repository)
      : super(RecipeOnlineState(onlineRecipes: [])) {
    on<RecipeOnlineEvent>((event, emit) async {
      if (event == RecipeOnlineEvent.fetEntries) {
        try {
          final onlineRecipes = await repository.getRecipe();
          emit(RecipeOnlineState(onlineRecipes: onlineRecipes));
        } catch (_) {}
      }
    });
  }
}
