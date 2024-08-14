import 'package:flutter/material.dart';
import 'package:palindrome_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  String _selectedUserName = '';

  List<User> get users => _users;
  String get selectedUserName => _selectedUserName;

  Future<void> fetchUsers([int page = 1, int perPage = 6]) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<User> fetchedUsers = (data['data'] as List)
          .map((userJson) => User.fromJson(userJson))
          .toList();
      _users = fetchedUsers;
      notifyListeners();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> refreshUsers() async {
    await fetchUsers();
  }

  void selectUser(String name) {
    _selectedUserName = name;
    notifyListeners();
  }
}
