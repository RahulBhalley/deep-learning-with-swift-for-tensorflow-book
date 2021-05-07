//
//  main.swift
//  
//
//  Created by Rahul Bhalley on 07/05/21.
//

/// **Listing 3-34**. Respond to possible errors when requesting a webpage
enum RequestError: Error {
    case noInternet
    case notFound
    case timeOut
}

func ping(website link: String) throws -> String {
    if link == "Wrong address" {
        throw RequestError.notFound
    } else if link == "No connection" {
        throw RequestError.noInternet
    } else if link == "Request timeout" {
        throw RequestError.timeOut
    }
    return #"Website: "\#(link)" is live."#
}

do {
    let pingResponse = try ping(website: "Wrong address")
    print(pingResponse)
} catch RequestError.noInternet {
    print("Could not connect to the Internet.")
} catch let pingError as RequestError {
    print("Error: \(pingError)")
}
