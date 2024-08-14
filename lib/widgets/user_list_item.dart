import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:palindrome_app/models/user_model.dart';
import 'package:palindrome_app/providers/user_provider.dart';

class UserListItem extends StatelessWidget {
  final User user;

  UserListItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: () {
        Provider.of<UserProvider>(context, listen: false)
            .selectUser('${user.firstName} ${user.lastName}');
        Navigator.pop(context);
      },
    );
  }
}
