// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../customization/header_style.dart';
import '../shared/utils.dart' show CalendarFormat;

class CustomCalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final HeaderStyle headerStyle;
  final VoidCallback onHeaderTap;
  final Widget headerButton;
  final Widget? todayButton;
  final Map<CalendarFormat, String> availableCalendarFormats;

  const CustomCalendarHeader({
    Key? key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required this.headerStyle,
    required this.onHeaderTap,
    required this.availableCalendarFormats,
    required this.headerButton,
    this.todayButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = DateFormat('yyyy. MM월').format(focusedMonth);

    return Container(
      decoration: headerStyle.decoration,
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      child: GestureDetector(
        onTap: onHeaderTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              text,
              style: headerStyle.titleTextStyle,
            ),
            SizedBox(
              width: 32,
              height: 32,
              child: headerButton,
            ),
            const Expanded(child: SizedBox()),
            ..._getTodayWidget()
          ],
        ),
      ),
    );
  }

  List<Widget> _getTodayWidget() {
    if (todayButton == null) {
      return [];
    }
    return [todayButton!];
  }
}
