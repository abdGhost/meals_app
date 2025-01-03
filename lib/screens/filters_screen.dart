import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool glutenFreeFilterSet;
  late bool lactoseFreeFilterSet;
  late bool vegetarianFilterSet;
  late bool veganFilterSet;

  @override
  void initState() {
    super.initState();
    glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree] ?? false;
    lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree] ?? false;
    vegetarianFilterSet = widget.currentFilters[Filter.vegetarian] ?? false;
    veganFilterSet = widget.currentFilters[Filter.vegan] ?? false;
  }

  void _updateFilter(Filter filter, bool value) {
    setState(() {
      switch (filter) {
        case Filter.glutenFree:
          glutenFreeFilterSet = value;
          break;
        case Filter.lactoseFree:
          lactoseFreeFilterSet = value;
          break;
        case Filter.vegetarian:
          vegetarianFilterSet = value;
          break;
        case Filter.vegan:
          veganFilterSet = value;
          break;
      }
    });
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool currentValue,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      value: currentValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) async {
          if (didPop) return;

          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegetarian: vegetarianFilterSet,
            Filter.vegan: veganFilterSet,
          });
        },
        child: Column(
          children: [
            _buildSwitchListTile(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              currentValue: glutenFreeFilterSet,
              onChanged: (value) => _updateFilter(Filter.glutenFree, value),
            ),
            _buildSwitchListTile(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              currentValue: lactoseFreeFilterSet,
              onChanged: (value) => _updateFilter(Filter.lactoseFree, value),
            ),
            _buildSwitchListTile(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              currentValue: vegetarianFilterSet,
              onChanged: (value) => _updateFilter(Filter.vegetarian, value),
            ),
            _buildSwitchListTile(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              currentValue: veganFilterSet,
              onChanged: (value) => _updateFilter(Filter.vegan, value),
            ),
          ],
        ),
      ),
    );
  }
}
