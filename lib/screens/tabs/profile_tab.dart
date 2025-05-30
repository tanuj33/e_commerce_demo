import 'package:e_commerce_demo/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreenTab extends StatelessWidget {
  const ProfileScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final String? username = authService.getCurrentUsername();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              username != null ? 'Hello, $username!' : 'Hello, Guest!',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'This is your personal profile page.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.blueGrey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            _buildProfileInfoRow(Icons.email, 'Email:', 'user@example.com'),
            _buildProfileInfoRow(Icons.phone, 'Phone:', '+123 456 7890'),
            _buildProfileInfoRow(Icons.location_on, 'Address:', '123 E-commerce St, App City'),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Implement profile editing logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Profile functionality coming soon!')),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blueGrey.shade700, size: 24),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blueGrey.shade700,
            ),
          ),
          SizedBox(width: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
