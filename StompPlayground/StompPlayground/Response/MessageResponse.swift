struct MessageResponse: Decodable {
    let firstMessageId: String?
    let messages: [MessageContentResponse]
}

struct MessageContentResponse: Decodable {
    let id: String
    let chatRoomId: Int
    let type: ChatType
    let userId: Int
    let message: String
    let emoticon: String
    let eventList: [Int]
    let emojiList: [EmojiResponse]
    let mention: [Int]
    let mentionAll: Bool
    let timestamp: String
    let read: [Int]
    let messageStatus: MessageStatus
}

enum MessageStatus: String, RawRepresentable, Decodable {
    case ALIVE, DELETE
}

struct EmojiResponse: Decodable {
    let emojiId: Int
    let userId: [Int]
}

enum ChatType: String, RawRepresentable, Decodable {
    case MESSAGE, FILE, IMG, ENTER, LEFT, SUB, UNSUB
}

//{
//    "id": "6611203988fe0f5f0468c5ee",
//
//    "mention": [],
//    "mentionAll": false,
//    "timestamp": "2024-04-06T19:13:13.251",
//    "read": [],
//    "joined": [
//        1,
//        2
//    ],
//    "messageStatus": "ALIVE"
//}
