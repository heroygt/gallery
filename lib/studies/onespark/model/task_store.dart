import 'package:flutter/widgets.dart';

import 'task_model.dart';

const _avatarsLocation = 'reply/avatars';

class TaskStore with ChangeNotifier {
  static final _inbox = <Task>[
    Todo(
      id: 1,
      key: "ARC-123",
      status: "开发中",
      reporter: '产品经理A',
      time: '15 minutes ago',
      summary: '开发一个需求!',
      message: '支持人脸识别登录.\n\n'
          'Keep an eye out for a package to arrive between this Thursday and next Tuesday. If for any reason you don\'t receive your package before the end of next week, please reach out to us for details on your shipment.\n\n'
          'As always, thank you for shopping with us and we hope you love our specially formulated Cucumber Mask!',
      avatar: '$_avatarsLocation/avatar_express.png',
      assignee: '我',
      containsPictures: false,
    ),
    Todo(
      id: 2,
      reporter: 'Ali Connors',
      time: '4 hrs ago',
      summary: 'Brunch this weekend?',
      message:
          'I\'ll be in your neighborhood doing errands and was hoping to catch you for a coffee this Saturday. If you don\'t have anything scheduled, it would be great to see you! It feels like its been forever.\n\n'
          'If we do get a chance to get together, remind me to tell you about Kim. She stopped over at the house to say hey to the kids and told me all about her trip to Mexico.\n\n'
          'Talk to you soon,\n\n'
          'Ali',
      avatar: '$_avatarsLocation/avatar_5.jpg',
      assignee: 'Jeff',
      containsPictures: false,
    ),
    Todo(
      id: 3,
      reporter: 'Allison Trabucco',
      time: '5 hrs ago',
      summary: 'Bonjour from Paris',
      message: 'Here are some great shots from my trip...',
      avatar: '$_avatarsLocation/avatar_3.jpg',
      assignee: 'Jeff',
      containsPictures: true,
    ),
    Todo(
      id: 4,
      reporter: 'Trevor Hansen',
      time: '9 hrs ago',
      summary: 'Brazil trip',
      message:
          'Thought we might be able to go over some details about our upcoming vacation.\n\n'
          'I\'ve been doing a bit of research and have come across a few paces in Northern Brazil that I think we should check out. '
          'One, the north has some of the most predictable wind on the planet. '
          'I\'d love to get out on the ocean and kitesurf for a couple of days if we\'re going to be anywhere near or around Taiba. '
          'I hear it\'s beautiful there and if you\'re up for it, I\'d love to go. Other than that, I haven\'t spent too much time looking into places along our road trip route. '
          'I\'m assuming we can find places to stay and things to do as we drive and find places we think look interesting. But... I know you\'re more of a planner, so if you have ideas or places in mind, lets jot some ideas down!\n\n'
          'Maybe we can jump on the phone later today if you have a second.',
      avatar: '$_avatarsLocation/avatar_8.jpg',
      assignee: 'Allison, Kim, Jeff',
      containsPictures: false,
    ),
    Todo(
      id: 5,
      reporter: 'Frank Hawkins',
      time: '10 hrs ago',
      summary: 'Update to Your Itinerary',
      message: '',
      avatar: '$_avatarsLocation/avatar_4.jpg',
      assignee: 'Jeff',
      containsPictures: false,
    ),
    Todo(
      id: 6,
      reporter: 'Google Express',
      time: '12 hrs ago',
      summary: 'Delivered',
      message: 'Your shoes should be waiting for you at home!',
      avatar: '$_avatarsLocation/avatar_express.png',
      assignee: 'Jeff',
      containsPictures: false,
    ),
    Todo(
      id: 7,
      reporter: 'Frank Hawkins',
      time: '4 hrs ago',
      summary: 'Your update on the Google Play Store is live!',
      message:
          'Your update is now live on the Play Store and available for your alpha users to start testing.\n\n'
          'Your alpha testers will be automatically notified. If you\'d rather send them a link directly, go to your Google Play Console and follow the instructions for obtaining an open alpha testing link.',
      avatar: '$_avatarsLocation/avatar_4.jpg',
      assignee: 'Jeff',
      containsPictures: false,
    ),
    Todo(
      id: 8,
      reporter: 'Allison Trabucco',
      time: '6 hrs ago',
      summary: 'Try a free TrailGo account',
      message:
          'Looking for the best hiking trails in your area? TrailGo gets you on the path to the outdoors faster than you can pack a sandwich.\n\n'
          'Whether you\'re an experienced hiker or just looking to get outside for the afternoon, there\'s a segment that suits you.',
      avatar: '$_avatarsLocation/avatar_3.jpg',
      assignee: 'Jeff',
      containsPictures: false,
    ),
    Todo(
      id: 9,
      reporter: 'Allison Trabucco',
      time: '4 hrs ago',
      summary: 'Free money',
      message:
          'You\'ve been selected as a winner in our latest raffle! To claim your prize, click on the link.',
      avatar: '$_avatarsLocation/avatar_3.jpg',
      assignee: 'Jeff',
      containsPictures: false,
      inboxType: InboxType.spam,
    ),
  ];

