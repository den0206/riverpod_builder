import 'package:flutter/material.dart';

void loopMethods(int loopCount, VoidCallback func) {
  for (var i = 0; i < loopCount; i++) {
    func();
  }
}
