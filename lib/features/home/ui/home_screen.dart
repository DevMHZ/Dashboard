import 'package:dashboard/features/Create_Resturant/view/create_resturant.dart';
import 'package:dashboard/features/all_resturant/view/all_resturant_screen.dart';
import 'package:dashboard/features/delete_resturant/view/delete_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController pageController = PageController();
  final SideMenuController sideMenuController = SideMenuController();

  @override
  void initState() {
    super.initState();

    // Listen to page changes and update side menu selection
    pageController.addListener(() {
      sideMenuController.changePage(pageController.page!.toInt());
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    sideMenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Row(
        children: [
          SideMenu(
            key: const Key('side_menu'),
            controller: sideMenuController,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              unselectedTitleTextStyle: const TextStyle(color: Colors.black),
              unselectedIconColor: Colors.black54,
              backgroundColor: Colors.grey[200],
              openSideMenuWidth: 200,
              compactSideMenuWidth: 40,
            ),
            items: [
              SideMenuItem(
                title: 'All Restaurants',
                onTap: (index, controller) {
                  pageController.jumpToPage(0);
                  controller.changePage(index);
                },
              ),
              SideMenuItem(
                title: 'Create Restaurant',
                onTap: (index, controller) {
                  pageController.jumpToPage(1);
                  controller.changePage(index);
                },
              ),
              SideMenuItem(
                title: 'Update Restaurant',
                onTap: (index, controller) {
                  pageController.jumpToPage(2);
                  controller.changePage(index);
                },
              ),
              SideMenuItem(
                title: 'Delete Restaurant',
                onTap: (index, controller) {
                  pageController.jumpToPage(3);
                  controller.changePage(index);
                },
              ),
            ],
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            showToggle: true,
            alwaysShowFooter: false,
            collapseWidth: 600,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                RestaurantListScreen(),
                CreateRestaurantView(),
                UpdateRestaurantPage(),
                DeleteRestaurantView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateRestaurantPage extends StatelessWidget {
  const UpdateRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Update Restaurant Page'),
    );
  }
}
