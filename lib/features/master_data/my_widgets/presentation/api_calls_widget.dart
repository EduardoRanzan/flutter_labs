import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/features/auth/entity/auth_request_dto.dart';

class ApiCallsWidget extends StatefulWidget{
  const ApiCallsWidget({super.key});

  @override
  State<ApiCallsWidget> createState() => _ApiCallsWidgetState();
}

class _ApiCallsWidgetState extends State<ApiCallsWidget> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> _auth() async {
    final body = AuthRequestDto(
      username: '1',
      password: '1',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsGeometry.all(15),
        child: _buildBody(),
      )
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text('Auth:'),
              ElevatedButton(
                  onPressed: _auth,
                  child: Text('Auth')
              )
            ],
          )
        )
      )
    );
  }
}