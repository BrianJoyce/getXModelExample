import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_examples/controllers/counter_controller.dart';
import 'package:getx_examples/controllers/proejct_controller.dart';
import 'package:getx_examples/screen2.dart';

import 'models/project.dart';

class Screen1 extends StatelessWidget {
  // const Screen1({Key key}) : super(key: key);
  final CounterController counterController = Get.put(CounterController());
  final ProjectController _projectController = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 1')),
      body: Column(
        children: <Widget>[
          Text('GetX vs Obs vs GetBuilder'),
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
          ),
          RaisedButton(
            child: Text('Screen 2'),
            onPressed: () => Get.to(Screen2()),
          ),
          Divider(color: Colors.blue),
          // Obx(
          //   () => showExpanedList(),
          // ),
          GetBuilder<ProjectController>(
            init: ProjectController(),
            builder: (_) {
              return getbuldershowExpanedList(_);
            },
          )
        ],
      ),
    );
  }

  getbuldershowExpanedList(dynamic projectCtrl) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool expanded) {
        // model.populateExpanded(index: index);
        // log.w(_projectController.projectsList[0].projectName);
        // log.w(_projectController.projectsList[0].expanded);
        projectCtrl.changeName(index: index);
      },
      children: projectCtrl.projectsList.map<ExpansionPanel>((Project project) {
        return ExpansionPanel(
            isExpanded: project.expanded,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(project.projectName),
                    Text(projectCtrl.projectsList.length.toString()),
                    // Text(project.type),
                    // Text('${project.createdAt ?? null}'),
                  ],
                ),
              );
            },
            body: Text(project.projectName));
      }).toList(),
    );
  }

  // showExpanedList() {
  //   return ExpansionPanelList(
  //     expansionCallback: (int index, bool expanded) {
  //       // model.populateExpanded(index: index);
  //       // log.w(_projectController.projectsList[0].projectName);
  //       // log.w(_projectController.projectsList[0].expanded);
  //       _projectController.changeName(index: index);
  //     },
  //     children: _projectController.projectsList
  //         .map<ExpansionPanel>((Rx<Project> project) {
  //       return ExpansionPanel(
  //           isExpanded: project.value.expanded,
  //           canTapOnHeader: true,
  //           headerBuilder: (BuildContext context, bool isExpanded) {
  //             return ListTile(
  //               title: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: <Widget>[
  //                   Obx(() => Text(project.value.projectName)),
  //                   Obx(() => Text(
  //                       _projectController.projectsList.length.toString())),
  //                   // Text(project.type),
  //                   // Text('${project.createdAt ?? null}'),
  //                 ],
  //               ),
  //             );
  //           },
  //           body: Text(project.value.projectName));
  //     }).toList(),
  //   );
  // }

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
