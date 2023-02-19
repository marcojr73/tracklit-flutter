import 'package:flutter/material.dart';

class AllHabits extends StatelessWidget {
  const AllHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 100),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
