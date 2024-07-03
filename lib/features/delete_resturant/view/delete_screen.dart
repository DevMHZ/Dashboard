import 'package:dashboard/features/delete_resturant/controller/delete_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteRestaurantView extends StatelessWidget {
  final DeleteRestaurantController deleteRestaurantController =
      Get.put(DeleteRestaurantController());
  final TextEditingController restaurantIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Restaurant'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Delete Restaurant',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: restaurantIdController,
                    decoration: InputDecoration(
                      labelText: 'Restaurant ID',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.restaurant),
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(() => deleteRestaurantController.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            final restaurantId = restaurantIdController.text;
                            if (restaurantId.isNotEmpty) {
                              deleteRestaurantController.deleteRestaurant(
                                  context, restaurantId);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Please enter a Restaurant ID')));
                            }
                          },
                          child: Text('Delete Restaurant'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            textStyle: TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
