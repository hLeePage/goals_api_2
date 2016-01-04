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
```
[
  {
    "body": "I will sell this house today!",
    "id": 2,
    "username": "kermit",
    "user_id": 1,
    "created_at": "2015-12-18T19:30:07.248Z",
    "upvotes": 0,
    "downvotes": 0,
    "completed": false,
    "comments": [
      {
        "body": "I believe in you!",
        "id": 1,
        "username": "miss",
        "user_id": 2,
        "goal_id": 2,
        "created_at": "2015-12-18T19:43:33.078Z"
      },
      {
        "body": "I'll see you at 4:00p.",
        "id": 2,
        "username": "fozzy",
        "user_id": 3,
        "goal_id": 2,
        "created_at": "2015-12-18T19:50:50.730Z"
      }
    ]
  }
]
```
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
```
[
  {
    "body": "I will sell this house today!",
    "id": 2,
    "username": "kermit",
    "user_id": 1,
    "created_at": "2015-12-18T19:30:07.248Z",
    "upvotes": 0,
    "downvotes": 0,
    "completed": false,
    "comments": [
      {
        "body": "I believe in you!",
        "id": 1,
        "username": "miss",
        "user_id": 2,
        "goal_id": 2,
        "created_at": "2015-12-18T19:43:33.078Z"
      },
      {
        "body": "I'll see you at 4:00p.",
        "id": 2,
        "username": "fozzy",
        "user_id": 3,
        "goal_id": 2,
        "created_at": "2015-12-18T19:50:50.730Z"
      }
    ]
  },
  {
    "body": "Find Waldo.",
    "id": 4,
    "username": "miss",
    "user_id": 2,
    "created_at": "2015-12-18T19:33:50.561Z",
    "upvotes": 0,
    "downvotes": 0,
    "completed": false,
    "comments": []
  },
  {
    "body": "Take a 25 minute stroll.",
    "id": 5,
    "username": "miss",
    "user_id": 2,
    "created_at": "2015-12-18T19:46:09.173Z",
    "upvotes": 0,
    "downvotes": 0,
    "completed": false,
    "comments": []
  }
]
```

To retrieve Fozzy's profile information, as well as an array of followers and an array of followings:
`GET`    `/users/<Fozzy's id>`
```
{
  "username": "fozzy",
  "id": 3,
  "first": "Fozzy",
  "last": "Bear",
  "email": "fozzy@bear.com",
  "following": [],
  "followers": [
    {
      "username": "kermit",
      "id": 1,
      "first": "Kermit",
      "last": "Frog",
      "email": "kermit@frog.com"
    },
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
To retrieve an array of Fozzy's goals:
`GET`    `/users/<Fozzy's id>/goals`
```
[
  {
    "body": "Get present for Gonzo",
    "id": 6,
    "username": "fozzy",
    "user_id": 3,
    "created_at": "2016-01-04T22:29:43.143Z",
    "upvotes": 0,
    "downvotes": 0,
    "completed": false,
    "comments": []
  }
]
```

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
```
[
  {
    "body": "I believe in you!",
    "id": 1,
    "username": "miss",
    "user_id": 2,
    "goal_id": 2,
    "created_at": "2015-12-18T19:43:33.078Z"
  },
  {
    "body": "I'll see you at 4:00p.",
    "id": 2,
    "username": "fozzy",
    "user_id": 3,
    "goal_id": 2,
    "created_at": "2015-12-18T19:50:50.730Z"
  }
]
```
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
