import 'package:dashboard/features/Create_Resturant/controller/create_resturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRestaurantView extends StatelessWidget {
  final CreateRestaurantController createRestaurantView =
      Get.put(CreateRestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: createRestaurantView.titleNameController,
                labelText: 'Title Name',
              ),
              _buildTextField(
                controller: createRestaurantView.endDateController,
                labelText: 'End Date',
                readOnly: true,
                onTap: () {
                  createRestaurantView.selectDate(context);
                },
              ),
              _buildTextField(
                controller: createRestaurantView.nameController,
                labelText: 'Name',
              ),
              _buildTextField(
                controller: createRestaurantView.phoneController,
                labelText: 'Phone',
              ),
              _buildTextField(
                controller: createRestaurantView.subDomainController,
                labelText: 'Sub-domain',
              ),
              SizedBox(height: 20),
              Text(
                'Contact Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: createRestaurantView.emailController,
                labelText: 'Email',
              ),
              _buildTextField(
                controller: createRestaurantView.profileImgController,
                labelText: 'Profile Image',
              ),
              SizedBox(height: 20),
              Text(
                'Additional Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: createRestaurantView.mainColorController,
                labelText: 'Main Color',
              ),
              _buildTextField(
                controller: createRestaurantView.passwordController,
                labelText: 'Password',
                obscureText: true,
              ),
              // _buildTextField(
              //   controller: createRestaurantView.mainCategoryController,
              //   labelText: 'Main Category',
              // ),
              // _buildTextField(
              //   controller: createRestaurantView.subcategoryController,
              //   labelText: 'Subcategory (JSON format)',
              //   maxLines: 5,
              // ),
              SizedBox(height: 20),
              Center(
                child: Obx(() => createRestaurantView.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () =>
                            createRestaurantView.createRestaurant(context),
                        child: Text('Create Restaurant'),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool readOnly = false,
    VoidCallback? onTap,
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        readOnly: readOnly,
        onTap: onTap,
        obscureText: obscureText,
        maxLines: maxLines,
      ),
    );
  }
}
