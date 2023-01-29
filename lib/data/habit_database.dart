import 'package:habits/datetime/date_time.dart';
import 'package:hive/hive.dart';

//refrence our box
final _myBox = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabitList = [];
  Map<DateTime, int> heatMapDataset = {};

  //create initial default data
  void createDefaultData() {
    todaysHabitList = [
      ["Morning", false],
      ["Evening", false],
    ];

    _myBox.put("START_DATE", todaysDateFormatted());
  }

  //load existing database
  void loadData() {
    //if its a new day, fetch database
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      //set all habits false each new day
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    }
    //if not, load current list
    else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  //update database
  void UpdateDatabase() {
    //update entry ya leo
    _myBox.put(todaysDateFormatted(), todaysHabitList);

    // incase of change update universal habitlist
    _myBox.put("CURRENT_HABIT_LIST", todaysHabitList);

    //calculate habit complete percentage for each day
    calculateHabitPercentage();

    //load heat map
    loadHeatMap();
  }

  void calculateHabitPercentage() {
    int countCompleted = 0;
    for (int i = 0; i < todaysHabitList.length; i++) {
      if (todaysHabitList[i][1] == true) {
        countCompleted++;
      }
    }

    String percent = todaysHabitList.isEmpty
        ? '0.0'
        : (countCompleted / todaysHabitList.length).toStringAsFixed(1);

    //key: "PERCENTAGE_SUMMARY_yyyymmdd"
    //value: string 0f one decimalpoint btwn 0-1
    _myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_myBox.get("START_DATE"));

    //count no of days to load
    int daysInBewteen = DateTime.now().difference(startDate).inDays;

    //go from start date to today and add each percent to the dataset
    //"PERCENTAGE_SUMMARRY_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBewteen + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(
          Duration(days: i),
        ),
      );

      double strengthAsPercentage = double.parse(
        _myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      //split the time line like below so dont worry about hours/mins/secs

      //year
      int year = startDate.add(Duration(days: i)).year;

      //month
      int month = startDate.add(Duration(days: i)).month;

      //day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercentage).toInt(),
      };

      heatMapDataset.addEntries(percentForEachDay.entries);
      print(heatMapDataset);
    }
  }
}
