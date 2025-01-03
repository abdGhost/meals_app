import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavtoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer favorites');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal is added to favorites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorites: _toggleMealFavtoriteStatus,
    );
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        onToggleFavorites: _toggleMealFavtoriteStatus,
        meals: _favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
        ),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
              semanticLabel: 'Categories',
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              semanticLabel: 'Favorites',
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
