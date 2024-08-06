import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app_bloc/Blocs/bloc/MyRecipeBloc/bloc/my_recipe_bloc.dart';
import 'package:food_recipe_app_bloc/Blocs/bloc/RecipeOnlie/recipe_online_bloc.dart';
import 'package:food_recipe_app_bloc/Pages/bottom_navbar.dart';
import 'package:food_recipe_app_bloc/Repository/custome_recipe_repository.dart';
import 'package:food_recipe_app_bloc/Repository/recipe_online_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => RecipeOnlineRepository(),
          ),
          RepositoryProvider(create: (context) => CustomRecipeRepository())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => RecipeOnlineBloc(
                    RepositoryProvider.of<RecipeOnlineRepository>(context)),
              ),
              BlocProvider(
                  create: (context) => MyRecipeBloc(
                      RepositoryProvider.of<CustomRecipeRepository>(context))
                    ..add(MyRecipeEvent.fetEntries))
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: BottomNavBar(),
            )));
  }
}
