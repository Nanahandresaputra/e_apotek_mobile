import 'package:e_apotek/screen/product/list_product.dart';
import 'package:e_apotek/screen/auth/register.dart';
import 'package:e_apotek/widget/custom_elevated_btn.dart';
import 'package:e_apotek/widget/input_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/img/vector-1.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/img/medic.png'),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: const Text(
                        'Login E Apotek',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF58BDBD)),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            InputField(
                              width: 400,
                              label: 'Email',
                              isEmail: true,
                              required: true,
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                            ),
                            InputField(
                              width: 400,
                              label: 'Password',
                              required: true,
                              controller: _passwordController,
                              obscureText: true,
                            ),
                            CustomElevatedBtn(
                                label: 'Login',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    debugPrint(
                                        'form data, ${_formKey.currentState!.save}');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ListProduct()));
                                  }
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'Belum punya akun?',
                                  style: TextStyle(color: Color(0xFF58BDBD)),
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        padding:
                                            const EdgeInsets.only(left: 7)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register()));
                                    },
                                    child: const Text('Daftar sekarang',
                                        style: TextStyle(
                                            color: Color(0xFF58BDBD),
                                            fontWeight: FontWeight.w800)))
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
