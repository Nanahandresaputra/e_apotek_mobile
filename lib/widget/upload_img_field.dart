import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImgField extends StatefulWidget {
  final double? size;
  final bool? isError;
  const UploadImgField({super.key, this.size, this.isError});

  @override
  State<UploadImgField> createState() => _UploadImgFieldState();
}

class _UploadImgFieldState extends State<UploadImgField> {
  ImagePicker imgPicker = ImagePicker();
  XFile? selectedImage;
  Future<void> _onPressed() async {
    final XFile? pickedImg =
        await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = pickedImg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: widget.size,
            height: widget.size,
            child: DottedBorder(
                color: const Color(0xFF58BDBD),
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                dashPattern: const [8, 4],
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: selectedImage != null
                            ? Image.file(
                                File(selectedImage!.path),
                                height: widget.size,
                                width: widget.size,
                                fit: BoxFit.cover,
                              )
                            : const Center(
                                child: Icon(Icons.camera_alt,
                                    size: 30, color: Color(0xFF58BDBD)))),
                    selectedImage != null
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black38),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Color.fromARGB(220, 255, 255, 255),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                )),
          ),
          const Text(
            'Upload Gambar',
            style: TextStyle(color: Color(0xFF58BDBD)),
          )
        ],
      ),
    );
  }
}
