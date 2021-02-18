import Vapor

extension Request {
    func render<Context: Encodable>(_ template: String, _ context: Context) -> EventLoopFuture<View> {
        let webpageURL = self.url.path
        let now = Date()
        
        let pageInfo = PageInfo(
            pageData: context,
            webpageURL: webpageURL,
            now: now
        )
        return self.view.render(template, pageInfo)
    }
}
