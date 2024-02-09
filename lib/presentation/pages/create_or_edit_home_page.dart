import 'package:flutter/material.dart';

class CreateOrEditHomePage extends StatefulWidget {
  const CreateOrEditHomePage({super.key});

  @override
  State<CreateOrEditHomePage> createState() => _CreateOrEditHomePageState();
}

class _CreateOrEditHomePageState extends State<CreateOrEditHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Create Or Edit Home Page'),
        ),
      ),
    );
  }
}
