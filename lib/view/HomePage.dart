import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:door_demo/controller/HiveManager.dart';
import 'package:door_demo/controller/NetworkController.dart';
import 'package:door_demo/controller/NotificationController.dart';
import 'package:door_demo/data/data.dart';
import 'package:door_demo/model/Quote.dart';
import 'package:door_demo/view/HistoryPage.dart';
import 'package:door_demo/view/QuoteDisplayScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NetworkController controller = NetworkController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("How Are You ? "),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: emotionList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: emotionList[index].color)),
                        // color: index <= 8 ? Colors.lightBlue : Colors.red,
                        child: TextButton(
                            onPressed: () async {
                              Quote quote = await controller
                                  .fetchQuote(emotionList[index].name);
                              await HiveManager.addItem(emotionList[index]);
                              await NotificationServices.showNotification(
                                  title: 'DoorApp',
                                  body: 'How do you feel?',
                                  schedule: true,
                                  date: DateTime.now()
                                      .add(const Duration(minutes: 5)),
                                  actionButtons: [
                                    NotificationActionButton(
                                      key: 'action_btn',
                                      label: 'Select your emotion',
                                    ),
                                  ]);

                              Get.to(QuoteDisplayScreen(quote: quote));
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              emotionList[index].name,
                              style: TextStyle(
                                  color: emotionList[index].color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      );
                    }),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      var items = HiveManager.getAllItems();

                      Get.to(HistoryPage(historyItems: items));
                    },
                    child: const Text(
                      "Show History",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
