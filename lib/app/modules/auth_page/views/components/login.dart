import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:nusantara/app/modules/auth_page/controllers/auth_page_controller.dart';

class Login extends GetView<AuthPageController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Enter your email and password',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        FormBuilder(
          key: controller.loginFormKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'email',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                name: 'password',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(8),
                ]),
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ],
          ),
        ),
        Column(
          children: [
            FilledButton(
              onPressed: () {
                controller.loginFormKey.currentState!.validate();

                if (controller.loginFormKey.currentState!.isValid) {
                  controller.loginFormKey.currentState!.save();
                  final form = controller.loginFormKey.currentState!.value;

                  controller.login(form['email'], form['password']);
                }
              },
              child: Text('Login'),
              style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      controller.toggleScreen();
                    },
                    child: Text('Register')),
              ],
            )
          ],
        ),
      ],
    );
  }
}
