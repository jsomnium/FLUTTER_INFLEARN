import 'package:diary/diary_service.dart';
import 'package:diary/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryService>(
      builder: (context, diaryService, child) {
        return Scaffold(
          body: Center(
            child: TableBasicsExample(),
          ),
        );
      },
    );
  }
}
