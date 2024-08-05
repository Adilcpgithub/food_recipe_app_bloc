import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app_bloc/Blocs/bloc/recipe_online_bloc.dart';
import 'package:food_recipe_app_bloc/Cards/recipe_card_online.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Center(
            child: Text(
          '   Food Recipes',
          style: TextStyle(
              fontSize: 22,
              fontFamily: AutofillHints.creditCardExpirationDay,
              fontWeight: FontWeight.w500),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {},
                child: const Icon(
                  size: 30,
                  Icons.send,
                  color: Color.fromARGB(255, 131, 73, 3),
                )),
          ),
          const SizedBox(
            width: 13,
          )
        ],
      ),
      body: BlocBuilder<RecipeOnlineBloc, RecipeOnlineState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final data = state.onlineRecipes[index];
              return RecipeCard(
                  title: data.name,
                  cookTime: data.cookingTime,
                  rating: data.rating,
                  thumbnailUrl: data.image);
            },
            itemCount: state.onlineRecipes.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<RecipeOnlineBloc>().add(RecipeOnlineEvent.fetEntries);
      }),
    );
  }
}
