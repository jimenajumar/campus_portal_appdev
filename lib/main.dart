import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
  class MyApp extends StatefulWidget {
    const MyApp({super.key});

    @override
    State<MyApp> createState() =>
    _MyAppState();
  }
  class _MyAppState extends State<MyApp> {
    final PageController _pageController = PageController();
    int _currentPage = 0;
    Timer? _slideTimer;
    @override
    void initState() {
      super.initState();
      _slideTimer = Timer.periodic(
        const Duration(seconds: 4), (timer) {
          if (!
          _pageController.hasClients) return;
          _pageController.animateToPage((_currentPage + 1) % 4,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          );
        }
      );
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white, body: SingleChildScrollView(
          child: Column( children: [Container (height: 210, width: double.infinity, decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
          ),
          image: DecorationImage(image: AssetImage('assets/building.png'),
          fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(child: Padding( padding: const EdgeInsets.all(20), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[const Icon(Icons.menu, color: Colors.blue, size:30,
        ),
        const Text('Campus Portal', style: TextStyle( color:Colors.white, fontSize: 21, fontWeight:FontWeight.bold,),
        ),
        const Icon(Icons.notifications, color: Colors.blue, size: 28,),
        ],
        ),
        ),
        ),
        ),
        Padding( padding: const EdgeInsets.all(20), child: TextField(decoration: InputDecoration(hintText: 'What are you looking for?', prefixIcon :const Icon( Icons.search, color: Color(0xFF991B1B),
        ),
        filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none,
        ),
        ),
        ),
        ),
        Padding( padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Explore Campus', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
          ),
          ),
          const Text('See all',
          style: TextStyle(color: Color(0xFF991B1B),
          ),
          ),
        ]
        ),
        ),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const 
          NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(4),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1.5,
          children: [
            _featureCard(Icons.calendar_month,'Schedule'),
            _featureCard(Icons.event,'Events'),
            _featureCard(Icons.campaign,'Announcements'),
            _featureCard(Icons.cloud,'Weather'),
            _featureCard(Icons.groups,'Clubs'),
            _featureCard(Icons.meeting_room,'Rooms'),
            _featureCard(Icons.person,'Profile'),
            _featureCard(Icons.person,'Logout'),
          ],
        ),
        const Padding( padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Campus Updates',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
          ),
          ),
        ),
        ),
        SizedBox(
          height: 150,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState((){
                _currentPage = index;
              });
            },
            children: [
              _updateCard(Icons.event,'Upcoming Events', 'Check out the latest campus activities',
              ),
              _updateCard(
                Icons.cloud,'Weather', 'See the latest weather updates',
              ),
              _updateCard(
                Icons.campaign,'Announcements', 'Stay updated with school announcements',
              ),
              _updateCard(
                Icons.schedule,'Class Schedule', 'Check your upcoming classes',
              ),
            ],
          ),
        ),
        ],
        ),
        ),
      ),
      );
    }
    Widget _featureCard(IconData icon, String title) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(5),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.red),
          const SizedBox(height: 2),
          Text(
            title, style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 11
            ),
          ),
        ],
        ),
      );
    }
    Widget _updateCard(IconData icon, String title, String description) {
      return Container(
        margin: const EdgeInsets. symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(
            color: Colors.black12, blurRadius: 5, offset: Offset(0, 3),
          )
          ]
        ),
        child: Row(children: [
          Icon(icon, size: 35, color: Colors.red),
          const SizedBox(width: 15),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title, style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5), Text(description),
          ],
          ),
          ),
        ],
        )
      );
    }
    @override
    void dispose() {
      _slideTimer?.cancel();
      _pageController.dispose();
      super.dispose();
    }
  }  
