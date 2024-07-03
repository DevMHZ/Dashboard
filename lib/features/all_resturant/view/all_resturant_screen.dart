import 'package:dashboard/core/routing/routes.dart';
import 'package:dashboard/features/all_resturant/controller/all_resturant_controller.dart';
import 'package:dashboard/features/all_resturant/widgets/resturant_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantListScreen extends StatelessWidget {
  final RestaurantController restaurantController =
      Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (restaurantController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 1200
                    ? 4
                    : MediaQuery.of(context).size.width > 800
                        ? 3
                        : MediaQuery.of(context).size.width > 600
                            ? 2
                            : 1,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: restaurantController.restaurantList.length,
              itemBuilder: (context, index) {
                var restaurant = restaurantController.restaurantList[index];
                return GestureDetector(
                  onTap: () {
                    restaurantController.selectRestaurant(restaurant);
                    Navigator.pushNamed(context, Routes.restaurantDetailsPage);
                    Get.to(RestaurantDetailsPage());
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: restaurant.profileimg != null
                                ? Image.network(
                                    restaurant.profileimg!,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: Icon(
                                        Icons.restaurant,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                restaurant.titleName!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
