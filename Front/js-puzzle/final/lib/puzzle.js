// Logic for decorating tiles
const decorate = () => {
  const tiles = document.querySelectorAll("td");
  tiles.forEach((tile) => {
    if (tile.dataset.number)
      tile.style.backgroundImage = `url(./images/${mode}/${tile.dataset.number}.jpg)`;
  });
}

// Logic for swapping contents
const swapContents = (empty, tile) => {
  // Swap the text
  empty.innerText = tile.innerText;
  tile.innerText = '';
  // Swap the data attributes
  empty.setAttribute('data-number', tile.dataset.number);
  tile.removeAttribute('number');
  // Swap the images
  empty.style.backgroundImage = `url(./images/${mode}/${empty.dataset.number}.jpg)`;
  tile.style.backgroundImage = '';
  // Swap the classes
  empty.classList.remove('empty');
  tile.classList.add('empty');
}

// Logic for checking empty spots
// 4. If it has an empty neighbor
const canMove = (tile) => {
  const tileCol = tile.cellIndex;
  const tileRow = tile.parentElement.rowIndex;
  const empty = document.querySelector('.empty');
  const emptyCol = empty.cellIndex;
  const emptyRow = empty.parentElement.rowIndex;

  return (
    tileCol === emptyCol && tileRow === emptyRow + 1 ||
    tileCol === emptyCol && tileRow === emptyRow - 1 ||
    tileCol === emptyCol + 1 && tileRow === emptyRow ||
    tileCol === emptyCol - 1 && tileRow === emptyRow
  )
}

// Logic for checking win
const checkWin = () => {
  const tiles = Array.from(document.querySelectorAll('td'));
  const win = tiles.map((tile) => tile.innerText).join() === "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,"
  if (win) alert(`You have ${mode}'d the game!`)
}

// Logic for tile swapping
// 5. Swap the tile and the empty space
// 6. Check if player wins
const tileSwap = (event) => {
  if (canMove(event.currentTarget)) {
    // 1. Select empty tile
    const empty = document.querySelector(".empty");
    // 2. Replace its content with the `element`'s content
    swapContents(empty, event.currentTarget);
    // 3. Check for a win
    checkWin();
  }
};

// Starting state
let mode = 'paal'

// Hint Button
const hintBtn = document.getElementById('show-hint');
const hint = document.querySelector('.hint');

hintBtn.addEventListener('click', () => hint.classList.toggle('active'));

// Initial Game Set up
// 0. Decorate tiles
decorate();
// 1. Select all tiles
const tiles = document.querySelectorAll("td");

// 2. For each tile
// 3. Listen to the click event
tiles.forEach((tile) => tile.addEventListener('click', tileSwap))

