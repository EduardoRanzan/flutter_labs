import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';
import 'package:flutter_labs/core/widgets/app_snack_bar.dart';
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
  final _secureStorage = SecureStorage();
  late final AuthService _authService;
  bool _isLoading = false;

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
    if (_isLoading) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isLoading = true;
    });


    try {
      AuthRequestDto body = AuthRequestDto(
        username: _loginController.text,
        password: _passwordController.text,
      );
      final response = await _authService.login(body);
      await _secureStorage.saveResponse(token: response.access_token, userName: response.name, userId: response.id);
      ScaffoldMessenger.of(context).showSnackBar(
          AppSnackBar.AppSnackBarSucess(context, AppLocalizations.of(context)?.success_login ?? '', true)
      );
      Navigator.of(context).pushReplacementNamed('/home');
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _showSnackBar(AppLocalizations.of(context)?.unauthorized_exception ?? '');
      } else {
        _showSnackBar(AppLocalizations.of(context)?.generica_exception ?? '');
      }
    }catch (e) {
      _showSnackBar(AppLocalizations.of(context)?.generica_exception ?? '');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.AppSnackBarError(context, message)
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)?.required ?? '';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)?.login ?? '',
                )
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)?.required ?? '';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)?.password ?? '',
                )
              ),
              FilledButton(
                onPressed: _isLoading ? null : _submit,
                style: ButtonStyle(
                ),
                child: _isLoading ?
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator()
                  ) :
                  Text(AppLocalizations.of(context)?.submitAuth ?? ''),
              ),
            ],
          ),
        )
      )
    );
  }
}