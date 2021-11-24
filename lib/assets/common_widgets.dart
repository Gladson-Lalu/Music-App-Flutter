import 'package:flutter/material.dart';

class customCircularProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.green[400],
        strokeWidth: 3,
      ),
    );
  }
}
