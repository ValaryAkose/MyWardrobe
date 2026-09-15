import 'package:flutter/material.dart';
import '../wardrobe/add_item_screen.dart';
import '../../app/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning',
                          style: TextStyle(
                            fontSize: 14,
                            color: MyWardrobeColors.secondaryText,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'My Wardrobe',
                          style: TextStyle(
                            fontFamily: 'DM Serif Display',
                            fontSize: 30,
                            color: MyWardrobeColors.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: MyWardrobeColors.lavender,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.person_outline_rounded,
                      color: MyWardrobeColors.text,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Today’s look',
                style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 28,
                  color: MyWardrobeColors.text,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  color: MyWardrobeColors.lavender,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.checkroom_outlined,
                        size: 58,
                        color: MyWardrobeColors.violet,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Your first outfit is waiting.',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: MyWardrobeColors.text,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Add clothes to get personalized looks.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: MyWardrobeColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: _StatCard(value: '0', label: 'Pieces'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(value: '0', label: 'Outfits'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(value: '0', label: 'Favorites'),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddItemScreen()),
                    );
                  },
                  icon: const Icon(Icons.add_rounded),
                  label: const Text(
                    'Add your first item',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyWardrobeColors.text,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: MyWardrobeColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: MyWardrobeColors.border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'DM Serif Display',
              fontSize: 24,
              color: MyWardrobeColors.text,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: MyWardrobeColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
