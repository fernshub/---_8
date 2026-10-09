import 'dart:async';
import 'package:flutter/material.dart';

class PrayerHeaderScreen extends StatefulWidget {
  const PrayerHeaderScreen({Key? key}) : super(key: key);

  @override
  State<PrayerHeaderScreen> createState() => _PrayerHeaderScreenState();
}

class _PrayerHeaderScreenState extends State<PrayerHeaderScreen>import 'package:flutter/material.dart';

class VerticalPrayerScreen extends StatefulWidget {
  const VerticalPrayerScreen({Key? key}) : super(key: key);

  @override
  State<VerticalPrayerScreen> createState() => _VerticalPrayerScreenState();
}

class _VerticalPrayerScreenState extends State<VerticalPrayerScreen> {
  // قائمة الصلوات مع حالة التنبيه (مفعلة أو معطلة)
  final List<Map<String, dynamic>> _prayers = [
    {'name': 'الفجر', 'time': '05:45 ص', 'enabled': true, 'icon': Icons.nightlight_round},
    {'name': 'الشروق', 'time': '07:05 ص', 'enabled': false, 'icon': Icons.wb_sunny_outlined},
    {'name': 'الظهر', 'time': '12:27 م', 'enabled': true, 'icon': Icons.wb_sunny},
    {'name': 'العصر', 'time': '03:29 م', 'enabled': true, 'icon': Icons.cloud_outlined},
    {'name': 'المغرب', 'time': '06:59 م', 'enabled': true, 'icon': Icons.nights_stay_outlined},
    {'name': 'العشاء', 'time': '08:25 م', 'enabled': true, 'icon': Icons.bedtime},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20), // الخلفية الخضراء الإسلامية
      body: Directionality(
        textDirection: TextDirection.rtl, // دعم اللغة العربية
        child: Column(
          children: [
            // 1. القسم العلوي (الخلفية الخضراء والمعلومات الرئيسية)
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // شريط الأزرار والموقع
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'دبي',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  
                  // اسم الصلاة القادمة والأيقونة
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'العصر',
                        style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.wb_sunny_rounded, color: Colors.amber, size: 22),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // الوقت بخط كبير بارز
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '03:29',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  
                  // موعد الصلاة القادمة
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'موعد الصلاة القادمة 17:50',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            // 2. القسم السفلي (القائمة البيضاء العمودية)
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // شريط التاريخ الهجري مع أزرار التنقل
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                            onPressed: () {},
                          ),
                          const Text(
                            '09 ذو الحجة، 1446هـ',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: Colors.black12),

                    // قائمة أوقات الصلوات العمودية
                    Expanded(
                      child: ListView.builder(
                        itemCount: _prayers.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        itemBuilder: (context, index) {
                          final prayer = _prayers[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // خانة الاختيار (Checkbox) لتفعيل التنبيه
                                Checkbox(
                                  value: prayer['enabled'],
                                  activeColor: Colors.green.shade700,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _prayers[index]['enabled'] = value ?? false;
                                    });
                                  },
                                ),
                                
                                // وقت الصلاة
                                Text(
                                  prayer['time'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                
                                // اسم الصلاة والأيقونة بجانبها
                                Row(
                                  children: [
                                    Text(
                                      prayer['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Icon(prayer['icon'], color: Colors.green.shade700, size: 22),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 {
  // عداد تنازلي تجريبي (بالثواني) لنفترض أن الوقت المتبقي هو 29 دقيقة و 19 ثانية
  late Timer _timer;
  int _secondsRemaining = 1759; 

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  // دالة تشغيل العد التنازلي التلقائي
  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _secondsRemaining = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // تنسيق الثواني إلى صيغة HH:MM:SS
  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // قائمة الصلوات اليومية لعرضها في الشريط الأفقي
    final List<Map<String, String>> prayers = [
      {'name': 'الفجر', 'time': '04:40 AM'},
      {'name': 'الشروق', 'time': '06:02 AM'},
      {'name': 'الظهر', 'time': '11:55 AM'},
      {'name': 'العصر', 'time': '03:10 PM'},
      {'name': 'المغرب', 'time': '05:39 PM'},
      {'name': 'العشاء', 'time': '06:54 PM'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // خلفية داكنة عصرية
      body: Directionality(
        textDirection: TextDirection.rtl, // دعم اللغة العربية من اليمين لليسار
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. رأس التطبيق مع الخلفية المتدرجة والعداد التنازلي
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 45, bottom: 25, left: 16, right: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE65C00), Color(0xFFF9D423)], // تدرج وقت الغروب الذهبي
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    // شريط العلوي (الإشعارات، الموقع، القائمة)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_active, color: Colors.white),
                          onPressed: () {},
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.amberAccent, size: 16),
                              SizedBox(width: 5),
                              Text(
                                'بغداد، العراق',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.grid_view_rounded, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    
                    // نص إعلان الصلاة القادمة
                    const Text(
                      'المغرب بعد',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // مؤقت العد التنازلي
                    Text(
                      _formatTime(_secondsRemaining),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),

              // 2. شريط أوقات الصلاة الأفقي المتحرك
              SizedBox(
                height: 105,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: prayers.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, index) {
                    final prayer = prayers[index];
                    bool isCurrentPrayer = prayer['name'] == 'المغرب'; // تمييز الصلاة القادمة
                    
                    return Container(
                      width: 85,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isCurrentPrayer 
                            ? const Color(0xFFE65C00).withOpacity(0.25) 
                            : Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isCurrentPrayer ? const Color(0xFFE65C00) : Colors.white12,
                          width: isCurrentPrayer ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            prayer['name']!,
                            style: TextStyle(
                              color: isCurrentPrayer ? Colors.orangeAccent : Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Icon(Icons.access_time_filled, color: Colors.amber, size: 18),
                          const SizedBox(height: 6),
                          Text(
                            prayer['time']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}