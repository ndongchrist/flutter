import 'package:flutter/material.dart';
import 'components/add_to_list.dart';
import 'package:provider/provider.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    List list = Provider.of<CardList>(context).cardList;
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(list[0]),
            );
          },
        ),
      ),
    );
  }
}
