import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:nusantara/app/modules/auth_page/controllers/auth_page_controller.dart';

class Register extends GetView<AuthPageController> {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Create new account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        FormBuilder(
          key: controller.registerFormKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                name: 'email',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.passwordKey,
                onChanged: (value) {
                  controller.password.value = value!;
                },
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
              SizedBox(
                height: 30,
              ),
              Obx(
                () => FormBuilderTextField(
                  name: 'confirm',
                  key: controller.confirmationKey,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8),
                    FormBuilderValidators.equal(controller.password.value,
                        errorText: 'password must be the same')
                  ]),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password confirmation',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            FilledButton(
              onPressed: () {
                controller.registerFormKey.currentState!.validate();

                if (controller.registerFormKey.currentState!.isValid) {
                  controller.registerFormKey.currentState!.save();
                  final form = controller.registerFormKey.currentState!.value;

                  controller.createUser(form['name'], form['email'],
                      form['password'], form['confirm']);
                }
              },
              child: Text('Register'),
              style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account?"),
                TextButton(
                    onPressed: () {
                      controller.toggleScreen();
                    },
                    child: Text('Login')),
              ],
            )
          ],
        ),
      ],
    );
  }
}
