part of 'recipe_online_bloc.dart';

abstract class RecipeOnlineState {}

class RecipeOnlineInitial extends RecipeOnlineState {}

class RecipeOnlineLoading extends RecipeOnlineState {}

class RecipeOnlineLoaded extends RecipeOnlineState {
  final List<Recipe> onlineRecipes;
  RecipeOnlineLoaded({required this.onlineRecipes});
}
