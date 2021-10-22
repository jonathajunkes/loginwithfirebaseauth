import 'package:loginwithfirebaseauth/utils/MeetingDataSource.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  DateTime dateAgora = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  <Widget>[
            _buildTitle(),
            ListView(
              children: [

              ],
            ),
            SingleChildScrollView(
                child: SfCalendar(
                                  view: CalendarView.month,
                                  dataSource: MeetingDataSource(_getDataSource()),
                                  showNavigationArrow: true,
                                  showCurrentTimeIndicator: true,
                                  todayHighlightColor: Colors.redAccent,
                                  cellBorderColor: Colors.transparent,
                                  selectionDecoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.redAccent, width: 2),
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                    shape: BoxShape.rectangle,
                                  ),
                                  monthViewSettings: const MonthViewSettings(
                                      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),

                                )
            ),
            _buildTitle(),
            SingleChildScrollView(
              child: _buildTitle()  ,
            )

          ],
        ),
      ),

    );
  }
  Widget _buildTitle() => const Text(
    "Teste Baka",
    textAlign: TextAlign.center,
  );
}
List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
  DateTime(today.year, today.month, today.day+1, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Atualização', startTime, endTime, const Color(0xFF0F8644),false));
  return meetings;
}
_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}
class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source){
    appointments = source;
  }
}
