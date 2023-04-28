import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberMeExample extends StatefulWidget {
  @override
  _RememberMeExampleState createState() => _RememberMeExampleState();
}

class _RememberMeExampleState extends State<RememberMeExample> {
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedPassword();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _loadSavedPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPassword = prefs.getString('saved_password');
    if (savedPassword != null) {
      setState(() {
        _passwordController.text = savedPassword;
        _rememberMe = true;
      });
    }
  }

  void _savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_password', password);
  }

  void _deleteSavedPassword() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remember Me Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                        if (_rememberMe) {
                          _savePassword(_passwordController.text);
                        } else {
                          _deleteSavedPassword();
                        }
                      });
                    },
                  ),
                  Text('Remember Me'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
