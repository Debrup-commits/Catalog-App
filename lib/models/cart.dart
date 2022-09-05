import 'package:catalog_app/models/catalog.dart';

class CartModel{

  //catalog field
  late CatalogModel _catalog;

  //collection of IDs
  final List<int> _itemIds=[];

  CatalogModel get catalog=>_catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }

  //get items in the cart
  List<Item> get items=>_itemIds.map((id) => _catalog.getById(id)).toList();

  //get Total Price
  num get totalprice=>items.fold(0, (total, current)=>total+current.price);

  //add Item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //remove Item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}