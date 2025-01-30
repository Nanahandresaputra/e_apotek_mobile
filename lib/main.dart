import 'package:e_apotek/feature/bloc/auth/auth_bloc.dart';
import 'package:e_apotek/feature/bloc/product/product_bloc.dart';
import 'package:e_apotek/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
  ], child: const Login()));
}
