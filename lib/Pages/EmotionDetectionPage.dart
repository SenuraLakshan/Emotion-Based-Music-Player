import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

import '../main.dart';

class EmotionDetection extends StatefulWidget {
  const EmotionDetection({Key? key}) : super(key: key);

  @override
  State<EmotionDetection> createState() => _EmotionDetectionState();
}

class _EmotionDetectionState extends State<EmotionDetection> {

  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  @override
  void initState(){
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera(){
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value){
      if(!mounted){
        return;
      }
      else{
        setState(() {
          cameraController!.startImageStream((imageStream){
            cameraImage = imageStream;
            runModel();
          });
        });
      }

    });

  }

  runModel() async{
    if(cameraImage!=null){
      var predictions = await Tflite.runModelOnFrame(bytesList: cameraImage!.planes.map((plane){
        return plane.bytes;
      }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);

      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadModel()async{
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt" );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF303151).withOpacity(0.4),
              const Color(0xFF303151).withOpacity(0.9)
            ],
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.account_box),
          actions: [
            Container(
              margin: const EdgeInsets.only(top:15, right: 20),
              child: const CircleAvatar(
                backgroundImage:NetworkImage(
                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fcolombo&psig=AOvVaw1STvug0X7w3V7JgSZkvD9X&ust=1666068041681000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJC4x5-55voCFQAAAAAdAAAAABAJ'
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left:20, top: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:20, top: 20, right: 20),
                      child: Text("Emotion Detection",style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.all(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width,
                          child: !cameraController!.value.isInitialized?
                          Container():
                          AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
                              child: CameraPreview(cameraController!),
                            ),
                        ),
                    ),

                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}

