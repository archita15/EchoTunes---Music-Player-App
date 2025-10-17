//
//  PlayerViewControllerTests.swift
//  MyMusic
//
//  Created by Archita Palkar on 10/17/25.
//  Copyright © 2025 ASN GROUP LLC. All rights reserved.
//

import XCTest
@testable import MyMusic

final class PlayerViewControllerTests: XCTestCase {

    var sut: PlayerViewController! // sut = System Under Test

    override func setUpWithError() throws {
        sut = PlayerViewController()
        sut.holder = UIView()
        sut.songs = [
            Song(name: "Test1", albumName: "Album1", artistName: "Artist1", imageName: "cover1", trackName: "song1"),
            Song(name: "Test2", albumName: "Album2", artistName: "Artist2", imageName: "cover2", trackName: "song2"),
            Song(name: "Test3", albumName: "Album3", artistName: "Artist3", imageName: "cover3", trackName: "song3")
        ]
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testNextButtonMovesToNextSong() {
        sut.position = 0
        sut.didTapNextButton()
        XCTAssertEqual(sut.position, 1)
    }

    func testBackButtonMovesToPreviousSong() {
        sut.position = 2
        sut.didTapBackButton()
        XCTAssertEqual(sut.position, 1)
    }

    func testNextButtonStopsAtLastSong() {
        sut.position = 2
        sut.didTapNextButton()
        XCTAssertEqual(sut.position, 2)
    }

    func testBackButtonStopsAtFirstSong() {
        sut.position = 0
        sut.didTapBackButton()
        XCTAssertEqual(sut.position, 0)
    }
}