  static final _outbox = <Task>[
    Task(
      id: 10,
      sender: 'Kim Alen',
      time: '4 hrs ago',
      summary: 'High school reunion?',
      detail:
          'Hi friends,\n\nI was at the grocery store on Sunday night.. when I ran into Genie Williams! I almost didn\'t recognize her afer 20 years!\n\n'
          'Anyway, it turns out she is on the organizing committee for the high school reunion this fall. I don\'t know if you were planning on going or not, but she could definitely use our help in trying to track down lots of missing alums. '
          'If you can make it, we\'re doing a little phone-tree party at her place next Saturday, hoping that if we can find one person, thee more will...',
      avatar: '$_avatarsLocation/avatar_7.jpg',
      assignee: 'Jeff',
      containsPictures: false,
    ),
    Task(
      id: 11,
      sender: 'Sandra Adams',
      time: '7 hrs ago',
      summary: 'Recipe to try',
      detail:
          'Raspberry Pie: We should make this pie recipe tonight! The filling is '
          'very quick to put together.',
      avatar: '$_avatarsLocation/avatar_2.jpg',
      assignee: 'Jeff',
      containsPictures: false,
    ),
  ];

  static final _drafts = <Task>[
    Task(
      id: 12,
      sender: 'Sandra Adams',
      time: '2 hrs ago',
      summary: '(No subject)',
      detail: 'Hey,\n\n'
          'Wanted to email and see what you thought of',
      avatar: '$_avatarsLocation/avatar_2.jpg',
      assignee: 'Jeff',
      containsPictures: false,
    ),
  ];

  List<Task> get _allEmails => [
        ..._inbox,
        ..._outbox,
        ..._drafts,
      ];

  List<Task> get inboxEmails {
    return _inbox.where((email) {
      if (email is Todo) {
        return email.inboxType == InboxType.normal &&
            !trashEmailIds.contains(email.id);
      }
      return false;
    }).toList();
  }

  List<Task> get spamEmails {
    return _inbox.where((email) {
      if (email is Todo) {
        return email.inboxType == InboxType.spam &&
            !trashEmailIds.contains(email.id);
      }
      return false;
    }).toList();
  }

  Task get currentEmail =>
      _allEmails.firstWhere((email) => email.id == _selectedEmailId);

  List<Task> get outboxEmails =>
      _outbox.where((email) => !trashEmailIds.contains(email.id)).toList();

  List<Task> get draftEmails =>
      _drafts.where((email) => !trashEmailIds.contains(email.id)).toList();

  Set<int> starredEmailIds = {};
  bool isEmailStarred(int id) =>
      _allEmails.any((email) => email.id == id && starredEmailIds.contains(id));
  bool get isCurrentEmailStarred => starredEmailIds.contains(currentEmail.id);

  List<Task> get starredEmails {
    return _allEmails
        .where((email) => starredEmailIds.contains(email.id))
        .toList();
  }

  void starEmail(int id) {
    starredEmailIds.add(id);
    notifyListeners();
  }

  void unstarEmail(int id) {
    starredEmailIds.remove(id);
    notifyListeners();
  }

  Set<int> trashEmailIds = {7, 8};
  List<Task> get trashEmails {
    return _allEmails
        .where((email) => trashEmailIds.contains(email.id))
        .toList();
  }

  void deleteEmail(int id) {
    trashEmailIds.add(id);
    notifyListeners();
  }

  int _selectedEmailId = -1;
  int get selectedEmailId => _selectedEmailId;
  set selectedEmailId(int value) {
    _selectedEmailId = value;
    notifyListeners();
  }

  bool get onMailView => _selectedEmailId > -1;

  MailboxPageType _selectedMailboxPage = MailboxPageType.inbox;
  MailboxPageType get selectedMailboxPage => _selectedMailboxPage;
  set selectedMailboxPage(MailboxPageType mailboxPage) {
    _selectedMailboxPage = mailboxPage;
    notifyListeners();
  }

  bool _onSearchPage = false;
  bool get onSearchPage => _onSearchPage;
  set onSearchPage(bool value) {
    _onSearchPage = value;
    notifyListeners();
  }
}
