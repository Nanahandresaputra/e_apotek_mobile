import 'package:e_apotek/feature/bloc/auth/auth_bloc.dart';
import 'package:e_apotek/screen/auth/register.dart';
import 'package:e_apotek/widget/custom_elevated_btn.dart';
import 'package:e_apotek/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<LoginBloc, AuthState>(
        builder: (context, state) {
          return Builder(builder: (context) {
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
                                  errorValidation: state is LoginError,
                                ),
                                InputField(
                                  width: 400,
                                  label: 'Password',
                                  required: true,
                                  controller: _passwordController,
                                  obscureText: true,
                                  errorValidation: state is LoginError,
                                  errorValidationText:
                                      'email atau password salah!',
                                ),
                                CustomElevatedBtn(
                                    label: 'Login',
                                    isLoading: state is LoginLoading,
                                    onPressed: () {
                                      Map<String, String> body = {
                                        'email': _emailController.text,
                                        'password': _passwordController.text,
                                      };
                                      debugPrint('form data triggered: ');
                                      if (_formKey.currentState!.validate()) {
                                        debugPrint('validating ---');
                                        _loginBloc.add(
                                            GetLoginEvent(loginBody: body));
                                        if (state is LoginSuccess) {
                                          debugPrint('form data, $body');
                                          debugPrint(
                                              'form data response, ${state.login}');
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             const ListProduct()));
                                        } else if (state is LoginError) {
                                          debugPrint(
                                              'form datae error, ${state.apiExeception}');
                                        }
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
                                      style:
                                          TextStyle(color: Color(0xFF58BDBD)),
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
          });
        },
      ),
    );
  }
}
