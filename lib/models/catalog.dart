class CatalogModel{
   static final items=[
    Item(
      id:1,
      name:"iphone 12",
      desc: "apple",
      price: 999,
      color: "#33505a",
      image: "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/ios/iphoto/ios15-iphone13-pro-home-camera-callout.png",
    )];
}



class Item{
  late final num id;
  late final String name;
  late final String desc;
  late final num price;
  late final String color;
  late final String image;

  Item({required this.id,required this.name,required this.desc,required this.price,required this.color,required this.image,});
}
