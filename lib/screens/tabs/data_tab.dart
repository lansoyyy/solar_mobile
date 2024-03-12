import 'package:flutter/material.dart';
import 'package:solar_mobile/widgets/text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataTab extends StatefulWidget {
  const DataTab({super.key});

  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'Show',
                  fontSize: 18,
                  fontFamily: 'Bold',
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: DropdownButton(
                      underline: const SizedBox(),
                      value: dropValue,
                      items: [
                        for (int i = 0; i < dropItems.length; i++)
                          DropdownMenuItem(
                            onTap: () {
                              filter = dropItems[i];
                            },
                            value: i,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(50, 2, 50, 2),
                              child: TextWidget(
                                  text: dropItems[i],
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                      ],
                      onChanged: ((value) {
                        setState(() {
                          dropValue = int.parse(value.toString());
                        });
                      })),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 500,
              width: 400,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        TextWidget(
                          text: index == 0
                              ? 'Solar Panel Status'
                              : index == 1
                                  ? 'Wind Turbine Status'
                                  : 'Battery Status',
                          fontSize: 24,
                          fontFamily: 'Bold',
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          text: 'Voltage',
                          fontSize: 18,
                          fontFamily: 'Bold',
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                              color: Colors.white,
                              height: 200,
                              width: 375,
                              child: SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(),
                                  series: <CartesianSeries>[
                                    // Renders line chart
                                    LineSeries<SalesData, DateTime>(
                                        dataSource: chartData,
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.year,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales)
                                  ])),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          text: 'Current',
                          fontSize: 18,
                          fontFamily: 'Bold',
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                              color: Colors.white,
                              height: 200,
                              width: 375,
                              child: SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(),
                                  series: <CartesianSeries>[
                                    // Renders line chart
                                    LineSeries<SalesData, DateTime>(
                                        dataSource: chartData,
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.year,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales)
                                  ])),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 3; i++)
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
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
