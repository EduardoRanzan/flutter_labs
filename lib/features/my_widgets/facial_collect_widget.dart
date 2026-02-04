import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_bar_widget.dart';
import 'package:flutter_labs/features/my_widgets/facial_camera_page.dart';

class FacialCollectWidget extends StatefulWidget {
  const FacialCollectWidget({super.key});

  @override
  State<FacialCollectWidget> createState() => _FacialCollectWidgetState();
}

class _FacialCollectWidgetState extends State<FacialCollectWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Coleta Facial'),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10), 
        child: _buildBody(),)
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 20),
                  child: Text('Coleta Facial:')
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.camera),
                onPressed: _openCamera,
                label: Text('Coleta facial'),
              )
            ],
          )
        )
      )
    );
  }

  Future<void> _openCamera() async{
    try {
      final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const FacialCameraPage()
          )
      );
      if (result != null) {
        print(result);
      }

    } catch (e) {
      throw Exception('Failed to pick image: $e');
    }
  }
}