import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteRestaurantController extends GetxController {
  var isLoading = false.obs;

  void deleteRestaurant(BuildContext context, String restaurantId) async {
    isLoading.value = true;

    final url = 'https://instinctive-fish-utahceratops.glitch.me/api/v1/Main/$restaurantId';
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Restaurant deleted successfully')));
        print('Restaurant deleted successfully');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete restaurant')));
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(response.body),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
        print('Failed to delete restaurant: ${response.body}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred')));
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
