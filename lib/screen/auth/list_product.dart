import 'package:e_apotek/widget/card_medicine.dart';
import 'package:e_apotek/widget/clip_path_bar.dart';
import 'package:e_apotek/widget/footer.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.58,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 2),
              itemBuilder: (context, index) {
                return CardMedicine(
                  tag: index,
                  title: 'Albendazol tablet/ tablet kunyah 400 mg',
                  harga: 30000,
                );
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