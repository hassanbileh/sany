import 'package:flutter/material.dart';
import 'package:sany/constants/greeting.dart';

class MainAdminPage extends StatefulWidget {
  const MainAdminPage({super.key});

  @override
  State<MainAdminPage> createState() => _MainAdminPageState();
}

class _MainAdminPageState extends State<MainAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(greeting()),),
      body: const Center(child: Text('Admin Page'),),
    );
  }
}