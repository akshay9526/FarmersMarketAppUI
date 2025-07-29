
import 'package:farmersmarket/constants/AppConstants.dart';
import 'package:farmersmarket/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/products.dart';
import '../widgets/buildDropdownField.dart';
import '../widgets/buildMultiTextField.dart';
import '../widgets/buttonWidget.dart';
import '../widgets/custom_form_fields.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  TextEditingController descController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _selectedFruit;
  final List<String> fruits = [
    'Seeds',
    'Seedlings',
    'Machinary',
    'Hire Worker',
    'Cultivation Process',
    'Crop Disease Solutions'
  ];

  String? _selectedunitQuant;
  final List<String> unitQuant = ['Unit', 'Quantity'];

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.addnewproduct),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/addnew.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      hintText: AppConstants.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z]+|\s"),
                        )
                      ],
                      validator: (val) {
                        if (null != val && !val.isValidName) {
                          return AppConstants.product_name;
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: buildDropdownField<String>(
                        context: context,
                        validator: (val) =>
                            val == null ? AppConstants.select_category : null,
                        label: AppConstants.select_category,
                        value: _selectedFruit,
                        items: fruits,
                        onChanged: (val) =>
                            setState(() => _selectedFruit = val),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                MaterialButton(
                                  height: 40,
                                  minWidth: 40,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      itemCount++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "$itemCount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ),
                                MaterialButton(
                                  height: 40,
                                  minWidth: 40,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      if (itemCount > 1) {
                                        itemCount--;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8), // Space between fields
                          Expanded(
                            child: buildDropdownField<String>(
                              context: context,
                              validator: (val) =>
                                  val == null ? AppConstants.select_unit_qty : null,
                              label: AppConstants.unit_qty,
                              value: _selectedunitQuant,
                              items: unitQuant,
                              onChanged: (val) =>
                                  setState(() => _selectedunitQuant = val),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomFormField(
                      hintText: AppConstants.price,
                      validator: (val) {
                        if (null != val && !val.isValidName) {
                          return AppConstants.enter_price;
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: buildMultiTextField(
                        context: context,
                        label: AppConstants.desc_opti,
                        controller: descController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppConstants.upload_img,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(products[index].image),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      // ❌ Handle remove action here
                                      setState(() {
                                        products.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: const Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildButtonWidget(
                        buttonColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        textColor: Theme.of(context).colorScheme.primary,
                        context: context,
                        label: AppConstants.upload,
                        fontSize: 18,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        assetPath: 'assets/upload.png',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
