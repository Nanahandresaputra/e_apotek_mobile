import 'package:e_apotek/screen/auth/login.dart';
import 'package:e_apotek/widget/custom_elevated_btn.dart';
import 'package:e_apotek/widget/input_field.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF00B1AF),
              // borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(25),
              //     bottomRight: Radius.circular(25))
            ),
            child: Center(
              child: Image.asset(
                'assets/img/logo.png',
                height: 120,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: ListView(
            children: <Widget>[
              const Text(
                'Registrasi akun',
                style: TextStyle(
                    color: Color(0xFF58BDBD),
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      InputField(
                        width: 400,
                        label: 'Nama',
                        required: true,
                        controller: _emailController,
                      ),
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
                          label: 'Daftar',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint(
                                  'form data, ${_formKey.currentState!.save}');
                            }
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Sudah punya akun?',
                            style: TextStyle(color: Color(0xFF58BDBD)),
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 7)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: const Text('Login disini',
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
      ),
    );
  }
}
