import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solar_mobile/widgets/button_widget.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

import '../../widgets/gauge_widget.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextWidget(
                  text: 'Load Control',
                  fontSize: 28,
                  color: Colors.white,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber,
                        ),
                      ),
                      width: 150,
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('assets/images/socket.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Load 1',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Set Timer',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: const Icon(
                              Icons.arrow_downward,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            title: TextWidget(
                              text: ' Up Time: HH : MM',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      width: 150,
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('assets/images/socket.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Load 2',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Set Timer',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: const Icon(
                              Icons.arrow_downward,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            title: TextWidget(
                              text: ' Up Time: HH : MM',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber,
                        ),
                      ),
                      width: 150,
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('assets/images/idea.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Load 3',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Set Timer',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: const Icon(
                              Icons.arrow_downward,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            title: TextWidget(
                              text: ' Up Time: HH : MM',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      width: 150,
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('assets/images/idea.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Load 4',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            leading: TextWidget(
                              text: 'Set Timer',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            trailing: const Icon(
                              Icons.arrow_downward,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          width: 200,
                          child: ListTile(
                            title: TextWidget(
                              text: ' Up Time: HH : MM',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
