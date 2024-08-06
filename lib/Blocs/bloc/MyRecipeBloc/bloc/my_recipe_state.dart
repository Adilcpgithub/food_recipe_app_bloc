part of 'my_recipe_bloc.dart';

sealed class MyRecipeState extends Equatable {
  const MyRecipeState();
  
  @override
  List<Object> get props => [];
}

final class MyRecipeInitial extends MyRecipeState {}
