import 'package:auth_tn/util/constants.dart';
import 'package:flutter/material.dart';

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
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {},
    );
  }
}
