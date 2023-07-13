import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/edit_book_controller.dart';

class EditBookView extends GetView<EditBookController> {
  const EditBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Book'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: controller.fetchBook(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: snapshot.connectionState == ConnectionState.waiting ? CircularProgressIndicator() : Column(
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
                                initialValue: controller.bookDetail['isbn'],
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.integer(),
                                ]),
                                keyboardType: TextInputType.number,
                              ),
                              FormBuilderTextField(
                                name: 'title',
                                decoration: InputDecoration(labelText: 'Title'),
                                initialValue: controller.bookDetail['title'],

                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                              FormBuilderTextField(
                                name: 'subtitle',
                                initialValue: controller.bookDetail['subtitle'],

                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                decoration: InputDecoration(labelText: 'Subtitle'),

                              ),
                              FormBuilderTextField(
                                name: 'author',
                                initialValue: controller.bookDetail['author'],

                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                decoration: InputDecoration(labelText: 'Author'),

                              ),
                              FormBuilderTextField(
                                name: 'publisher',
                                initialValue: controller.bookDetail['publisher'],

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
                                initialValue: controller.bookDetail['description'],

                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),

                                decoration: InputDecoration(labelText: 'Description'),

                              ),
                              FormBuilderTextField(
                                name: 'website',
                                initialValue: controller.bookDetail['website'],

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

                              controller.editBook(
                                  form['isbn'],
                                  form['title'],
                                  form['subtitle'],
                                  form['author'],
                                  form['publisher'],
                                  form['desc'],
                                  form['website']);
                            }
                          },
                          child: Text('Save')),

                      SizedBox(height: 10,),

                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.redAccent
                        ),
                          onPressed: () {
                          controller.deleteBook();
                          },
                          child: Text('Delete Books')),

                    ],
                  ),
                ),
              ),
            );
          }
        ));
  }
}
