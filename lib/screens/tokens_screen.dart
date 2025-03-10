import 'package:auth_tn/util/constants.dart';
import 'package:flutter/material.dart';

class TokensPage extends StatelessWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample token data
    final List<AuthToken> tokens = [
      AuthToken(
        name: 'Police HQ',
        account: 'officer123',
        code: '235',
        timeRemaining: 23,
        maxTime: 30,
      ),
      AuthToken(
        name: 'Station Access',
        account: 'officer123',
        code: '892',
        timeRemaining: 15,
        maxTime: 30,
      ),
      AuthToken(
        name: 'Database Login',
        account: 'officer123',
        code: '627',
        timeRemaining: 8,
        maxTime: 30,
      ),
      AuthToken(
        name: 'Evidence Room',
        account: 'officer123',
        code: '154',
        timeRemaining: 27,
        maxTime: 30,
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search tokens...',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFF002A55),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tokens.length,
            itemBuilder: (context, index) {
              return TokenCard(token: tokens[index]);
            },
          ),
        ),
      ],
    );
  }
}

class AuthToken {
  final String name;
  final String account;
  final String code;
  final int timeRemaining;
  final int maxTime;

  AuthToken({
    required this.name,
    required this.account,
    required this.code,
    required this.timeRemaining,
    required this.maxTime,
  });
}

class TokenCard extends StatelessWidget {
  final AuthToken token;

  const TokenCard({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      color: const Color(0xFF002A55),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFF003366),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: orange,
                  child: Icon(
                    Icons.shield,
                    color: Color(0xFF001F3F),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        token.name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        token.account,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  token.code,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: orange,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: token.timeRemaining / token.maxTime,
                backgroundColor: const Color(0xFF003366),
                valueColor: AlwaysStoppedAnimation<Color>(
                  token.timeRemaining > 10 ? orange : bittersweet,
                ),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Refreshes in ${token.timeRemaining}s',
                  style: TextStyle(
                    fontSize: 12,
                    color: token.timeRemaining > 10
                        ? Colors.grey[400]
                        : Colors.red[300],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
