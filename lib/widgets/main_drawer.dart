import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  Widget _buildListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: theme.colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onBackground,
          fontSize: 24,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: theme.colorScheme.primary,
                  size: 48,
                ),
                const SizedBox(width: 10),
                Text(
                  'Cooking up!',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          _buildListTile(
            context: context,
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () => onSelectScreen('meals'),
          ),
          _buildListTile(
            context: context,
            icon: Icons.settings,
            title: 'Filters',
            onTap: () => onSelectScreen('filters'),
          ),
        ],
      ),
    );
  }
}
