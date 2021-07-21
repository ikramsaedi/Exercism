//
// This is only a SKELETON file for the 'Word Search' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

class WordSearch {
  constructor(grid, word) {
    this.grid = grid;
    this.word = word;
  }

  find(words) {
    let result = {};

    for (let wordsIndex = 0; wordsIndex < words.length; wordsIndex++) {
      let word = words[wordsIndex]; //word ur searching for

      for (let gridIndex = 0; gridIndex < this.grid.length; gridIndex++) {
        let row = this.grid[gridIndex];
        let firstChara = row.indexOf(word);
        let lastChara = firstChara + word.length;

        if (row.includes(word)) {
          result[word] = {
            start: [gridIndex + 1, firstChara + 1],
            end: [gridIndex + 1, lastChara],
          };
          console.log(result[word]);
          break; //exits the loop if that condition is true
        } else {
          result[word] = undefined;
        }
      }
    }
    return result;
  }
}

export default WordSearch;
