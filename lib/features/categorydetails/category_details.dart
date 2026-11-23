import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;

  final List<String> categories = [
    "Mohamed",
    "mahmoud",
    "Magdy",
    "marawan",
    "Mazin",
    "Maged",
    "Montasr",
    "Moataz",
    "Moamen",
    "Molhm",
  ];

  final List<Map<String, String>> subItems = [
    {
      "name": "item1",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item2",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item3",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item4",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item5",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item6",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item7",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item8",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item9",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
    {
      "name": "item10",
      "image": "https://alfallahalyoum.news/wp-content/uploads/2021/09/5-9.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // القائمة الشمال
            Container(
              width: 115.w,
              color: Appcolors.opacity30,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      color: isSelected ? Colors.white : Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 8.w),
                      child: Row(
                        children: [
                          if (isSelected)
                            Container(
                              width: 4.w,
                              height: 28.h,
                              margin: EdgeInsets.only(right: 6.w),
                              color: Appcolors.Primary,
                            ),
                          Expanded(
                            child: Text(
                              // categories[index].title,
                              categories[index],
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: Appcolors.darkPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // الجزء اليمين (البانر + GridView)
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories[selectedIndex],
                      // categories[selectedIndex].title,
                      style: Appstyles.font18darkprimaryBold,
                    ),
                    SizedBox(height: 22.h),
                    Expanded(
                      child: GridView.builder(
                        itemCount: subItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.w,
                          crossAxisSpacing: 10.w,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (context, idx) {
                          return Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(subItems[idx]["image"]!,
                                      // subItems[idx].image,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subItems[idx]["name"]!,
                                // subItems[idx].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
