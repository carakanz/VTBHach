import tensorflow as tf
import numpy as np
import cv2

class CarRecognizer(object):
    def __init__(self):
        """Constructor"""
        pass

    def load_model(self, model_name):
        """Load model"""
        self.model_name = model_name
        print("Start importing")

        print("Start loading model")
        self.model = tf.keras.models.load_model(model_name)
        self.labels = ["Hyundai Solaris sedan",
                       "KIA Rio sedan",
                       "SKODA OCTAVIA sedan",
                       "Volkswagen Polo sedan",
                       "Volkswagen Tiguan"]
        self.predictions = np.array([0.2, 0.2, 0.2, 0.2, 0.2])
        self.image_size = 224
        print("Recognizer is ready")

    def predict(self, image_name):
        """Recognize a car"""
        # print("Preprocessing image")
        input_image = cv2.imread(image_name)
        self.image = cv2.resize(input_image, (self.image_size, self.image_size))
        self.image_batch = np.expand_dims(self.image, axis=0)
        # print("Making predictions")
        predictions = self.model.predict(self.image_batch)
        self.predictions = predictions[0]
        labels_and_predictions = {}
        for i, label in enumerate(self.labels):
            labels_and_predictions[label] = self.predictions[i]
        return labels_and_predictions

    def most_probable(self):
        return np.argmax(self.predictions, axis=None)

    @staticmethod
    def get_recognizer(model_name):
        car_recognizer = CarRecognizer()
        car_recognizer.load_model(model_name)