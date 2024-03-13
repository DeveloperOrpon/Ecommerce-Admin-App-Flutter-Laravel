// import 'package:ashique_admin_app/config/appConst.dart';
// import 'package:ashique_admin_app/controller/productAddController.dart';
// import 'package:ashique_admin_app/controller/productController.dart';
// import 'package:ashique_admin_app/view/modal/addCategory.dart';
// import 'package:chips_choice/chips_choice.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../model/Category.dart';
//
// showCategoryDialog(BuildContext context) {
//   final productController = Get.put(ProductController());
//   final productAddController = Get.put(ProductAddController());
//   showModalBottomSheet(
//     context: context,
//     builder: (context) => Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     'Choose Category',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: Icon(CupertinoIcons.xmark))
//               ],
//             ),
//             Expanded(child: Obx(() {
//               return ChipsChoice<CategoryModel>.multiple(
//                 key: UniqueKey(),
//                 alignment: WrapAlignment.center,
//                 scrollPhysics: BouncingScrollPhysics(),
//                 choiceCheckmark: true,
//                 verticalDirection: VerticalDirection.down,
//                 value: productController.allCategoryList.value,
//                 onChanged: (value) {
//
//                 },
//                 // onChanged: (val) =>
//                 // productAddController.selectedCategory.value = val,
//                 choiceStyle: C2ChipStyle.toned(
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(5),
//                   ),
//                 ),
//                 wrapped: true,
//                 choiceItems: C2Choice.listFrom<CategoryModel, CategoryModel>(
//                   // avatarImage: (index, item) => AssetImage(appLogo),
//                   source:productController.allCategoryList.value,
//                   value: (i, v) => v,
//                   label: (i, v) => v.name.toString(),
//                 ),
//               );
//             })),
//             OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6))),
//                 onPressed: () {
//                   showAddCategoryDialog(context);
//                 },
//                 label: const Text('Add New Category'),
//                 icon: const Icon(CupertinoIcons.add)),
//             CupertinoButton(
//               color: Theme.of(context).colorScheme.primary,
//               child: const Text(
//                 'Select',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {},
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
