import 'package:dashboard/features/all_resturant/controller/all_resturant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final RestaurantController restaurantController =
      Get.find<RestaurantController>();

  @override
  Widget build(BuildContext context) {
    var restaurant = restaurantController.selectedRestaurant.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name ?? 'Restaurant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (restaurant.profileimg != null)
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      restaurant.profileimg!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 16.0),
              Text(
                restaurant.name ?? '',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                restaurant.titleName ?? '',
                style: TextStyle(fontSize: 22, color: Colors.grey[600]),
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              _buildInfoCard('Phone', restaurant.phone ?? ''),
              _buildInfoCard('Sub Domain', restaurant.subDomain ?? ''),
              _buildInfoCard('End Date', restaurant.endDate ?? ''),
              _buildInfoCard('Main Color', restaurant.mainColor ?? ''),
              _buildInfoCard('Created At', restaurant.createdAt ?? ''),
              _buildInfoCard('Updated At', restaurant.updatedAt ?? ''),
              _buildInfoCard('Slug', restaurant.slug ?? ''),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              Text('Main Categories:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              if (restaurant.maincategory != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: restaurant.maincategory!
                      .map((category) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              category,
                              style: TextStyle(fontSize: 16),
                            ),
                          ))
                      .toList(),
                ),
              SizedBox(height: 16.0),
              Text('Subcategories:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              if (restaurant.subcategory != null)
                Column(
                  children: restaurant.subcategory!
                      .map((sub) => Card(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Text(sub.name ?? ''),
                              subtitle: Text(sub.des ?? ''),
                              trailing: Text(sub.price ?? ''),
                            ),
                          ))
                      .toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      ),
    );
  }
}
