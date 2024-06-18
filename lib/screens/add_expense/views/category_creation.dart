import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/data/data.dart';
import 'package:expense_tracker/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uuid/uuid.dart';

getCategoryCreation(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) {
      bool isExpanded = false;
      IconData? selectedIcon;
      Color categoryColor = Colors.white;
      TextEditingController categoryNameController = TextEditingController();
      TextEditingController categoryIconController = TextEditingController();
      TextEditingController categoryColorController = TextEditingController();
      bool isLoading = false;

      return BlocProvider.value(
        value: context.read<CreateCategoryBloc>(),
        child: StatefulBuilder(builder: (ctx, setState) {
          return BlocListener<CreateCategoryBloc, CreateCategoryState>(
            listener: (context, state) {
              if (state is CreateCategorySuccess) {
                Navigator.pop(ctx);
              } else if (state is CreateCategoryLoading) {
                setState(
                  () {
                    isLoading = true;
                  },
                );
              }
            },
            child: AlertDialog(
              title: const Text('Create a Category'),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: categoryNameController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: categoryIconController,
                      onTap: () async {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      textAlignVertical: TextAlignVertical.center,
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                        ),
                        fillColor: Colors.white,
                        hintText: 'Icon',
                        border: OutlineInputBorder(
                          borderRadius: isExpanded
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                )
                              : BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    isExpanded
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: icons.length,
                              itemBuilder: (context, int i) {
                                Color iconColor = selectedIcon == icons[i]
                                    ? Colors.blue
                                    : Colors.black;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIcon = icons[i];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      icons[i],
                                      color: iconColor, // 아이콘 색상 설정
                                      size: 24,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: categoryColorController,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx2) {
                            return BlocProvider.value(
                              value: context.read<CreateCategoryBloc>(),
                              child: AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ColorPicker(
                                      pickerColor: categoryColor,
                                      onColorChanged: (value) {
                                        setState(() {
                                          categoryColor = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: const Text(
                                          'Save Color',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      textAlignVertical: TextAlignVertical.center,
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: categoryColor,
                        hintText: 'Color',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: kToolbarHeight,
                      child: isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : TextButton(
                              onPressed: () {
                                // Create Category Object and Pop

                                Category category = Category.empty;
                                category.categoryId = Uuid().v1();
                                category.name = categoryNameController.text;
                                category.iconCodePoint =
                                    selectedIcon!.codePoint;
                                category.iconFontFamily =
                                    selectedIcon!.fontFamily!;
                                category.color = categoryColor.toString();
                                context
                                    .read<CreateCategoryBloc>()
                                    .add(CreateCategory(category));
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      );
    },
  );
}
