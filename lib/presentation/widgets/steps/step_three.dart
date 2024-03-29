import 'package:example/presentation/provider/state_provider.dart';
import 'package:example/presentation/screens/register_page.dart';
import 'package:example/presentation/widgets/text_fields.dart/def_text_field.dart';
import 'package:example/presentation/widgets/text_widgets/def_text.dart';
import 'package:example/presentation/widgets/text_widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  List<int> days = [];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<int> years = List.generate(30, (index) => DateTime.now().year - index);

  int selectedDay = 1;
  String selectedMonth = 'January';
  int selectedYear = DateTime.now().year;
  void updateDays(String month, int year) {
    int daysInMonth = DateTime(year, months.indexOf(month) + 1, 0).day;
    setState(() {
      days = List.generate(daysInMonth, (index) => index + 1);
      if (!days.contains(selectedDay)) {
        selectedDay = days.last;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StateProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(
            title: "ФИО",
            color: Colors.black,
          ),
          DefaultTextFormWidget(
            controller: TextEditingController(),
            hintText: "ФИО",
          ),
          const SizedBox(height: 30),
          const TitleText(
            title: "Дата рождения",
            color: Colors.black,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xffF0EFEF),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                elevation: 0,
                value: selectedDay,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(12),
                hint: const DefaultText(title: "Дата"),
                items: days.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDay = value!;
                  });
                },
              ),
            ),
            Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color(0xffF0EFEF),
                    borderRadius: BorderRadius.circular(12)),
                child: DropdownButton(
                  value: selectedMonth,
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(12),
                  hint: const DefaultText(title: "Месяц"),
                  items: months.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value!;
                      updateDays(selectedMonth, selectedYear);
                    });
                  },
                )),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xffF0EFEF),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                value: selectedYear,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(12),
                hint: const DefaultText(title: "Год"),
                items: years.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value!;
                  });
                },
              ),
            )
          ]),
          const SizedBox(height: 30),
          const TitleText(
            title: "Адрес электронной почты",
            color: Colors.black,
          ),
          DefaultTextFormWidget(
            controller: TextEditingController(),
            hintText: "Адрес электронной почты",
          ),
          const SizedBox(height: 40),
          DefElevatedButton(
              onPressed: () => provider.nextStep(), title: "Продолжить"),
        ],
      ),
    );
  }
}
