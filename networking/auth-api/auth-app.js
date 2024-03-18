const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json());

app.get('/verify-token/:token', (req, res) => {
  console.log("Request /verify-token/:token")
  const token = req.params.token;

  // dummy verification!
  if (token === 'abc') {
    return res.status(200).json({ message: 'Valid token.', uid: 'u1' });
  }
  res.status(401).json({ message: 'Token invalid.' });
});

app.get('/token/:hashedPassword/:enteredPassword', (req, res) => {
  console.log("Request /token/:hashedPassword/:enteredPassword")
  const hashedPassword = req.params.hashedPassword;
  const enteredPassword = req.params.enteredPassword;

  // dummy password verification!
  if (hashedPassword === enteredPassword + '_hash') {
    const token = 'abc';
    return res.status(200).json({ message: 'Token created.', token: token });
  }
  res.status(401).json({ message: 'Passwords do not match.' });
});

app.get('/hashed-password/:password', (req, res) => {
  console.log("Request /hashed-password/:password")
  // dummy hashed pw generation!
  const enteredPassword = req.params.password;
  const hashedPassword = enteredPassword + '_hash';
  res.status(200).json({ hashedPassword: hashedPassword });
});

app.get('/health', (req, res) => {
  console.log("/health request")
  res.send("Welcome to auth-app")
});


console.log("Listening on port 8000")
app.listen(8000);
