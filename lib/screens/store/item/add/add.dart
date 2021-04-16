import 'package:flutter/material.dart';
import 'package:platform_business/models/store.dart';
import 'package:platform_business/screens/store/item/add/local_widgets/accessibility_bar.dart';
import 'package:platform_business/screens/store/item/add/local_widgets/add_photo.dart';

List<CategoryModel> categories = Categories.data;
List<String> photos = [];

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isAvailable = false;
  int categorySelected = 0;

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    final bool isValid = _formKey.currentState.validate();
    if (isValid) {
      print('Got a valid input');
      // And do something here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ańade producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.trim().length < 3) {
                          return 'This field requires a minimum of 3 characters';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Titulo',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.trim().length < 3) {
                          return 'This field requires a minimum of 3 characters';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Detalle',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.trim().length < 3) {
                          return 'This field requires a minimum of 3 characters';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Precio',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Ańadir imagenes"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 120,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: photos.length == 0 ? 1 : photos.length,
                        itemBuilder: (context, index) {
                          return photos.length == 0
                              ? addPhotoWidget(context)
                              : photoWidget(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text("Categoria:"),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton(
                            hint: new Text('Categorias'),
                            value: categorySelected,
                            items: <DropdownMenuItem>[
                              new DropdownMenuItem(
                                child: new Text(categories[0].title),
                                value: 0,
                              ),
                              new DropdownMenuItem(
                                child: new Text(categories[2].title),
                                value: 1,
                              ),
                              new DropdownMenuItem(
                                child: new Text(categories[3].title),
                                value: 2,
                              ),
                              new DropdownMenuItem(
                                child: new Text(categories[4].title),
                                value: 3,
                              ),
                              new DropdownMenuItem(
                                child: new Text(categories[5].title),
                                value: 4,
                              ),
                            ],
                            onChanged: (value) => setState(() {
                                  categorySelected = value;
                                })),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Switch(
                            value: isAvailable,
                            onChanged: (value) {
                              setState(() {
                                isAvailable = value;
                              });
                            }),
                        Text("Esta disponible")
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                        onPressed: _saveForm,
                        icon: Icon(Icons.save),
                        label: Text('Guardar'))
                  ],
                ),
              ),
            ),
            accessibilityBarWidget(context)
          ],
        ),
      ),
    );
  }
}
