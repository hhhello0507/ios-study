public struct ErrorResponse: Decodable {
    public let status: Int
    public let code: String
    public let message: String
}
