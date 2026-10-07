from flask import Flask, request, jsonify
import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import os

app = Flask(__name__)

# Charger le dataset
file_path = r"C:\Users\aouadhi\Downloads\archive (3)\diabetes.csv"  # Modifiez le chemin si nécessaire
data = pd.read_csv(file_path)

# Préparer les données
new_data = data.loc[:, ['Glucose', 'BloodPressure', 'Insulin', 'BMI', 'Age']]
X = new_data[['BloodPressure', 'Insulin', 'BMI', 'Age']]  # Features
y = new_data['Glucose']  # Variable cible

# Entraîner le modèle
model = RandomForestRegressor(n_estimators=100, random_state=42)
model.fit(X, y)

# Route principale pour la prédiction
@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Récupérer les données JSON envoyées par Flutter
        data = request.json
        blood_pressure = float(data['blood_pressure'])
        insulin = float(data['insulin'])
        bmi = float(data['bmi'])
        age = float(data['age'])

        # Préparer les données pour la prédiction
        input_data = np.array([[blood_pressure, insulin, bmi, age]])

        # Prédire le niveau de glucose
        predicted_glucose = model.predict(input_data)[0]

        # Retourner la prédiction en JSON
        return jsonify({'predicted_glucose': round(predicted_glucose, 2)})
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    # Exécuter le serveur Flask sur votre machine locale
    app.run(host='0.0.0.0', port=5000, debug=True)
