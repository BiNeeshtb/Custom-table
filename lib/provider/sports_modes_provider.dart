import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_report/model/DataModel.dart';
import 'package:sports_report/sampleData.dart';

class SportsModeProvider extends ChangeNotifier {
  final List<DataModel> _datalist = SampleData.datalist; //[];

  List<DataModel> get datalist => [..._datalist];

  List<int> _runningTimelist = [];
  List<int> _joggingTimelist = [];
  List<int> _exerciseTimelist = [];

//Seperate time from datalist
  seperateTime() {
    List<int> runningTimelistInstance = [];
    List<int> joggingTimelistInstance = [];
    List<int> exerciseTimelistInstance = [];

    for (var i = 0; i < _datalist.length; i++) {
      runningTimelistInstance.add(_datalist[i].runningTime!);
      joggingTimelistInstance.add(_datalist[i].joggingTime!);
      exerciseTimelistInstance.add(_datalist[i].exerciseTime!);
    }

    _runningTimelist = runningTimelistInstance;
    _joggingTimelist = joggingTimelistInstance;
    _exerciseTimelist = exerciseTimelistInstance;
  }

  int calculateTotalRunningTime() {
    return _runningTimelist.fold(
        0, (previousValue, element) => previousValue + element);
  }

  int calculateTotalJoggingTime() {
    return _joggingTimelist.fold(
        0, (previousValue, element) => previousValue + element);
  }

  int calculateTotalExerciseTime() {
    return _exerciseTimelist.fold(
        0, (previousValue, element) => previousValue + element);
  }

  int calculateTotaltime() {
    return calculateTotalRunningTime() +
        calculateTotalJoggingTime() +
        calculateTotalExerciseTime();
  }

  int calculateTotaltimebyDate(DateTime? date) {
    DataModel data = _datalist.firstWhere((e) => e.date == date);
    return data.exerciseTime! + data.joggingTime! + data.runningTime!;
  }

  calculateTotalRTengagement() {
    return ((calculateTotalRunningTime() / calculateTotaltime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalRTengagementbyDate(DateTime? date) {
    DataModel data = _datalist.firstWhere((e) => e.date == date);
    return ((data.runningTime! / calculateTotaltime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalJTengagement() {
    return ((calculateTotalJoggingTime() / calculateTotaltime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalJTengagementbyDate(DateTime? date) {
    DataModel data = _datalist.firstWhere((e) => e.date == date);
    return ((data.joggingTime! / calculateTotaltime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalETengagement() {
    return ((calculateTotalExerciseTime() / calculateTotaltime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalETengagementbyDate(DateTime? date) {
    DataModel data = _datalist.firstWhere((e) => e.date == date);
    return ((data.exerciseTime! / calculateTotaltime()) * 100)
        .toStringAsFixed(2);
  }
}
