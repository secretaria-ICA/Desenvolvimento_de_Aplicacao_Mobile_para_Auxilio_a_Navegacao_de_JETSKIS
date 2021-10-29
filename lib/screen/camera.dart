import 'dart:io';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class Camera extends StatefulWidget {

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  Future<File> imageFile;
  File _image;
  String result = '';
  ImagePicker imagePicker;

  teste() {
    print('work');
  }

  Future capturePhoto() async{
    XFile pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    _image = File(pickedFile.path);
    setState(() {
      _image;
    });
    doImageClassification(_image);
  } 

  loadDataModelFiles() async{
    String output = await Tflite.loadModel(
        model: 'assets/model.tflite',
        labels: 'assets/label.txt',
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false,
    );
  print(output);
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }

  @override
  void dispose(){
    super.dispose();
    Tflite.close();
  }

  doImageClassification(File image) async {
    
    try{
      var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255,
      numResults: 2,
      threshold: 0.4,
      asynch: true,
    );
    setState(() {
      result = '';
    });
    recognitions.forEach((element) {
      setState(() {
        result += element['label'] + '\n\n';
      });
      print(result);
    });

    }catch(e){
      print(e);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Câmera'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () async => capturePhoto(),
                child: _image!=null ?
                  Image.file(
                    _image,
                    height: 400,
                    width: 400,
                  ) :
                  Container(
                    width: 400,
                    height: 400,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                    ),
                  )
              ),
              SizedBox(height: 5.0),
              Text(
                result,
                style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      color: Colors.black 
                  )

                ),
              SizedBox(height: 30.0),
            ]
          )
        )
      )
    );
  }
}