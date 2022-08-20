import 'package:catapp/theme/app_color.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final ValueChanged<String> onChange;
  const SearchBarWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  var controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  controller.value;
                });
                widget.onChange(value);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none),
                fillColor: AppColors.grey2,
                filled: true,
                suffixIcon: controller.text.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            controller.clear();
                          });
                          setState(() {});
                          widget.onChange("");
                        },
                        child: const Icon(
                          Icons.cancel,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
