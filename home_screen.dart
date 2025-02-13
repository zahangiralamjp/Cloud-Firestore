import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_recipe_screen.dart';
import 'package:flutter_application_2/recipe_controller.dart';
import 'package:get/get.dart';

import 'recipe_model.dart';

class HomeScreen extends StatelessWidget {
  final RecipeController _recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(AddRecipeScreen()),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: _recipeController.recipes.length,
          itemBuilder: (context, index) {
            Recipe recipe = _recipeController.recipes[index];
            return ListTile(
              title: Text(recipe.title),
              subtitle: Text(recipe.description),
              trailing: IconButton(
                icon: Icon(
                  recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () => _recipeController.toggleFavorite(recipe),
              ),
              onTap: () => Get.to(AddRecipeScreen(recipe: recipe)),
            );
          },
        );
      }),
    );
  }
}
