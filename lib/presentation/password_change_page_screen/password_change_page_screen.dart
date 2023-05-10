import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PasswordChangePageScreen extends StatefulWidget {
  @override
  _PasswordChangePageScreenState createState() => _PasswordChangePageScreenState();
}

class _PasswordChangePageScreenState extends State<PasswordChangePageScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isCurrentPasswordHidden = true;
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  Future<void> changePassword() async {
    final apiUrl = Uri.parse('http://facemark.me/dj-rest-auth/password/change/');
    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'old_password': currentPasswordController.text,
        'new_password1': newPasswordController.text,
        'new_password2': confirmPasswordController.text,
      }),
    );

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Password changed successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (response.statusCode == 400) {
      Map<String, dynamic> errorData = json.decode(response.body);
      String errorMessage = errorData['error'];
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to change password.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Password'),
        ),
        body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextFormField(
    controller: currentPasswordController,
    obscureText: isCurrentPasswordHidden,
    decoration: InputDecoration(
    labelText: 'Current Password',
    suffixIcon: IconButton(
    onPressed: () {
    setState(() {
    isCurrentPasswordHidden = !isCurrentPasswordHidden;
    });
    },
    icon: Icon(
    isCurrentPasswordHidden ? Icons.visibility : Icons.visibility_off,
    ),
    ),
    ),
    ),
    SizedBox(height: 16.0),
    TextFormField(
    controller: newPasswordController,
    obscureText: isNewPasswordHidden,
    decoration: InputDecoration(
    labelText: 'New Password',
    suffixIcon: IconButton(
    onPressed: () {
    setState(() {
    isNewPasswordHidden = !isNewPasswordHidden;
    });
    },
    icon: Icon(
    isNewPasswordHidden ?Icons.visibility : Icons.visibility_off,
    ),
    ),
    ),
    ),
      SizedBox(height: 16.0),
      TextFormField(
        controller: confirmPasswordController,
        obscureText: isConfirmPasswordHidden,
        decoration: InputDecoration(
          labelText: 'Confirm New Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isConfirmPasswordHidden = !isConfirmPasswordHidden;
              });
            },
            icon: Icon(
              isConfirmPasswordHidden ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
      SizedBox(height: 24.0),
      ElevatedButton(
        onPressed: changePassword,
        child: Text('Change Password'),
      ),
    ],
    ),
        ),
    );
  }
}
