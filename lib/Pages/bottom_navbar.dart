import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app_bloc/Blocs/bloc/RecipeOnlie/recipe_online_bloc.dart';
import 'package:food_recipe_app_bloc/Pages/add_recipe_page.dart';
import 'package:food_recipe_app_bloc/Pages/homePage.dart';
import 'package:food_recipe_app_bloc/Pages/online_recipe_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RecipeOnlineBloc>().add(RecipeOnlineEvent.fetEntries);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Color.fromARGB(232, 255, 163, 5),
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.fastfood),
                text: "Add Recipe",
              ),
              Tab(
                icon: Icon(Icons.cloud_download),
                text: "Fetch Recipes",
              ),
            ],
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff999999),
          ),
        ),
        body: TabBarView(
            children: [RecipeListScreen(), AddRecipes(), OnlineRecipePage()]),
      ),
    );
  }
}
