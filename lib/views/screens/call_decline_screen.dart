import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Declined Screen',
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF13DAEC),
          background: const Color(0xFFF6F8F8),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Spline Sans'),
          bodyMedium: TextStyle(fontFamily: 'Spline Sans'),
          titleLarge: TextStyle(fontFamily: 'Spline Sans'),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF13DAEC),
          brightness: Brightness.dark,
          background: const Color(0xFF102022),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Spline Sans'),
          bodyMedium: TextStyle(fontFamily: 'Spline Sans'),
          titleLarge: TextStyle(fontFamily: 'Spline Sans'),
        ),
      ),
      home: const CallDeclinedScreen(),
    );
  }
}

class CallDeclinedScreen extends StatelessWidget {
  const CallDeclinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF102022) : const Color(0xFFF6F8F8);
    final primaryColor = const Color(0xFF13DAEC);
    final whiteWithOpacity = Colors.white.withOpacity(0.6);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Close Button
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              onPressed: () {
                // Handle close action
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(),
              ),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),

          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Profile Picture with Call End Icon
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBUMXL3aY-yukLzAF0kbTK9HR8eo8D3UnUHs1ni1MkIOC_jcfg0I4Vzy9q9VufpIUWgi9paYwpnvYM4i35tUmzldk5iCQnn3iEDJzpnw5FwIMiMT3e2o5YoYNAICHWfZSZWNckX-G2hVKEAOh1VvrMYtw1zEpsEGkgpbDP6tSjNhIQZWkOyzmIEQ7v7gui_aQOf-R8gUO0XnMlN4dln5Sqz4_tV_o9WlknsA2lvC5kh9WZHAiWE6nhu05JuerzEN3xbtJAnYroMd9',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -8,
                              right: -8,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF102022),
                                    width: 4,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.call_end,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Name and Status
                        const Column(
                          children: [
                            Text(
                              'Jane Doe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Spline Sans',
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Call Declined',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Spline Sans',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Action Buttons
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        // Message Button
                        Expanded(
                          child: Container(
                            height: 56,
                            margin: const EdgeInsets.only(right: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle message action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Message',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Spline Sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Call Back Button
                        Expanded(
                          child: Container(
                            height: 56,
                            margin: const EdgeInsets.only(left: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle call back action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Color(0xFF102022),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Call Back',
                                    style: TextStyle(
                                      color: Color(0xFF102022),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Spline Sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}