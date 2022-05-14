import '../generated/l10n.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_dropdown_categories.dart';
import '../widgets/custom_scrollview_products.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).AppTitle, hasActions: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const CustomDropDownCategories(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height - 210,
                  width: MediaQuery.of(context).size.width,
                ),
                child: CustomScrollViewProducts(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
