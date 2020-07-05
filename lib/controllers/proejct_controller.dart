import 'package:get/get.dart';
import 'package:getx_examples/models/project.dart';

class ProjectController extends GetxController {
  List<Project> _projectList;
  List<Project> get projectsList => _projectList;

  @override
  void onInit() {
    // TODO: implement onInit
    _projectList = List<Project>();
    populateProjectList();
    super.onInit();
  }

  populateProjectList() {
    Project p1 = Project(projectName: 'Project 1');
    Project p2 = Project(projectName: 'Project 2');
    _projectList.add(p1);
    _projectList.add(p2);
    // p2.expanded
    print(_projectList[0].projectName);
    update();
  }

  changeName({int index}) {
    Project p3 = Project(projectName: 'Project 3');
    // _projectList.add(p3);
    _projectList[index].expanded = !_projectList[index].expanded;
    _projectList[index].projectName = 'updated $index';
    update();
  }

  populateExpanded({int index}) {}
}
