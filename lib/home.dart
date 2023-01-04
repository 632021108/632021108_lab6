
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _Homepagestat();
}

class _Homepagestat extends State<MyWidget> {

  final List<ListItem> _fruits = [
    ListItem(1, 'Apple'),
    ListItem(2, 'Banana'),
    ListItem(3, 'Mango'),
  ]; 

  late List<DropdownMenuItem<ListItem>> _dropdownMenuTtem;
  late ListItem _selectedItem;

  @override
  void initState() {
    super.initState();
    _dropdownMenuTtem = buildDropdownMenuItem(_fruits);
    _selectedItem = _dropdownMenuTtem[0].value!;
  }


  List<DropdownMenuItem<ListItem>>buildDropdownMenuItem(
    List<ListItem> fruits) {
      List<DropdownMenuItem<ListItem>> items = [];
      for (ListItem listItem in fruits) {
        items.add(DropdownMenuItem(
          value: listItem,
          child: Text(listItem.name),
        ));
      }
      return items;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Input Witget"),
      ),
    body: SafeArea(
      child:ListView(
        children: [
          DropdownButton(
            value: _selectedItem,
            items: _dropdownMenuTtem,
            onChanged: (value) {
              setState(() {
                _selectedItem = value! ;
              });
            },
            ),
            Text(_selectedItem.name),

        ],
        ) 
        ),
    );
  }
  
  
}


class ListItem {
  final String name;
  final int value;

  ListItem(this.value , this.name);
}