import 'package:auth_tn/constants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ScannerPage(),
    const TokensPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00284F),
        title: Row(
          children: [
            const Icon(
              Icons.shield,
              color: orange,
            ),
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
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF00284F),
          border: Border(
            top: BorderSide(
              color: orange,
              width: 1.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: const Color(0xFF00284F),
          selectedItemColor: orange,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              label: 'Tokens',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      _cameraController =
          CameraController(cameras![0], ResolutionPreset.medium);
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Scanner')),
      body: Column(
        children: [
          Expanded(
            child: _cameraController == null ||
                    !_cameraController!.value.isInitialized
                ? Center(child: CircularProgressIndicator())
                : CameraPreview(_cameraController!),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle QR scanning logic
              },
              child: Text('Scan QR'),
            ),
          ),
        ],
      ),
    );
  }
}

class TokensPage extends StatelessWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample token data
    final List<AuthToken> tokens = [
      AuthToken(
        name: 'Police HQ',
        account: 'officer123',
        code: '235',
        timeRemaining: 23,
        maxTime: 30,
      ),
      AuthToken(
        name: 'Station Access',
        account: 'officer123',
        code: '892',
        timeRemaining: 15,
        maxTime: 30,
      ),
      AuthToken(
        name: 'Database Login',
        account: 'officer123',
        code: '627',
        timeRemaining: 8,
        maxTime: 30,
      ),
      AuthToken(
        name: 'Evidence Room',
        account: 'officer123',
        code: '154',
        timeRemaining: 27,
        maxTime: 30,
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search tokens...',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFF002A55),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tokens.length,
            itemBuilder: (context, index) {
              return TokenCard(token: tokens[index]);
            },
          ),
        ),
      ],
    );
  }
}

class AuthToken {
  final String name;
  final String account;
  final String code;
  final int timeRemaining;
  final int maxTime;

  AuthToken({
    required this.name,
    required this.account,
    required this.code,
    required this.timeRemaining,
    required this.maxTime,
  });
}

class TokenCard extends StatelessWidget {
  final AuthToken token;

  const TokenCard({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      color: const Color(0xFF002A55),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFF003366),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: orange,
                  child: Icon(
                    Icons.shield,
                    color: Color(0xFF001F3F),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        token.name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        token.account,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  token.code,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: orange,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: token.timeRemaining / token.maxTime,
                backgroundColor: const Color(0xFF003366),
                valueColor: AlwaysStoppedAnimation<Color>(
                  token.timeRemaining > 10 ? orange : bittersweet,
                ),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Refreshes in ${token.timeRemaining}s',
                  style: TextStyle(
                    fontSize: 12,
                    color: token.timeRemaining > 10
                        ? Colors.grey[400]
                        : Colors.red[300],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF002A55),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF003366), width: 1),
            ),
            child: Column(
              children: [
                // Profile picture
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: orange,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFF001F3F),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Officer K. Raman',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'ID: TN-12345 • Chennai Division',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003366),
                    foregroundColor: orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Settings List
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF002A55),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF003366), width: 1),
            ),
            child: Column(
              children: [
                _buildSettingsItem(
                  context,
                  Icons.security,
                  'Security Settings',
                  'Manage biometrics, PIN',
                ),
                const Divider(color: Color(0xFF003366), height: 1),
                _buildSettingsItem(
                  context,
                  Icons.notifications,
                  'Notifications',
                  'Manage notification settings',
                ),
                const Divider(color: Color(0xFF003366), height: 1),
                _buildSettingsItem(
                  context,
                  Icons.lock_clock,
                  'Token Settings',
                  'Configure token refresh times',
                ),
                const Divider(color: Color(0xFF003366), height: 1),
                _buildSettingsItem(
                  context,
                  Icons.help_outline,
                  'Help & Support',
                  'Contact IT support, FAQs',
                ),
                const Divider(color: Color(0xFF003366), height: 1),
                _buildSettingsItem(
                  context,
                  Icons.info_outline,
                  'About',
                  'App info, legal information',
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Logout Button
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text('LOGOUT'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF990000),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Footer
          const Text(
            'Tamil Nadu Police Department • v1.0.0',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return ListTile(
      leading: Icon(icon, color: orange),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {},
    );
  }
}
