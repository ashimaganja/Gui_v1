import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:cp949/cp949.dart' as cp949;
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Windows Serial Port Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const MyHomePage(title: 'Flutter Windows Serial Port Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SerialPort> portList = [];
  SerialPort? _serialPort;
  String data = "";

  @override
  void initState() {
    super.initState();
    requestManageExternalStoragePermission();
  }

  Future<void> requestManageExternalStoragePermission() async {
    if (Platform.isAndroid && await Permission.manageExternalStorage.isDenied) {
      // Android 11+ specific storage permission handling
      await Permission.manageExternalStorage.request();
      if (await Permission.manageExternalStorage.isGranted) {
        test();
      } else {
        debugPrint('Permission denied');
        openAppSettings(); // Prompt user to settings if permission is denied
      }
    } else {
      // Handling for other platforms or Android versions below 11
      if (await Permission.storage.isGranted) {
        test();
      }
    }
  }

  void test() {
    // Populate the port list
    for (final name in SerialPort.availablePorts) {
      final sp = SerialPort(name);
      portList.add(sp);
    }
    if (portList.isNotEmpty) {
      setState(() {
        _serialPort = portList.first;
      });
    }

  }

  void changedDropDownItem(SerialPort sp) {
    setState(() {
      _serialPort = sp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<SerialPort>(
                    value: _serialPort,
                    items: portList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                            "${item.name}: ${cp949.decodeString(item.description ?? '')}"),
                      );
                    }).toList(),
                    onChanged: (e) {
                      if (e != null) {
                        setState(() {
                          changedDropDownItem(e);
                          debugPrint(e.name);
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 50.0),
                  OutlinedButton(
                    child: const Text("Open"),
                    onPressed: () {
                      if (_serialPort == null) return;

                      if (_serialPort!.open(mode: SerialPortMode.readWrite)) {
                        debugPrint('${_serialPort!.name} opened!');
                        data = _serialPort!.name!;
                        SerialPortConfig config = _serialPort!.config;


                        config.baudRate = 9600;  // Set the appropriate baud rate
                        config.parity = SerialPortParity.none;
                        config.bits = 8;
                        // config.cts = 16;
                        // config.rts = 14;
                        config.stopBits = 1;
                        config.flowControl = SerialPortFlowControl.rtsCts;


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Second(
                                  data: data, port: _serialPort!)),
                        );
                      }else{

                        debugPrint('${SerialPort.lastError} ');
                        debugPrint('${_serialPort!.name} can\'t be opened');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on SerialPortConfig {
  set flowControl(int flowControl) {}
}

class Second extends StatefulWidget {
  final String data;
  final SerialPort port;

  Second({required this.data, required this.port});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Port: ${widget.data}'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            widget.port.close();
            debugPrint("${widget.port.name} is closed");
            Navigator.pop(context);
          },
          child: const Text('Close and Go back!'),
        ),
      ),
    );
  }
}
