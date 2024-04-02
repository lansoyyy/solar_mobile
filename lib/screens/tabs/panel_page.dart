import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solar_mobile/widgets/button_widget.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

import '../../widgets/gauge_widget.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({super.key});

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  bool hasLoaded = false;

  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance
        .ref('users/')
        .orderByKey()
        .onValue
        .listen((DatabaseEvent event) {
      final dynamic data = event.snapshot.value;

      print(data);

      setState(() {
        hasLoaded = true;
      });
    });
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 600,
                width: 400,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          TextWidget(
                            text: index == 0
                                ? 'Solar Panel Status'
                                : index == 1
                                    ? 'Wind Turbine Status'
                                    : index == 2
                                        ? 'Charging Rate Status'
                                        : 'Discharging Rate Status',
                            fontSize: 24,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              color: Colors.white,
                              height: index == 2 || index == 3 ? 350 : 200,
                              width: 375,
                              child: index == 2 || index == 3
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 175,
                                              height: 150,
                                              child: GaugeChart(
                                                sign: 'C',
                                                data: 100,
                                                opium: '28 - 30',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 175,
                                              height: 150,
                                              child: GaugeChart(
                                                sign: 'C',
                                                data: 100,
                                                opium: '28 - 30',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 175,
                                          height: 150,
                                          child: GaugeChart(
                                            sign: 'C',
                                            data: 100,
                                            opium: '28 - 30',
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 175,
                                          height: 150,
                                          child: GaugeChart(
                                            sign: 'C',
                                            data: 100,
                                            opium: '28 - 30',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 175,
                                          height: 150,
                                          child: GaugeChart(
                                            sign: 'C',
                                            data: 100,
                                            opium: '28 - 30',
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ButtonWidget(
                            radius: 100,
                            color: Colors.white,
                            label: DateFormat(
                                    'dd / MM / yy                 hh : mm a')
                                .format(DateTime.now()),
                            onPressed: () {},
                            textColor: Colors.black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 4; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: index == i
                                            ? Colors.black
                                            : Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
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
