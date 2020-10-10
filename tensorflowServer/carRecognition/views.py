import json
import base64
from os import path

from django.http import HttpResponse
from django.http import HttpResponseBadRequest
from django.views.decorators.csrf import csrf_exempt

from carRecognition.scripts.CarRecognizer import CarRecognizer


logger = CarRecognizer.get_recognizer(path.join("carRecognition", "scripts", "mnv2_model_1.h5"))

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
        image = base64.decodebytes(content)
        result = logger.predict(image)
    except Exception:
        return HttpResponseBadRequest("Invalid base64 jpg image")

    return json.dumps({"probabilities": result})