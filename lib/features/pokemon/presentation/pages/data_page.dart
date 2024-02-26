import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/features/pokemon/presentation/widgets/data_widget.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DataWidget()
      )
    );
  }
}
