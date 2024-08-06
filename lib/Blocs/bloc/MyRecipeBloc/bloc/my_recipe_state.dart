part of 'my_recipe_bloc.dart';

abstract class MyRecipeState {}

final class MyRecipeInitial extends MyRecipeState {}

class MyRecipeLoading extends MyRecipeState {}

class MyRecipeLoaded extends MyRecipeState {
  final List<CustomeRecipeModel> customRecipes;
  MyRecipeLoaded({required this.customRecipes});
}

class MyRecipeNoData extends MyRecipeState {}
