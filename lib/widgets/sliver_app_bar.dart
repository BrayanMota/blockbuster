import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final bool pinned;
  final bool floating;
  final bool leadingPop;
  final String textTopSliver;
  final double fontSizeTextTopSliver;
  final Color colorTextTopSliver;
  final Color colorSliver;

  const CustomSliverAppBar({
    Key? key = const Key(''),
    this.pinned = false,
    this.floating = false,
    this.leadingPop = true,
    this.textTopSliver = 'Blockbuster LCC',
    this.fontSizeTextTopSliver = 20,
    this.colorTextTopSliver = Colors.black,
    this.colorSliver = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 0),
      sliver: SliverAppBar(
        pinned: pinned,
        floating: floating,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: leadingPop
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : Image.asset(
                  'assets/blockbuster_logo.png',
                ),
        ),
        backgroundColor: colorSliver,
        title: Text(
          textTopSliver,
          style: TextStyle(
            color: colorTextTopSliver,
            fontSize: fontSizeTextTopSliver,
          ),
        ),
      ),
    );
  }
}
