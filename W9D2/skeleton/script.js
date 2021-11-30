document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const placesList = document.getElementById("place-list");
    placesList.addEventListener('submit', event => {
      event.preventDefault();
      const newPlaceInput = document.getElementsByClassName("favorite-input");
      const newPlace = newPlaceInput[0].value;
      newPlaceInput[0].value = "";

      const ul = document.getElementById("sf-places");
      const li = document.createElement("li");
      li.textContent = newPlace;
      ul.appendChild(li);
    });



  // adding new photos

  // --- your code here!



});
