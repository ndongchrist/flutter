import 'package:flutter/material.dart';
import 'package:galleryapp/CardView.dart';
import 'package:provider/provider.dart';
import 'add_to_list.dart';

class MyMaterialButton extends StatelessWidget {
  const MyMaterialButton({required this.Title});

  final String Title;

  @override
  Widget build(BuildContext context) {
    List list = Provider.of<CardList>(context).cardList;

    return RawMaterialButton(
      constraints: BoxConstraints(minHeight: 50, minWidth: 100),
      onPressed: () {
        list.add(Title);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CardView()),
        );
      },
      fillColor: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            'Add',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20),
          ),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    );
  }
}
