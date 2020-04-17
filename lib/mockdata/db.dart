
///Temporary helper class, TODO: remove
class DB {
  static List Dares = [
    """{
  "objective": {
    "type": "BOOLEAN",
    "goal": "NO_MEAT"
  },
  "scope": {
    "type": "TIMED",
    "length": 3
  },
  "start": "2012-01-23T18:25:43.511Z",
  "end": "2012-04-23T18:25:43.511Z",
  "participants": [
    {
      "uid": 1,
      "name": "Timothy",
      "profile_img": "/profile-picture/1",
      "score": [
        true,
        false
      ]
    },
    {
      "uid": 2,
      "name": "Steven",
      "profile_img": "/profile-picture/2",
      "score": [
        false,
        false
      ]
    }
  ]
}""",
    """{
  "objective": {
    "type": "BOOLEAN",
    "goal": "NO_MEAT"
  },
  "scope": {
    "type": "TIMED",
    "length": 3
  },
  "start": "2012-03-12T18:25:43.511Z",
  "end": "2012-03-15T18:25:43.511Z",
  "participants": [
    {
      "uid": 3,
      "name": "Tor",
      "score": [
        true,
        false,
        true
      ]
    },
    {
      "uid": 4,
      "name": "Julia",
      "score": [
        true,
        true,
        true
      ]
    }
  ]
  }"""
  ];

  static List Users = ["""
  {
  "uid": 1,
  "name": "Timothy",
  "profile_img": "/profile-picture/1",
  "dares": [
    {
      "id": "d1"
    },
    {
      "id": "d2"
    },
    {
      "id": "d3"
    }
  ],
  "friends": [
    {
      "uid": 2,
      "name": "Steven",
      "profile_img": "/profile-picture/1"
    },
    {
      "uid": 3,
      "name": "Tor",
      "profile_img": "/profile-picture/1"
    }
  ]
}
  """];
}