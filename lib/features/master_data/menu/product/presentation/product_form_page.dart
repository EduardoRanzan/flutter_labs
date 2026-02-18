import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_snack_bar.dart';
import 'package:flutter_labs/core/widgets/app_text.dart';
import 'package:flutter_labs/features/master_data/menu/product/entity/product_dto.dart';
import 'package:flutter_labs/features/master_data/menu/product/service/product_service.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class ProductFormPage extends StatefulWidget{
  final String? productId;

  const ProductFormPage ({super.key, this.productId});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;

  late final ProductService _productService;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _productService = ProductService();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();
    if (widget.productId != null) {_loadProduct();}
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: _buildBody(),
        )
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: AppText.title(context, AppLocalizations.of(context)?.products ?? '')),
        Expanded(
          flex: 14,
          child: _buildForm()
        ),
        Expanded(
          flex: 1,
          child: Align(child: _buildFormButtons(), alignment: Alignment.bottomRight)
        ),
      ],
    );
  }

  Widget _buildForm() {
    return _isLoading ? Center(child: CircularProgressIndicator()) : Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)?.product_name ?? '',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)?.required ?? '';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)?.product_price ?? '',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)?.required ?? '';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)?.product_description ?? '',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormButtons() {
    return _isLoading ? Container() : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(AppLocalizations.of(context)?.dismiss ?? ''),
        ),
        widget.productId == null ? Container() :
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
          ),
          onPressed: _delete,
          child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onErrorContainer),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(AppLocalizations.of(context)?.save ?? ''),
        )
      ]
    );
  }

  Future<void> _loadProduct() async{
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      final ProductDto product = await _productService.findById(widget.productId!);
      _nameController.text = product.name;
      _priceController.text = product.price.toString();
      _descriptionController.text = product.description!;
    } catch (e) {
      Navigator.of(context).pop(true);
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.AppSnackBarError(context, AppLocalizations.of(context)?.generic_exception ?? '')
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  Future<void> _submit() async {
    if (_isLoading) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _isLoading = true;
    });

    ProductDto body = ProductDto(
      id: widget.productId,
      name: _nameController.text,
      price: double.parse(_priceController.text),
      description: _descriptionController.text,
    );

    try {
      if (widget.productId == null) {
        await _productService.create(body);
      } else {
        await _productService.update(widget.productId!, body);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.AppSnackBarSucess(context, AppLocalizations.of(context)?.created ?? '', showCloseIcon: true)
      );
      Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.AppSnackBarError(context, AppLocalizations.of(context)?.generic_exception ?? '', showCloseIcon: true)
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  Future<void> _delete() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      await _productService.remove(widget.productId!);
      ScaffoldMessenger.of(context).showSnackBar(
          AppSnackBar.AppSnackBarSucess(context, AppLocalizations.of(context)?.removed ?? '', showCloseIcon: true)
      );
      Navigator.of(context).pop(true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar.AppSnackBarError(context, AppLocalizations.of(context)?.generic_exception ?? '', showCloseIcon: true)
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}