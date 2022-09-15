import Vapor

extension Request {
    func render<Context: Encodable>(_ template: String, _ context: Context) async throws -> View {
        let webpageURL = self.url.path
        let now = Date()
        let loggedInUser = self.auth.get(User.self)
        
        let pageInfo = PageInfo(
            pageData: context,
            webpageURL: webpageURL,
            loggedInUser: loggedInUser,
            now: now
        )
        return try await self.view.render(template, pageInfo)
    }
}
