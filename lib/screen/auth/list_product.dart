import 'package:e_apotek/widget/clip_path_bar.dart';
import 'package:e_apotek/widget/footer.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 60),
            child: ClipPathBar(
              title: 'E Apotek',
            )),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
