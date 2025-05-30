import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class EndDateScreen extends StatefulWidget {
  const EndDateScreen({super.key});

  @override
  State<EndDateScreen> createState() => _EndDateScreenState();
}

class _EndDateScreenState extends State<EndDateScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  List<Map<String, dynamic>> events = [
    {
      'title': 'Flutter Bootcamp',
      'description': 'Flutter бойынша қаржыландырылатын курс',
      'endDate': DateTime.now().add(const Duration(days: 1)),
      'completed': false,
      'hasNotification': false,
    },
    {
      'title': 'Startup Pitch Day',
      'description': 'Стартаптардың инвесторлар алдында питчингі',
      'endDate': DateTime.now().subtract(const Duration(days: 1)),
      'completed': false,
      'hasNotification': false,
    },
    {
      'title': 'Hackathon',
      'description': '48 сағаттық кодтау марафоны',
      'endDate': null,
      'completed': false,
      'hasNotification': false,
    },
  ];

  // ignore: unused_field
  DateTime? _selectedDate;
  // ignore: unused_field
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _initNotifications();
  }

  Future<void> _initNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const settings = InitializationSettings(android: androidSettings);
    await flutterLocalNotificationsPlugin.initialize(settings);
  }

  Future<void> _scheduleNotification(
    int id,
    String title,
    String body,
    DateTime dateTime,
  ) async {
    if (dateTime.isBefore(DateTime.now())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Өткен күнге ескерту орнатылмайды!')),
      );
      return;
    }

    final androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

    final notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: events[index]['endDate'] ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        events[index]['endDate'] = picked;
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        final date = events[index]['endDate'] ?? DateTime.now();
        events[index]['endDate'] = DateTime(
          date.year,
          date.month,
          date.day,
          picked.hour,
          picked.minute,
        );
        _selectedTime = picked;
      });
    }
  }

  String _getRemainingTimeText(DateTime? endDate) {
    if (endDate == null) return 'Күн белгіленбеген';

    final now = DateTime.now();
    final difference = endDate.difference(now);

    if (difference.isNegative) return 'Мерзімі өтіп кеткен';
    if (difference.inDays == 0) return 'Бүгін аяқталады';
    if (difference.inDays <= 3) return '${difference.inDays} күн қалды';

    return DateFormat('yyyy-MM-dd').format(endDate);
  }

  Color _getStatusColor(DateTime? endDate) {
    if (endDate == null) return Colors.grey;
    final now = DateTime.now();
    final difference = endDate.difference(now);

    if (difference.isNegative) return Colors.red;
    if (difference.inDays <= 3) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Мерзімдер',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          final endDate = event['endDate'] as DateTime?;

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Notification Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        color:
                            event['hasNotification']
                                ? Colors.blue
                                : Colors.grey,
                        onPressed: () {
                          if (endDate != null) {
                            final notificationTime = endDate.subtract(
                              const Duration(hours: 1),
                            );
                            _scheduleNotification(
                              DateTime.now().millisecondsSinceEpoch % 100000,
                              'Ескерту: ${event['title']}',
                              'Мерзімі жақында аяқталады!',
                              notificationTime,
                            );
                            setState(() {
                              event['hasNotification'] = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Ескерту орнатылды!'),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(event['description']),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: _getStatusColor(endDate),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _getRemainingTimeText(endDate),
                        style: TextStyle(
                          color: _getStatusColor(endDate),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.calendar_month, size: 16),
                        label: const Text('Күн'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[100],
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: () => _selectDate(context, index),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.access_time, size: 16),
                        label: const Text('Уақыт'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[100],
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: () => _selectTime(context, index),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
