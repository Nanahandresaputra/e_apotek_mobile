import 'package:e_apotek/feature/bloc/product/product_bloc.dart';
import 'package:e_apotek/screen/product/detail_product.dart';
import 'package:e_apotek/widget/card_medicine.dart';
import 'package:e_apotek/widget/clip_path_bar.dart';
import 'package:e_apotek/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight + 60),
                child: ClipPathBar(
                  title: 'E Apotek',
                )),
            bottomNavigationBar: const Footer(),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
              child: state is ProductLoading
                  ? Center(
                      child: Image.asset(
                        'assets/img/loading-medicine.gif',
                        width: 50,
                        height: 50,
                      ),
                    )
                  : state is ProductSuccess
                      ? GridView.builder(
                          itemCount: state.product!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.58,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 2),
                          itemBuilder: (context, index) {
                            return CardMedicine(
                              tag: index,
                              title: state.product?[index].namaProduk,
                              harga: state.product?[index].harga,
                              thumbnail: state.product?[index].thumbnailUrl,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailProduct(
                                              tag: index,
                                              productId:
                                                  state.product?[index].id,
                                              title: state
                                                  .product?[index].namaProduk,
                                              harga:
                                                  state.product?[index].harga,
                                              thumbnail: state
                                                  .product?[index].thumbnailUrl,
                                              description: state
                                                  .product?[index].description,
                                              codeProduct: state
                                                  .product?[index].kodeProduk,
                                            )));
                              },
                            );
                          })
                      : const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
