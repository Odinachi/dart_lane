import 'package:dartcoder/shared/app_string.dart';
import 'package:flutter/material.dart';

class DsaListScreen extends StatefulWidget {
  const DsaListScreen({super.key});

  @override
  State<DsaListScreen> createState() => _DsaListScreenState();
}

class _DsaListScreenState extends State<DsaListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.dsa),
      ),
      body: Center(
        child: Text('DSA List Screen'),
      ),
    );
  }
}
