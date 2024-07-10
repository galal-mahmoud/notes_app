import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 24.0,
        end: 8.0,
        top: 16.0,
        bottom: 24.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'Flutter tips',
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 26.0,
              ),
            ),
            contentPadding: const EdgeInsetsDirectional.all(0),
            subtitle: const Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                child:  Text(
                  'Build your career with Tharwat Samy',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                  ),
                )),
            trailing: Padding(
                padding: EdgeInsetsDirectional.only(bottom: 24.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 22.0,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(end: 16),
            child: Text(
              'May21, 2022',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}