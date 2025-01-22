import 'package:e_apotek/screen/product/list_product.dart';
import 'package:e_apotek/widget/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ListProduct()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: const Text('Profile',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFF58BDBD),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 350,
                  child: Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/img/vector-2.png',
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          )),
                      Align(
                        alignment: const Alignment(0, -0.85),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: const Card(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Color(0xFF58BDBD),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 33,
                                      child: Icon(
                                        Icons.person,
                                        color: Color(0xFF58BDBD),
                                        size: 34,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  SizedBox(
                                    height: 95,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Namamu',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22)),
                                        Text('Namamu@mail.com',
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: const Alignment(0, -0.2),
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        ItemListProfile(
                          icon: CupertinoIcons.exclamationmark,
                          title: 'Tentang Aplikasi',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ItemListProfile(
                          icon: Icons.exit_to_app,
                          title: 'Keluar',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Footer(),
            )
          ],
        ),
      ),
    );
  }
}

class ItemListProfile extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final IconData? icon;

  const ItemListProfile({super.key, this.title, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: const Color(0xFF58BDBD),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
          Text(
            '$title',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Icon(
            Icons.arrow_right_outlined,
            color: Color(0xFF58BDBD),
            size: 50,
          )
        ],
      ),
    );
  }
}
