import 'package:flutter/material.dart';
import 'package:flutter_application_2/recipe_controller.dart';
import 'package:flutter_application_2/recipe_model.dart';
import 'package:get/get.dart';

class AddRecipeScreen extends StatelessWidget {
  final RecipeController _recipeController = Get.find();
  final Recipe? recipe;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();

  AddRecipeScreen({this.recipe});

  @override
  Widget build(BuildContext context) {
    if (recipe != null) {
      _titleController.text = recipe!.title;
      _descriptionController.text = recipe!.description;
      _imageUrlController.text = recipe!.imageUrl;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe == null ? 'Add Recipe' : 'Edit Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a title';
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a description';
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter an image URL';
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Recipe newRecipe = Recipe(
                      id: recipe?.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      imageUrl: _imageUrlController.text,
                    );
                    if (recipe == null) {
                      _recipeController.addRecipe(newRecipe);
                    } else {
                      _recipeController.updateRecipe(newRecipe);
                    }
                    Get.back();
                  }
                },
                child: Text(recipe == null ? 'Add Recipe' : 'Update Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
