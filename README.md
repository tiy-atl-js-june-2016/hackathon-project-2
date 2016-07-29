## Hackathon - Portfolio Builder (Team Tim)

> Sign up and watch your career take off. It's raining jobs!

- Create an account
- Provide some Github details
- Choose your layout
- Add employment & education background & bio
- Generate a shareable portfolio page

[https://hackathon-team-tim.herokuapp.com](https://hackathon-team-tim.herokuapp.com)

## Authorization

Some requests require an "**Access-Token**" header to be present. Users are assigned an Auth Token during account creation. The access token can be retrieved at any time via the "/login" route.

The following routes require it:

- POST `/profiles`
- PUT `/profiles/:username`

#### Errors

Any request that fails to be processed will return an *appropriate*
status code as a response as well as a JSON object with an "errors"
property providing any additional data to solve the problem... most of the time :neckbeard:

## Users

#### POST `/signup`

This route creates an account for a new user.


**Request:**

```
{
  "first_name": <string>,
  "last_name": <string>,
  "username": <string>,
  "email": <string>,
  "password": <string>
}
```

**Response:**

```
{
  user: {
    id: 35,
    first_name: 'Tim',
    last_name: 'Whitacre',
    username: 'tbone',
    email: 'tim@tim.com',
    access_token: '7774743beeb3c26dfdd80213ba1b9097'
  }
}
```

#### POST `/login`

This route exists 'signs a user in' and gets their info.

**Request:**

```
{
  username: <string>,
  password: <string>
}
```

**Response:**

```
{
  access_token: '7774743beeb3c26dfdd80213ba1b9097',
  username: 'tbone',
  user_id: 1
}
```

## Profiles

#### POST `/profiles`


**Request**

```
{
	github_username: <string>
	location: <string>
	bio: <string>
	layout_choice: <number>
	page_title: <string>
}
```

**Response:**

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

#### GET `/profiles/:username`

**Response:**

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

#### PUT `/profiles/:username`

**Request**

```
{
	github_username: <string>
	location: <string>
	bio: <string>
	layout_choice: <number>
	page_title: <string>
}
```

**Response:**

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

## Github

#### GET `/github/:username`

**Response:**

```
{
  user: [...],
  repos: [...],
  orgs: [...]
}
```

> The response above is based off the [Github API v3](https://developer.github.com/v3/). Go there for a detailed description of what is returned.