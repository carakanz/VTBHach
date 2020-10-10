import tensorflow as tf
import numpy as np
import cv2

class CarRecognizer(object):
    def __init__(self, model_name):
        """Constructor"""
        self.model_name = model_name
        print("Start importing")
        
        print("Start loading model")
        self.model = tf.keras.models.load_model(model_name)
        self.labels = ["Hyundai Solaris sedan",
                       "KIA Rio sedan",
                       "SKODA OCTAVIA sedan",
                       "Volkswagen Polo sedan",
                       "Volkswagen Tiguan"]
        self.predictions = np.array([0.2, 0.2, 0.2, 0.2, 0.2]);
        self.image_size = 224
        print("Recognizer is ready")
    
    def predict(self, image):
        """Recognize a car"""
        #print("Preprocessing image")
        input_image = cv2.imdecode(image)
        self.image = cv2.resize(input_image,(self.image_size,self.image_size))
        self.image_batch = np.expand_dims(self.image, axis=0)
        #print("Making predictions")
        predictions = self.model.predict(self.image_batch)
        self.predictions = predictions[0]
        labels_and_predictions = {}
        for i, label in enumerate(self.labels):
            labels_and_predictions[label] = self.predictions[i]
        return labels_and_predictions