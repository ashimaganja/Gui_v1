import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:cp949/cp949.dart' as cp949;
import 'package:permission_handler/permission_handler.dart';


import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

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

class Second extends StatefulWidget {
  final String data;
  final SerialPort port;
  Second({required this.data, required this.port});
  @override
  State<Second> createState() => _SecondState();
}

class _MyHomePageState extends State<MyHomePage> {


  // Future<void> requestPermissions() async {
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  //
  //   var usbPermission = await Permission.manageExternalStorage.status;
  //   if (!usbPermission.isGranted) {
  //     await Permission.manageExternalStorage.request();
  //   }
  // }

  Future<void>  requestManageExternalStoragePermission2() async {
    if (Platform.isAndroid) {
      // Check if the permission is already granted
      if (await Permission.manageExternalStorage.isGranted) {
        print("Permission already granted");
        test();
      } else {
        // If permission is denied, direct the user to settings
        if (await Permission.manageExternalStorage.isDenied) {
          print("Permission denied, requesting permission via intent.");
          try {
            const platform = MethodChannel('com.example.myapp/storage');
            // Open the manage external storage settings on Android 11+
            await platform.invokeMethod('requestManageExternalStorage');
          } on PlatformException catch (e) {
            print('Error while opening storage settings: $e');
          }
        }
      }
    }
  }

  Future<void>  requestManageExternalStoragePermission1() async {
    if (Platform.isAndroid && await Permission.manageExternalStorage.isDenied) {
      try {
        // Open settings for Manage External Storage on Android 11+
        await Permission.manageExternalStorage.request();
        if (await Permission.manageExternalStorage.isGranted) {
          print("Permission granted");
          test();
        } else {
          // Direct the user to settings
          print("Permission denied, opening app settings");
          openAppSettings();
        }
      } on PlatformException catch (e) {
        print('Error while requesting permission: $e');
      }
    } else {
      // For devices lower than Android 11 or other platforms
      if (await Permission.storage.isGranted) {
        print("Permission granted");
        test();
      } else {
        print("Permission denied");
      }
    }
  }

  Future<void> requestManageExternalStoragePermission() async {
    print("requestManageExternalStoragePermission");
    if (await Permission.storage.request().isGranted &&
        await Permission.manageExternalStorage.request().isGranted) {
      // Permission granted, proceed with your logic
      print("Permission granted");
      test();
    } else {
      // Handle permission denial
      print("Permission denied");
    }
  }

  List<SerialPort> portList = [];
  SerialPort? _serialPort;
  List<Uint8List> receiveDataList = [];
  final textInputCtrl = TextEditingController();
  String data = "";

  @override
  void initState() {
    super.initState();
    print("initState");

    requestManageExternalStoragePermission1();

    // for (final name in SerialPort.availablePorts) {
    //   final sp = SerialPort(name);
    //
    //   portList.add(sp);
    // }
    // if (portList.isNotEmpty) {
    //   _serialPort = portList.first;
    // }
  }

  void test(){
    for (final name in SerialPort.availablePorts) {
      final sp = SerialPort(name);

      portList.add(sp);
    }
    if (portList.isNotEmpty) {
      _serialPort = portList.first;
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
                    DropdownButton(
                      value: _serialPort,
                      items: portList.map((item) {
                        return DropdownMenuItem(
                            child: Text(
                                "${item.name}: ${cp949.decodeString(item.description ?? '')}"),
                            value: item);
                      }).toList(),
                      onChanged: (e) {
                        setState(() {
                          changedDropDownItem(e as SerialPort);
                          debugPrint(e.name);
                        });
                      },
                    ),
                    const SizedBox(
                      width: 50.0,
                    ),
                    OutlinedButton(
                      child: const Text("Select"),
                      onPressed: () {
                        if (_serialPort == null) {
                          return;
                        } else {
                          debugPrint(
                              "${_serialPort!.open(mode: SerialPortMode.readWrite)}");

                          if (_serialPort!.isOpen) {
                            debugPrint('${_serialPort!.name} opened!');
                            data = _serialPort!.name!;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Second(data: data, port: _serialPort!)),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
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