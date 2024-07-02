import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/routing/routes.dart';

class CreateRestaurantController extends GetxController {
  var isLoading = false.obs;
  var titleNameController = TextEditingController();
  var endDateController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var subDomainController = TextEditingController();
  var emailController = TextEditingController();
  var profileImgController = TextEditingController();
  var mainColorController = TextEditingController();
  var passwordController = TextEditingController();
  var mainCategoryController = TextEditingController();
  var subcategoryController = TextEditingController();

  void createRestaurant(BuildContext context) async {
    isLoading.value = true;

    final url = 'https://instinctive-fish-utahceratops.glitch.me/api/v1/Main/';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'titleName': titleNameController.text,
      'endDate': endDateController.text,
      'name': nameController.text,
      'phone': phoneController.text,
      'subDomain': subDomainController.text,
      'email': emailController.text,
      'profileimg': profileImgController.text,
      'mainColor': mainColorController.text,
      'password': passwordController.text,
      'maincategory': [mainCategoryController.text],
      'subcategory': jsonDecode(subcategoryController.text),
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Handle success
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Restaurant created successfully')));
        print('Restaurant created successfully');
        Navigator.pushNamed(context, Routes.homeScreen);
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create restaurant')));
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
        print('Failed to create restaurant: ${response.body}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred')));
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
