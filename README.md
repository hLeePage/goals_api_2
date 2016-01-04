Instructions below will be in the following form:

`Request Type`  `Endpoint Address`

`Example Payload`


To create a new user account:

`POST`   `/users`
```
{
 "user":
        {
         "first": "Mark",
          "last": "Hamill",
          "username": "Luke",
          "email": "luke@force.com",
          "password": "lightsaber"
        }
}
  ```

To sign in to an existing account:
`POST`   `/oauth/token`
```
{
 "grant_type": "password",
 "username": "luke@force.com",
 "password": "lightsaber"
}
```

To retrieve the signed-in user's profile information, as well as an array of followers and an array of followings:
`GET`    `/me`
```
{
  "username": "kermit",
  "id": 1,
  "first": "Kermit",
  "last": "Frog",
  "email": "kermit@frog.com",
  "following": [
    {
      "username": "miss",
      "id": 2,
      "first": "Miss",
      "last": "Piggy",
      "email": "miss@piggy.com"
    },
    {
      "username": "fozzy",
      "id": 3,
      "first": "Fozzy",
      "last": "Bear",
      "email": "fozzy@bear.com"
    }
  ],
  "followers": [
    {
      "username": "miss",
      "id": 2,
      "first": "Miss",
      "last": "Piggy",
      "email": "miss@piggy.com"
    }
  ]
}
```

To retrieve an array of the signed-in user's goals, along with an array of comments for each goal:
`GET`    `/my_goals`

To retrieve an array of all users, as well as an array of followers and an array of followings:
`GET`    `/users`

```[
  {
    username: "kermit",
    id: 1,
    first: "Kermit",
    last: "Frog",
    email: "kermit@frog.com",
    following: [
      {
        username: "miss",
        id: 2,
        first: "Miss",
        last: "Piggy",
        email: "miss@piggy.com"
      },
      {
        username: "fozzy",
        id: 3,
        first: "Fozzy",
        last: "Bear",
        email: "fozzy@bear.com"
      }
    ],
    followers: [
      {
        username: "miss",
        id: 2,
        first: "Miss",
        last: "Piggy",
        email: "miss@piggy.com"
      }
    ]
  },
  {
    username: "miss",
    id: 2,
    first: "Miss",
    last: "Piggy",
    email: "miss@piggy.com",
    following: [
      {
        username: "kermit",
        id: 1,
        first: "Kermit",
        last: "Frog",
        email: "kermit@frog.com"
      },
      {
        username: "fozzy",
        id: 3,
        first: "Fozzy",
        last: "Bear",
        email: "fozzy@bear.com"
      }
    ],
    followers: [
      {
        username: "kermit",
        id: 1,
        first: "Kermit",
        last: "Frog",
        email: "kermit@frog.com"
      }
    ]
  }
]
```

To retrieve an array of all goals:
`GET`    `/goals`

To retrieve Rick"s profile information, as well as an array of followers and an array of followings:
`GET`    `/users/<Rick's id>`

To retrieve an array of Rick"s goals:
`GET`    `/users/<Rick's id>/goals`


To upvote the goal with id 6:
`PUT`    `/goals/6/vote_up`

To downvote the goal with id 4231:
`PUT`    `/goals/4231/vote_down`

To post a new goal:
`POST`   `/goals`
```
{
 "goal":
  {
   "body": "I will sell this house today."
  }
}
```

To retrieve the goal with id 7:
`GET`    `/goals/7`

To update one's own goal that has id 256:
`PUT`    `/goals/256`
```
{
 "goal":
  {
   "body": "I will sell this house tomorrow."
  }
}
```
To delete one's own goal that has id 11:
`DELETE`  `/goals/11`

To retrieve an array of all comments:
`GET`    `/comments`

To retrieve an array of comments for the goal with id 7:
`GET`    `/goals/7/comments`

To post a comment to the goal with id 36:
`POST`   `/goals/36/comments`
```
{
 "comment":
   {
    "body": "You are superbad!"
   }
}
```

To retrieve the comment with id 89 that was posted to the goal with id 46:
`GET`    `/goals/46/comments/89`

To update one's own comment with id 24 that was posted to the goal with id 8:
`PUT`    `/goals/8/comments/24`
```
{
 "comment":
   {
    "body": "I shouldn't have said that. This is what I meant to say"
   }
}
```

To delete one's own comment with id 56 that was posted to goal 93:
`DELETE`   `/goals/:93/comments/56`

To retrieve an array of users whom Rick is following:
`GET`    `/users/<Rick"s id>/following`

To retrieve an array of users who are following Rick:
`GET`    `/users/<Rick"s:id>/followers`

To follow Shakira:
`POST`   `/follow/<Shakira"s id>`

To cease following Shakira:
`POST`   `/unfollow/<Shakira"s id>`
