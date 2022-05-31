import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/custom_button_gradiant.dart';
import '../../../widgets/custom_image_container.dart';
import '/blocs/blocs.dart';

class PicturesScreen extends StatelessWidget {
  final TabController tabController;

  const PicturesScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingLoaded) {
          var images = state.user.imageUrls;
          var imageCount = images.length;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seleccionar foto de perfil',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: (imageCount > 0)
                            ? CustomImageContainer(imageUrl: images[0])
                            : const CustomImageContainer()
                        // child: GridView.builder(
                        //   gridDelegate:
                        //       const SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 2,
                        //     childAspectRatio: 0.66,
                        //   ),
                        //   itemCount: 1,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return (imageCount > index)
                        //         ? CustomImageContainer(imageUrl: images[index])
                        //         : const CustomImageContainer();
                        //   },
                        // ),
                        ),
                  ],
                ),
                //
                CustomButtonGradiant(
                  height: 45,
                  width: 150,
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  text: Text(
                    S.of(context).bttn_register,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                ),
              ],
            ),
          );
        } else {
          return Text(S.of(context).error_desc);
        }
      },
    );
  }
}
