import 'package:dashboard/features/Create_Resturant/controller/create_resturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRestaurantView extends StatelessWidget {
  final CreateRestaurantController createRestaurantView = Get.put(CreateRestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Restaurant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: createRestaurantView.titleNameController,
                decoration: InputDecoration(labelText: 'Title Name'),
              ),
              TextField(
                controller: createRestaurantView.endDateController,
                decoration: InputDecoration(labelText: 'End Date'),
              ),
              TextField(
                controller: createRestaurantView.nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: createRestaurantView.phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: createRestaurantView.subDomainController,
                decoration: InputDecoration(labelText: 'Sub-domain'),
              ),
              TextField(
                controller: createRestaurantView.emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: createRestaurantView.profileImgController,
                decoration: InputDecoration(labelText: 'Profile Image'),
              ),
              TextField(
                controller: createRestaurantView.mainColorController,
                decoration: InputDecoration(labelText: 'Main-Color'),
              ),
              TextField(
                controller: createRestaurantView.passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: createRestaurantView.mainCategoryController,
                decoration: InputDecoration(labelText: 'Main Category'),
              ),
              TextField(
                controller: createRestaurantView.subcategoryController,
                decoration: InputDecoration(
                  labelText: 'Subcategory (JSON format)',
                  hintText: '[{"maincategory":"main","name":"shawarma","price":"30000","img":"shawarma","des":"shawarma shawarma"}]',
                ),
                maxLines: 5,
              ),
              SizedBox(height: 20),
              Obx(() => createRestaurantView.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => createRestaurantView.createRestaurant(context),
                      child: Text('Create Restaurant'),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
