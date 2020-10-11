import json
import base64
from os import path

from django.http import HttpResponse
from django.http import HttpResponseBadRequest
from django.views.decorators.csrf import csrf_exempt

from carRecognition.scripts.CarRecognizer import CarRecognizer


recognizer = CarRecognizer.get_recognizer(path.join(path.realpath('..'),
                                                    "tensorflowServer",
                                                    "carRecognition",
                                                    "scripts",
                                                    "mnv2_model_new.h5"))


@csrf_exempt
def car_recognize(request):
    raw_body = request.body
    try:
        json_body = json.loads(raw_body)
    except Exception as exc:
        return HttpResponseBadRequest(exc)

    content = json_body.get("content")

    if json_body is None:
        return HttpResponseBadRequest("Cannot find content")

    try:
        image = base64.b64decode(content)
        result = recognizer.predict(image)
    except Exception as exc:
        return HttpResponseBadRequest("Invalid base64 jpg image")

    return HttpResponse(json.dumps({"probabilities": result}))