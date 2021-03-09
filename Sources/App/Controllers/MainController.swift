import Vapor

final class MainController : RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: home)
        routes.get("templates", use: templates)
        routes.get("conditions", use: conditions)
        routes.get("tags", use: tags)
        routes.get("login", use: login)
        routes.get("profile", ":userID", use: profile)

        
        routes.get("hc", use: healthCheck)
    }
    
    func healthCheck(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return req.eventLoop.future(.ok)
    }
        
    func home(req: Request) throws -> EventLoopFuture<View> {
        let context = BaseContext(
            title: "Home",
            description: "Home page",
            loggedInUser: nil)
        return req.render("index", context)
    }
    
    func templates(req: Request) throws -> EventLoopFuture<View> {
        let context = BaseContext(
            title: "Templates",
            description: "This site itself is a showcase of Leaf templates",
            loggedInUser: nil)
        return req.render("templates", context)
    }
    
    func conditions(req: Request) throws -> EventLoopFuture<View> {
        let cards = [
            Card(
                title: "Cloud",
                description: "Since Vapor run in docker, it can be easily deployed to any cloud hosting.",
                svgPath: "M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"),
            Card(
                title: "SSL Certificates",
                description: "It's a piece of cake easy to setup TLS support. Let's encrypt provides free certificates.",
                svgPath: "M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"),
            Card(
                title: "Testing",
                description: "It's a good practice to automate repetitive tasks. Unit tests are good starting point.",
                svgPath: "M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"),
            Card(
                title: "Security",
                description: "Ever heard about Vapor Secure Headers package? Check GitHub or Vapor discord forum.",
                svgPath: "M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"),
            Card(
                title: "Powerful API",
                 description: "Building APIs is the field where Vapor really shines. Build fully functional API within minutes.",
                 svgPath: "M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"),
            Card(
                title: "Databases",
                description: "There is an ORM called Fluent. It provides drivers for Postgres, MySQL, SQLite and MongoDB.",
                svgPath: "M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2m-2-4h.01M17 16h.01")
        ]
        
        let context = ConditionsLoopsContext(
            title: "Loops & Conditions",
            description: "How to use loops and conditions",
            loggedInUser: nil,
            cards: cards)
        return req.render("conditions", context)
    }
    
    func tags(req: Request) throws -> EventLoopFuture<View> {
        let context = TagsContext(
            title: "Tags",
            description: "Leaf tags examples",
            loggedInUser: nil,
            name: "my name is Jane Doe",
            myArray: ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"])
        return req.render("tags", context)
    }
    
    func login(req: Request) throws -> EventLoopFuture<View> {
        let user = User(id: UUID(),fullName: "Jane Doe", email: "janedoe@acme.com")
        let context = BaseContext(
            title: "Sign in",
            description: "Now, you are signed in as Jane Doe",
            loggedInUser: user)
        return req.render("login", context)
    }
    
    func profile(req: Request) throws -> EventLoopFuture<View> {
        guard let userId = req.parameters.get("userID", as: UUID.self ) else {
            throw Abort(.badRequest)
        }
        // fake user - usually we would query the database
        let user = User(id: userId, fullName: "Jane Doe", email: "janedoe@acme.com")
        let context = BaseContext(
            title: "User profile",
            description: "Example of dynamically generated URL",
            loggedInUser: user)
        return req.render("profile", context)
    }
    
}
