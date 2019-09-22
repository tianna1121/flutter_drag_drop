import 'package:flutter_drag_drop/model/footItem.dart';

class CartProvider {
  List<FoodItem> foodItems = [];

  List<FoodItem> addToList(FoodItem foodItem) {
    foodItems.add(foodItem);
    return foodItems;
  }

  List<FoodItem> removeFromList(FoodItem foodItem) {
    foodItems.remove(foodItem);
    return foodItems;
  }
}
