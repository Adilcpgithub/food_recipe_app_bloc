import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app_bloc/Repository/custome_recipe_repository.dart';
import 'package:food_recipe_app_bloc/widget/stylishTextField.dart';

class AddRecipes extends StatefulWidget {
  const AddRecipes({super.key});

  @override
  State<AddRecipes> createState() => _AddRecipesState();
}

class _AddRecipesState extends State<AddRecipes> {
  final _titleController = TextEditingController();
  final _servingsController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 255, 216, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(232, 255, 163, 5),
        title: Center(
            child: const Text(
          'Submit Recipe',
          style: TextStyle(
              fontSize: 22,
              fontFamily: AutofillHints.creditCardExpirationDay,
              fontWeight: FontWeight.w500),
        )),
      ),
      body: Container(
        color: Color.fromARGB(232, 255, 216, 149),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  StylishTextField(
                    controller: _titleController,
                    hintText: 'Title',
                    icon: Icons.title,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  StylishTextField(
                    controller: _servingsController,
                    hintText: 'Cooking Time',
                    icon: Icons.restaurant,
                    keyboardType: TextInputType.number,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cooking Time cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  StylishTextField(
                    controller: _ingredientsController,
                    hintText: 'Ingredients ',
                    icon: Icons.list,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingredients cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  StylishTextField(
                    controller: _instructionsController,
                    hintText: 'Instructions',
                    icon: Icons.description,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Instructions cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print('sqqssssssssssssssss');
                        context.read<CustomRecipeRepository>().PostCustomData(
                            title: _titleController.text,
                            cookingTime: _servingsController.text,
                            ingredients: _ingredientsController.text,
                            instruction: _instructionsController.text);
                        print('------------------222-------------');

                        _titleController.clear();
                        _servingsController.clear();
                        _ingredientsController.clear();
                        _instructionsController.clear();
                        formKey.currentState?.reset();
                      }

                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
