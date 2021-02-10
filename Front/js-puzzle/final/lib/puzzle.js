// Decorate
(() => {
  const pieces = document.querySelectorAll('td');
  pieces.forEach((piece) => {
    if (piece.dataset.number) piece.style.backgroundImage = `url(./images/${piece.dataset.number}.jpg)`;
  })
})();

// DO NOT TOUCH CODE ABOVE 👆

// Hint Button
const hintBtn = document.getElementById('show-hint');
const hint = document.querySelector('.hint');

document.addEventListener('click', () => hint.classList.toggle('active'));

// Logic for checking empty spots
// 4. If it has an empty neighbor
const canMove = (tile) => {
  console.log(tile);
}

// Logic for tile swapping
// 5. Swap the tile and the empty space
// 6. Check if player wins
const tileSwap = () => {
  canMove(event.currentTarget);
  console.log("I Was clicked");
};

// 1. Select all tiles
const tiles = document.querySelectorAll("td");

// 2. For each tile
// 3. Listen to the click event
tiles.forEach((tile) => tile.addEventListener('click', tileSwap))



