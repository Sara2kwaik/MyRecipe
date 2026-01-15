import 'dart:io';
import 'package:app_test_flutter/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:app_test_flutter/cubits/edit_profile/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  late TextEditingController avatarController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    final state = context.read<EditProfileCubit>().state as EditProfileLoaded;
    avatarController = TextEditingController(text: state.avatarUrl);
    nameController = TextEditingController(text: state.name);
    emailController = TextEditingController(text: state.email);
    bioController = TextEditingController(text: state.bio);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is EditProfileLoaded) {
          // تحديث النصوص عند تغيير البيانات
          avatarController.text = state.avatarUrl;
          nameController.text = state.name;
          emailController.text = state.email;
          bioController.text = state.bio;
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoaded) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text("Edit Profile"),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<EditProfileCubit>().updateAvatarUrl(
                        avatarController.text,
                      );
                      context.read<EditProfileCubit>().updateName(
                        nameController.text,
                      );
                      context.read<EditProfileCubit>().updateEmail(
                        emailController.text,
                      );
                      context.read<EditProfileCubit>().updateBio(
                        bioController.text,
                      );
                      context.read<EditProfileCubit>().saveProfile();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        /// Avatar
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            GestureDetector(
                              onTap: () => showImageSourceDialog(context),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: state.avatarFile != null
                                    ? FileImage(state.avatarFile!)
                                    : NetworkImage(state.avatarUrl)
                                          as ImageProvider,
                              ),
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Click to change avatar",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 20),
                        buildField(
                          label: "Avatar URL",
                          controller: avatarController,
                        ),
                        SizedBox(height: 16),
                        buildField(
                          label: "Full Name",
                          controller: nameController,
                          prefixIcon: Icons.person_outline,
                        ),
                        SizedBox(height: 16),
                        buildField(
                          label: "Email",
                          controller: emailController,
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16),
                        buildField(
                          label: "Bio",
                          controller: bioController,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is EditProfileLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(body: SizedBox());
        }
      },
    );
  }

  /// Reusable TextField
  Widget buildField({
    required String label,
    required TextEditingController controller,
    IconData? prefixIcon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          cursorColor: Colors.orange,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.orange, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 70,
    );
    if (image != null) {
      context.read<EditProfileCubit>().updateAvatarFile(File(image.path));
    }
  }

  void showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
