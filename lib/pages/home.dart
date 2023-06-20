import 'package:blockbuster_system/widgets/sliver_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(leadingPop: false),
        _buildRecentReleases(context),
      ],
    );
  }

  Widget _buildRecentReleases(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) => null),
    );
  }
}
