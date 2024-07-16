<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
  <script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-auth.js"></script>
  <script>
    // Your web app's Firebase configuration
    var firebaseConfig = {
      apiKey: "YOUR_API_KEY",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);

    // Initialize Firebase Authentication and get a reference to the service
    const auth = firebase.auth();

    // Function to handle user sign up
    function signUp() {
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;
      firebase.auth().createUserWithEmailAndPassword(email, password)
        .then((userCredential) => {
          alert("User registered!");
        })
        .catch((error) => {
          var errorCode = error.code;
          var errorMessage = error.message;
          alert(errorMessage);
        });
    }

    // Function to handle user login
    function login() {
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;
      firebase.auth().signInWithEmailAndPassword(email, password)
        .then((userCredential) => {
          alert("User logged in!");
        })
        .catch((error) => {
          var errorCode = error.code;
          var errorMessage = error.message;
          alert(errorMessage);
        });
    }

    // Function to handle user logout
    function logout() {
      firebase.auth().signOut().then(() => {
        alert("User logged out!");
      }).catch((error) => {
        alert(error.message);
      });
    }
  </script>
</head>
<body>
  <h2>Register</h2>
  <input type="text" id="email" placeholder="Email">
  <input type="password" id="password" placeholder="Password">
  <button onclick="signUp()">Sign Up</button>

  <h2>Login</h2>
  <input type="text" id="email" placeholder="Email">
  <input type="password" id="password" placeholder="Password">
  <button onclick="login()">Login</button>

  <h2>Logout</h2>
  <button onclick="logout()">Logout</button>
</body>
</html>
