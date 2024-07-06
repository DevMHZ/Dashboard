import 'package:dashboard/features/Create_Resturant/controller/create_resturant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRestaurantView extends StatelessWidget {
  final CreateRestaurantController createRestaurantView =
      Get.put(CreateRestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'معلومات المطهم',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: createRestaurantView.titleNameController,
                  labelText: 'اسم المطعم',
                ),
                _buildTextField(
                  controller: createRestaurantView.endDateController,
                  labelText: 'تاريخ الانتهاء',
                  readOnly: true,
                  onTap: () {
                    createRestaurantView.selectDate(context);
                  },
                ),
                _buildTextField(
                  controller: createRestaurantView.nameController,
                  labelText: 'اسم المستخدم',
                ),
                _buildTextField(
                  controller: createRestaurantView.phoneController,
                  labelText: 'رقم الهاتف',
                ),
                _buildTextField(
                  controller: createRestaurantView.subDomainController,
                  labelText: 'الدومين',
                ),
                SizedBox(height: 20),
                Text(
                  'معلومات التواصل',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: createRestaurantView.emailController,
                  labelText: 'الايميل',
                ),
                _buildTextField(
                  controller: createRestaurantView.profileImgController,
                  labelText: 'صورة الملف الشخصي',
                ),
                SizedBox(height: 20),
                Text(
                  'معلومات اضافية',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildTextField(
                  controller: createRestaurantView.mainColorController,
                  labelText: 'اللون الاساسي',
                ),
                _buildTextField(
                  controller: createRestaurantView.passwordController,
                  labelText: 'كلمة السر',
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
                          child: Text('إنشاء مطعم'),
                        )),
                ),
              ],
            ),
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
