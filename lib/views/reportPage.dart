// ignore: file_names
import 'package:flutter/material.dart';

import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:provider/provider.dart';
import 'package:sports_report/provider/sports_modes_provider.dart';

import '../constants.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  void didChangeDependencies() {
    Provider.of<SportsModeProvider>(context, listen: false).seperateTime();
    super.didChangeDependencies();
  }

  ScrollController? _scrollController1;
  ScrollController? _scrollController2;
  ScrollController? _scrollController3;
  ScrollController? _scrollController4;
  ScrollController? _scrollController5;
  ScrollController? _scrollController6;
  ScrollController? _scrollController7;
  ScrollController? _scrollController8;
  ScrollController? _scrollController9;
  LinkedScrollControllerGroup? _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _scrollController1 = _controllers!.addAndGet();
    _scrollController2 = _controllers!.addAndGet();
    _scrollController3 = _controllers!.addAndGet();
    _scrollController4 = _controllers!.addAndGet();
    _scrollController5 = _controllers!.addAndGet();
    _scrollController6 = _controllers!.addAndGet();
    _scrollController7 = _controllers!.addAndGet();
    _scrollController8 = _controllers!.addAndGet();

    _scrollController9 = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _scrollController1!.dispose();
    _scrollController2!.dispose();
    _scrollController3!.dispose();
    _scrollController4!.dispose();
    _scrollController5!.dispose();
    _scrollController6!.dispose();
    _scrollController7!.dispose();
    _scrollController8!.dispose();
    _scrollController9!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SportsModeProvider>(builder: (context, sportsmode, _) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _customTable(sportsmode),
          ),
        ),
      );
    });
  }

  Widget _customTable(SportsModeProvider sportsmode) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCells("Total Info for the WEEK", isbold: true),
            Flexible(
              child: SingleChildScrollView(
                controller: _scrollController1,
                //scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    _buildCells("Running Time", isbold: true),
                    _buildCells("Jogging Time", isbold: true),
                    _buildCells("Exercise Time", isbold: true),
                    _buildCells("Total Time(Running+Jogging+Exercise)",
                        isbold: true),
                    _buildCells(
                        "Running Time engagement %(Running / Total Time)",
                        isbold: true),
                    _buildCells(
                        "JoggingTime engagement %(Jogging / Total Time)",
                        isbold: true),
                    _buildCells(
                        "ExerciseTime engagement %(Exercise / Total Time)",
                        isbold: true),
                  ],
                ),
              ),
            )
          ],
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells("Total (Sun - Sat)", isbold: true),
                    Flexible(
                      child: SingleChildScrollView(
                        controller: _scrollController2,
                        child: Column(
                          children: [
                            _buildCells(
                                " ${sportsmode.calculateTotalRunningTime().toString()} min"),
                            _buildCells(
                                " ${sportsmode.calculateTotalJoggingTime().toString()} min"),
                            _buildCells(
                                " ${sportsmode.calculateTotalExerciseTime().toString()} min"),
                            _buildCells(
                                " ${sportsmode.calculateTotaltime()} min"),
                            _buildCells(
                                " ${sportsmode.calculateTotalRTengagement()} %"),
                            _buildCells(
                                " ${sportsmode.calculateTotalJTengagement()} %"),
                            _buildCells(
                                " ${sportsmode.calculateTotalETengagement()} %"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Sun (${formatDate(sportsmode.datalist[0].date)})',
                        isbold: true),
                    Flexible(
                      child: SingleChildScrollView(
                        controller: _scrollController3,
                        child: Column(
                          children: [
                            _buildCells(
                                " ${sportsmode.datalist[0].runningTime} min"),
                            _buildCells(
                                "${sportsmode.datalist[0].joggingTime} min"),
                            _buildCells(
                                "${sportsmode.datalist[0].exerciseTime} min"),
                            _buildCells(
                                "${sportsmode.calculateTotaltimebyDate(sportsmode.datalist[0].date)} min"),
                            _buildCells(
                                " ${sportsmode.calculateTotalRTengagementbyDate(sportsmode.datalist[0].date)} %"),
                            _buildCells(
                                " ${sportsmode.calculateTotalJTengagementbyDate(sportsmode.datalist[0].date)} %"),
                            _buildCells(
                                " ${sportsmode.calculateTotalETengagementbyDate(sportsmode.datalist[0].date)} %"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Mon (${formatDate(sportsmode.datalist[1].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController4,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${sportsmode.datalist[1].runningTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[1].joggingTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[1].exerciseTime} min"),
                          _buildCells(
                              "${sportsmode.calculateTotaltimebyDate(sportsmode.datalist[1].date)} min"),
                          _buildCells(
                              " ${sportsmode.calculateTotalRTengagementbyDate(sportsmode.datalist[1].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalJTengagementbyDate(sportsmode.datalist[1].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalETengagementbyDate(sportsmode.datalist[1].date)} %"),
                        ],
                      ),
                    )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Tue (${formatDate(sportsmode.datalist[2].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController5,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${sportsmode.datalist[2].runningTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[2].joggingTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[2].exerciseTime} min"),
                          _buildCells(
                              "${sportsmode.calculateTotaltimebyDate(sportsmode.datalist[2].date)} min"),
                          _buildCells(
                              " ${sportsmode.calculateTotalRTengagementbyDate(sportsmode.datalist[2].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalJTengagementbyDate(sportsmode.datalist[2].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalETengagementbyDate(sportsmode.datalist[2].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Wed (${formatDate(sportsmode.datalist[3].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController6,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${sportsmode.datalist[3].runningTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[3].joggingTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[3].exerciseTime} min"),
                          _buildCells(
                              "${sportsmode.calculateTotaltimebyDate(sportsmode.datalist[3].date)} min"),
                          _buildCells(
                              " ${sportsmode.calculateTotalRTengagementbyDate(sportsmode.datalist[3].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalJTengagementbyDate(sportsmode.datalist[3].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalETengagementbyDate(sportsmode.datalist[3].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Thu (${formatDate(sportsmode.datalist[4].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController7,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${sportsmode.datalist[4].runningTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[4].joggingTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[4].exerciseTime} min"),
                          _buildCells(
                              "${sportsmode.calculateTotaltimebyDate(sportsmode.datalist[4].date)} min"),
                          _buildCells(
                              " ${sportsmode.calculateTotalRTengagementbyDate(sportsmode.datalist[4].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalJTengagementbyDate(sportsmode.datalist[4].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalETengagementbyDate(sportsmode.datalist[4].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Fri (${formatDate(sportsmode.datalist[5].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController8,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${sportsmode.datalist[5].runningTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[5].joggingTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[5].exerciseTime} min"),
                          _buildCells(
                              "${sportsmode.calculateTotaltimebyDate(sportsmode.datalist[5].date)} min"),
                          _buildCells(
                              " ${sportsmode.calculateTotalRTengagementbyDate(sportsmode.datalist[5].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalJTengagementbyDate(sportsmode.datalist[5].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalETengagementbyDate(sportsmode.datalist[5].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Sat (${formatDate(sportsmode.datalist[6].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController9,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${sportsmode.datalist[6].runningTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[6].joggingTime} min"),
                          _buildCells(
                              "${sportsmode.datalist[6].exerciseTime} min"),
                          _buildCells(
                              "${sportsmode.calculateTotaltimebyDate(sportsmode.datalist[6].date)} min"),
                          _buildCells(
                              " ${sportsmode.calculateTotalRTengagementbyDate(sportsmode.datalist[6].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalJTengagementbyDate(sportsmode.datalist[6].date)} %"),
                          _buildCells(
                              " ${sportsmode.calculateTotalETengagementbyDate(sportsmode.datalist[6].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCells(String? text, {bool isbold = false}) {
    return Container(
      alignment: Alignment.center,
      width: 160.0,
      height: 80.0,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: !isbold ? Colors.white : Colors.yellow[300],
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: isbold ? 14 : 16,
            fontWeight: isbold ? FontWeight.bold : FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
