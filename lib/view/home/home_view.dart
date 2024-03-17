import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/controller/controller.dart';
import 'package:recipeapp/core/app_colors.dart';
import 'package:recipeapp/core/extension/center_extension.dart';
import 'package:recipeapp/core/extension/padding_extension.dart';
import 'package:recipeapp/core/widgets/custom_text.dart';
import 'package:recipeapp/view/home/search.dart';
import 'package:recipeapp/view/home/widgets/card_item.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: offLightC.withOpacity(0.3),
          title: CustomText(text: 'Recipe App').center(),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                controller.setType(value.toString());
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('Easy');
                    },
                    value: 'Easy',
                    child: CustomText(text: 'Easy'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('Medium');
                    },
                    value: 'Medium',
                    child: CustomText(text: 'Medium'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('');
                    },
                    value: '',
                    child: CustomText(text: 'Default'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('Breakfast');
                    },
                    value: 'Breakfast',
                    child: CustomText(text: 'Breakfast'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('Lunch');
                    },
                    value: 'Lunch',
                    child: CustomText(text: 'Lunch'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('Dinner');
                    },
                    value: 'Dinner',
                    child: CustomText(text: 'Dinner'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('Snack');
                    },
                    value: 'Snack',
                    child: CustomText(text: 'Snack'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      controller.setType('Dessert');
                    },
                    value: 'Dessert',
                    child: CustomText(text: 'Dessert'),
                  ),
                ];
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: lightC,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomText(text: 'sort')
                    .padding(Get.width * 0.02, Get.height * 0.01),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: Search(recipeModel: controller.recipeModel),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  //height: Get.height * 0.07,
                  decoration: BoxDecoration(
                    //color: lightC,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: offLightC),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.search,
                        size: Get.width * 0.07,
                      ).padding(12, 12),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: controller.recipeModel == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : FutureBuilder(
                        future: controller.getDataByType(controller.type),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: controller.recipeModel!.recipes.length,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: CardItem(
                                  index: index,
                                ),
                              );
                            },
                          );
                        }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
