

import XCTest

@testable import Gomoku

class GomokuRulesTest: XCTestCase {
    
    var board : Board!
    var rules : GomokuRules!
    
    override func setUp(){
        board = Board()
        rules = GomokuRules()
        super.setUp()
    }
    
    func testEmptyBoard_isNotWin() throws {
        try XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() throws{
        try board.place(intersection: Intersection(1,1), player: Player.White)
        
        try XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() throws {
        for col in 0..<5 {
            try board.place(intersection: Intersection(col,0), player: Player.White)
        }
        
        try XCTAssertTrue(rules.isWin(board: board))
    }
    
    func testFiveInARowInTheFirstRow_isALose() throws {
        for col in 0..<4 {
            try board.place(intersection: Intersection(col,0), player: Player.White)
        }
        
        try XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testSixInARowInTheFirstRow_isAWin() throws {
        for col in 0..<6 {
            try board.place(intersection: Intersection(col,0), player: Player.White)
        }
        
        try XCTAssertTrue(rules.isWin(board: board))
    }
}
