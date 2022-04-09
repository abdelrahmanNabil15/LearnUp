// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:untitled2/commponet/CustomText.dart';
import 'package:untitled2/commponet/defult_button.dart';

Widget builderarticleItem() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://blog.prepscholar.com/hs-fs/hub/360031/file-514060139-png/study-pic.png ',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Text(
                      '  A product is the item offered for sale. A product can be a service or an item. It can be physical or in virtual or cyber form. Every product is made at a cost and each is sold at a price. The price that can be charged',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '2021-11-10T19:47:00Z',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget Cateogery() => SizedBox(
      height: 100,
      child: ListView.separated(
          itemBuilder: (context, index) {
            const BouncingScrollPhysics();

            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyan,
                    ),
                    height: 60,
                    width: 100,
                    child: customText(
                        maxline: 1,
                        fontWeight: FontWeight.bold,
                        text: 'Information',
                        alignment: Alignment.center,
                        fontSize: 15)),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: 10),
    );

Widget ListOfinstructor() => ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/Profile Image.png'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const customText(
                          maxline: 1,
                          fontWeight: FontWeight.bold,
                          text: 'abdo nabil ',
                        ),
                        DefaultButton(
                          function: () {},
                          text: "follow",
                          width: 120,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    const customText(
                      maxline: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      text:
                          'In this case, you should try Wrap widget in flutterrrrrrrrrrrrre',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
    physics: const BouncingScrollPhysics(),
    separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
    scrollDirection: Axis.vertical,
    itemCount: 3);

Widget Rooms() => ListView.separated(
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: customText(
                    maxline: 1,
                    fontWeight: FontWeight.bold,
                    text: 'LIVE',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: customText(
                    maxline: 2,
                    fontWeight: FontWeight.bold,
                    text: 'Roadmap <> Flutter  Enginger Flutter dev chat |Ep05',
                  ),
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
                              const customText(
                                maxline: 1,
                                fontWeight: FontWeight.bold,
                                text: 'Pawann Kumaar',
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
                          const Expanded(
                            child: customText(
                              maxline: 1,
                              fontWeight: FontWeight.normal,
                              text:
                                  'In this case, you should try Wrap widget in flutterrrrrrrrrrrrre',
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
