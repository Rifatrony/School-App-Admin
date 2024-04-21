import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class BodingView extends StatelessWidget {
  const BodingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
      ),
    );
  }
}
