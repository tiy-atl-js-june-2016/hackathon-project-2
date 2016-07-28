## Hackathon - Portfolio Builder (Team Tim)

> Sign up and watch your career take off. It's raining jobs!

- Create an account
- Provide some Github details
- Choose your layout
- Add employment & education background & bio
- Generate a shareable portfolio page

> [https://hackathon-team-tim.herokuapp.com](https://hackathon-team-tim.herokuapp.com)

## Authorization

All authorized requests unless otherwise mentioned require
a "**Access-Token**" header to be present. Users are assigned an
Auth Token during account creation. The access token can be
retrieved at any time via the "/login" route.

#### Errors

Any request that fails to be processed will return an *appropriate*
status code as a response as well as a JSON object with an "errors"
property providing any additional data to solve the problem.

### Routes

#### POST /signup

> This route creates an account for a new user.

**Params:**

```
  * first_name: string
  * last_name: string
  * username: string
  * email: string
  * password: string
```

**Status Code:**
Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

**Request:**

```
{
  "first_name": "Tim",
  "last_name": "Whitacre",
  "username": "tbone",
  "email": "tim@tim.com",
  "password": "iheartquiteriot"
}
```

**Response:**

```
{
  "user": {
    "id": 35,
    "first_name": "Tim",
    "last_name": "Whitacre",
    "username": "tbone",
    "email": "tim@tim.com",
    "access_token": "7774743beeb3c26dfdd80213ba1b9097"
  }
}
```

#### POST /login

> This route exists 'signs a user in' and gets their info.

**Params:**

```
username: string
password: string
```

**Status Codes:**
Returns 200 on success and 401 on failure.

***Request:***

```
{
  "username": "tbone",
  "password": "iheartquiteriot"
}
```

***Response:***

```
{
  "access_token": "7774743beeb3c26dfdd80213ba1b9097",
  "username": "tbone"
}
```

## Profiles

### POST /profiles

```
github_username: string
location: string
bio: string
layout_choice: number
```

***Response:***

```
{
  github_username: 'twhitacre',
  location: 'Atlanta',
  bio: 'This is all about me',
  layout_choice: 5,
  user: 'tbone',
  user_id: 1
}
```

### GET /profiles/:id

***Response:***

```
{
  github_username: 'twhitacre',
  location: 'Atlanta',
  bio: 'This is all about me',
  layout_choice: 5,
  user: 'tbone',
  user_id: 1
}
```

