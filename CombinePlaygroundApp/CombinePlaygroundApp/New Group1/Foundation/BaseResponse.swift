public struct BaseResponse<Data: Decodable>: Decodable {
    public let status: Int
    public let message: String
    public let data: Data
}

public struct BaseVoidResponse: Decodable {
    public let status: Int
    public let message: String
}
