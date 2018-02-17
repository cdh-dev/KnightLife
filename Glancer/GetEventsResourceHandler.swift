//
//  GetEventsResourceHandler.swift
//  Glancer
//
//  Created by Dylan Hanson on 2/15/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation

class GetEventsResourceHandler: ResourceHandler<(EnscribedDate, EventList?)>
{
	private var manager: EventManager
	var menus: [EnscribedDate: EventList] = [:]
	
	init(_ manager: EventManager)
	{
		self.manager = manager
	}
	
	@discardableResult
	func getMenu(_ date: EnscribedDate, hard: Bool = false, callback: @escaping (FetchError?, EventList?) -> Void = {_,_ in}) -> EventList?
	{
		if hard || self.menus[date] == nil // Requires reload
		{
			let call = GetEventsWebCall(manager, date: date)
			call.callback =
			{ error, result in
				if let success = result
				{
					self.menus[date] = success
					self.success((date, success))
				} else if error == nil
				{
					self.menus[date] = nil
					self.success((date, nil))
				} else
				{
					self.menus[date] = nil
					self.failure(error!)
				}
			}
			call.execute()
			return nil
		} else
		{
			return menus[date]
		}
	}
}
