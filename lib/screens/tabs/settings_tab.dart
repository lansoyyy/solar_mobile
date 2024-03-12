import 'package:flutter/material.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF8C52FF), Color(0xFFFF914D)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Settings',
              fontSize: 32,
              fontFamily: 'Bold',
              color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  color: Colors.amber[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: 'Set Parameter',
                          fontSize: 24,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: 'Help Center',
                          fontSize: 24,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
