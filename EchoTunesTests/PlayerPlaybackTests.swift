//
//  PlayerPlaybackTests.swift
//  MyMusic
//
//  Created by Archita Palkar on 10/17/25.
//  Copyright © 2025 ASN GROUP LLC. All rights reserved.
//

import XCTest
import AVFoundation
@testable import MyMusic

final class PlayerPlaybackTests: XCTestCase {

    var sut: PlayerViewController!

    override func setUpWithError() throws {
        sut = PlayerViewController()

        // Provide a mock UIView same as in UI
        sut.holder = UIView()
        sut.holder.frame = CGRect(x: 0, y: 0, width: 350, height: 700)

        sut.songs = [
            Song(name: "Test1", albumName: "Album1", artistName: "Artist1", imageName: "cover1", trackName: "song1"),
            Song(name: "Test2", albumName: "Album2", artistName: "Artist2", imageName: "cover2", trackName: "song2")
        ]

        // Configure player UI + audio at start
        sut.position = 0
        sut.configure()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testPlayPauseToggleChangesStateCorrectly() {
        // First pause
        sut.didTapPlayPauseButton()
        XCTAssertFalse(sut.player?.isPlaying ?? true, "Player should pause")

        // Then play again
        sut.didTapPlayPauseButton()
        XCTAssertTrue(sut.player?.isPlaying ?? false, "Player should play after toggle")
    }

    func testVolumeSliderAdjustsVolume() {
        let newVolume: Float = 0.75
        let slider = UISlider()
        slider.value = newVolume

        sut.didSlideSlider(slider)

        XCTAssertEqual(sut.player?.volume, newVolume, "Volume should reflect slider value")
    }

    func testMetadataLoadedCorrectly() {
        XCTAssertEqual(sut.songNameLabel.text, "Test1")
        XCTAssertEqual(sut.albumNameLabel.text, "Album1")
        XCTAssertEqual(sut.artistNameLabel.text, "Artist1")
    }

    func testConfigureInitializesPlayer() {
        XCTAssertNotNil(sut.player, "Player should be initialized after configure()")
        XCTAssertTrue(sut.player?.isPlaying ?? false, "Player should start in playing state")
    }
}
