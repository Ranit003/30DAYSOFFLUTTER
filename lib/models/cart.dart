import 'catalog.dart';

class CartModel{
  late CatalogModel _catalog;
  //collection of ids
  final List<int> _itemIds=[];
  static final cartModel=CartModel._internal();
  CartModel._internal();
  factory CartModel()=>cartModel;


  CatalogModel get catalog=>_catalog;

   set catalog(CatalogModel newCatalog){
     assert(newCatalog!=null);
     _catalog=newCatalog;
   }
   //get items in the cart
  List<Item> get items=>_itemIds.map((id)=>_catalog.getById(id)).toList();

  //get total price
  num get totalPrice=>items.fold(0, (total,current)=>total+current.price);

  //add item
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }
  //item remove
  void remove(Item item){
    _itemIds.remove(item.id);
  }

  void add(Item catalog) {}



}