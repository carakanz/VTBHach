//
//  API.swift
//  swift_lesson1_2
//
//  Created by Darya on 10.10.2020.
//  Copyright © 2020 16817252. All rights reserved.
//

import Foundation

class API {
    func getCarInfo(at img: String, getInfo: ((APIResponse) -> Void)?, fail: @escaping (AlertAnswer?) -> Void?) {
		let url = URL(string: "https://gw.hackathon.vtb.ru/vtb/hackathon/car-recognize")!

		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField:"Content-Type")
		request.setValue("application/json", forHTTPHeaderField: "accept")
		request.setValue("191deda891dd58164392cd9975a35a01", forHTTPHeaderField: "x-ibm-client-id")
		request.httpBody = try? JSONSerialization.data(withJSONObject: ["content": img])

		let session = URLSession.shared
		session.dataTask(with: request) { data, response, error in
			guard let httpResponse = response as? HTTPURLResponse,
				let jsonData = data else {
					fail(.responseProblem)
					return
			}
			do {
				let messageData = try JSONDecoder().decode(APIResponse.self, from: jsonData)
				getInfo?(messageData)
			} catch {
				fail(.decodingProblem)
			}
		}.resume()
    }
}

