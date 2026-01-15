import 'package:app_test_flutter/cubits/Profile/profile_cubit.dart';
import 'package:app_test_flutter/widget/ProfileBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..loadProfile(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: profileAppBar(context),
        body: ProfileBody(),
      ),
    );
  }

  PreferredSizeWidget profileAppBar(BuildContext context) {
    return AppBar(
      elevation: .6,
      toolbarHeight: 70,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Center(child: Text("Profile")),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {},
          color: Colors.orange,
        ),
      ],
    );
  }
}
