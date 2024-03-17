import 'package:get/get.dart';
import 'package:recipeapp/model/recipe_model.dart';
import 'package:recipeapp/services/api_repo.dart';

class Controller extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  RecipeModel? recipeModel;
  String type = '';
  ApiRepo apiRepo = ApiRepo();

  Future<void> getData() async {
    final data = await apiRepo.getApi('https://dummyjson.com/recipes');
    recipeModel = RecipeModel.fromJson(data);
    update();
  }

  Future<void> getDataByType(String type) async {
    final data = await apiRepo.getApi('https://dummyjson.com/recipes');
    if (type == 'Easy') {
      data['recipes'] = data['recipes']
          .where((element) => element['difficulty'] == 'Easy')
          .toList();
    }
    if (type == 'Medium') {
      data['recipes'] = data['recipes']
          .where((element) => element['difficulty'] == 'Medium')
          .toList();
    }

    if (type == 'Dinner') {
      data['recipes'] = data['recipes']
          .where((element) => element['mealType'][0] == 'Dinner')
          .toList();
    }

    if (type == 'Dessert') {
      data['recipes'] = data['recipes']
          .where((element) => element['mealType'][0] == 'Dessert')
          .toList();
    }

    if (type == 'Lunch') {
      data['recipes'] = data['recipes']
          .where((element) => element['mealType'][0] == 'Lunch')
          .toList();
    }

    if (type == 'Breakfast') {
      data['recipes'] = data['recipes']
          .where((element) => element['mealType'][0] == 'Breakfast')
          .toList();
    }

    if (type == 'Snack') {
      data['recipes'] = data['recipes']
          .where((element) => element['mealType'][0] == 'Snack')
          .toList();
    }
    recipeModel = RecipeModel.fromJson(data);
    update();
  }

  setType(String typeSort) {
    type = typeSort;
    update();
  }

  setMealType(String typeSort) {
    type = typeSort;
    update();
  }
}
