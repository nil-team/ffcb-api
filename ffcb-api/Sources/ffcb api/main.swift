import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import Application

let router = Router()

router.all("/", middleware: BodyParser(), StaticFileServer(path: "./Public"))

router.get("/") { request, response, next in
    
    let data = [
        "info": [
            [
                "id": "1",
                "username": "victor",
                "password": "eemi2017"
            ]
        ],
        
        "courses": [
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
            ],
            [
                "place": "Les Panoramas",
                "begin": "16h30",
                "end": "18h30",
                "lat": "48.870537",
                "long": "2.342358",
                "marge": "200",
                "course": "Anglais"
            ]
        ]
    ]
    
    try response.send(data).end()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8080") ?? 8080

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
