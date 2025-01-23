import 'package:e_apotek/feature/bloc/auth/auth_bloc.dart';
import 'package:e_apotek/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginBloc())],
      child: Login()));
}
