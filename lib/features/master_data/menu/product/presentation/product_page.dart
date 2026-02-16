import 'package:flutter/material.dart';
import 'package:flutter_labs/core/services/api/app_page_result.dart';
import 'package:flutter_labs/core/widgets/app_snack_bar.dart';
import 'package:flutter_labs/core/widgets/app_text.dart';
import 'package:flutter_labs/features/master_data/menu/product/entity/product_dto.dart';
import 'package:flutter_labs/features/master_data/menu/product/presentation/product_form_page.dart';
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
  int pageSize = 7;

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
      body: SafeArea(
        child: Padding(padding: EdgeInsetsGeometry.all(10),
            child: _buildBody()
        )
      ),
    );
  }
  
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _buildHeader()
        ),
        Expanded(
          flex: 9,
          child: _buildProduct(),
        ),
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

        final products = snapshot.data!.data;

        final total = snapshot.data!.total ?? 0;
        final maxPage = (total / pageSize);

        return Column(
            children: [
              Expanded(
                flex: 9,
                child: _buildProductList(products)
              ),
              Expanded(
                flex: 1,
                child: _buildBottomButtons(maxPage)
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
              subtitle: Row(
                spacing: 5,
                children: [
                  Badge(
                    label: Text('R\$ ${p.price.toString()}'),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  AppText.body(context, p.description.toString()),
                ],
              ),
              enabled: p.status!,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProductFormPage(productId: p.id))
                );
              },
            )
        );
      }
    );
  }

  Widget _buildBottomButtons(double maxPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        actualPage != 1 ? FilledButton(
          onPressed: () {
            _previousPage();
          },
          child: Icon(Icons.navigate_before)
        ) : Container(),
        actualPage < maxPage ? FilledButton(
          onPressed: () {
            _nextPage();
          },
          child: Icon(Icons.navigate_next)
        ) : Container(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      spacing: 10,
      children: [
        AppText.title(context, AppLocalizations.of(context)?.products ?? ''),
        FilledButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductFormPage())
            );
          },
          child: Icon(Icons.add))
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
    _product = _productService.findAll(page: actualPage, pageSize: pageSize);
  }
}
