import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/card_custom.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/status_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filterBy = [
    'Name',
    'Status',
  ];

  bool pendingApprovalEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Row(
            children: [
              CardCustom(
                title: 'Current Time',
                subtitle: '12 : 57 WIB',
                color: AppColors.yellow,
              ),
              SpaceWidth(30.0),
              CardCustom(
                title: 'Present',
                subtitle: '234',
                color: AppColors.green,
              ),
              SpaceWidth(30.0),
              CardCustom(
                title: 'Leave',
                subtitle: '12',
                color: AppColors.red,
              ),
              SpaceWidth(30.0),
              CardCustom(
                title: 'Not Marked',
                subtitle: '23',
                color: AppColors.blue,
              ),
            ],
          ),
          const SpaceHeight(30.0),
          Card(
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today Attendance',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 130.0,
                        child: CustomDropdown(
                          value: filterBy.first,
                          items: filterBy,
                          label: 'Filter by',
                          onChanged: (value) {
                            setState(() {});
                          },
                          showLabel: false,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/03/is-shanks-evil-in-one-piece.jpg',
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  title: const Text('Akagami no Shanks'),
                  subtitle: const Text('10 mins ago'),
                  trailing: const StatusWidget(StatusEnum.present),
                ),
                ListTile(
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/03/is-shanks-evil-in-one-piece.jpg',
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  title: const Text('Akagami no Shanks'),
                  subtitle: const Text('15 mins ago'),
                  trailing: const StatusWidget(StatusEnum.leave),
                ),
                ListTile(
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/03/is-shanks-evil-in-one-piece.jpg',
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  title: const Text('Akagami no Shanks'),
                  subtitle: const Text('42 mins ago'),
                  trailing: const StatusWidget(StatusEnum.notMarked),
                ),
              ],
            ),
          ),
          const SpaceHeight(30.0),
          Card(
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pending Approvals',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 40.0,
                        child: Button.outlined(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          label: 'View All',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (pendingApprovalEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: EmptyPlaceholder(),
                  ),
                ] else ...[
                  ListTile(
                    leading: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/03/is-shanks-evil-in-one-piece.jpg',
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    title: const Text('Akagami no Shanks'),
                    subtitle: const Text('10 mins ago'),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Approve',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/03/is-shanks-evil-in-one-piece.jpg',
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    title: const Text('Akagami no Shanks'),
                    subtitle: const Text('15 mins ago'),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Approve',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://static1.cbrimages.com/wordpress/wp-content/uploads/2024/03/is-shanks-evil-in-one-piece.jpg',
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    title: const Text('Akagami no Shanks'),
                    subtitle: const Text('42 mins ago'),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Approve',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
