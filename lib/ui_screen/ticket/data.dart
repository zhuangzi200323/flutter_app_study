import 'package:flutter/material.dart';

class BoardingPassData {
  String passengerName;
  _Airport? origin;
  _Airport? destination;
  String duration;
  TimeOfDay? boardingTime;
  DateTime? departs;
  DateTime? arrives;
  String gate;
  int zone;
  String seat;
  String flightClass;
  String flightNumber;

  BoardingPassData({
    this.passengerName = "",
    this.origin,
    this.destination,
    this.duration = "",
    this.boardingTime,
    this.departs,
    this.arrives,
    this.gate = "",
    this.zone = 0,
    this.seat = "",
    this.flightClass = "",
    this.flightNumber = "",
  });
}

class _Airport {
  String code;
  String city;

  _Airport({this.city = "", this.code = ""});
}

List<BoardingPassData> boardingPasses = [
  BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YEG', city: 'Edmonton'),
      destination: _Airport(code: 'LAX', city: 'Los Angeles'),
      duration: '3时 30分',
      boardingTime: TimeOfDay(hour: 7, minute: 10),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '50',
      zone: 3,
      seat: '12A',
      flightClass: 'Economy',
      flightNumber: 'AC237'),
  BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YYC', city: 'Calgary'),
      destination: _Airport(code: 'YOW', city: 'Ottawa'),
      duration: '3时 50分',
      boardingTime: TimeOfDay(hour: 12, minute: 15),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '22',
      zone: 1,
      seat: '17C',
      flightClass: 'Economy',
      flightNumber: 'AC237'),
  BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YEG', city: 'Edmonton'),
      destination: _Airport(code: 'MEX', city: 'Mexico'),
      duration: '4时 15分',
      boardingTime: TimeOfDay(hour: 16, minute: 45),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '30',
      zone: 2,
      seat: '22B',
      flightClass: 'Economy',
      flightNumber: 'AC237'),
  BoardingPassData(
      passengerName: 'Ms. Jane Doe',
      origin: _Airport(code: 'YYC', city: 'Calgary'),
      destination: _Airport(code: 'YOW', city: 'Ottawa'),
      duration: "3时 15分",
      boardingTime: TimeOfDay(hour: 12, minute: 15),
      departs: DateTime(2019, 10, 17, 23, 45),
      arrives: DateTime(2019, 10, 18, 02, 15),
      gate: '22',
      zone: 1,
      seat: '17C',
      flightClass: 'Economy',
      flightNumber: 'AC237'),
];
