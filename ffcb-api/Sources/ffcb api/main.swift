import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import Application

let router = Router()

router.all("/", middleware: BodyParser(), StaticFileServer(path: "./Public"))

router.get("/") { request, response, next in
    
    let data : [String:Any] = [
                "1": [
                    "begin": 1518186623,
                    "position": [
                        "lat": 48.860247,
                        "long": 2.366260,
                        "name": "L'Atelier Côté Ring",
                    ],
                    "championship": "Ligue - 78kg",
                    "players": [
                        "first": [
                            "name": "P. Omba",
                            "club": "Vienne",
                            "age" : 22,
                            "img": "https://www.victor-de-la-fouchardiere.fr/27848729_1855347754490026_1121205195_n.jpg"
                        ],
                        "second": [
                            "name": "A. Palatis",
                            "club": "Martigues",
                            "age" : 21,
                            "img": "https://www.victor-de-la-fouchardiere.fr/27783895_1855347751156693_595563397_n.png"
                        ],
                    ]
                ],
                "2": [
                    "begin": 1518186644,
                    "position": [
                        "lat": 48.860247,
                        "long": 2.366260,
                        "name": "L'Atelier Côté Ring",
                    ],
                    "championship": "Ligue - 85kg",
                    "players": [
                        "first": [
                            "name": "C. Durand",
                            "club": "Paris",
                            "age" : 25,
                            "img": "https://www.victor-de-la-fouchardiere.fr/27935391_1855347761156692_667548611_n.png"
                        ],
                        "second": [
                            "name": "R. Monlont",
                            "club": "Pau",
                            "age" : 26,
                            "img": "https://www.victor-de-la-fouchardiere.fr/27849166_1855347757823359_1928470038_n.png"
                        ],
                    ]
                ],
    ]
    
    try response.send(json: data).end()
}

let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8080") ?? 8080

Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()
