class Task {
  Task({
    this.id,
    this.key,
    this.status,
    this.sender,
    this.time,
    this.summary,
    this.detail,
    this.avatar,
    this.assignee,
    this.containsPictures,
  });

  final int id;
  final String key;
  final String status;
  final String sender;
  final String time;
  final String summary;
  final String detail;
  final String avatar;
  final String assignee;
  final bool containsPictures;
}

class Todo extends Task {
  Todo({
    int id,
    String key,
    String status,
    String reporter,
    String time,
    String summary,
    String message,
    String avatar,
    String assignee,
    bool containsPictures,
    this.inboxType = InboxType.normal,
  }) : super(
          id: id,
          key: key,
          status: status,
          sender: reporter,
          time: time,
          summary: summary,
          detail: message,
          avatar: avatar,
          assignee: assignee,
          containsPictures: containsPictures,
        );

  InboxType inboxType;
}

// The different mailbox pages that the Reply app contains.
enum MailboxPageType {
  inbox,
  starred,
  sent,
  trash,
  spam,
  drafts,
}

// Different types of mail that can be sent to the inbox.
enum InboxType {
  normal,
  spam,
}
