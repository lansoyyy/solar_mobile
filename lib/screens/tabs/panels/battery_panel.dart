import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:solar_mobile/widgets/button_widget.dart';
import 'package:solar_mobile/widgets/gauge_widget.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

import 'solar_panel.dart';

class BatteryPanel extends StatefulWidget {
  const BatteryPanel({super.key});

  @override
  State<BatteryPanel> createState() => _BatteryPanelState();
}

class _BatteryPanelState extends State<BatteryPanel> {
  bool hasLoaded = false;

  dynamic panelData = {};

  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance
        .ref('users/TEAM OTOG/')
        .orderByKey()
        .limitToFirst(1)
        .onValue
        .listen((DatabaseEvent event) {
      final dynamic data = event.snapshot.value;

      if (data != null && data is Map<Object?, Object?>) {
        final List<MapEntry<Object?, Object?>> entries = data.entries.toList();
        if (entries.isNotEmpty) {
          final MapEntry<Object?, Object?> firstEntry = entries.first;
          print(
              'First entry key: ${firstEntry.key}, value: ${firstEntry.value}');
          setState(() {
            panelData = firstEntry.value;
            hasLoaded = true;
          });
          // Now you can use firstEntry.key and firstEntry.value as needed
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hasLoaded
          ? GestureDetector(
              onHorizontalDragUpdate: (details) {
                // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                int sensitivity = 8;
                if (details.delta.dx > sensitivity) {
                  Get.to(() => const BatteryPanel(),
                      duration: const Duration(seconds: 1),
                      transition: Transition.downToUp);
                  // Right Swipe
                } else if (details.delta.dx < -sensitivity) {
                  //Left Swipe
                }
              },
              child: Container(
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
                            return index == 0 || index == 1
                                ? const SizedBox()
                                : SingleChildScrollView(
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
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Container(
                                            color: Colors.white,
                                            height: index == 2 || index == 3
                                                ? 350
                                                : 200,
                                            width: 375,
                                            child: index == 2 || index == 3
                                                ? Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                            width: 175,
                                                            height: 150,
                                                            child: GaugeChart(
                                                              text: 'VOLTAGE',
                                                              sign: '',
                                                              data: panelData[
                                                                  'BatteryVoltage'],
                                                              opium: '0 - 0',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 175,
                                                            height: 150,
                                                            child: GaugeChart(
                                                              text: 'AMPERES',
                                                              sign: '',
                                                              data: panelData[
                                                                  'BatteryCurrent'],
                                                              opium: '0 - 0',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 175,
                                                        height: 150,
                                                        child: GaugeChart(
                                                          text: 'PERCENTAGE',
                                                          sign: '',
                                                          data: panelData[
                                                              'Battery Percentage'],
                                                          opium: '0 - 0',
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      SizedBox(
                                                        width: 175,
                                                        height: 150,
                                                        child: GaugeChart(
                                                          text:
                                                              'Optimum  Voltage at\n12.0 volts to 18.0 volts',
                                                          sign: 'C',
                                                          data: index == 0
                                                              ? panelData[
                                                                  'SolarCurrent']
                                                              : index == 1
                                                                  ? panelData[
                                                                      'WindCurrent']
                                                                  : 100,
                                                          opium: '28 - 30',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 175,
                                                        height: 150,
                                                        child: GaugeChart(
                                                          text:
                                                              'Optimum  Amperes at 5 amperes to 20 amperes',
                                                          sign: 'C',
                                                          data: index == 0
                                                              ? panelData[
                                                                  'SolarVoltage']
                                                              : index == 1
                                                                  ? panelData[
                                                                      'WindVoltage']
                                                                  : 100,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (int i = 0; i < 4; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, right: 5),
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
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
