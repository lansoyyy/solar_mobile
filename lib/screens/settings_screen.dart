import 'package:flutter/material.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget(
          text: 'Contact Administrator',
          fontSize: 18,
        ),
      ),
    );
  }
}
