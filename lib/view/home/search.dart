import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/core/app_colors.dart';
import 'package:recipeapp/core/extension/center_extension.dart';
import 'package:recipeapp/core/extension/padding_extension.dart';
import 'package:recipeapp/core/widgets/custom_text.dart';
import 'package:recipeapp/model/recipe_model.dart';
import 'package:recipeapp/view/details/details_view.dart';

class Search extends SearchDelegate {
  RecipeModel? recipeModel;
  Search({required this.recipeModel});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Icon(Icons.search);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List result = recipeModel!.recipes
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: query == '' ? recipeModel!.recipes.length : result.length,
      itemBuilder: (context, index) {
        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => DetailsView(
                  index: recipeModel!.recipes[recipeModel!.recipes.indexOf(
                    result[index],
                  )],
                ),
              );
            },
            child: Stack(
              children: [
                SizedBox(
                  height: Get.height * 0.35,
                  width: Get.width,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.25,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: offLightC.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: Get.height * 0.01,
                  child: CircleAvatar(
                    radius: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(110),
                      child: Hero(
                        tag: recipeModel!.recipes[index].id,
                        child: query == ''
                            ? Image.network(
                                recipeModel!.recipes[index].image,
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                result[index].image,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      CustomText(
                        text: query == ''
                            ? recipeModel!.recipes[index].name.toString()
                            : result[index].name.toString(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: query == ''
                                ? recipeModel!.recipes[index].cuisine.toString()
                                : result[index].cuisine.toString(),
                            fontSize: 18,
                          ),
                          CustomText(
                            text: query == ''
                                ? recipeModel!.recipes[index].difficulty
                                    .toString()
                                : result[index].difficulty.toString(),
                            fontSize: 18,
                          ),
                        ],
                      ).padding(0, 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text:
                                '${query == '' ? recipeModel!.recipes[index].caloriesPerServing : result[index].caloriesPerServing} kcal',
                            fontSize: 18,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: query == ''
                                    ? recipeModel!.recipes[index].rating
                                        .toString()
                                    : result[index].rating.toString(),
                                fontSize: 18,
                              ),
                              const Icon(Icons.star, color: Colors.amber),
                            ],
                          ),
                        ],
                      ).padding(0, 16),
                    ],
                  ).center().padding(8, 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
