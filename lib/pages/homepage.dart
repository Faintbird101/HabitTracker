import 'package:flutter/material.dart';
import 'package:habits/components/action_button.dart';
import 'package:habits/components/mothly_summary.dart';
import 'package:habits/data/habit_database.dart';
import 'package:habits/pages/exapandable.dart';
import 'package:habits/pages/splashscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/habit_tile.dart';
import '../components/my_fab.dart';
import '../components/new_habit_box.dart';
import 'package:habits/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    //check if its first time opening the app
    //then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }
    //there is already data so just load it
    else {
      db.loadData();
    }

    //update the database
    db.UpdateDatabase();

    super.initState();
  }

  //checkbox was tapped
  void CheckBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.UpdateDatabase();
  }

  //create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    //show dialog
    showDialog(
      context: context,
      builder: (context) {
        return NewHabitBox(
          hintText: 'Enter New Habit..',
          controller: _newHabitNameController,
          onSave: saveNewHabits,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  void saveNewHabits() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.UpdateDatabase();
  }

  void cancelDialogBox() {
    setState(() {
      _newHabitNameController.clear();
    });
    Navigator.pop(context);
  }

  //settings
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return NewHabitBox(
          hintText: db.todaysHabitList[index][0],
          controller: _newHabitNameController,
          onSave: () => saveExistingHabitName(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  //save Existing Habitname
  void saveExistingHabitName(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);

    db.UpdateDatabase();
  }

  //delete Habit
  void deleteHabit(index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.UpdateDatabase();
  }

  void quiting(index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure'),
          content: Text('Do you want to close the app?'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No')),
            TextButton(
                onPressed: () {
                  Future.delayed(Duration(seconds: 2), () {
                    Text('Opps still working on it 😅😅😅');
                    setState(() {});
                  });
                  Text('Opps still working on it 😅😅😅');
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: ExpandableFab(
          children: [
            ActionButton(
              icon: const Icon(Icons.exit_to_app_rounded),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SplashScreen()));
              },
            ),
            ActionButton(
              icon: const Icon(Icons.power_settings_new_rounded),
              onPressed: () {},
            ),
            ActionButton(
              icon: const Icon(Icons.add),
              onPressed: createNewHabit,
            ),
          ],
          distance: 120,
        ),
        // MyFloatingActionbutton(
        //   onPressed: createNewHabit,
        // ),
        body: ListView(
          children: [
            // monthly summarry
            MonthlySummary(
              datasets: db.heatMapDataset,
              startDate: _myBox.get("START_DATE"),
            ),

            // list of habits
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.todaysHabitList.length,
              itemBuilder: ((context, index) {
                return HabitTile(
                  settingsTapped: (context) => openHabitSettings(index),
                  deleteTapped: (context) => deleteHabit(index),
                  habitName: db.todaysHabitList[index][0],
                  habitcompeleted: db.todaysHabitList[index][1],
                  onChanged: (value) => CheckBoxTapped(value, index),
                );
              }),
            ),
          ],
        ));
  }
}
