import 'package:flutter/material.dart';
import 'components/my_material-button.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String Title;
  final String price;
  DetailPage(
      {required this.imagePath, required this.Title, required this.price});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            Title,
                            style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        ),
                        MyMaterialButton(
                          Title: Title,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      Text(
                        price + '\$',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
