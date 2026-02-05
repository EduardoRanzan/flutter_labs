import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/features/auth/entity/auth_request_dto.dart';
import 'package:flutter_labs/features/auth/services/auth_service.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class AuthPage extends StatefulWidget{
  const AuthPage ({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async{
    try {
      AuthRequestDto body = AuthRequestDto(
        username: _loginController.text,
        password: _passwordController.text,
      );

      await _authService.login(body);
      Navigator.of(context).pushNamed('/home');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _showSnackBar(AppLocalizations.of(context)?.unauthorized_exception ?? '');
      } else {
        _showSnackBar(AppLocalizations.of(context)?.generica_exception ?? '');
      }
    }catch (e) {
      _showSnackBar(AppLocalizations.of(context)?.generica_exception ?? '');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Theme.of(context).colorScheme.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsetsGeometry.directional(
          start: 20,
          end: 20,
          top: 100,
          bottom: 100),
        child: Card(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _buildCardContext()
          ),
        )
      ),
    );
  }

  Widget _buildCardContext() {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              TextFormField(
                controller: _loginController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)?.login ?? '',
                )
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)?.password ?? '',
                )
              ),
              FilledButton(
                onPressed: _submit,
                child: Text(AppLocalizations.of(context)?.submitAuth ?? ''),
                style: ButtonStyle(
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}