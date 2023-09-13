// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(initialRoute: "/main", routes: {
    "/main": (context) => const MyApp(),
    "/fitness": (context) => const FitnessPage(),
    "/profile": (context) => const ProfilePage(),
    "/chat": (context) => const ChatPage(),
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stay Healthy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xFFCA411B),
      ),
      home: const MyHomePage(title: "Hallo Ugo"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const FitnessTracker(index: 0),
    const FitnessPage(),
    const ProfilePage(),
    const ChatPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Fitness',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FitnessTracker extends StatefulWidget {
  final int index;
  const FitnessTracker({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<FitnessTracker> createState() => _FitnessTrackerState();
}

class _FitnessTrackerState extends State<FitnessTracker> {
  List<int> counters = [0, 0, 0];

  void _incrementCounter(int i) {
    setState(() {
      i = 0;
      counters[i]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const text = Text("Fitness Tracker");
    return Scaffold(
      appBar: AppBar(
        title: text,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 36),
        child: Column(
          children: [
            TrackingElement(
              color: const Color.fromARGB(255, 222, 237, 11),
              iconData: Icons.directions_run,
              unit: 'm',
              onTap: () {
                _incrementCounter(0);
              },
              counter: (0),
            ),
            const SizedBox(height: 20),
            TrackingElement(
              color: const Color.fromARGB(255, 17, 50, 234),
              iconData: Icons.local_drink,
              unit: 'l',
              onTap: () {
                _incrementCounter(0);
              },
              counter: (1),
            ),
            const SizedBox(height: 20),
            TrackingElement(
              color: const Color.fromARGB(255, 9, 240, 79),
              iconData: Icons.fastfood,
              unit: 'cal',
              onTap: () {
                _incrementCounter(2);
              },
              counter: (2),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackingElement extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String unit;
  final VoidCallback onTap;
  final int counter;

  const TrackingElement({
    Key? key,
    required this.color,
    required this.iconData,
    required this.unit,
    required this.onTap,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.black,
                  size: 55,
                ),
                const SizedBox(width: 10),
                Text(
                  '$counter/ 5000 $unit',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
          LinearProgressIndicator(
            value: counter / 5000,
            backgroundColor: Colors.white,
            minHeight: 10.0,
          ),
        ],
      ),
    );
  }
}

class FitnessPage extends StatelessWidget {
  const FitnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness Videos"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Fitness Videos anzeigen und an Live-Kursen teilnehmen',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Profil erstellen, Profilbild hochladen oder mit der Kamera aufnehmen.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Chat-Raum',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
