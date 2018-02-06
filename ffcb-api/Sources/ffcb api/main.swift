import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import Application

let router = Router()

router.all("/", middleware: BodyParser())

router.get("/") { request, response, next in
    
    let data = [
        "matches": [
            [
                "place": "Les Panoramas",
                "begin": "9h",
                "end": "11h",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Ruby on Rails"
            ],
            [
                "place": "Palais Brogniart",
                "begin": "11h15",
                "end": "13h15",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Ruby on Rails"
            ],
            [
                "place": "Palais Brogniart",
                "begin": "14h15",
                "end": "16h15",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Option design"
            ]
        ]
    ]
    
    try response.send(data).end()
}

let port: Int
let defaultPort = 8080
if let requestedPort = ProcessInfo.processInfo.environment["PORT"] {
    port = Int(requestedPort) ?? defaultPort
} else {
    port = defaultPort
}

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()

