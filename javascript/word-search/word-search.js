//
// This is only a SKELETON file for the 'Word Search' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

class WordSearch {
  constructor(grid, word) {
    this.grid = grid;
    this.word = word;
    this.verticalGrid = [];

    for (let i = 0; i < this.grid.length; i++) {
      let row = this.grid[i];
      let characters = row.split("");

      for (let charaIndex = 0; charaIndex < characters.length; charaIndex++) {
        this.verticalGrid[charaIndex].push(characters[charaIndex]);
      }
    }

    //join up each row of vertical grid into a string
  }

  find(words) {
    let result = {};

    for (let wordsIndex = 0; wordsIndex < words.length; wordsIndex++) {
      let word = words[wordsIndex]; //word ur searching for

      for (let gridIndex = 0; gridIndex < this.grid.length; gridIndex++) {
        let row = this.grid[gridIndex];
        let firstChara = row.indexOf(word);
        let lastChara = firstChara + word.length;
        let reversedWord = reverse(word);

        if (row.includes(word)) {
          result[word] = {
            start: [gridIndex + 1, firstChara + 1],
            end: [gridIndex + 1, lastChara],
          };
          //console.log(result[word]);
          break; //exits the loop if that condition is true
        } else if (row.includes(reversedWord)) {
          result[word] = {
            start: [gridIndex + 1, lastChara + 1],
            end: [gridIndex + 1, firstChara + 2],
          };
          break;
        } else {
          result[word] = undefined;
        }
      }
    }
    return result;
  }
}
function reverse(word) {
  let splitWord = word.split("");
  let reversedWord = splitWord.reverse();
  return reversedWord.join("");
}
export default WordSearch;

abchef;
abceef;
abcl;
