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

    for (let gridIndex = 0; gridIndex < this.grid.length; gridIndex++) {
      let row = this.grid[gridIndex]; //clojuremt wld be the row
      let word = words[0]; //word ur searching for
      let firstChara = row.indexOf(word);
      let lastChara = firstChara + word.length;

      console.log("hi");
      console.log(row);
      console.log(row.includes(word));
      if (row.includes(word)) {
        console.log("i'm here");
        result[word] = {
          start: [gridIndex + 1, firstChara + 1],
          end: [gridIndex + 1, lastChara],
        };
        console.log(result[word]);
      } else {
        console.log("else statement");
        console.log(result);
        result[word] = undefined;
      }
    }

    return result;
  }
}

export default WordSearch;
