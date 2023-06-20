import 'package:flutter/material.dart';

/// Classe responsável por gerar um [TextField] para um campo de pesquisa.
///
/// [hintText] - Texto de dica do campo de texto.
///
/// [controller] - Controlador do campo de texto.
///
/// [search] - Função que será executada quando o usuário clicar no botão de
/// pesquisa.
class CustomSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? search;

  const CustomSearchField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.all(10),
      ),
      onSubmitted: search,
    );
  }
}
