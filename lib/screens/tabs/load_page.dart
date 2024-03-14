import 'package:flutter/material.dart';
import 'package:solar_mobile/widgets/button_widget.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

import '../../widgets/gauge_widget.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  var dropItems = [
    'Today',
    'Yesterday',
    '2 Days Ago',
    'Last Week',
    'Last Month'
  ];

  var filter = 'Today';
  var dropValue = 0;

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(2010), 35),
      SalesData(DateTime(2011), 28),
      SalesData(DateTime(2012), 34),
      SalesData(DateTime(2013), 32),
      SalesData(DateTime(2014), 40)
    ];
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
                            label: 'DD / MM / YY                 HH : MM AM',
                            onPressed: () {},
                            textColor: Colors.black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonWidget(
                            radius: 100,
                            color: Colors.white,
                            label: 'CHECK BATTERY STATUS',
                            onPressed: () {},
                            textColor: Colors.black,
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
