import 'package:e_apotek/feature/bloc/auth/auth_bloc.dart';
import 'package:e_apotek/helpers/email_validator.dart';
import 'package:e_apotek/screen/auth/register.dart';
import 'package:e_apotek/screen/product/list_product.dart';
import 'package:e_apotek/widget/custom_elevated_btn.dart';
import 'package:e_apotek/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginWidget());
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

    void loginSubmit(context, state) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      int? userId = prefs.getInt('userId');

      if (userId != null) {
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ListProduct()));
      }

      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        if (state is LoginSuccess) {
          await prefs.setString('token', state.login!.token ?? '');
          await prefs.setString('email', state.login!.user!.email ?? '');
          await prefs.setString('nama', state.login!.user!.nama ?? '');
          await prefs.setInt('userId', state.login!.user!.id ?? 0);

          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ListProduct()));
        }
        if (state is LoginError) {
          if (state.apiExeception!.code != 400) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(state.apiExeception!.message!),
                    ));
          }
        }
      }
    }

    return Builder(builder: (context) {
      return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            loginSubmit(context, state);
          });
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
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              InputField(
                                width: 400,
                                label: 'Email',
                                isEmail: true,
                                required: true,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                errorValidation: state is LoginError,
                              ),
                              InputField(
                                width: 400,
                                label: 'Password',
                                required: true,
                                controller: passwordController,
                                obscureText: true,
                                errorValidation: state is LoginError,
                                errorValidationText:
                                    'Email atau Password salah!',
                              ),
                              CustomElevatedBtn(
                                  label: 'Login',
                                  isLoading: state is LoginLoading,
                                  onPressed: () async {
                                    Map<String, String> body = {
                                      'email': emailController.text,
                                      'password': passwordController.text,
                                    };

                                    if ((emailController.text.isNotEmpty ||
                                            passwordController
                                                .text.isNotEmpty) &&
                                        !EmailValidator(
                                                value: emailController.text)
                                            .isValid()) {
                                      context
                                          .read<AuthBloc>()
                                          .add(GetLoginEvent(loginBody: body));
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                    }

                                    if (formKey.currentState != null &&
                                        formKey.currentState!.validate()) {
                                      return;
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
        },
      );
    });
  }
}
