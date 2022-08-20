import 'package:catapp/model/cat.dart';
import 'package:catapp/presentation/components/loading_widget.dart';
import 'package:catapp/presentation/components/no_results_widget.dart';
import 'package:catapp/presentation/home/widgets/item_widget.dart';
import 'package:catapp/presentation/home/widgets/search_bar_widget.dart';
import 'package:catapp/presentation/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_color.dart';
import 'package:lottie/lottie.dart';

import 'home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key}) : super(key: key) {
    Get.put(HomeController());
    //Get.lazyPut(()=>SplashController())
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Catbreeds"),
        ),
        body: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SearchBarWidget(onChange: (value) {
                  controller.onChangeForSearch(value);
                })),
            Expanded(
              child: Obx(() => controller.load.value == true
                  ? const Center(child: LoadingWidget())
                  : controller.data.value.isEmpty
                      ? const NoResultsWidget()
                      : RefreshIndicator(
                          onRefresh: () async {
                            await controller.getListCats();
                          },
                          child: ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              var cat = controller.data.value[index];
                              return ItemWidget(
                                cat: cat,
                                onPressMore: () {
                                  controller.goToDetail(cat);
                                },
                              );
                            },
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
