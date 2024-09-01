import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Button.outlined(
          onPressed: () {},
          label: 'Previous',
          width: 150.0,
          icon: const Icon(Icons.arrow_back),
        ),
        const Spacer(),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const ColoredBox(
              color: AppColors.light,
              child: Center(
                child: Text('1'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: Text('2'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: Text('3'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: Text('...'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: Text('8'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: Text('9'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: const ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: Text('10'),
              ),
            ),
          ),
        ),
        const Spacer(),
        Button.outlined(
          onPressed: () {},
          label: 'Next',
          width: 150.0,
          suffixIcon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
