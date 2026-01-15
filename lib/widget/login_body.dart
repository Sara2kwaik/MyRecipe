import 'package:app_test_flutter/cubits/auth/auth_cubit.dart';
import 'package:app_test_flutter/cubits/auth/auth_states.dart';
import 'package:app_test_flutter/layout/Authication/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/components.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          elevation: 8,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Form(
              key: formKey,
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticated) {
                    Navigator.pushReplacementNamed(context, "/home");
                  }

                  if (state is AuthError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/logo3.png'),
                      ),

                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// Email
                      label("Email"),
                      defaultFormField(
                        controller: usernameController,
                        type: TextInputType.text,
                        hint: "your@email.com",
                        textStyle: const TextStyle(fontSize: 15),
                        prefix: const Icon(Icons.email, color: Colors.grey),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "You must enter your email";
                          }
                          return null;
                        },
                        bottomPadding: 15,
                      ),

                      /// Password
                      label("Password"),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        hint: "........",
                        textStyle: const TextStyle(fontSize: 15),
                        prefix: const Icon(Icons.lock, color: Colors.grey),
                        isPassword: true,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "You must enter your Password";
                          }
                          return null;
                        },
                        bottomPadding: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forget Password ?",
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xFFFFC107),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),

                      /// Login Button
                      SizedBox(
                        width: double.infinity,
                        child: state is AuthLoading
                            ? Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().login(
                                      email: usernameController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFC107),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Comic Relief2',
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: const Color(0xFFFFC107),
                                  fontFamily: 'Comic Relief',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          Text(text, style: TextStyle(fontSize: 15, color: Colors.black87)),
        ],
      ),
    );
  }
}
