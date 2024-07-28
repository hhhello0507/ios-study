import Foundation
import SocketRocket

final class TestViewModel: ObservableObject {
    private let socketClient = StompClientLib()
    private let url = URL(string: "wss://hoolc.me/stomp/chat")!
    
    private var header: [String: String] {
        [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MTksImVtYWlsIjoiaGhoZWxsbzA1MDdAZ21haWwuY29tIiwicm9sZSI6IlJPTEVfVVNFUiIsImlhdCI6MTcyMDI1NTcwOSwiZXhwIjoxNzIwMjYxNzA5fQ.8vvXoLxKyhyJesPd9gDmcQ0tg90_yyuAwVbKrLohm_s",
            StompCommands.commandHeaderHeartBeat: "0,10000"
//            StompCommands.commandHeaderDestinationId: UUID().uuidString
//            StompCommands.commandHeaderContentType:"application/json;charset=UTF-8"
        ]
    }
    
    func registerSockect() {
        let urlRequest = URLRequest(url: url)
        socketClient.openSocketWithURLRequest(
            request: urlRequest,
            delegate: self,
            connectionHeaders: header
        )
    }
    
    // Publish Message
    func sendMessage() {
        print("sending Message...")
        let payloadObject: [String: Any] = [
            "roomId" : "6683baa5c10b712fbd2ed9d8", //보내는 방 주소
            "type" : "MESSAGE", // 형식 MESSAGE, IMG, FILE
            "message" : "ho", // 채팅
        ]
        socketClient.sendJSONForDict(
            dict: payloadObject as AnyObject,
            toDestination: "/pub/chat.message"
//            header: header
        )
    }
    
    func subcribe() {
        socketClient.subscribe(destination: "/exchange/chat.exchange/room.6683baa5c10b712fbd2ed9d8")
    }
    
    func disconnect() {
        socketClient.disconnect()
    }
}

extension TestViewModel: StompClientLibDelegate {
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
        print("💎 didReceiveMessageWithJSONBody", jsonBody ?? "")
    }
    
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("💎 DidDisconnect")
    }
    
    func stompClientDidConnect(client: StompClientLib!) {
        print("💎 Didconnect")
        subcribe()
    }
    
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
        print("💎 DidSendReceipt")
    }
    
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("💎 Error \(description) - \(message ?? "")")
    }
    
    func serverDidSendPing() {
        print("💎 Server DidSendPing")
    }
}
