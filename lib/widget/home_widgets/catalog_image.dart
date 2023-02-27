import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widget/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) :assert(image!=null);
  @override
  Widget build(BuildContext context) {
    return Image.network(image,
    ).box.rounded.p16.color(MyTheme.creamColor).make().p16();
  }
}
