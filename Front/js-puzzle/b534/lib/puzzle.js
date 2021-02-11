// Decorate
(() => {
  const pieces = document.querySelectorAll('td');
  pieces.forEach((piece) => {
    if (piece.dataset.number) piece.style.backgroundImage = `url(./images/${piece.dataset.number}.jpg)`;
  })
})();

// DO NOT TOUCH CODE ABOVE 👆

// Set up hint callback
const hintBtn = document.querySelector('#show-hint');
const hint = document.querySelector('.hint');

hintBtn.addEventListener('click', () => hint.classList.toggle('active'));


// Helper Function

const canMove = (tile) => {
  // 3. Check if it's next to an empty square
  const tileCol = tile.cellIndex;
  const tileRow = tile.parentNode.rowIndex;
  const empty = document.querySelector('.empty');
  const emptyCol = empty.cellIndex;
  const emptyRow = empty.parentNode.rowIndex;

  return (
    tileCol === emptyCol && tileRow === emptyRow + 1 ||
    tileCol === emptyCol && tileRow === emptyRow - 1 ||
    tileCol === emptyCol + 1 && tileRow === emptyRow ||
    tileCol === emptyCol - 1 && tileRow === emptyRow
  )
};

const swapContents = (empty, tile) => {
  // Swap the text
  empty.innerText = tile.innerText;
  tile.innerText = '';
  // Swap the data attributes
  empty.setAttribute('data-number', tile.dataset.number);
  tile.removeAttribute('data-number');
  // Swap the images
  empty.style.backgroundImage = `url(./images/${empty.dataset.number}.jpg)`;
  tile.style.backgroundImage = '';
  // Swap the classes
  empty.classList.remove('empty');
  tile.classList.add('empty');
}

const checkWin = () => {
  const tiles = Array.from(document.querySelectorAll("td"));

  const texts = tiles.map((tile) => tile.innerText).join();

  const win = texts === "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,";

  if (win) {
    alert("You have won");
  }
}


const tileLogic = () => {
  const tile = event.currentTarget;
  if (canMove(tile)) {
    // 4. Swap the tile and the empty space
    const empty = document.querySelector(".empty");
    swapContents(empty, tile);
    // 5. Check if you've won the game
    checkWin();
  }
};


// Game Logic

// 1. Select all of the tiles
const tiles = document.querySelectorAll('td');

// 2. For each tile, add a click event
tiles.forEach((tile) => {
  tile.addEventListener('click', tileLogic)
});


