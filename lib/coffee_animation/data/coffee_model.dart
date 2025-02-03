class Coffee {
  Coffee({
    required this.name,
    required this.price,
    required this.image,
  });

  final String name;
  final String image;
  final Map<CoffeeSize, double> price;
}

enum CoffeeSize { large, mediam, small }

class CoffeeServices {
  static List<Coffee> coffees = [
    Coffee(
      name: "Caramel Cold Drink",
      price: {CoffeeSize.large: 22.0, CoffeeSize.mediam: 17.5},
      image: "assets/images/coffee_images/2.png",
    ),
    Coffee(
      name: "Black Tea Latte",
      price: {
        CoffeeSize.large: 12.0,
        CoffeeSize.mediam: 10.0,
        CoffeeSize.small: 8.0,
      },
      image: "assets/images/coffee_images/10.png",
    ),
    Coffee(
      name: "Iced Coffee Mocha",
      price: {
        CoffeeSize.large: 18.0,
        CoffeeSize.mediam: 16.0,
        CoffeeSize.small: 12.0,
      },
      image: "assets/images/coffee_images/3.png",
    ),
    Coffee(
      name: "Caramelized Pecan Latte",
      price: {
        CoffeeSize.large: 20.0,
        CoffeeSize.mediam: 16.0,
        CoffeeSize.small: 12.5,
      },
      image: "assets/images/coffee_images/4.png",
    ),
    Coffee(
      name: "Toffee Nut Latte",
      price: {
        CoffeeSize.large: 16.0,
        CoffeeSize.mediam: 15.0,
        CoffeeSize.small: 12.0,
      },
      image: "assets/images/coffee_images/5.png",
    ),
    Coffee(
      name: "Capuchino",
      price: {
        CoffeeSize.large: 14.0,
        CoffeeSize.mediam: 12.0,
        CoffeeSize.small: 10.0,
      },
      image: "assets/images/coffee_images/6.png",
    ),
    Coffee(
      name: "Classic Irish Coffee",
      price: {
        CoffeeSize.large: 12.0,
        CoffeeSize.mediam: 9.0,
        CoffeeSize.small: 7.0,
      },
      image: "assets/images/coffee_images/11.png",
    ),
    Coffee(
      name: "Americano",
      price: {
        CoffeeSize.large: 10.0,
        CoffeeSize.mediam: 8.0,
        CoffeeSize.small: 5.0,
      },
      image: "assets/images/coffee_images/8.png",
    ),
    Coffee(
      name: "Caramel Macchiato",
      price: {
        CoffeeSize.large: 18.0,
        CoffeeSize.mediam: 16.0,
        CoffeeSize.small: 12.0,
      },
      image: "assets/images/coffee_images/1.png",
    ),
    Coffee(
      name: "Vietnamese-Style Iced Coffee",
      price: {CoffeeSize.large: 18.0, CoffeeSize.mediam: 16.0},
      image: "assets/images/coffee_images/9.png",
    ),
    Coffee(
      name: "Toffee Nut Iced Latte",
      price: {CoffeeSize.large: 16.0, CoffeeSize.mediam: 14.0},
      image: "assets/images/coffee_images/7.png",
    ),
    Coffee(
      name: "Toffee Nut Crunch Latte",
      price: {
        CoffeeSize.large: 16.0,
        CoffeeSize.mediam: 13.0,
        CoffeeSize.small: 10.5,
      },
      image: "assets/images/coffee_images/12.png",
    ),
  ];
}
