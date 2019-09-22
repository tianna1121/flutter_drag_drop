import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/bloc/cartListBloc.dart';
import 'package:flutter_drag_drop/model/footItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => CartListBloc())],
      child: MaterialApp(
        title: 'Food Deliver',
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
              SizedBox(
                height: 45.0,
              ),
              for (var foodItem in fooditemList.foodItems)
                ItemContainer(foodItem: foodItem)
            ],
          ),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  final FoodItem foodItem;

  ItemContainer({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Items(
          hotel: foodItem.hotel,
          itemName: foodItem.title,
          itemPrice: foodItem.price,
          imgUrl: foodItem.imgUrl,
          leftAligned: (foodItem.id % 2 == 0) ? true : false),
    );
  }
}

class Items extends StatelessWidget {
  final bool leftAligned;
  final String imgUrl;
  final double itemPrice;
  final String itemName;
  final String hotel;

  Items(
      {@required this.leftAligned,
      @required this.imgUrl,
      @required this.itemName,
      @required this.itemPrice,
      @required this.hotel});
  @override
  Widget build(BuildContext context) {
    double containerPadding = 45.0;
    double containerBorderRadius = 10.0;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: leftAligned ? 0 : containerPadding,
              right: leftAligned ? containerPadding : 0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : Radius.circular(0),
                  ),
                  child: Image.network(imgUrl, fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: leftAligned ? 20 : 0, right: leftAligned ? 0 : 20),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(
            height: 30.0,
          ),
          title(),
          SizedBox(
            height: 30.0,
          ),
          searchBar(),
          SizedBox(
            height: 30.0,
          ),
          categories(),
        ],
      ),
    );
  }
}

Widget categories() {
  return Container(
    height: 185.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Pizza",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Rolls",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
      ],
    ),
  );
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              hintStyle: TextStyle(color: Colors.black87)),
        ),
      )
    ],
  );
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        width: 45,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Food',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
          ),
          Text(
            'Delivery',
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30.0),
          )
        ],
      ),
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.menu),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Text('0'),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.yellow[800],
                  borderRadius: BorderRadius.circular(50.0)),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  CategoryListItem(
      {@required this.categoryIcon,
      @required this.categoryName,
      @required this.availability,
      @required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: selected ? Color(0xfffeb324) : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[100],
              blurRadius: 5.0,
              offset: Offset(25, 0),
              spreadRadius: 5.0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: selected ? Colors.transparent : Colors.grey,
                  width: 1.5),
            ),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            categoryName,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          )
        ],
      ),
    );
  }
}
