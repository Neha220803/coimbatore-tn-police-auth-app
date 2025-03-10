import 'package:auth_tn/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TN Police Authenticator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // Using the official Tamil Nadu Police logo colors
          colorScheme: ColorScheme(
            // Midnight Blue - primary background color from the logo
            primary: const Color(0xFF222671),
            // Delft Blue - variant of blue from the logo for contrast
            secondary: const Color(0xFF373566),
            // Bittersweet - red color from the banner
            error: const Color(0xFFFA4E4E),
            // Lion color - for neutral elements
            surface: const Color(0xFFB6966F),
            // Orange from the logo/flag
            tertiary: const Color(0xFFF18121),
            // Background using Midnight Blue
            background: const Color(0xFF222671),
            // Lighter variant of Midnight Blue for containers
            primaryContainer: const Color(0xFF2A2E85),
            // Lighter variant of Delft Blue for secondary containers
            secondaryContainer: const Color(0xFF43417A),
            // White for text on dark backgrounds
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onBackground: Colors.white,
            // Dark text for orange elements
            onTertiary: Colors.black,
            // Dark text for lion color elements
            onSurface: const Color(0xFF222222),
            // White on error
            onError: Colors.white,
            // Light colors for container text
            onPrimaryContainer: Colors.white,
            onSecondaryContainer: Colors.white,
            // Default brightness
            brightness: Brightness.dark,
            // Other required colors with sensible defaults
            errorContainer: const Color(0xFFFA4E4E).withOpacity(0.7),
            onErrorContainer: Colors.white,
            tertiaryContainer: const Color(0xFFF18121).withOpacity(0.7),
            onTertiaryContainer: Colors.black,
            surfaceVariant: const Color(0xFFB6966F).withOpacity(0.7),
            onSurfaceVariant: Colors.black,
            outline: Colors.white70,
            outlineVariant: Colors.white30,
            scrim: Colors.black,
            inversePrimary: Colors.white,
            inverseSurface: Colors.white,
            onInverseSurface: const Color(0xFF222671),
            shadow: Colors.black,
            surfaceTint: const Color(0xFF222671),
          ),
          // Text theme
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
            ),
          ),
          // Button theme with Bittersweet color
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFA4E4E), // Bittersweet
              foregroundColor: Colors.white, // White text on red buttons
            ),
          ),
          // Set scaffold background to Midnight Blue
          scaffoldBackgroundColor: const Color.fromARGB(255, 6, 7, 29),
          // App bar with Midnight Blue
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF222671),
            foregroundColor: Colors.white,
          ),
        ),
        home: const LoginPage());
  }
}
