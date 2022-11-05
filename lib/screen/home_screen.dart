import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screen/next_screen.dart';
import 'package:getx_practice/service/increment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = Get.size.height;
    final w = Get.size.width;
    final data = Get.find<IncrementService>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return Text(
              data.num.toString(),
              style: TextStyle(fontSize: 30),
            );
          }),
          Center(
            child: ElevatedButton(
              onPressed: () {
                data.increment();
              },
              child: const Text('Click'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => NextScreen());
              },
              child: const Text('Screen 1'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    barrierDismissible: false,
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Yes')),
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('No')),
                    ],
                    backgroundColor: Colors.white,
                    title: 'Alert',
                    content: Text('Are you sure to delete this one ?'));
              },
              child: const Text('Show Dialogs'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  color: Colors.amber,
                  child: Center(child: Text('Hi there')),
                ));
              },
              child: const Text('Show Bottomsheet'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.red,
            height: h * .10,
            width: w * .50,
            child: Center(
                child: Text(
              'Responsive size',
              style: TextStyle(fontSize: h * .030, color: Colors.white),
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('alert', 'alerm added successfully',
              margin: EdgeInsets.all(18),
              backgroundColor: Colors.white,
              icon: Icon(Icons.favorite),
              snackPosition: SnackPosition.BOTTOM);
        },
        child: Icon(Icons.add_alarm),
      ),
    );
  }
}
