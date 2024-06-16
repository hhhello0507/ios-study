struct SendMessageRequest: Encodable {
    let roomId: Int
    let type: MessageType
    let message: String
    let mention: [Int]
    let mentionAll: Bool
}

enum MessageType: String, RawRepresentable, Encodable {
    case MESSAGE, IMG, FILE
}
