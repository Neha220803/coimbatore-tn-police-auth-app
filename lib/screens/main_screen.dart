import 'package:auth_tn/screens/profile_screen.dart';
import 'package:auth_tn/screens/scanner_screen.dart';
import 'package:auth_tn/screens/side_nav.dart';
import 'package:auth_tn/screens/tokens_screen.dart';
import 'package:auth_tn/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController =
      PageController(); // ✅ Add PageController

  final List<Widget> _screens = [
    const ScannerPage(),
    const TokensPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00284F),
        title: Row(
          children: [
            const Icon(Icons.shield, color: orange),
            const SizedBox(width: 8),
            Text(
              _selectedIndex == 0
                  ? 'QR SCANNER'
                  : _selectedIndex == 1
                      ? 'SECURITY TOKENS'
                      : 'PROFILE',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        controller: _pageController, // ✅ Use PageController
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: primarycolor,
        items: const <TabItem>[
          TabItem(icon: Icons.qr_code_scanner, title: 'Scan'),
          TabItem(icon: Icons.security, title: 'Tokens'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          setState(() {
            _selectedIndex = index;
          });
        },
        initialActiveIndex: _selectedIndex,
        style: TabStyle.reactCircle,
        height: 60,
      ),

      //     Container(
      //   decoration: const BoxDecoration(
      //     color: Color(0xFF00284F),
      //     border: Border(
      //       top: BorderSide(
      //         color: orange,
      //         width: 1.0,
      //       ),
      //     ),
      //   ),
      //   child: BottomNavigationBar(
      //     currentIndex: _selectedIndex,
      //     onTap: (index) {
      //       setState(() {
      //         _selectedIndex = index;
      //       });
      //     },
      //     backgroundColor: const Color(0xFF00284F),
      //     selectedItemColor: orange,
      //     unselectedItemColor: Colors.grey,
      //     selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.qr_code_scanner),
      //         label: 'Scan',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.security),
      //         label: 'Tokens',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
