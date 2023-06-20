import 'package:flutter/material.dart';

import '../../../widgets/labels.dart';
import '../../../widgets/search_field.dart';
import '../../../widgets/sliver_app_bar.dart';
import '../models.dart';
import '../service.dart';

class ProductionDetail extends StatefulWidget {
  final ProductionModel productionModel;

  const ProductionDetail({
    Key? key,
    required this.productionModel,
  }) : super(key: key);

  @override
  State<ProductionDetail> createState() => _ProductionDetailState();
}

class _ProductionDetailState extends State<ProductionDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductionModel _productionModel = ProductionModel();
  final ProductionService _service = ProductionService();

  @override
  void initState() {
    _searchProduction(widget.productionModel.imdbID);
    super.initState();
  }

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
        const CustomSliverAppBar(),
        _buildListProductions(context),
      ],
    );
  }

  Widget _buildListProductions(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Image.network(
              _productionModel.poster,
              height: 200.0,
            ),
            CustomLabelDetailPages(
              title: 'Título',
              text: _productionModel.title,
            ),
            CustomLabelDetailPages(
              title: 'Data de Lançamento',
              text: _productionModel.released,
            ),
            CustomLabelDetailPages(
              title: 'Diretor',
              text: _productionModel.director,
            ),
            CustomLabelDetailPages(
              title: 'Plot do filme',
              text: _productionModel.plot,
            ),
          ],
        ),
      ),
    );
  }

  /// Método responsável por carregar os dados da API
  void _searchProduction(String imdbID) async {
    try {
      _productionModel = await _service.getProduction(imdbID);
      setState(() {});
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     backgroundColor: Colors.yellow,
      //     content: Text(
      //       'Nenhuma produção encontrada.',
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ),
      // );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Ocorreu um erro ao carregar mais informações da produção.',
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
