import 'package:flutter/material.dart';

class CommentWrite extends StatelessWidget {
  const CommentWrite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 6,
            color: const Color(0xffB1B1B1).withOpacity(0.16))
      ]),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 14.0),
                  hintText: "댓글을 남겨주세요.",
                  hintStyle: const TextStyle(
                      color: Color(0xffabacb2),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400),
                  fillColor: const Color(0xfff8f8f8),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      borderSide: const BorderSide(color: Color(0xfff8f8f8))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17.0),
                      borderSide: const BorderSide(color: Color(0xfff8f8f8)))),
              minLines: 1,
              maxLines: 10,
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            width: 7.0,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
                textStyle: const TextStyle(
                    fontSize: 13.0,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w400),
                primary: const Color(0xffe71915),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0))),
            child: const Text("등록"),
          )
        ],
      ),
    );
  }
}
