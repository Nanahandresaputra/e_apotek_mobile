import 'dart:io';

import 'package:e_apotek/feature/bloc/product/product_bloc.dart';
import 'package:e_apotek/screen/product/list_product.dart';
import 'package:e_apotek/widget/clip_path_bar.dart';
import 'package:e_apotek/widget/custom_elevated_btn.dart';
import 'package:e_apotek/widget/input_field.dart';
import 'package:e_apotek/widget/upload_img_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class FormProduct extends StatelessWidget {
  final bool? isEdit;
  final String? initialImg;
  final Map<String, dynamic>? initialValue;
  final int? productId;
  const FormProduct(
      {super.key,
      this.isEdit,
      this.initialImg,
      this.initialValue,
      this.productId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormList(
        isEdit: isEdit,
        initialImg: initialImg,
        initialValue: initialValue,
        productId: productId,
      ),
    );
  }
}

class FormList extends StatefulWidget {
  final bool? isEdit;
  final String? initialImg;
  final Map<String, dynamic>? initialValue;
  final int? productId;

  const FormList(
      {super.key,
      this.isEdit,
      this.initialImg,
      this.initialValue,
      this.productId});

  @override
  State<FormList> createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> initialValue = {};

  UploadImgField imgValue = const UploadImgField();

  XFile? selectedImage;
  ImagePicker imgPicker = ImagePicker();
  bool isValidateImg = false;

  Future<void> onPressed() async {
    XFile? pickedImg = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = pickedImg;
    });
  }

  @override
  void initState() {
    initialValue = {
      'code': widget.initialValue?['code'],
      'name': widget.initialValue?['name'],
      'price': widget.initialValue?['price'],
      'description': widget.initialValue?['description'],
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController kodeController =
        TextEditingController(text: initialValue['code']);
    TextEditingController namaController =
        TextEditingController(text: initialValue['name']);
    TextEditingController hargaController =
        TextEditingController(text: initialValue['price']);
    TextEditingController deskripsiController =
        TextEditingController(text: initialValue['description']);

    void addProductSubmit(context, state) async {
      if (state is ProductPostSuccess) {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ListProduct()));
      }
      if (state is ProductPostError) {
        if (state.apiExeception!.code != 400) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(state.apiExeception!.message!),
                  ));
        }
      }
    }

    return Builder(builder: (context) {
      return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            addProductSubmit(context, state);
          });
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight + 60),
                child: Stack(
                  children: <Widget>[
                    ClipPathBar(
                      title:
                          widget.isEdit == true ? 'Edit Data' : 'Tambah Data',
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListProduct()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ],
                )),
            body: ListView(
              children: <Widget>[
                Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        UploadImgField(
                          initialImg: widget.initialImg,
                          size: 100,
                          onPressed: onPressed,
                          selectedImage: selectedImage,
                          isError: isValidateImg,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InputField(
                          width: 400,
                          label: 'Kode Produk',
                          required: true,
                          controller: kodeController,
                        ),
                        InputField(
                          width: 400,
                          label: 'Nama Produk',
                          required: true,
                          controller: namaController,
                        ),
                        InputField(
                          width: 400,
                          label: 'Harga',
                          required: true,
                          controller: hargaController,
                          keyboardType: TextInputType.number,
                        ),
                        InputField(
                          width: 400,
                          label: 'Deskripsi',
                          minLines: 3,
                          required: true,
                          controller: deskripsiController,
                          keyboardType: TextInputType.text,
                        ),
                        CustomElevatedBtn(
                            label: 'Simpan',
                            isLoading: state is ProductPostLoading,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {}
                              if (selectedImage == null &&
                                  widget.initialImg == null) {
                                setState(() {
                                  isValidateImg = true;
                                });
                                return;
                              }

                              Map<String, dynamic> body = {
                                'kode_produk': kodeController.text,
                                'nama_produk': namaController.text,
                                'harga': hargaController.text,
                                'description': deskripsiController.text,
                                'thumbnail': selectedImage != null
                                    ? File(selectedImage!.path)
                                    : null
                              };

                              setState(() {
                                isValidateImg = false;
                              });

                              context.read<ProductBloc>().add(PostProductEvent(
                                    body: body,
                                    dataId: widget.productId,
                                  ));
                            })
                      ],
                    ))
              ],
            ),
          );
        },
      );
    });
  }
}
