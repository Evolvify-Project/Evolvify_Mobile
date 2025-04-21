import 'package:flutter/material.dart';

class PopularSkillgridView extends StatelessWidget {
  const PopularSkillgridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 4,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.3 / 3,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 17,
      ),
      itemBuilder: (context, index) {
        return Container(color: Colors.amber);
      },
    );
  }
}
        
        
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(12),
        //   child: AspectRatio(
        //     aspectRatio: 1 / 2,
        //     child:Image.asset(Assets.imagesSkill2)
            
            // CachedNetworkImage(
            //   imageUrl: Assets.imagesSkill2,
            //   fit: BoxFit.fill,
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            //   placeholder:
            //       (context, url) =>
            //           const Center(child: CircularProgressIndicator()),
            // ),
         