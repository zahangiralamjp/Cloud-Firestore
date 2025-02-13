import 'package:cloud_firestore/cloud_firestore.dart';

import 'recipe_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new recipe
  Future<void> addRecipe(Recipe recipe) async {
    await _firestore.collection('recipes').add(recipe.toMap());
  }

  // Get all recipes
  Stream<List<Recipe>> getRecipes() {
    return _firestore.collection('recipes').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Recipe.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  // Update a recipe
  Future<void> updateRecipe(Recipe recipe) async {
    await _firestore
        .collection('recipes')
        .doc(recipe.id)
        .update(recipe.toMap());
  }

  // Delete a recipe
  Future<void> deleteRecipe(String id) async {
    await _firestore.collection('recipes').doc(id).delete();
  }
}
