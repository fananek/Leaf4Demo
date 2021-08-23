import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.views.use(.leaf)
    app.leaf.tags["now"] = NowTag()
    app.leaf.tags["nowTable"] = NowTableTag()

    // register routes
    try routes(app)
}
