import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/controller/controller.dart';
import 'package:recipeapp/core/app_colors.dart';
import 'package:recipeapp/core/extension/center_extension.dart';
import 'package:recipeapp/core/extension/padding_extension.dart';
import 'package:recipeapp/core/widgets/custom_text.dart';
import 'package:recipeapp/view/details/details_view.dart';

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  CardItem({super.key, required this.index});
  Controller controller = Get.find();
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailsView(index: controller.recipeModel!.recipes[index]),
        );
      },
      child: Stack(
        children: [
          Container(
            height: Get.height * 0.35,
            width: Get.width,
            color: Colors.yellow.shade50,
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.25,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: offLightC.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(40)),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: Get.height * 0.01,
            child: CircleAvatar(
              radius: 114,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(114),
                child: Hero(
                  tag: controller.recipeModel!.recipes[index].id,
                  child: Image.network(
                    controller.recipeModel!.recipes[index].image,
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
                  text: controller.recipeModel!.recipes[index].name.toString(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: controller.recipeModel!.recipes[index].cuisine
                          .toString(),
                      fontSize: 18,
                    ),
                    CustomText(
                      text: controller.recipeModel!.recipes[index].difficulty
                          .toString(),
                      fontSize: 18,
                    ),
                  ],
                ).padding(0, 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text:
                          '${controller.recipeModel!.recipes[index].caloriesPerServing} kcal',
                      fontSize: 18,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: controller.recipeModel!.recipes[index].rating
                              .toString(),
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
    );
  }
}
