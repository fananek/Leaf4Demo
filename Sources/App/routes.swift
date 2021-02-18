import Vapor

func routes(_ app: Application) throws {
    let controllers: [RouteCollection] = [
        MainController()
    ]
    for controller in controllers {
        try app.register(collection: controller)
    }
}
