//
//  DiamondKataView+DiamondKataViewModel.swift
//  Diamond Kata
//
//  Created by Iliyan Mladenov on 13.10.22.
//

import Foundation


class DiamondKataViewModel: ObservableObject {
    //MARK: Properties
    let charactersLimit = 1

    //MARK: Published properties
    @Published var diamondKata = ""
    @Published var labelMessage = ""

    //MARK: Public methods
    func makeDiamondKata() -> [String] {
        guard !isInputAboveLimit(),
              isInputChar() else { return [] }
        var result = createQuarterDiamond()

        result = verticalMirror(array: result)
        result = horizontalMirror(array: result)

        return combine2DArrayWithoutSeparator(array: result)
    }


    //MARK: Private methods
    private func isInputAboveLimit() -> Bool {
        return diamondKata.count > charactersLimit
    }

    private func isInputChar() -> Bool {
        guard !diamondKata.isEmpty else { return false }
        let character = Character(diamondKata)
        return character.isLetter
    }

    private func createQuarterDiamond() -> [[String]] {
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{ $0 }
        guard let lastLetterIndex = alphabet.firstIndex(of: Character(diamondKata.uppercased())) else { return [] }

        let columns = Array(repeating: " _ ", count: lastLetterIndex + 1)
        var rows = Array(repeating: columns, count: lastLetterIndex + 1)

        for index in 0...lastLetterIndex {
            rows[index][lastLetterIndex - index] = " \(String(alphabet[index])) "
        }
        return rows
    }

    private func verticalMirror(array: [[String]]) -> [[String]] {
        return array.map { $0 + $0.dropLast().reversed() }
    }

    private func horizontalMirror(array: [[String]]) -> [[String]] {
        return array + array.dropLast().reversed()
    }

    private func combine2DArrayWithoutSeparator(array: [[String]]) -> [String] {
        return array.map { $0.joined() }
    }
}

