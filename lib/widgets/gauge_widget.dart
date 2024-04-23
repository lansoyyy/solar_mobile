import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeChart extends StatelessWidget {
  late dynamic data;
  final String opium;
  final String sign;
  final String text;
  GaugeChart(
      {super.key,
      this.data,
      required this.opium,
      required this.sign,
      required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> parts = opium.split("-");
    String secondPart = parts[1].trim();
    double value = double.parse(secondPart);

    double partialPercentage = data / value;
    double totalPercentage = partialPercentage * 100;

    return SizedBox(
      height: 150,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            endAngle: 0,
            radiusFactor: 0.8,
            canScaleToFit: true,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.5,
              color: Color.fromARGB(30, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.startCurve,
            ),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 90,
                widget: Text(
                  data.toString(),
                  style: const TextStyle(
                      fontFamily: 'QBold',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              GaugeAnnotation(
                angle: 90,
                positionFactor: 1.50,
                widget: Column(
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          fontFamily: 'QBold',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
            ranges: [
              GaugeRange(
                  startValue: 1.0,
                  endValue: 100,
                  color: Colors.grey.withOpacity(.5)),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                  color: const Color.fromARGB(255, 192, 236, 225),
                  value: totalPercentage,
                  width: 0.2,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve),
            ],
          )
        ],
      ),
    );
  }
}
