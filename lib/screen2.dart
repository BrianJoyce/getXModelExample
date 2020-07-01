import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_examples/controllers/counter_controller.dart';

class Screen2 extends StatelessWidget {
  // const Screen1({Key key}) : super(key: key);
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 2')),
      body: Column(
        children: <Widget>[
          Text('GetX vs Obs Vs GetBuilder'),
          Divider(color: Colors.blue),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('With/Without obs'),
                  Text('without Obs: '),
                  Text('with Obs: ')
                ],
              ),
              getXExample(),
              obxExample(),
              getBuilderExample(),
            ],
          ),
          RaisedButton(
            onPressed: () {
              counterController.increment();
              counterController.incrementObs();
            },
            child: Text('Initialise or Increment'),
          )
        ],
      ),
    );
  }

  Column getBuilderExample() {
    return Column(
      children: <Widget>[
        Text('GetBuilder'),
        GetBuilder<CounterController>(
          init: CounterController(), // INIT IT ONLY THE FIRST TIME
          builder: (_) => Text(
            '${_.counter.unit}',
          ),
        ),
        GetBuilder<CounterController>(
          init: CounterController(), // INIT IT ONLY THE FIRST TIME
          builder: (_) => Text(
            '${_.counterObs.value.unit}',
          ),
        ),
      ],
    );
  }

  Column obxExample() {
    return Column(
      children: <Widget>[
        Text('Obx'),
        Obx(() => Text('${counterController.counter.unit}')),
        Obx(() => Text('${counterController.counterObs.value.unit}')),
      ],
    );
  }

  Column getXExample() {
    return Column(
      children: <Widget>[
        Text('Get X'),
        GetX(
          init: CounterController(),
          builder: (_) => Text('${_.counter.unit}'),
        ),
        GetX(
          init: CounterController(),
          builder: (_) => Text('${_.counterObs.value.unit}'),
        ),
      ],
    );
  }
}
