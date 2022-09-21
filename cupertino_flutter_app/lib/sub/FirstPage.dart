import 'package:cupertino_flutter_app/animalItem.dart';
import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, this.list}) : super(key: key);
  final List<Animal>? list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: list!.length,
            itemBuilder: (context, position) => GestureDetector(
                  onTap: () {
                    AlertDialog dialog = AlertDialog(
                        content: Text(
                      '이 동물은 ${list![position].kind!}입니다.',
                      style: const TextStyle(fontSize: 20),
                    ));
                    showDialog(
                      context: context,
                      builder: (context) {
                        return dialog;
                      },
                    );
                  },
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          list![position].imagePath!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        Text(list![position].animalName!)
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
