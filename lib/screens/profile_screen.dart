import 'package:flutter/material.dart';
import 'package:souqflow/core/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildUserHeader(),
            SizedBox(height: 24),
            _buildSettingsSection(),
            SizedBox(height: 24),
            _buildAppInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primary,
            child: Icon(Icons.person, size: 30, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Guest User',
                  style: TextStyle(color: AppColors.textLight),
                ),
              ],
            ),
          ),
          Icon(Icons.edit, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildSettingItem(
          icon: Icons.language,
          title: 'Language',
          subtitle: 'English',
          onTap: () {},
        ),
        _buildSettingItem(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Enabled',
          onTap: () {},
        ),
        _buildSettingItem(
          icon: Icons.payment,
          title: 'Payment Methods',
          subtitle: 'Add credit card',
          onTap: () {},
        ),
        _buildSettingItem(
          icon: Icons.location_on,
          title: 'Address',
          subtitle: 'Add delivery address',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildAppInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildSettingItem(
          icon: Icons.help,
          title: 'Help & Support',
          subtitle: 'Contact us',
          onTap: () {},
        ),
        _buildSettingItem(
          icon: Icons.security,
          title: 'Privacy Policy',
          subtitle: 'Read our policy',
          onTap: () {},
        ),
        _buildSettingItem(
          icon: Icons.info,
          title: 'About',
          subtitle: 'Version 1.0.0',
          onTap: () {},
        ),
      ],
    );
  }

  _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
