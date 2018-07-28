//
//  BlockID.swift
//  Glancer
//
//  Created by Dylan Hanson on 11/1/17.
//  Copyright © 2017 BB&N. All rights reserved.
//

import Foundation

enum BlockID: Int {
	
	case a
	case b
	case c
	case d
	case e
	case f
	case g
	case x
    case lunch
	case activities
	case lab
	case custom
	case advisory
	case classMeeting
	case assembly
	
	var technicalValue: String {
		switch self {
		case .a:
			return "a"
		case .b:
			return "b"
		case .c:
			return "c"
		case .d:
			return "d"
		case .e:
			return "e"
		case .f:
			return "f"
		case .g:
			return "g"
		case .x:
			return "x"
		case .lunch:
			return "lunch"
		case .activities:
			return "activities"
		case .lab:
			return "lab"
		case .custom:
			return "custom"
		case .advisory:
			return "advisory"
		case .classMeeting:
			return "class_meeting"
		case .assembly:
			return "assembly"
		}
	}
	
	var shortName: String {
		switch self {
		case .a:
			return "A"
		case .b:
			return "B"
		case .c:
			return "C"
		case .d:
			return "D"
		case .e:
			return "E"
		case .f:
			return "F"
		case .g:
			return "G"
		case .x:
			return "X"
		case .lunch:
			return "Lunch"
		case .activities:
			return "Activities"
		case .lab:
			return "Lab"
		case .custom:
			return "Custom"
		case .advisory:
			return "Advisory"
		case .classMeeting:
			return "Class Meeting"
		case .assembly:
			return "Assembly"
		}
	}
	
	var displayName: String {
		if BlockID.letterBlocks.contains(self) {
			return "\(self.shortName) Block"
		}
		return self.shortName
	}
	
	static func fromStringValue(name: String) -> BlockID? {
		for cur in BlockID.values {
			if cur.technicalValue == name {
				return cur
			}
		}
		return nil
	}
	
	static var values: [BlockID] { return [.a, .b, .c, .d, .e, .f, .g, .x, .custom, .activities, .lab, .lunch, .advisory, .classMeeting, .assembly] }
	static var letterBlocks: [BlockID] { return [.a, .b, .c, .d, .e, .f, .g, .x] }
	static var academicBlocks: [BlockID] { return [.a, .b, .c, .d, .e, .f, .g] }

}
