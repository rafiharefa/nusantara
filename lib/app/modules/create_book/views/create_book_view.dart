import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/create_book_controller.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreateBookView extends GetView<CreateBookController> {
  const CreateBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    CreateBookController controller = Get.put(CreateBookController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Book'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Fill up the fields',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  FormBuilder(
                    key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'isbn',
                            decoration: InputDecoration(labelText: 'ISBN'),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.integer(),
                            ]),
                            keyboardType: TextInputType.number,
                          ),
                          FormBuilderTextField(
                            name: 'title',
                            decoration: InputDecoration(labelText: 'Title'),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'subtitle',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            decoration: InputDecoration(labelText: 'Subtitle'),

                          ),
                          FormBuilderTextField(
                            name: 'author',

                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            decoration: InputDecoration(labelText: 'Author'),

                          ),
                          FormBuilderTextField(
                            name: 'publisher',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),

                            decoration: InputDecoration(labelText: 'Publisher'),

                          ),
                          FormBuilderTextField(
                            name: 'pages',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.integer()
                            ]),

                            decoration: InputDecoration(labelText: 'Pages'),

                          ),
                          FormBuilderTextField(
                            name: 'desc',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),

                            decoration: InputDecoration(labelText: 'Description'),

                          ),
                          FormBuilderTextField(
                            name: 'website',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),

                            decoration: InputDecoration(labelText: 'Website'),

                          ),
                        ],
                      )),

                  SizedBox(height: 10,),
                  FilledButton(
                      onPressed: () {
                        _formKey.currentState!.validate();

                        if (_formKey.currentState!.isValid) {
                          _formKey.currentState!.save();
                          final form = _formKey.currentState!.value;

                          controller.createBook(
                              form['isbn'],
                              form['title'],
                              form['subtitle'],
                              form['author'],
                              form['publisher'],
                              form['desc'],
                              form['website']);
                        }
                      },
                      child: Text('Add Book')),
                ],
              ),
            ),
          ),
        ));
  }
}
