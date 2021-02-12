const authorization = "Bearer sk_d3589776fb80b0662ab099fb9af0f99b";
// TODO

// 4. Read the json returned and display the results in a div/table/ul
const insertMarkup = (data) => {
  document.querySelector('#userName').innerText = data.name.fullName;
  document.querySelector('#userEmail').innerText = data.email;
  document.querySelector("#userBio").innerText = data.bio;
  document.querySelector('#userPhoto').innerHTML = `<img src="${data.avatar}" height="120" width="120">`;
  document.querySelector('#userLocation').innerText = data.location;
}

const callClearbitApi = (email) => {
  fetch(`https://person.clearbit.com/v2/combined/find?email=${email}`, {
    headers: { Authorization: authorization } })
  .then(response => response.json())
  .then((data) => {
    insertMarkup(data.person);
  })
}

const callClearbitApiAsync = async (email) => {
  const response = await fetch(
    `https://person.clearbit.com/v2/combined/find?email=${email}`,
    {
      headers: { Authorization: authorization },
    }
  )
  const data = await response.json();
  insertMarkup(data.person);
};


// 1. Add listener on the form
(() => {
  const form = document.querySelector("#clearbitForm");
  form.addEventListener('submit', (event) => {
    // 2. Prevent the submission of the form with .preventDefault()
    event.preventDefault();
    // 3. Send an AJAX request to the Clearbit API using the fetch API
    const email = document.querySelector('#clearbitEmail');
    callClearbitApiAsync(email.value);
  })
})();




// callClearbitApi('nicolasproto@gmail.com');
