import 'package:dashboard_admin/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_admin/style/colors.dart';


 // const white= Colors.white;
 // const pink1= Color(0xFFF8BBD0);
 // const pink4= Color(0xFFF1CFDB);
 // const pink2= Color(0xFFEC407A);
 // const pink3= Color(0xFF880E4F);
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      color: AppColors.pink2,
      theme: ThemeData(
        cardColor: AppColors.pink4,
      ),
      home:  DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardContent(),
    Center(child: Text('Add Items Screen')),
    Center(child: Text('Monthly Sales Screen')),
    Center(child: Text('Reviews Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: AppColors.pink1, // Set app bar background color
        foregroundColor: AppColors.pink5, // Set text/icon color of app bar
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.all,
            backgroundColor: AppColors.pink1, // Background color for NavigationRail
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.dashboard, color: AppColors.pink4), // Set icon color
                selectedIcon: Icon(Icons.dashboard, color: AppColors.pink4), // Set selected icon color
                label: Text('Dashboard', style: TextStyle(color: AppColors.pink2)), // Set label text color
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add, color: AppColors.pink4),
                selectedIcon: Icon(Icons.add, color: AppColors.pink4),
                label: Text('Add Items', style: TextStyle(color: AppColors.pink2)),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.attach_money, color: AppColors.pink4),
                selectedIcon: Icon(Icons.attach_money, color: AppColors.pink4),
                label: Text('Sales', style: TextStyle(color: AppColors.pink2)),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.reviews, color: AppColors.pink4),
                selectedIcon: Icon(Icons.reviews, color: AppColors.pink4),
                label: Text('Reviews', style: TextStyle(color: AppColors.pink2)),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1), // Add a divider
          Expanded(
            child: Container( // Wrap the content area in a Container
              color: AppColors.pink4, // Set background color for content area (optional)
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( // Added Container for background color
      color: AppColors.pink4, // Set background color here
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          DashboardCard(
            title: 'Users',
            icon: Icons.people,
            count: 150,
            backgroundColor: AppColors.pink4,
            textColor: AppColors.pink3,
          ),
          DashboardCard(
            title: 'Products',
            icon: Icons.shopping_cart,
            count: 230,
            backgroundColor: AppColors.pink4,
            textColor: AppColors.pink3,
          ),
          DashboardCard(
            title: 'Orders',
            icon: Icons.monetization_on,
            count: 120,
            backgroundColor: AppColors.pink4,
            textColor: AppColors.pink3,
          ),
          DashboardCard(
            title: 'Reports',
            icon: Icons.bar_chart,
            count: 5,
            backgroundColor: AppColors.pink4,
            textColor: AppColors.pink3,
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  // ... (same as before)
  final String title;
  final IconData icon;
  final int count;
  final Color? backgroundColor; // Optional background color for the card
  final Color? textColor; // Optional text color for the card

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.count,
    this.backgroundColor, // Initialize the optional background color
    this.textColor, // Initialize the optional text color

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Clicked on $title')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 4),
              Text(
                '$count',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}