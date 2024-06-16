import SwiftUI
import Foundation
import StompClientLib
import UIKit
import Alamofire

let baseURL = "https://hoolc.me"

let token = "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6OSwiZW1haWwiOiJyaGVlc2V1bGFAZ21haWwuY29tIiwicm9sZSI6IlJPTEVfVVNFUiIsImlhdCI6MTcxNjQ1NDIwNSwiZXhwIjoxNzE2NDYwMjA1fQ.4tn89tUzmjixPWifRy_YHLIuIawmu8F9D_Cr4GA4T6c"
let jsonEncoder = JSONEncoder()

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        
        // 세로방향 고정
        return UIInterfaceOrientationMask.portrait
    }
}

let authHeader: HTTPHeaders = ["Authorization": "Bearer \(token)"]

final class ViewModel: ObservableObject, StompClientLibDelegate {
    
    var stompClient: StompClientLib
    @Published var messages: MessageResponse? = nil
    
    init() {
        stompClient = StompClientLib()
        let url = NSURL(string: "wss://hoolc.me/stomp/chat")!
        stompClient.openSocketWithURLRequest(request: NSURLRequest(url: url as URL) , delegate: self, connectionHeaders: authHeader.dictionary)
        stompClient.subscribe(destination: "/exchange/chat.exchange/room.107")
    }
    
    @MainActor
    func fetchMessage() async {
        do {
            let response = try await AF.request("\(baseURL)/message/search/107?page=0", headers: authHeader).serializingDecodable(BaseResponse<MessageResponse>.self).value
            messages = response.data
        } catch {
            print(error)
        }
    }
    
    func sendMessage() {
        let request = SendMessageRequest(roomId: 107, type: .MESSAGE, message: "정말 ㅎㅇ", mention: [], mentionAll: false)
        let json = try? jsonEncoder.encode(request)
        if let json {
            let jsonString = String(data: json, encoding: .utf8) ?? ""
            print(jsonString)
            stompClient.sendMessage(message: jsonString, toDestination: "/pub/chat.message", withHeaders: authHeader.dictionary, withReceipt: nil)
        }
    }
    
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String: String]?, withDestination destination: String) {
        print("jsonBody -")
        print(jsonBody)
    }
    
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("did disconnect")
    }
    
    func stompClientDidConnect(client: StompClientLib!) {
        print("disconnect")
    }
    
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
        print("did send receipt")
    }
    
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("error message - \(description)")
        print("error message - \(message)")
    }
    
    func serverDidSendPing() {
        print("did send ping")
    }
}

struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            List {
                if let messages = viewModel.messages?.messages {
                    ForEach(messages, id: \.id) {
                        Text($0.message)
                    }
                }
            }
            Button {
                viewModel.sendMessage()
            } label: {
                Text("send")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .task {
            await viewModel.fetchMessage()
        }
        .navigationTitle("StompPlayground")
    }
}
