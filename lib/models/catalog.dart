class CatalogModel{
  static List<Item> items=[
    Item(
      id:1,
      name:"iphone 12",
      desc: "apple",
      price: 999,
      color: "#33505a",
      image: "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/ios/iphoto/ios15-iphone13-pro-home-camera-callout.png",

    )];
  //get item by id
      Item getById(int id)=>items.firstWhere((element) =>element.id==id,orElse:null);

//    get item by position
      Item getItemByPosition(int pos)=>items[pos];

}



class Item{
  late final num id;
  late final String name;
  late final String desc;
  late final num price;
  late final String color;
  late final String image;

  Item({required this.id,required this.name,required this.desc,required this.price,required this.color,required this.image,});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap()=>{
    "id":id,
    "name":name,
    "dsec":desc,
    "price":price,
    "color":color,
    "image":image,
  };


}
