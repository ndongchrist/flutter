import 'package:flutter/material.dart';
import 'package:galleryapp/detail_page.dart';

import 'components/my_material-button.dart';

List<ImageDetails> imageList = [
  ImageDetails(imagePath: 'images/1.jpg', name: 'Laptop', price: '120'),
  ImageDetails(imagePath: 'images/2.jpg', name: 'HP Laptop', price: '20'),
  ImageDetails(imagePath: 'images/3.jpg', name: 'Dell Latitude', price: '50'),
  ImageDetails(imagePath: 'images/4.jpg', name: 'Collection', price: '200'),
  ImageDetails(imagePath: 'images/5.jpg', name: 'PC', price: '30'),
  ImageDetails(imagePath: 'images/6.jpg', name: 'HP Win11', price: '80'),
  ImageDetails(imagePath: 'images/7.jpg', name: 'Tablet', price: '150'),
  ImageDetails(imagePath: 'images/8.jpg', name: 'Smartphone', price: '300'),
  ImageDetails(imagePath: 'images/9.jpg', name: 'Camera', price: '400'),
  ImageDetails(imagePath: 'images/10.jpg', name: 'Printer', price: '100'),
  ImageDetails(imagePath: 'images/11.jpg', name: 'Scanner', price: '80'),
  ImageDetails(imagePath: 'images/12.jpg', name: 'Router', price: '60'),
  ImageDetails(imagePath: 'images/13.jpg', name: 'Switch', price: '100'),
  ImageDetails(
      imagePath: 'images/14.jpg', name: 'Speaker System', price: '500'),
  ImageDetails(imagePath: 'images/15.jpg', name: 'Projector', price: '800'),
  ImageDetails(imagePath: 'images/16.jpg', name: 'Gaming Chair', price: '150'),
  ImageDetails(
      imagePath: 'images/17.jpg', name: 'External Hard Drive', price: '80'),
  ImageDetails(
      imagePath: 'images/18.jpg', name: 'Wireless Earbuds', price: '50'),
  ImageDetails(
      imagePath: 'images/19.jpg', name: 'Fitness Tracker', price: '100'),
  ImageDetails(imagePath: 'images/20.jpg', name: 'Smart Watch', price: '300'),
  ImageDetails(
      imagePath: 'images/21.jpg', name: 'Bluetooth Speaker', price: '60'),
  ImageDetails(
      imagePath: 'images/22.jpg',
      name: 'Virtual Reality Headset',
      price: '200'),
  ImageDetails(
      imagePath: 'images/23.jpg', name: 'Smart Thermostat', price: '150'),
  ImageDetails(
      imagePath: 'images/24.jpg', name: 'Wireless Charger', price: '40'),
  ImageDetails(imagePath: 'images/25.jpg', name: 'Smart Lock', price: '120'),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.lightBlueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: imageList.length,
                  itemBuilder: ((context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    imagePath: imageList[index].imagePath,
                                    Title: imageList[index].name,
                                    price: imageList[index].price)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(imageList[index].imagePath)),
                            color: Colors.lightBlueAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String price;
  final String name;

  ImageDetails(
      {required this.imagePath, required this.name, required this.price});
}
