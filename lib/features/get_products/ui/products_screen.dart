import 'package:amazon_app/features/get_products/logic/cubit.dart';
import 'package:amazon_app/features/get_products/logic/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/model/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState() {
    GetProductCubit.get(context).emitGetProductStates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
          if (GetProductCubit.products.isNotEmpty) {
            List<Product> products =GetProductCubit.products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Container(
                    width: double.infinity.w,
                    padding: EdgeInsets.all(5.0),
                    height: 160.h,
                    child: GestureDetector(
                      child: Flexible(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0.h),
                          ),
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite),
                                  iconSize: 25.h,
                                  color: Colors.black,
                                  onPressed: () {
                                  }),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      products[index].image!,
                                      height: 150.h,
                                      width: 150.w,
                                      fit: BoxFit.fill,

                                    ),
                                  ),
                                  radius: 60.sp,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: Column(
                                    children: [
                                      Text(
                                        products[index].title!,
                                        style: TextStyle(
                                            fontSize: 12.h,
                                            color: Colors.black),
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),

                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.add_shopping_cart),
                                            iconSize: 25.h,
                                            color: Colors.blue,
                                            onPressed: () {
                                            },
                                          ),
                                          SizedBox(
                                            width: 55.w,
                                          ),
                                          Text(
                                            "${products[index].price} \$",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
