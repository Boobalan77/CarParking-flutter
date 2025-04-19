import 'package:flutter/material.dart';

class MumbaiPlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mumbai Places')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 3 columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return ImageCard(
              imageUrl:
                  'assets/mumbai/image${index + 1}.jpg', // Local asset images
              text: _getTextForCard(index),
              onTap: () {
                // Handle card tap (add navigation or action here)
                print('Card ${index + 1} tapped!');
              },
            );
          },
        ),
      ),
    );
  }
}

String _getTextForCard(int index) {
  switch (index) {
    case 0:
      return 'Gateway';
    case 1:
      return 'Shivaji';
    case 2:
      return ' Pagoda ';
    case 3:
      return 'ISKCON Temple';
    case 4:
      return 'Stmary Church';
    default:
      return 'ElleysWorld';
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final VoidCallback onTap;

  ImageCard({required this.imageUrl, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imageUrl, // Using local assets
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.2), // Low opacity overlay
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
