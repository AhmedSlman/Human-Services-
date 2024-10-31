import 'dart:io';
import 'package:flutter/material.dart';

class MaanDemoChat {
  static List<MaanChatModel> chatList = [
    MaanChatModel(
        text: 'Hello, we are trying to design UI/UX for app',
        date: DateTime.now().subtract(const Duration(hours: 2)),
        isSentByMe: false),
    MaanChatModel(
        text: 'Oh, Hello Angela Young',
        date: DateTime.now().subtract(const Duration(hours: 1)),
        isSentByMe: true),
    MaanChatModel(
        text: 'At first i need to know about your project details',
        date: DateTime.now().subtract(const Duration(hours: 1)),
        isSentByMe: true),
    MaanChatModel(
        text: 'Yes sure, please wait',
        date: DateTime.now().subtract(const Duration(minutes: 5)),
        isSentByMe: false),
    MaanChatModel(
        text: 'Can we talk about the project other platfrom',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
  ];
}

class MaanChatModel {
  final File? file;
  final String? text;
  final DateTime date;
  final bool isSentByMe;
  final String? senderImage;

  MaanChatModel(
      {this.file,
        this.text,
        required this.date,
        required this.isSentByMe,
        this.senderImage});
}

class MaanGigModel {
  int gigID;
  String gigImage;
  String gigTitle;
  String? gigDescription;
  double gigPrice;
  double? discountPrice;
  String? influencerImage;
  String influencerName;
  int? influencerReach;
  double? influencerRating;
  int? influencerReviews;

  MaanGigModel({
    required this.gigID,
    required this.gigImage,
    required this.gigTitle,
    this.gigDescription,
    required this.gigPrice,
    this.discountPrice,
    this.influencerImage,
    required this.influencerName,
    this.influencerReach,
    this.influencerRating,
    this.influencerReviews,
  });
}

class _MaanCategoryModel {
  String image;
  String title;

  _MaanCategoryModel({
    required this.image,
    required this.title,
  });
}

class MaanDemoGig {
  static List<MaanGigModel> gigs = [
    MaanGigModel(
        gigID: 1,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig01.png',
        gigTitle: 'I will post a review on my page',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 100,
        discountPrice: 80,
        influencerName: 'Guy Hawkins',
        influencerImage:
        'images/chat1.png',
        influencerReach: 1200,
        influencerRating: 4.7,
        influencerReviews: 12),
    MaanGigModel(
        gigID: 2,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig02.png',
        gigTitle: 'I will post a review on my page',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 200,
        discountPrice: 189,
        influencerName: 'Marvin McKinney',
        influencerImage:
        'images/chat2.png',
        influencerReach: 800,
        influencerRating: 4.2,
        influencerReviews: 8),
    MaanGigModel(
        gigID: 3,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig03.png',
        gigTitle: 'I will post a review on my page',
        gigPrice: 120,
        discountPrice: 0,
        influencerName: 'Eleanor Pena',
        influencerImage:
        'images/chat3.png',
        influencerReach: 12958392,
        influencerRating: 4.6,
        influencerReviews: 120),
    MaanGigModel(
        gigID: 4,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig04.png',
        gigTitle: 'Content recording lifestyle vlog',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 150,
        discountPrice: 129,
        influencerName: 'Ronald Richards',
        influencerImage:
        'images/chat4.png',
        influencerReach: 1200,
        influencerRating: 4.2,
        influencerReviews: 8),
    MaanGigModel(
        gigID: 5,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig05.png',
        gigTitle: 'I will post a review on my page',
        gigPrice: 120,
        discountPrice: 0,
        influencerName: 'Annette Black',
        influencerImage:
        'images/chat5.png',
        influencerReach: 12958392,
        influencerRating: 4.6,
        influencerReviews: 120),
    MaanGigModel(
        gigID: 6,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig06.png',
        gigTitle: 'I will post a review on my page',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 150,
        discountPrice: 129,
        influencerName: 'Theresa Webb',
        influencerImage:
        'images/chat6.png',
        influencerReach: 1200,
        influencerRating: 4.2,
        influencerReviews: 8),
    MaanGigModel(
        gigID: 7,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig06.png',
        gigTitle: 'I will post a review on my page',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 150,
        discountPrice: 129,
        influencerName: 'Arlene McCoy',
        influencerImage:
        'images/chat7.png',
        influencerReach: 1200,
        influencerRating: 4.2,
        influencerReviews: 8),
    MaanGigModel(
        gigID: 8,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig06.png',
        gigTitle: 'I will post a review on my page',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 150,
        discountPrice: 129,
        influencerName: 'Darlene Robertson',
        influencerImage:
        'images/chat8.png',
        influencerReach: 1200,
        influencerRating: 4.2,
        influencerReviews: 8),
    MaanGigModel(
        gigID: 9,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig06.png',
        gigTitle: 'I will post a review on my page',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 150,
        discountPrice: 129,
        influencerName: 'Robert Fox',
        influencerImage:
        'images/chat9.png',
        influencerReach: 1200,
        influencerRating: 4.2,
        influencerReviews: 8),
    MaanGigModel(
        gigID: 10,
        gigImage: 'assets/images/maan_assets/demo_gig/demo_gig06.png',
        gigTitle: 'I will post a review on my page',
        gigDescription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        gigPrice: 150,
        discountPrice: 129,
        influencerName: 'Savannah Nguyen',
        influencerImage:
        'images/chat10.png',
        influencerReach: 1200,
        influencerRating: 4.2,
        influencerReviews: 8),
  ];
}
