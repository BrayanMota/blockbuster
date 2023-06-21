import 'package:blockbuster_system/apps/production/pages/detail.dart';
import 'package:flutter/material.dart';

import '../../../widgets/search_field.dart';
import '../../../widgets/sliver_app_bar.dart';
import '../models.dart';
import '../service.dart';

class ProductionList extends StatefulWidget {
  const ProductionList({super.key});

  @override
  State<ProductionList> createState() => _ProductionListState();
}

class _ProductionListState extends State<ProductionList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _searchFieldController = TextEditingController();

  List<ProductionModel> _productionList = <ProductionModel>[];
  final ProductionService _service = ProductionService();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: _buildBody(context),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(leadingPop: false),
        _buildSearchField(context),
        _buildGridProductions(context),
        // _buildListProductions(context),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      sliver: SliverToBoxAdapter(
        child: CustomSearchField(
          hintText: 'Pesquisar',
          controller: _searchFieldController,
          search: (value) {
            if (_searchFieldController.text.isNotEmpty) {
              _searchProduction(_searchFieldController.text.trim());
            }
          },
        ),
      ),
    );
  }

  Widget _buildGridProductions(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return _buildProduction(_productionList[index]);
        },
        itemCount: _productionList.length,
      ),
    );
  }

  Widget _buildListProductions(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _buildProduction(_productionList[index]);
          },
          childCount: _productionList.length,
        ),
      ),
    );
  }

  Widget _buildProduction(ProductionModel production) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductionDetail(productionModel: production),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                production.poster,
                height: 200.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/production.jpg',
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                production.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Método responsável por carregar os dados da API
  void _searchProduction(String search) async {
    try {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      _productionList.clear();
      _productionList = await _service.getProductions(search);
      if (_productionList.isNotEmpty) {
        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.yellow,
            content: Text(
              'Nenhuma produção encontrada.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Ocorreu um erro ao carregar a lista de produções.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }
  }
}
