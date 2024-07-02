import 'package:dashboard/features/Create_Resturant/view/create_resturant.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Row(
        children: [
          SideMenu(
            key: const Key('side_menu'),
            items: [
              SideMenuItem(
                title: 'All Restaurants',
                onTap: (index, controller) {
                  pageController.jumpToPage(0);
                },
              ),
              SideMenuItem(
                title: 'Create Restaurant',
                onTap: (index, controller) {
                  pageController.jumpToPage(1);
                },
              ),
              SideMenuItem(
                title: 'Update Restaurant',
                onTap: (index, controller) {
                  pageController.jumpToPage(2);
                },
              ),
              SideMenuItem(
                title: 'Delete Restaurant',
                onTap: (index, controller) {
                  pageController.jumpToPage(3);
                },
              ),
            ],
            controller: sideMenuController,
            onDisplayModeChanged: (mode) {
              print(mode);
            },
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
            showToggle: true,
            alwaysShowFooter: false,
            collapseWidth: 600,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                AllRestaurantsPage(),
                CreateRestaurantView(),
                UpdateRestaurantPage(),
                DeleteRestaurantPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AllRestaurantsPage extends StatelessWidget {
  const AllRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('All Restaurants Page'),
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

class DeleteRestaurantPage extends StatelessWidget {
  const DeleteRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Delete Restaurant Page'),
    );
  }
}
