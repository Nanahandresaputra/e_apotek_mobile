import 'package:flutter/material.dart';

class CardMedicine extends StatelessWidget {
  final String? title;
  final String? thumbnail;
  final int? harga;
  final int? tag;
  final Function()? onTap;

  const CardMedicine(
      {super.key,
      this.tag,
      this.title,
      this.thumbnail,
      this.harga,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: '$tag',
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Image.asset(
                    'assets/img/img-placeholder.jpg',
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        '$title',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      'Rp $harga ',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
