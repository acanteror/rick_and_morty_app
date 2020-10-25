const String charactersResponse = r'''
  {
  "data": {
    "characters": {
      "info": {
        "count": 100,
        "pages": 10,
        "next": 2,
        "prev": null
      },
      "results": [
        {
          "id": "id",
          "name": "name",
          "status": "status",
          "species": "species",
          "type": "type",
          "gender": "gender",
          "image": "image"
        }
      ]
    }
  }
}
  ''';

const String charactersData = r'''
  {
    "characters": {
      "info": {
        "count": 100,
        "pages": 10,
        "next": 2,
        "prev": null
      },
      "results": [
        {
          "id": "id",
          "name": "name",
          "status": "status",
          "species": "species",
          "type": "type",
          "gender": "gender",
          "image": "image"
        }
      ]
    }
  }
  ''';
