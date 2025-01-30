import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImgField extends StatefulWidget {
  final double? size;
  final bool? isError;
  final Function()? onPressed;
  final XFile? selectedImage;
  final String? initialImg;
  const UploadImgField({
    super.key,
    this.size,
    this.isError,
    this.onPressed,
    this.selectedImage,
    this.initialImg,
  });

  @override
  State<UploadImgField> createState() => _UploadImgFieldState();
}

class _UploadImgFieldState extends State<UploadImgField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: widget.size,
            height: widget.size,
            child: DottedBorder(
                color: widget.isError == true
                    ? Colors.red
                    : const Color(0xFF58BDBD),
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                dashPattern: const [8, 4],
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: widget.initialImg != null &&
                                widget.selectedImage == null
                            ? Image.network(
                                '${widget.initialImg}',
                                height: widget.size,
                                width: widget.size,
                                fit: BoxFit.cover,
                              )
                            : widget.selectedImage != null
                                ? Image.file(
                                    File(widget.selectedImage!.path),
                                    height: widget.size,
                                    width: widget.size,
                                    fit: BoxFit.cover,
                                  )
                                : const Center(
                                    child: Icon(Icons.camera_alt,
                                        size: 30, color: Color(0xFF58BDBD)))),
                    widget.selectedImage != null || widget.initialImg != null
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
          Text(
            widget.isError == true
                ? 'Masukan Gambar Produk'
                : 'Upload Gambar Produk',
            style: TextStyle(
                color: widget.isError == true
                    ? Colors.red
                    : const Color(0xFF58BDBD)),
          )
        ],
      ),
    );
  }
}
