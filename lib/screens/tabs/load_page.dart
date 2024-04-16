import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:solar_mobile/widgets/button_widget.dart';
import 'package:solar_mobile/widgets/text_widget.dart';

import '../../widgets/gauge_widget.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;
  int _count4 = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller1.close();
    _controller2.close();
    _controller3.close();
    _controller4.close();
    super.dispose();
  }

  bool _isCounting1 = false;
  bool _isCounting2 = false;
  bool _isCounting3 = false;
  bool _isCounting4 = false;

  final _controller2 = StreamController<int>.broadcast();
  final _controller3 = StreamController<int>.broadcast();
  final _controller4 = StreamController<int>.broadcast();

  final _controller1 = StreamController<int>.broadcast();

  void _startCounter1() {
    if (_isCounting1) {
      Future<void>.delayed(const Duration(seconds: 1), () {
        _count1++;
        _controller1.sink.add(_count1);
        _startCounter1();
      });
    }
  }

  void _startCounter2() {
    if (_isCounting2) {
      Future<void>.delayed(const Duration(seconds: 1), () {
        _count2++;
        _controller2.sink.add(_count2);
        _startCounter2();
      });
    }
  }

  void _startCounter3() {
    if (_isCounting3) {
      Future<void>.delayed(const Duration(seconds: 1), () {
        _count3++;
        _controller3.sink.add(_count3);
        _startCounter3();
      });
    }
  }

  void _startCounter4() {
    if (_isCounting4) {
      Future<void>.delayed(const Duration(seconds: 1), () {
        _count4++;
        _controller4.sink.add(_count4);
        _startCounter4();
      });
    }
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
        child: StreamBuilder<DatabaseEvent>(
            stream: FirebaseDatabase.instance.ref().onValue,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(child: Text('Error'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              }
              final dynamic data = snapshot.data!.snapshot.value;

              // if (data['RELAY_STATUS_1'] == 1) {
              //   _startCounter1();
              // } else if (data['RELAY_STATUS_2'] == 1) {
              //   _startCounter2();
              // } else if (data['RELAY_STATUS_3'] == 1) {
              //   _startCounter3();
              // } else if (data['RELAY_STATUS_4'] == 1) {
              //   _startCounter4();
              // }

              // if (data['RELAY_STATUS_1'] == 0) {
              //   _count1 = 0;
              //   _controller1.close();
              // } else if (data['RELAY_STATUS_2'] == 0) {
              //   _count2 = 0;
              //   _controller2.close();
              // } else if (data['RELAY_STATUS_3'] == 0) {
              //   _count3 = 0;
              //   _controller3.close();
              // } else if (data['RELAY_STATUS_4'] == 0) {
              //   _count4 = 0;
              //   _controller4.close();
              // }

              if (isAfterSelectedTime(_selectedTime1)) {
                if (data['RELAY_STATUS_1'] == 1) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    FirebaseDatabase.instance.ref().child('').update({
                      'RELAY_STATUS_1': 0,
                    });
                  });
                }
              } else if (isAfterSelectedTime(_selectedTime2)) {
                if (data['RELAY_STATUS_2'] == 1) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    FirebaseDatabase.instance.ref().child('').update({
                      'RELAY_STATUS_2': 0,
                    });
                  });
                }
              } else if (isAfterSelectedTime(_selectedTime3)) {
                if (data['RELAY_STATUS_3'] == 1) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    FirebaseDatabase.instance.ref().child('').update({
                      'RELAY_STATUS_3': 0,
                    });
                  });
                }
              } else if (isAfterSelectedTime(_selectedTime4)) {
                if (data['RELAY_STATUS_4'] == 1) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    FirebaseDatabase.instance.ref().child('').update({
                      'RELAY_STATUS_4': 0,
                    });
                  });
                }
              }

              return SafeArea(
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
                              color: data['RELAY_STATUS_1'] == 0
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
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
                                    value: data['RELAY_STATUS_1'] == 0
                                        ? false
                                        : true,
                                    onChanged: (value) {
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child('')
                                          .update({
                                        'RELAY_STATUS_1': value == true ? 1 : 0,
                                      });

                                      if (data['RELAY_STATUS_1'] == 0) {
                                        setState(() {
                                          _isCounting1 = true;
                                        });
                                        _startCounter1();
                                      } else {
                                        setState(() {
                                          _isCounting1 = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectTime1(context, _selectedTime1);
                                },
                                child: Container(
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
                                    trailing: TextWidget(
                                      text: _selectedTime1.format(context),
                                      fontSize: 12,
                                    ),
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
                                    title: Center(
                                  child: StreamBuilder<int>(
                                    stream: _controller1.stream,
                                    initialData: _count1,
                                    builder: (context, snapshot) {
                                      return TextWidget(
                                        text: 'Up Time: ${snapshot.data}',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      );
                                    },
                                  ),
                                )),
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
                              color: data['RELAY_STATUS_2'] == 0
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
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
                                    text: 'Load 2',
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'Bold',
                                  ),
                                  trailing: Switch(
                                    value: data['RELAY_STATUS_2'] == 0
                                        ? false
                                        : true,
                                    onChanged: (value) {
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child('')
                                          .update({
                                        'RELAY_STATUS_2': value == true ? 1 : 0,
                                      });

                                      if (data['RELAY_STATUS_2'] == 0) {
                                        setState(() {
                                          _isCounting2 = true;
                                        });
                                        _startCounter2();
                                      } else {
                                        setState(() {
                                          _isCounting2 = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectTime2(context, _selectedTime2);
                                },
                                child: Container(
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
                                    trailing: TextWidget(
                                      text: _selectedTime2.format(context),
                                      fontSize: 12,
                                    ),
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
                                    title: Center(
                                  child: StreamBuilder<int>(
                                    stream: _controller2.stream,
                                    initialData: _count2,
                                    builder: (context, snapshot) {
                                      return TextWidget(
                                        text: 'Up Time: ${snapshot.data}',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      );
                                    },
                                  ),
                                )),
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
                              color: data['RELAY_STATUS_3'] == 0
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
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
                                    value: data['RELAY_STATUS_3'] == 0
                                        ? false
                                        : true,
                                    onChanged: (value) {
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child('')
                                          .update({
                                        'RELAY_STATUS_3': value == true ? 1 : 0,
                                      });
                                      if (data['RELAY_STATUS_3'] == 0) {
                                        setState(() {
                                          _isCounting3 = true;
                                        });
                                        _startCounter3();
                                      } else {
                                        setState(() {
                                          _isCounting3 = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectTime3(context, _selectedTime3);
                                },
                                child: Container(
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
                                    trailing: TextWidget(
                                      text: _selectedTime3.format(context),
                                      fontSize: 12,
                                    ),
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
                                    title: Center(
                                  child: StreamBuilder<int>(
                                    stream: _controller3.stream,
                                    initialData: _count3,
                                    builder: (context, snapshot) {
                                      return TextWidget(
                                        text: 'Up Time: ${snapshot.data}',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      );
                                    },
                                  ),
                                )),
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
                              color: data['RELAY_STATUS_4'] == 0
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
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
                                    text: 'Load 4',
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'Bold',
                                  ),
                                  trailing: Switch(
                                    value: data['RELAY_STATUS_4'] == 0
                                        ? false
                                        : true,
                                    onChanged: (value) {
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child('')
                                          .update({
                                        'RELAY_STATUS_4': value == true ? 1 : 0,
                                      });

                                      if (data['RELAY_STATUS_4'] == 0) {
                                        setState(() {
                                          _isCounting4 = true;
                                        });
                                        _startCounter4();
                                      } else {
                                        setState(() {
                                          _isCounting4 = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectTime4(context, _selectedTime4);
                                },
                                child: Container(
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
                                    trailing: TextWidget(
                                      text: _selectedTime4.format(context),
                                      fontSize: 12,
                                    ),
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
                                    title: Center(
                                  child: StreamBuilder<int>(
                                    stream: _controller4.stream,
                                    initialData: _count4,
                                    builder: (context, snapshot) {
                                      return TextWidget(
                                        text: 'Up Time: ${snapshot.data}',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      );
                                    },
                                  ),
                                )),
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
              );
            }),
      ),
    );
  }

  TimeOfDay _selectedTime1 =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 0)));

  TimeOfDay _selectedTime2 =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 0)));
  TimeOfDay _selectedTime3 =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 0)));
  TimeOfDay _selectedTime4 =
      TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 0)));

  Future<void> _selectTime1(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        _selectedTime1 = picked;
      });
    }
  }

  Future<void> _selectTime2(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        _selectedTime2 = picked;
      });
    }
  }

  Future<void> _selectTime3(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        _selectedTime3 = picked;
      });
    }
  }

  Future<void> _selectTime4(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        _selectedTime4 = picked;
      });
    }
  }

  final now = DateTime.now();

  bool isAfterSelectedTime(TimeOfDay time) {
    final selectedDateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return now.isAfter(selectedDateTime) ||
        now.isAtSameMomentAs(selectedDateTime);
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
