import 'package:flutter/material.dart';

class AvailabilitySubmissionPage extends StatefulWidget {
  const AvailabilitySubmissionPage({super.key});

  @override
  State<AvailabilitySubmissionPage> createState() =>
      _AvailabilitySubmissionPageState();
}

class _AvailabilitySubmissionPageState
    extends State<AvailabilitySubmissionPage> {
  String? selectedWeek;
  int selectedDayIndex = 0;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;
  bool repeatAllDays = false;

  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> weeks = ["Week 1", "Week 2", "Week 3", "Week 4"];

  void pickTime(bool isFrom) async {
    final TimeOfDay? picked =
        await showCustomTimePicker(context, initialTime: fromTime);

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromTime = picked;
        } else {
          toTime = picked;
        }
      });
    }
  }

  String formatTime(TimeOfDay? time) {
    if (time == null) return "Available ${time == fromTime ? 'from' : 'till'}";
    final hour = time.hourOfPeriod.toString().padLeft(2, "0");
    final minute = time.minute.toString().padLeft(2, "0");
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Availability Submission",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Week", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                hint: const Text("Select a week"),
                value: selectedWeek,
                items: weeks.map((week) {
                  return DropdownMenuItem(
                    value: week,
                    child: Text(week),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedWeek = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text("Day", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    final selected = selectedDayIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDayIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          border: selected
                              ? const Border(
                                  bottom:
                                      BorderSide(color: Colors.blue, width: 2))
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          days[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: selected ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => pickTime(true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Text(formatTime(fromTime),
                                style: TextStyle(
                                  color: fromTime == null
                                      ? Colors.grey
                                      : Colors.black,
                                )),
                            const Spacer(),
                            const Icon(Icons.access_time, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => pickTime(false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            Text(formatTime(toTime),
                                style: TextStyle(
                                  color: toTime == null
                                      ? Colors.grey
                                      : Colors.black,
                                )),
                            const Spacer(),
                            const Icon(Icons.access_time, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: repeatAllDays,
                    onChanged: (value) {
                      setState(() {
                        repeatAllDays = value ?? false;
                      });
                    },
                  ),
                  const Text("Repeat this for all days of the week."),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: fromTime != null && toTime != null
                      ? () {
                          // Save logic here
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: fromTime != null && toTime != null
                        ? Colors.blue
                        : Colors.blue.shade100,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Save availability",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay?> showCustomTimePicker(BuildContext context,
      {TimeOfDay? initialTime}) async {
    int hour = initialTime?.hour ?? 9;
    int minute = initialTime?.minute ?? 0;
    String period = hour >= 12 ? "PM" : "AM";

    int displayHour = hour % 12 == 0 ? 12 : hour % 12;

    return showModalBottomSheet<TimeOfDay>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Select time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Hours Picker
                    SizedBox(
                      width: 80,
                      height: 150,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        perspective: 0.001,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            displayHour = value + 1;
                          });
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                                child: Text("${index + 1}".padLeft(2, '0'),
                                    style: const TextStyle(fontSize: 20)));
                          },
                          childCount: 12,
                        ),
                      ),
                    ),

                    const Text(":", style: TextStyle(fontSize: 24)),

                    // Minutes Picker
                    SizedBox(
                      width: 80,
                      height: 150,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        perspective: 0.001,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            minute = value * 15;
                          });
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                                child: Text(
                                    (index * 15).toString().padLeft(2, '0'),
                                    style: const TextStyle(fontSize: 20)));
                          },
                          childCount: 4,
                        ),
                      ),
                    ),

                    // AM/PM Picker
                    SizedBox(
                      width: 80,
                      height: 150,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        perspective: 0.001,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            period = value == 0 ? "AM" : "PM";
                          });
                        },
                        childDelegate: ListWheelChildListDelegate(
                          children: const [
                            Center(
                                child:
                                    Text("AM", style: TextStyle(fontSize: 20))),
                            Center(
                                child:
                                    Text("PM", style: TextStyle(fontSize: 20))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          int finalHour = period == "AM"
                              ? (displayHour % 12)
                              : (displayHour % 12) + 12;
                          Navigator.pop(context,
                              TimeOfDay(hour: finalHour, minute: minute));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text("Save"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        });
      },
    );
  }
}
