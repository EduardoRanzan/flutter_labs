import 'package:flutter/material.dart';
import 'package:flutter_labs/core/services/api/app_page_result.dart';
import 'package:flutter_labs/core/widgets/app_snack_bar.dart';
import 'package:flutter_labs/core/widgets/app_text.dart';
import 'package:flutter_labs/features/master_data/menu/product/entity/product_dto.dart';
import 'package:flutter_labs/features/master_data/menu/product/service/product_service.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  late final ProductService _productService;
  Future<AppPageResult<ProductDto>>? _product;

  int actualPage = 1;
  int pageSize = 5;

  @override
  void initState() {
    super.initState();
    _productService = ProductService();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }
  
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: _buildProduct(),
        ),
        Expanded(
          flex: 1,
          child: _buildBottomButtons(),
        )
      ],
    );
  }

  Widget _buildProduct() {
    return FutureBuilder<AppPageResult<ProductDto>>(
      future: _product,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
          return AppText.title(context, AppLocalizations
              .of(context)
              ?.products_not_found ?? '');
        }

        if (!snapshot.hasError) {
          AppSnackBar.AppSnackBarError(context, snapshot.error.toString());
        }

        final products = snapshot.data!.data;

        return Column(
            children: [
              Expanded(
                  child: _buildProductList(products)
              )
            ]
        );
      }
    );
  }

  Widget _buildProductList(List<ProductDto> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final p = products[index];
        return Card(
            child: ListTile(
              title: AppText.title(context, p.name),
              subtitle: AppText.body(context, p.price.toString()),
            )
        );
      }
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilledButton(
          onPressed: () {
            _previousPage();
          },
          child: Icon(Icons.navigate_before)
        ),
        FilledButton(
          onPressed: () {
            _nextPage();
          },
          child: Icon(Icons.navigate_next)
        ),
      ],
    );
  }

  void _previousPage() {
    if (actualPage == 1) return;

    setState(() {
      actualPage--;
      loadingProduct();
    });
  }

  void _nextPage() {
    setState(() {
      actualPage++;
      loadingProduct();
    });
  }

  void _init() {
    loadingProduct();
  }

  void loadingProduct(){
    setState(() {
      _product = _productService.findAll(page: actualPage, pageSize: pageSize);
    });
  }
}
