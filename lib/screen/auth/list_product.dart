import 'package:e_apotek/widget/card_medicine.dart';
import 'package:e_apotek/widget/clip_path_bar.dart';
import 'package:e_apotek/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 60),
            child: ClipPathBar(
              title: 'E Apotek',
            )),
        bottomNavigationBar: const Footer(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return const CardMedicine();
              }),
        ),
      ),
    );
  }
}


// Image.asset(
//             'assets/img/loading-medicine.gif',
//             width: 50,
//             height: 50,
//           )