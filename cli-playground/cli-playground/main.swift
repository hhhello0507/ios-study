import Foundation
public struct Message {
    public let userId: Int
    public let timestamp: Date
}

public extension [Message] {
    var devideByUser: [[Message]] {
        var result: [[Message]] = []
        self
            .sorted {
                $0.timestamp < $1.timestamp
            }
            .forEach { message in
                if var last = result.last {
                    if last.first?.userId == message.userId {
                        let length = result.count
                        last.append(message)
                        result[length - 1] = last
                    } else {
                        result.append([message])
                    }
                } else {
                    result.append([message])
                }
            }
        return result
    }
}

let dummyMessage: [Message] = [
    
    .init(userId: 2, timestamp: .now.addingTimeInterval(-800)),
    .init(userId: 2, timestamp: .now.addingTimeInterval(-900)),
    
    .init(userId: 5, timestamp: .now.addingTimeInterval(-700)),
    .init(userId: 5, timestamp: .now.addingTimeInterval(-600)),
    
    .init(userId: 6, timestamp: .now.addingTimeInterval(-500)),
    
    .init(userId: 1, timestamp: .now.addingTimeInterval(-400)),
    .init(userId: 1, timestamp: .now.addingTimeInterval(-300)),
    .init(userId: 1, timestamp: .now.addingTimeInterval(-1000)),
    
    .init(userId: 7, timestamp: .now.addingTimeInterval(-200)),
    
    .init(userId: 2, timestamp: .now.addingTimeInterval(-100))
]

//dummyMessage.devideByUser
//    .forEach {
//        print($0)
//        print()
//    }

/*
 [cli_playground.Message(userId: 1, timestamp: 2024-07-08 07:35:26 +0000)]

 [cli_playground.Message(userId: 2, timestamp: 2024-07-08 07:37:06 +0000), cli_playground.Message(userId: 2, timestamp: 2024-07-08 07:38:46 +0000)]

 [cli_playground.Message(userId: 5, timestamp: 2024-07-08 07:40:26 +0000), cli_playground.Message(userId: 5, timestamp: 2024-07-08 07:42:06 +0000)]

 [cli_playground.Message(userId: 6, timestamp: 2024-07-08 07:43:46 +0000)]

 [cli_playground.Message(userId: 1, timestamp: 2024-07-08 07:45:26 +0000), cli_playground.Message(userId: 1, timestamp: 2024-07-08 07:47:06 +0000)]

 [cli_playground.Message(userId: 7, timestamp: 2024-07-08 07:48:46 +0000)]

 [cli_playground.Message(userId: 2, timestamp: 2024-07-08 07:50:26 +0000)]

 */

print(Int(1.1))
print(Int(-0.2))
