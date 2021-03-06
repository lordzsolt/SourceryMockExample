//
//  AutoMockable.swift
//  SourceryExampleTests
//
//  Created by Zsolt Kovacs on 08.11.20.
//  Copyright © 2020 iosmith. All rights reserved.
//

import Foundation
@testable import SourceryExample

private protocol AutoMockable {}

private typealias MFriendListInteractorProtocol = FriendListInteractorProtocol & AutoMockable
private typealias MFriendListViewProtocol = FriendListViewProtocol & AutoMockable
private typealias MFriendListWireframeProtocol = FriendListWireframeProtocol & AutoMockable

