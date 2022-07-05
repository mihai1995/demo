String dateTimeFormatter(int date) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
  int year = dateTime.year;
  String month = dateTime.month < 9 ? '0${dateTime.month}' : dateTime.month.toString();
  String days = dateTime.day < 9 ? '0${dateTime.day}' : dateTime.day.toString();
  String hour = dateTime.hour < 9 ? '0${dateTime.hour}' : dateTime.hour.toString();
  String seconds = dateTime.second < 9 ? '0${dateTime.second}' : dateTime.second.toString();
  return '$days/$month/$year $hour:$seconds';
}
