import 'package:flutter/material.dart';
import 'package:flutter_momoapp/model/notifacaiton.dart' as momo;

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final categories = <String>[];
  final notifications = [];

  @override
  void initState() {
    categories.addAll(['Giao dịch', 'Ưu đãi', 'Cập nhật', 'Tất Cả']);
    notifications.addAll([
      momo.Notification(
          id: 1,
          createdDate: '21/08/2022',
          category: 'Nạp tiền điện thoại',
          title: 'Nạp dế cho cạ cứng nhận quà HOT',
          content: 'Mừng ngày 2/9, rủ bạn cùng Momo',
          Icons: '${Icon(Icons.arrow_back_ios)},',
          isRead: true),
      momo.Notification(
          id: 2,
          createdDate: '22/08/2022',
          category: 'Giới thiệu MoMo',
          title: 'Quà to đón lễ',
          content:
              'Combo 10k tiền mặt và vocher hoàn tiền khi thanh toán hoá đơn, mua sắm Tiki đổ bộ.',
          Icons: '${Icon(Icons.adb_outlined)},',
          isRead: true),
      momo.Notification(
          id: 3,
          createdDate: '23/08/2022',
          category: 'Tú thần tài',
          title: 'Cấp báo!!! Có rung chấn Ưư đãi',
          content: 'Hoàn tiền đậm đến 10 triệu khi chyển 108đ',
          Icons: 'content',
          isRead: true),
      momo.Notification(
          id: 4,
          createdDate: '22/08/2022',
          category: 'MoMo pha chế',
          title: 'Khuyến mãi Momo siêu sale',
          content: 'Dùng momo thôi anh e mình ơi',
          Icons: '${Icon(Icons.arrow_back_ios)},',
          isRead: true),
      momo.Notification(
          id: 5,
          createdDate: '21/08/2022',
          category: 'Nạp tiền điện thoại',
          title: 'Nạp dế cho cạ cứng nhận quà HOT',
          content: 'Mừng ngày 2/9, rủ bạn cùng Momo',
          Icons: '${Icon(Icons.add_a_photo)}',
          isRead: true),
      momo.Notification(
          id: 6,
          createdDate: '22/08/2022',
          category: 'Giới thiệu MoMo',
          title: 'Quà to đón lễ',
          content:
              'Combo 10k tiền mặt và vocher hoàn tiền khi thanh toán hoá đơn, mua sắm Tiki đổ bộ.',
          Icons: '${Icon(Icons.adb_outlined)}',
          isRead: true),
      momo.Notification(
          id: 7,
          createdDate: '23/08/2022',
          category: 'Tú thần tài',
          title: 'Cấp báo!!! Có rung chấn Ưư đãi',
          content: 'Hoàn tiền đậm đến 10 triệu khi chyển 108đ',
          Icons: '${Icon(Icons.adb_outlined)}',
          isRead: true),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text(
            'Thông báo',
          ),
        ),
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.checklist),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: [
          buildCategory(),
          Expanded(child: buildNotifications()),
        ],
      ),
    );
  }

  Widget buildCategory() {
    return Container(
      height: 56,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 16,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              print('Category:$category');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200),
              child: Text(
                category,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }

  Widget buildNotifications() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return buildNotification(notification);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 16),
          itemCount: notifications.length),
    );
  }

  Widget buildNotification(momo.Notification notification) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 14,
              spreadRadius: 0,
              offset: Offset(0, 4),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.phone_iphone,
                color: Colors.red,
                size: 26,
              ),
              Expanded(
                  child: Text(
                notification.category,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.pink,
                ),
              )),
              Text(
                notification.createdDate,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Icon(
                Icons.ac_unit_outlined,
                color: Colors.pink,
                size: 26,
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey.shade100,
            margin: const EdgeInsets.only(right: 15),
          ),
          Text(
            notification.content,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
