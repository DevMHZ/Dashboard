// restaurant_controller.dart
import 'dart:convert';
import 'package:dashboard/features/all_resturant/model/all_resturant_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  var isLoading = true.obs;
  var restaurantList = <Data>[].obs;
  var selectedRestaurant = Data().obs;

  @override
  void onInit() {
    fetchRestaurants();
    super.onInit();
  }

  void fetchRestaurants() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://instinctive-fish-utahceratops.glitch.me/api/v1/Main/'));
      if (response.statusCode == 200) {
        var result = GetResturantsModel.fromJson(json.decode(response.body));
        if (result.data != null) {
          restaurantList.value = result.data!;
        }
      } else {
        Get.snackbar("Error", "Failed to fetch restaurants");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void selectRestaurant(Data restaurant) {
    selectedRestaurant.value = restaurant;
  }
}
