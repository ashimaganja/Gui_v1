import 'dart:io';

import 'dart:convert';
import 'dart:typed_data';


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
                    child: const Text("Select"),
                    onPressed: () {
                      if (_serialPort == null){ return;}
                      else{


                      // if (_serialPort!.open(mode: SerialPortMode.readWrite)) {
                      //   debugPrint('${_serialPort!.name} opened!');
                      //   data = _serialPort!.name!;
                      //   SerialPortConfig config = _serialPort!.config;
                      //
                      //     // https://www.sigrok.org/api/libserialport/0.1.1/a00007.html#gab14927cf0efee73b59d04a572b688fa0
                      //     // https://www.sigrok.org/api/libserialport/0.1.1/a00004_source.html
                      //     config.baudRate = 115200;
                      //     config.parity = 0;
                      //     config.bits = 8;
                      //     config.cts = 0;
                      //     config.rts = 0;
                      //     config.stopBits = 1;
                      //     config.xonXoff = 0;
                      //     _serialPort!.config = config;


                  data = _serialPort!.name!;


                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Second(
                                  data: data, port: _serialPort!)),
                        );
                      }
                      // else{
                      //
                      //   debugPrint('${SerialPort.lastError} ');
                      //   debugPrint('${_serialPort!.name} can\'t be opened');
                      // }
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


/// Note : Ports setting and everything is done on the second page second page.



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

    final Port = widget.port;
    debugPrint('${Port.name} hello');
    final reader = SerialPortReader(Port);
    List<Uint8List> receiveDataList = [];
    final textInputCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(' Port: ${widget.data}'),
      ),
      body:
          Column(
            children: [

              SizedBox(
                child :
                ElevatedButton(
                  onPressed: () {
                    widget.port.close();
                    debugPrint("${widget.port.name} is closed");
                    Navigator.pop(context);
                  },
                  child: const Text('Close and Go back!'),
                ),
              ),
              Row(

                  children:
                  [

                  OutlinedButton(
                      child: Text("Open"),
                      onPressed:(){
                        /// This issue need to be fixed in different manner:
                        /// issue 1: A widget that's already open.
                        /// issue 2: The back button on the widget is causes the port to move back to the home screen without closing the ports
                        if(widget.port.isOpen){
                          widget.port.close();
                          debugPrint('${Port.name} was open and is now closed');
                        }

                        if (widget.port.open(mode: SerialPortMode.readWrite)) {
                          debugPrint('${Port.name} opened!');
                          SerialPortConfig config = widget.port.config;
                          // https://www.sigrok.org/api/libserialport/0.1.1/a00007.html#gab14927cf0efee73b59d04a572b688fa0
                          // https://www.sigrok.org/api/libserialport/0.1.1/a00004_source.html
                          config.baudRate = 115200;
                          config.parity = 0;
                          config.bits = 8;
                          config.cts = 0;
                          config.rts = 0;
                          config.stopBits = 1;
                          config.xonXoff = 0;
                          widget.port.config = config;

                          if(widget.port.isOpen){
                            debugPrint('${Port.name} is open.');
                          }
                          final reader = SerialPortReader(widget.port);
                          reader.stream.listen((data) {
                            debugPrint('received: $data');
                            receiveDataList.add(data);
                            setState(() {});
                          }, onError: (error) {
                            if (error is SerialPortError) {
                              debugPrint(
                                  'error: ${cp949.decodeString(error.message)}, code: ${error.errorCode}');
                            }
                          });
                          }
                        else{

                          /// There are some hardware issues
                          /// issue 1: semaphore timeout
                          /// issue 2: Access denied -> this can be resolved by restarting caused when we try to open already opened port.
                          debugPrint('${SerialPort.lastError} ');
                          debugPrint('${Port.name} cannot be opened');
                        }
                        setState(() {

                        });
                    })

            ],
          ),
              Expanded(
                flex: 8,
                child: Card(
                  margin: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: receiveDataList.length,
                      itemBuilder: (context, index) {
                        /*
                      OUTPUT for raw bytes
                      return Text(receiveDataList[index].toString());
                      */
                        /* output for string */
                        return Text(String.fromCharCodes(receiveDataList[index]));
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        enabled: (widget.port.isOpen)
                            ? true
                            : false,
                        controller: textInputCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextButton.icon(
                      onPressed: (widget.port.isOpen)
                          ? () {
                        if (widget.port.write(Uint8List.fromList(
                            textInputCtrl.text.codeUnits)) ==
                            textInputCtrl.text.codeUnits.length) {
                          setState(() {
                            textInputCtrl.text = '';
                          });
                        }
                      }
                          : null,
                      icon: const Icon(Icons.send),
                      label: const Text("Send"),
                    ),
                  ),
                ],
              ),

    ]
    )
    );

  }
}
