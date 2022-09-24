import 'package:flutter/material.dart';

class SecondDetail extends StatefulWidget {
  const SecondDetail({Key? key}) : super(key: key);

  @override
  State<SecondDetail> createState() => _SecondDetail();
}

class _SecondDetail extends State<SecondDetail> {

  TextEditingController? textEditingController ;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondDetail Example'),
      ),
      body: Column(
        children: <Widget>[
          TextField(controller: textEditingController,
          keyboardType: TextInputType.text,
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop(textEditingController!.value.text);
          }, child: Text('저장하기'))
        ],
      ),
    );
  }
}
