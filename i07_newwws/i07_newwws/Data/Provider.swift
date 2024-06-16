//
//  Provider.swift
//  i07_newwws
//
//  Created by dgsw8th71 on 2023/09/10.
//

import Alamofire
import Combine
import Foundation
import Moya

public struct Provider<Target: TargetType> {
  private let stubBehavior: StubBehavior
  
  public init(
    stubBehavior: StubBehavior = .never
  ) {
    self.stubBehavior = stubBehavior
  }
    
  
  public func request<T: Decodable>(_ target: TargetType, type: T.Type) -> Future<T?, Error> {
    switch stubBehavior {
    case .never:
      return requestObject(target, type: type)
    case .immediate:
      return requestStub(target, type: type)
    }
  }
}

// MARK: Private Request Methods
private extension Provider {
  func requestObject<T: Decodable>(_ target: TargetType, type: T.Type) -> Future<T?, Error> {
    return Future { promise in
    }
  }
  
  func requestStub<T: Decodable>(_ target: TargetType, type: T.Type) -> Future<T?, Error> {
    return Future { promise in
      switch stubBehavior {
      case .never:
        break
      case .immediate:
        do {
          let data = try JSONDecoder().decode(T.self, from: target.sampleData)
          promise(.success(data))
        } catch let error {
          promise(.failure(error))
        }
      }
    }
  }
}

public enum StubBehavior {
  /// Do not stub.
  case never
  /// Return a response immediately.
  case immediate
}
