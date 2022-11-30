import firebase_admin
from firebase_admin import ml
from firebase_admin import credentials
import tensorflow as tf

firebase_admin.initialize_app(
    credentials.Certificate('C:\\Users\\I526744\\Documents\\BITS\\SEM 3\\CPAD\\Assignment\\CPAD2022SecBTeam05\\MLmodel\\application-name-91fa1-firebase-adminsdk-c5160-6254dd99f4.json'),
    options = {
        'storageBucket': 'application-name-91fa1.appspot.com'
})

source = ml.TFLiteGCSModelSource.from_tflite_model_file('C:\\Users\\I526744\\Documents\\BITS\\SEM 3\\CPAD\\Assignment\\CPAD2022SecBTeam05\\MLmodel\\model_skin.tflite')

tflite_format = ml.TFLiteFormat(model_source = source)
model = ml.Model(
    display_name = "test_model",
    tags = ["examples"],
    model_format = tflite_format
)

new_model = ml.create_model(model)
ml.publish_model(new_model.model_id)