import 'package:flutter/material.dart';
import 'package:whatsin/screens/call.dart';
import 'package:whatsin/screens/community.dart';
import 'package:whatsin/screens/home.dart';
import 'package:whatsin/screens/updates.dart';
import 'package:whatsin/styles/color.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _activeIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    UpdatesScreen(),
    CommunityScreen(),
    CallScreen(),
  ];

  IconData get _fabIcon {
    switch (_activeIndex) {
      case 1:
        return Icons.camera_alt;
      case 2:
        return Icons.group_add;
      case 3:
        return Icons.add_call;
      default:
        return Icons.chat;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _activeIndex, children: _screens),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.whatsappGreen,
        foregroundColor: Colors.black,
        child: Icon(_fabIcon),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.navBar,
        selectedIndex: _activeIndex,
        indicatorColor: AppColors.card,
        onDestinationSelected: (index) => setState(() => _activeIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.chat_outlined), label: 'Chats'),
          NavigationDestination(icon: Icon(Icons.update_outlined), label: 'Updates'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), label: 'Communities'),
          NavigationDestination(icon: Icon(Icons.call_outlined), label: 'Calls'),
        ],
      ),
    );
  }
}
