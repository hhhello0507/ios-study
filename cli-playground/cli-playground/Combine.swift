import Combine
import Foundation

var subscriptions = Set<AnyCancellable>()

func just() {
    _ = Just(4).sink {
        print($0)
    }
}

func sequence() {
    let provider = (1..<10).publisher
    
    _ = provider
        .filter {
            $0 % 2 == 0
        }
        .map {
            String($0) + "와우"
        }
        .sink(receiveCompletion: { _ in
            print("end")
        }, receiveValue: { e in
            print(e)
        })
}

struct DivisionByZeroError: Error {}

func tryFilter() {
    
    let nums = [1, 2, 3, 4, 0, 5, 6, 7]
    _ = nums.publisher
        .dropFirst(2)
        .tryFilter {
            if $0 == 0 {
                throw DivisionByZeroError()
            } else {
                return $0 % 2 == 0
            }
        }
        .sink(
            receiveCompletion: { print ("\($0)") },
            receiveValue: { print ("\($0)", terminator: " ") }
        )
}

func dropUntilOutputFrom() {
    let upstream = PassthroughSubject<Int, Never>()
    let isReady = PassthroughSubject<Void, Never>()
    
    _ = upstream
        .drop(untilOutputFrom: isReady) // second로부터 받으면 그때부터 데이터 받음
        .sink(receiveCompletion: { c in
            print(c)
        }, receiveValue: {
            print($0)
        })
    
    upstream.send(1)
    upstream.send(2)
    isReady.send()
    upstream.send(3)
    upstream.send(4)
}

func passthrothSubject() {
    let subject = PassthroughSubject<String, Error>()
    
    _ = subject.sink(receiveCompletion: { completion in
        //에러가 발생한경우도 receiveCompletion 블록이 호출됩니다.
        switch completion {
        case .failure:
            print("Error가 발생하였습니다.")
        case .finished:
            print("데이터의 발행이 끝났습니다.")
        }
    }, receiveValue: { value in
        print(value)
    })
    
    //데이터를 외부에서 발행할 수 있습니다.
    subject.send("A")
    subject.send("B")
    
    //데이터의 발행을 종료합니다.
    subject.send(completion: .finished)
}
//passthrothSubject()

func requestGet() {
    Repository.requestGet()
        .sink {
            switch $0 {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            default:
                break
            }
        }
        .store(in: &subscriptions)
}


func requestPost() {
    Repository.requestPost(req: Create(name: "Hello"))
        .sink {
            switch $0 {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            default:
                break
            }
        }
        .store(in: &subscriptions)
}

//requestGet()
//requestPost()

//RunLoop.main.run()

public struct Create: Encodable {
    let name: String
}

public struct HelloResponse: Decodable {
    let name: String
    let age: Int
}
public struct VoidResponse: Decodable {}


public class Animal {
    
}
