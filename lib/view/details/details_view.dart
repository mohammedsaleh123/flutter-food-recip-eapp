import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/controller/controller.dart';
import 'package:recipeapp/core/app_colors.dart';
import 'package:recipeapp/core/extension/center_extension.dart';
import 'package:recipeapp/core/extension/padding_extension.dart';
import 'package:recipeapp/core/widgets/custom_text.dart';
import 'package:recipeapp/model/recipe_model.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  DetailsView({super.key, required this.index});
  Controller controller = Get.find();
  Recipe? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        backgroundColor: offLightC.withOpacity(0.3),
        title: CustomText(
          text: index!.name,
        ).center(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.35,
              width: Get.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Hero(
                  tag: index!.id,
                  child: Image.network(
                    index!.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: index!.difficulty.toString(),
                      ),
                      SizedBox(
                        width: Get.width * 0.04,
                      ),
                      CustomText(
                        text: index!.cuisine,
                      ),
                    ],
                  ),
                  Column(
                    children:
                        index!.tags.map((e) => CustomText(text: e)).toList(),
                  ),
                ],
              ).padding(12, 8),
            ),
            const Divider(),
            CustomText(
              text: 'ingredients',
              fontSize: 16,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              //height: Get.height * 0.35,
              width: Get.width,
              decoration: BoxDecoration(
                color: offLightC.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: index!.ingredients
                    .map(
                      (e) => CustomText(
                              text: '${index!.ingredients.indexOf(e) + 1} - $e')
                          .padding(0, Get.height * 0.006),
                    )
                    .toList(),
              ),
            ),
            Row(
              children: [
                CustomText(text: 'servings: ${index!.servings}'),
                const Spacer(),
                CustomText(text: 'prep time: ${index!.prepTimeMinutes} min'),
                const Spacer(),
                CustomText(text: 'cook time: ${index!.cookTimeMinutes} min'),
              ],
            ).padding(Get.width * 0.05, Get.height * 0.02),
            const Divider(),
            CustomText(text: 'instructions', fontSize: 16),
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.01),
              padding: const EdgeInsets.all(12),
              //height: Get.height * 0.35,
              decoration: BoxDecoration(
                color: offLightC.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: index!.instructions
                    .map((e) => CustomText(
                            text: '${index!.instructions.indexOf(e) + 1} - $e')
                        .padding(0, Get.height * 0.006))
                    .toList(),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
