import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_bar_widget.dart';
import 'package:flutter_labs/main.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FacialCameraPage extends StatefulWidget {
  const FacialCameraPage({super.key});

  @override
  State<FacialCameraPage> createState() => _FacialCameraPageState();
}

class _FacialCameraPageState extends State<FacialCameraPage> {
  late CameraController _controller;
  late FaceDetector _faceDetector;
  bool _isProcessing = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.fast,
        enableLandmarks: false,
        enableContours: false,
        enableClassification: true,
      ),
    );

    _initCamera();
  }

  Future<void> _initCamera() async {
    final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await _controller.initialize();
    await _controller.startImageStream(_processCameraImage);

    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _faceDetector.close();
    super.dispose();
  }

  Future<void> _takePicture() async {
    await _controller.stopImageStream();
    final XFile file = await _controller.takePicture();
    Navigator.pop(context, file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isInitialized
          ? Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Stack(
            children: [
              CameraPreview(_controller),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FloatingActionButton(
                    onPressed: _takePicture,
                    child: const Icon(Icons.camera_alt),
                  ),
                ),
              ),
            ],
          )
        )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if (_isProcessing) return;
    _isProcessing = true;

    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }

    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
    Size(image.width.toDouble(), image.height.toDouble());

    final camera = _controller.description;

    final imageRotation =
        InputImageRotationValue.fromRawValue(
          camera.sensorOrientation,
        ) ??
            InputImageRotation.rotation0deg;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw) ??
            InputImageFormat.nv21;

    final plane = image.planes.first;

    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: imageSize,
        rotation: imageRotation,
        format: inputImageFormat,
        bytesPerRow: plane.bytesPerRow,
      ),
    );

    final faces = await _faceDetector.processImage(inputImage);

    _handleFaces(faces);

    _isProcessing = false;
  }


  bool _faceOk = false;

  void _handleFaces(List<Face> faces) {
    if (faces.length == 1) {
      final face = faces.first;

      final leftEyeOpen = face.leftEyeOpenProbability ?? 0;
      final rightEyeOpen = face.rightEyeOpenProbability ?? 0;

      if (leftEyeOpen > 0.5 && rightEyeOpen > 0.5) {
        setState(() {
          _faceOk = true;
        });
        return;
      }
    }

    setState(() {
      _faceOk = false;
    });
  }
}
