import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:palindrome_app/providers/user_provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)?.settings.arguments as String;
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Second Screen')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur agar teks sejajar ke kiri
          children: [
            Text('Welcome', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10), // Jarak antara "Welcome" dan nama
            Text(
              '$name',
              style: TextStyle(
                fontSize: 28, // Ukuran lebih besar untuk nama
                fontWeight: FontWeight.bold, // Mengatur teks menjadi tebal (bold)
              ),
            ),
            SizedBox(height: 20), // Jarak antara nama dan teks "Selected User"
            Expanded(
              child: Center(
                child: Text(
                  'Selected User Name ${userProvider.selectedUserName}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold, // Mengatur teks "Selected User" menjadi tebal (bold)
                  ),
                  textAlign: TextAlign.center, // Memusatkan teks "Selected User"
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter, // Menempatkan tombol di bagian bawah
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: Text('Choose a User'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  primary: Color(0xFF2B637B),
                  onPrimary: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
