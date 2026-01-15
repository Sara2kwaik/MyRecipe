import 'package:app_test_flutter/cubits/register/register_cubit.dart';
import 'package:app_test_flutter/widget/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: Scaffold(backgroundColor: Colors.white, body: RegisterBody()),
    );
  }
}
