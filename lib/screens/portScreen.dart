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

    List<InputMessages> inputMessages = [];
    Future<void> reconnectPort() async {
      try {
        await widget.port.close();  // Ensure the port is closed
        await widget.port.open(mode: 0);   // Attempt to reopen the port
        debugPrint("Port reopened successfully.");
      } catch (e) {
        debugPrint("Failed to reconnect the port: $e");
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Port ${widget.data}'),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
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
                      Expanded(
                        child:
                        TextField(
                            maxLines: null,

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
              onPressed: (widget.port.isOpen) ? () async {
                try {
                  debugPrint("${textInputCtrl.text}");
                  messageNotifier.value = textInputCtrl.text;

                  // Check if the port is open before writing
                  if (widget.port.isOpen) {
                    int bytesWritten = await widget.port.write(Uint8List.fromList(textInputCtrl.text.codeUnits));

                    // Verify if all bytes were written
                    if (bytesWritten == textInputCtrl.text.codeUnits.length) {
                      inputMessages.add(InputMessages(message: textInputCtrl.text, time: DateTime.now()));
                      setState(() {
                        message = textInputCtrl.text;
                        sentMessages.add(textInputCtrl.text);
                        textInputCtrl.clear(); // Clear the text area

                        inputMessages.add(InputMessages(message: message, time: DateTime.now()));
                        debugPrint(" cat ${inputMessages[0].message}");
                      });
                    } else {
                      debugPrint("Failed to send complete message. Attempting to reopen port.");
                      await reconnectPort();
                    }
                  } else {
                    debugPrint("Port is closed. Attempting to reopen port.");
                    await reconnectPort();
                  }
                } catch (e) {
                  debugPrint("Error: $e. Attempting to reconnect.");
                  await reconnectPort();
                }
              } : null,
              icon: Icon(Icons.send),
              label: Text("Send"),

            ),

// Function to reconnect the port
   



        ],
                  )
              ),

              SizedBox(height: 10), // Spacing

              // Input Data Display Box
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Input Data Display Box
                Expanded(
                  child: Container(
                    height: 400,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: inputMessages.isNotEmpty
                        ? ListView.builder(
                      itemCount: inputMessages.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                          child: Text(inputMessages[index].message),
                        );
                      },
                    )
                        : Center(child: Text("No input messages")), // Placeholder if empty
                  ),
                ),

                SizedBox(width: 20), // Horizontal spacing in Row

                // Output Data Display Box
                Expanded(
                  child: Container(
                    height: 400,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: receiveDataList.isNotEmpty
                        ? ListView.builder(
                      itemCount: receiveDataList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Text(String.fromCharCodes(receiveDataList[index]));
                      },
                    )
                        : Center(child: Text("No data recieved from port")), // Placeholder if empty
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Input to the Port", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Output from the port", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              // Pushes the send button to the bottom


              //// this is test part




            ],
          ),
        ),
      )
    );
  }
}
