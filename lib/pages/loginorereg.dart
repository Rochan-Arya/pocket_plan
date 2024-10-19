import 'package:expense_tracker/pages/loginpage.dart';
import 'package:expense_tracker/pages/reg_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegPage extends StatefulWidget {
  const LoginOrRegPage({super.key});

  @override
  State<LoginOrRegPage> createState() => _LoginOrRegPageState();
}

class _LoginOrRegPageState extends State<LoginOrRegPage> {
  bool showloginPage = true;
  void togglePage() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage) {
      return Loginpage(
        onTap: togglePage,
      );
    } else {
      return RegisterPage(onTap: togglePage);
    }
  }
}
