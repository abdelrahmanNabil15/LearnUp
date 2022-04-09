import 'package:flutter/material.dart';

import 'CustomText.dart';

class Rooms extends StatelessWidget {
  const Rooms(
      {Key? key,
      required this.Status,
      required this.host,
      required this.RoomName,
      required this.Roomdescription})
      : super(key: key);

  final String Status, host, RoomName, Roomdescription;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade50,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //name of rooms
                    Expanded(
                      flex: 4,
                      child: Padding(

                        padding: EdgeInsets.all(8.0),
                        child: customText(
                          maxline: 2,
                          fontWeight: FontWeight.bold,
                          text: RoomName,
                          //'Roadmap <> Flutter  Enginger Flutter dev chat |Ep05',
                        ),
                      ),
                    ),
                    //status of room joined or live
                    Expanded( flex: 1,

                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: customText(
                          alignment: Alignment.topRight,
                          maxline: 1,
                          fontWeight: FontWeight.bold,
                          text: Status,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: customText(
                    maxline: 1,
                    fontWeight: FontWeight.normal,
                    text: '44 listening',
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child:
                                      Image.asset('assets/Profile Image.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              customText(
                                maxline: 1,
                                fontWeight: FontWeight.bold,
                                text: host,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: Colors.white,
                                height: 22,
                                child: const customText(
                                  maxline: 1,
                                  fontWeight: FontWeight.normal,
                                  text: 'Host',
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: customText(
                              maxline: 1,
                              fontWeight: FontWeight.normal,
                              text: Roomdescription,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: 3,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
      scrollDirection: Axis.vertical,
    );
    ;
  }
}
