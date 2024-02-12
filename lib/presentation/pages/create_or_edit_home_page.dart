import 'package:flutter/material.dart';

/// A home can be created ([isEditing] = false) or edited ([isEditing] = true) with this page.
///
/// Adjusts the UI based on the [isEditing] value.
class CreateOrEditHomePage extends StatefulWidget {
  final bool isEditing;

  const CreateOrEditHomePage({
    super.key,
    required this.isEditing,
  });

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
