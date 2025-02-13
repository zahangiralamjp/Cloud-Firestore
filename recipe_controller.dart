import 'package:flutter_application_2/firebase_service.dart';
import 'package:flutter_application_2/recipe_model.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  var recipes = <Recipe>[].obs;

  @override
  void onInit() {
    fetchRecipes();
    super.onInit();
  }

  void fetchRecipes() {
    _firebaseService.getRecipes().listen((recipeList) {
      recipes.assignAll(recipeList);
    });
  }

  void addRecipe(Recipe recipe) {
    _firebaseService.addRecipe(recipe);
  }

  void updateRecipe(Recipe recipe) {
    _firebaseService.updateRecipe(recipe);
  }

  void deleteRecipe(String id) {
    _firebaseService.deleteRecipe(id);
  }

  void toggleFavorite(Recipe recipe) {
    recipe.isFavorite = !recipe.isFavorite;
    updateRecipe(recipe);
  }
}
