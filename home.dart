import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController lampEditingController;
  late String _lampImage;
  
  

  @override
  void initState() {
    super.initState();
    lampEditingController = TextEditingController();
    _lampImage = 'images/lamp_on.png';
  }

  @override
  void dispose() {
    lampEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text('Main 화면'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: lampEditingController,
                decoration: InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Image.asset(
              _lampImage,
              width: 200,
            ),
            
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          editLamp();
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          child: Icon(Icons.edit),
        ),
      ),
    );
  } // Build

  // ---Functions---

editLamp() async{
  String inputLamp = lampEditingController.text.trim();

  if(lampEditingController.text.trim().isEmpty){
    Get.snackbar(
      "알림", 
      "이름을 입력해주세요",
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
    colorText: Colors.white
    );
  }else{
    // lampEditingController.clear();
    final returnedData = await Get.toNamed('/edit', arguments: inputLamp);
  if(returnedData !=null && returnedData is Map){
  _lampImage = returnedData['image'];
  lampEditingController.text = returnedData['text'];
  }
  setState(() {});
  }
}

} // Class
