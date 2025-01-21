import 'package:e_apotek/screen/product/list_product.dart';
import 'package:e_apotek/widget/clip_path_bar.dart';
import 'package:e_apotek/widget/custom_elevated_btn.dart';
import 'package:e_apotek/widget/input_field.dart';
import 'package:e_apotek/widget/upload_img_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormProduct extends StatefulWidget {
  const FormProduct({super.key});

  @override
  State<FormProduct> createState() => _FormProductState();
}

class _FormProductState extends State<FormProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();

  final UploadImgField imgValue = const UploadImgField();

  XFile? selectedImage;
  ImagePicker imgPicker = ImagePicker();

  Future<void> onPressed() async {
    XFile? pickedImg = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = pickedImg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 60),
            child: Stack(
              children: <Widget>[
                const ClipPathBar(
                  title: 'Tambah/Edit',
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
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    UploadImgField(
                      size: 100,
                      onPressed: onPressed,
                      selectedImage: selectedImage,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputField(
                      width: 400,
                      label: 'Nama',
                      required: true,
                      controller: _namaController,
                    ),
                    InputField(
                      width: 400,
                      label: 'Nama',
                      required: true,
                      controller: _namaController,
                    ),
                    InputField(
                      width: 400,
                      label: 'Nama',
                      required: true,
                      controller: _namaController,
                    ),
                    InputField(
                      width: 400,
                      label: 'Deskripsi',
                      minLines: 3,
                      required: true,
                      controller: _namaController,
                      keyboardType: TextInputType.multiline,
                    ),
                    CustomElevatedBtn(
                        label: 'Simpan',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint(
                                'form data, ${_formKey.currentState!.save}');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListProduct()));
                          }
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
