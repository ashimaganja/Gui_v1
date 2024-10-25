import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'package:cp949/cp949.dart' as cp949;
import 'package:gui_v1/models/inputMessage.dart';

class portScreen extends StatefulWidget {


  final String data;
  final SerialPort port;

  portScreen({required this.data, required this.port});

  @override
  State<portScreen> createState() => _portScreenState();
}

class _portScreenState extends State<portScreen> {
  @override
  Widget build(BuildContext context) {
    final Port = widget.port;
    debugPrint('${Port.name}');
    final reader = SerialPortReader(Port);
    List<Uint8List> receiveDataList = [];
    final textInputCtrl = TextEditingController();
    List<String> sentMessages = [""];
    String message = "empty";
    ValueNotifier<String> messageNotifier = ValueNotifier("empty");



    return Scaffold(
      appBar: AppBar(
        title: Text('Port ${widget.data}'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input Box


            SizedBox(height: 20), // Spacing

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.port.close();
                    debugPrint("${widget.port.name} is closed");
                    //  Navigator.pop(context);
                  },
                  child: const Text('Close Port'),
                ),
                ElevatedButton(
                    child: const Text('Open Port'),
                    onPressed: (){
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
                            debugPrint('error: ${cp949.decodeString(error.message)}, code: ${error.errorCode}');
                          }
                        }
                        );
                      }else{
                        debugPrint('${SerialPort.lastError} ');
                        debugPrint('${Port.name} cannot be opened');

                      }setState(() {

                      });
                    })

              ],
            ),
            SizedBox(height: 20),

            SizedBox(

                width: double.infinity,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child:   TextField(
                      enabled: (widget.port.isOpen) ? true : false,
                      controller: textInputCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Enter your input',
                        border: OutlineInputBorder(),
                      ),
                    ),),

                    const SizedBox(width: 10),
                    // Sen d Button


                    TextButton.icon(
                        onPressed: (widget.port.isOpen) ? (){
                          debugPrint("${textInputCtrl.text} ");
                          messageNotifier.value = textInputCtrl.text;
                          if(widget.port.write(Uint8List.fromList(textInputCtrl.text.codeUnits)) == textInputCtrl.text.codeUnits.length){
                            setState((){
                              message = textInputCtrl.text;
                              sentMessages.add(textInputCtrl.text);
                              textInputCtrl.text = "";

                            });
                          }
                          // Your send button logic here
                        }:null,
                        icon: const Icon(Icons.send),
                        label: const Text("Send")

                    ),


                  ],
                )
            ),



            SizedBox(height: 10), // Spacing

            // Input Data Display Box
            SizedBox(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    width: 600,
                    height: 400,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:

                    ValueListenableBuilder(
                      valueListenable: messageNotifier,
                      builder: (context, child, value) {

                        var texting = messageNotifier.value.toString();
                        debugPrint('${sentMessages.length}');
                        return Text('${DateTime.now()} Message: $texting');
                      },
                    ),

                  ),

                  SizedBox(height: 20), // Spacing

                  // Output Data Display Box

                  Container(
                      width: 600,
                      height: 400,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(

                          itemCount: receiveDataList.length,
                          itemBuilder:  (context, index) {
                            /*
                      OUTPUT for raw bytes
                      return Text(receiveDataList[index].toString());
                      */
                            /* output for string */
                            return Text(String.fromCharCodes(receiveDataList[index]));
                          })
                    //Text('Output Data will appear here'),
                  )
                ],
              ),
            ),
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Input to the Port"),
                  Text("Output from the port")
                ],
              ),
            ),
            // Pushes the send button to the bottom







          ],
        ),
      ),
    );

  }
}
