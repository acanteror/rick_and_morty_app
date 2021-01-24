const String characterDetailResponse = r'''
  {
  "data": {
    "character": {
        "id": "id",
        "name": "name",
        "status": "status",
        "species": "species",
        "type": "type",
        "gender": "gender",
        "image": "image",
        "episode": [
          {
            "id": "id",
            "name": "name",
            "air_date": "air_date",
            "episode": "episode"
          }
        ]
      }
    }
  }
  ''';

const String characterDetailData = r'''
  {
    "character": {
        "id": "id",
        "name": "name",
        "status": "status",
        "species": "species",
        "type": "type",
        "gender": "gender",
        "image": "image",
        "episode": [
          {
            "id": "id",
            "name": "name",
            "air_date": "air_date",
            "episode": "episode"
          }
        ]
      }
    }
  
  ''';
