import 'package:auth_app2/providers/auth_provider.dart';
import 'package:auth_app2/screens/login_page.dart';
import 'package:auth_app2/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailContrller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  SignupPage({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Provider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 10,
            children: [
              CustomFormField(
                hint: "Name",
                icon: Icons.person,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                },
                Controller: nameController,
              ),
              CustomFormField(
                hint: "Email",
                icon: Icons.email,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                },
                Controller: emailContrller,
              ),
              CustomFormField(
                hint: "Password",
                icon: Icons.lock,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                },
                Controller: passwordController,
              ),
              CustomFormField(
                hint: "Phone",
                icon: Icons.phone,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                },
                Controller: phoneController,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    Provider.RequestSignUp(
                      name: nameController.text,
                      email: emailContrller.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                    );
                    await ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(Provider.auth!.message)),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
