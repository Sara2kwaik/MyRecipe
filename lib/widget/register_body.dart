import 'package:app_test_flutter/cubits/register/register_states.dart';
import 'package:app_test_flutter/layout/Authication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/components.dart';
import '../../cubits/register/register_cubit.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is RegisterSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        }
      },
      builder: (context, state) {
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/logo3.png'),
                      ),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Full Name
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Full Name",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 7),
                      defaultFormField(
                        controller: fullnameController,
                        type: TextInputType.text,
                        hint: "Sara kwaik",
                        textStyle: const TextStyle(fontSize: 15),
                        prefix: const Icon(Icons.person, color: Colors.grey),
                        validate: (value) {
                          if (value == null || value.isEmpty)
                            return "You must enter your Full Name";
                          return null;
                        },
                        bottomPadding: 15,
                      ),
                      // Email
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 7),
                      defaultFormField(
                        controller: usernameController,
                        type: TextInputType.text,
                        hint: "your@email.com",
                        textStyle: const TextStyle(fontSize: 15),
                        prefix: const Icon(Icons.email, color: Colors.grey),
                        validate: (value) {
                          if (value == null || value.isEmpty)
                            return "You must enter your email";
                          return null;
                        },
                        bottomPadding: 15,
                      ),
                      // Password
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 7),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        hint: "........",
                        textStyle: const TextStyle(fontSize: 15),
                        prefix: const Icon(Icons.lock, color: Colors.grey),
                        isPassword: true,
                        validate: (value) {
                          if (value == null || value.isEmpty)
                            return "You must enter your Password";
                          return null;
                        },
                        bottomPadding: 20,
                      ),
                      // Confirm Password
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 7),
                      defaultFormField(
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        hint: "........",
                        textStyle: const TextStyle(fontSize: 15),
                        prefix: const Icon(Icons.lock, color: Colors.grey),
                        isPassword: true,
                        validate: (value) {
                          if (value == null || value.isEmpty)
                            return "You must enter your Password";
                          return null;
                        },
                        bottomPadding: 20,
                      ),
                      const SizedBox(height: 5),
                      // Register Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<RegisterCubit>(
                                context,
                              ).registerUser(
                                fullname: fullnameController.text,
                                email: usernameController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFC107),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: state is RegisterLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Login redirect
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Comic Relief2',
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFFFC107),
                                fontFamily: 'Comic Relief',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
