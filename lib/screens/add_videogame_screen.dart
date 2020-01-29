import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node/models/videogame_model.dart';

class AddVideoGameScreen extends StatefulWidget {
  final Function updateVideogameList;
  final VideoGame videogame;

  AddVideoGameScreen({this.updateVideogameList, this.videogame});

  @override
  _AddVideoGameScreenState createState() => _AddVideoGameScreenState();
}

class _AddVideoGameScreenState extends State<AddVideoGameScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _category = '';
  String _description = '';
  int _price = 0;
  int _quantity = 0;
  String _photo = '';

  final List<String> _categories = [];

  _getCategories() {
    print("getting categories");
    // assing the categories variable to the array response of the api endpoint /GET/gategories
  }

  _delete() {
    print("delte method");
  }

  _submit() {
    print("submit method");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.videogame == null ? 'Add Videogame' : 'Update Videogame',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (input) => input.trim().isEmpty
                              ? 'Please enter a task title'
                              : null,
                          onSaved: (input) => _name = input,
                          initialValue: _name,
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 20.0),
                      //   child: DropdownButtonFormField(
                      //     isDense: true,
                      //     icon: Icon(Icons.arrow_drop_down_circle),
                      //     iconSize: 22.0,
                      //     iconEnabledColor: Theme.of(context).primaryColor,
                      //     items: _priorities.map((String priority) {
                      //       return DropdownMenuItem(
                      //         value: priority,
                      //         child: Text(
                      //           priority,
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 18.0,
                      //           ),
                      //         ),
                      //       );
                      //     }).toList(),
                      //     style: TextStyle(fontSize: 18.0),
                      //     decoration: InputDecoration(
                      //       labelText: 'Priority',
                      //       labelStyle: TextStyle(fontSize: 18.0),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //     ),
                      //     validator: (input) => _priority == null
                      //         ? 'Please select a priority level'
                      //         : null,
                      //     onSaved: (input) => _priority = input,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _priority = value;
                      //       });
                      //     },
                      //     value: _priority),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(vertical: 20.0),
                      //   height: 60.0,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     color: Theme.of(context).primaryColor,
                      //     borderRadius: BorderRadius.circular(30.0),
                      //   ),
                      //   child: FlatButton(
                      //     child: Text(
                      //       widget.task == null ? 'Add' : 'Update',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 20.0,
                      //       ),
                      //     ),
                      //     onPressed: _submit,
                      //   ),
                      // ),
                    //   widget.task != null ? Container(
                    //     margin: EdgeInsets.symmetric(vertical: 20.0),
                    //     height: 60.0,
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                    //       color: Theme.of(context).primaryColor,
                    //       borderRadius: BorderRadius.circular(30.0),
                    //     ),
                    //     child: FlatButton(
                    //       child: Text(
                    //         'Delete',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 20.0,
                    //         ),
                    //       ),
                    //       onPressed: _delete,
                    //     ),
                    //   ) :  SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
