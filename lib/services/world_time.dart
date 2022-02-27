import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String? time; // time in that location //null safte: String? time
  String flag; // flag icon
  String url; // location url for API
  bool? isDaytime; // true of false if Day time or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // see the difference, it is http.get()
    
    //make the request
    Response response =
        await get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // print(datetime);
    // print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
//set the time property
    isDaytime = now.hour > 6 && now.hour < 19  ? true: false;
    time = DateFormat.jm().format(now);
  }
}
