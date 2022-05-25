import 'package:flutter/material.dart';

import '../../../config/constrants.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/custom_appbar.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.2),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                title: S.of(context).title_create_category_screen,
                hasActions: false),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kPaddingM),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Categorias',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPaddingL, vertical: kPaddingS),
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nombre de la categoría',
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.6),
                        child: MaterialButton(
                          textColor: Theme.of(context).primaryColorLight,
                          color: Theme.of(context).primaryColor,
                          elevation: 10,
                          onPressed: () {},
                          child: const Text(
                            'Guardar',
                          ),
                        ),
                      ),
                      const Divider(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
