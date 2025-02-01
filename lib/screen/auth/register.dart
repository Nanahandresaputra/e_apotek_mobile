import 'package:e_apotek/feature/bloc/auth/auth_bloc.dart';
import 'package:e_apotek/screen/auth/login.dart';
import 'package:e_apotek/widget/custom_elevated_btn.dart';
import 'package:e_apotek/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController namaController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void registerSubmit(context, state) {
      if (state is RegisterSuccess) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
      if (state is RegisterError) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(state.apiExeception!.message!),
                ));
      }
    }

    return Builder(builder: (context) {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            registerSubmit(context, state);
          });
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 150,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF00B1AF),
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
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          InputField(
                            width: 400,
                            label: 'Nama',
                            required: true,
                            controller: namaController,
                          ),
                          InputField(
                            width: 400,
                            label: 'Email',
                            isEmail: true,
                            required: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                          InputField(
                            width: 400,
                            label: 'Password',
                            required: true,
                            controller: passwordController,
                            obscureText: true,
                          ),
                          CustomElevatedBtn(
                              label: 'Daftar',
                              isLoading: state is RegisterLoading,
                              onPressed: () {
                                Map<String, String> body = {
                                  "nama": namaController.text,
                                  "email": emailController.text,
                                  "password": passwordController.text,
                                };
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                      GetRegisterEvent(registerBody: body));
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
                                            builder: (context) =>
                                                const Login()));
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
          );
        },
      );
    });
  }
}
