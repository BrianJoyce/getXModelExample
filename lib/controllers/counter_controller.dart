import 'package:get/get.dart';
import 'package:getx_examples/models/counter.dart';

class CounterController extends GetxController {
  static CounterController get to => Get.find();
  Counter _counter = Counter();
  get counter => _counter;

  var _counterObs = Counter().obs;
  get counterObs => _counterObs;

  void increment() {
    _counter.unit == null ? _counter.unit = 1 : _counter.unit++;

    update();
  }

  void incrementObs() {
    _counterObs.value.unit == null
        ? _counterObs.value.unit = 1
        : _counterObs.value.unit++;
  }
}
