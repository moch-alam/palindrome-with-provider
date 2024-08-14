import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:palindrome_app/providers/user_provider.dart';
import 'package:palindrome_app/widgets/user_list_item.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Third Screen')),
      ),
      body: RefreshIndicator(
        onRefresh: userProvider.refreshUsers,
        child: FutureBuilder(
          future: userProvider.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              if (userProvider.users.isEmpty) {
                return Center(child: Text('No Users Found'));
              } else {
                return ListView.builder(
                  itemCount: userProvider.users.length,
                  itemBuilder: (context, index) {
                    return UserListItem(user: userProvider.users[index]);
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
