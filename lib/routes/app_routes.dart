import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/categories_screen.dart';
import '../screens/home/products_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/history/history_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const categories = '/categories';
  static const products = '/products';
  static const cart = '/cart';
  static const profile = '/profile';
  static const history = '/history';

  static final routes = <String, WidgetBuilder>{
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    home: (_) => const HomeScreen(),
    categories: (_) => const CategoriesScreen(),
    products: (_) => const ProductsScreen(),
    cart: (_) => const CartScreen(),
    profile: (_) => const ProfileScreen(),
    history: (_) => const HistoryScreen(),
  };
}
