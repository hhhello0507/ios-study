struct SignUpRequest: Encodable {
    let username: String
    let password: String
    let passwordCheck: String
}
