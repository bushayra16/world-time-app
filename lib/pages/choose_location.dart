import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location = [
    WorldTime(location: 'Banladesh', flag: 'Bangladesh.jpg', url: 'Asia/Dhaka'),
    WorldTime(location: 'India', flag: 'India.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'London', flag: 'London.jpg', url: 'Europe/London'),
    WorldTime(location: 'Nepal', flag: 'Nepal.jpg', url: 'Asia/Kathmandu'),
    WorldTime(
        location: 'America', flag: 'America.jpg', url: 'America/New_York'),
    WorldTime(
        location: 'Istambul', flag: 'Istambul.jpg', url: 'Europe/Istanbul'),
    WorldTime(url: 'Europe/Athens', location: 'Greece', flag: 'Greece.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'Egypt.jpg'),
    WorldTime(
        location: 'Australia',
        flag: 'Australia.jpg',
        url: 'Australia/Melbourne'),
  ];

  void updateTime(index) async {
    WorldTime newWorldTime = location[index];
    await newWorldTime.getTime();
    //navigate to home screen

    Navigator.pop(context, {
      'location': newWorldTime.location,
      'flag': newWorldTime.flag,
      'time': newWorldTime.time,
      'isDaytime': newWorldTime.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            backgroundColor: Colors.grey[600],
            title: Text('Choose a Location'),
            centerTitle: true,
            elevation: 0),
        body: ListView.builder(
            itemCount: location.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              );
            }));
  }
}
