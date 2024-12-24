import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras import Input
import matplotlib.pyplot as plt
from sqlalchemy import create_engine
import os
import random

# Limitar mensajes en consola
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

# Configuración de conexión a MySQL
def conectar_db():
    engine = create_engine("mysql+pymysql://root:qwerty@localhost/netflix")
    return engine

# Cargar datos de visualizaciones
def cargar_datos_visualizaciones(connection):
    query = """
    SELECT usuarios.id AS usuario_id, usuarios.nombre AS usuario_nombre,
           peliculas.id AS pelicula_id, peliculas.titulo AS pelicula_titulo,
           peliculas.genero AS pelicula_genero,
           visualizaciones.calificacion AS puntuacion
    FROM visualizaciones
    JOIN usuarios ON visualizaciones.usuario_id = usuarios.id
    JOIN peliculas ON visualizaciones.pelicula_id = peliculas.id;
    """
    return pd.read_sql(query, connection)

# Crear matriz usuario-película
def crear_matriz_usuario_pelicula(df):
    return df.pivot_table(index="usuario_id", columns="pelicula_id", values="puntuacion").fillna(0)

# Normalizar los datos
def normalizar_datos(matriz):
    mean_user_rating = matriz.mean(axis=1).reshape(-1, 1)  # Ajustado para usar directamente numpy.ndarray
    normalized = matriz - mean_user_rating
    return normalized, mean_user_rating

# Entrenar modelo
def entrenar_modelo(train, test, input_dim):
    model = Sequential([
        Input(shape=(input_dim,)),
        Dense(256, activation='relu'),
        Dense(128, activation='relu'),
        Dense(64, activation='relu'),
        Dense(128, activation='relu'),
        Dense(256, activation='relu'),
        Dense(input_dim, activation='sigmoid')
    ])
    model.compile(optimizer='adam', loss='mean_squared_error')
    history = model.fit(train, train, epochs=10, batch_size=32, validation_data=(test, test), verbose=1)
    return model, history

# Visualización 1: Progreso del entrenamiento
def visualizar_entrenamiento(history):
    plt.plot(history.history['loss'], label='Loss (Entrenamiento)')
    plt.plot(history.history['val_loss'], label='Loss (Validación)')
    plt.xlabel('Epochs')
    plt.ylabel('Error')
    plt.title('Progreso del Entrenamiento')
    plt.legend()
    plt.show()

# Visualización 2: Comparación entre predicciones y datos reales
def visualizar_comparacion_usuario(usuario_id, ratings_matrix, predicted_ratings):
    usuario_idx = ratings_matrix.index.get_loc(usuario_id)
    datos_reales = ratings_matrix.iloc[usuario_idx]
    datos_predichos = predicted_ratings[usuario_idx]

    plt.figure(figsize=(10, 5))
    plt.plot(datos_reales, 'o-', label='Datos Reales')
    plt.plot(datos_predichos, 'x-', label='Predicciones')
    plt.xlabel('Películas')
    plt.ylabel('Calificación')
    plt.title(f'Comparación Usuario {usuario_id}')
    plt.legend()
    plt.show()

# Visualización 3: Distribución de las calificaciones predichas
def visualizar_distribucion(predicted_ratings):
    plt.hist(predicted_ratings.flatten(), bins=50, color='skyblue', edgecolor='black')
    plt.xlabel('Calificaciones Predichas')
    plt.ylabel('Frecuencia')
    plt.title('Distribución de Calificaciones Predichas')
    plt.show()

# Obtener recomendaciones para un usuario
def obtener_recomendaciones(usuario_id, ratings_matrix, predicted_ratings, connection, top_n=5):
    usuario_idx = ratings_matrix.index.get_loc(usuario_id)
    predicciones_usuario = predicted_ratings[usuario_idx]
    peliculas_recomendadas_idx = np.argsort(-predicciones_usuario)[:top_n]
    
    recomendaciones = []
    for pelicula_idx in peliculas_recomendadas_idx:
        query = f"SELECT titulo, genero FROM peliculas WHERE id = {pelicula_idx + 1};"
        with connection.connect() as conn:  
            result = conn.execute(query).fetchone()  # Ejecutar la consulta y obtener un resultado
            if result:
                recomendaciones.append({"titulo": result[0], "genero": result[1]})
    return recomendaciones

# Mostrar historial de visualización
def mostrar_historial_usuario(usuario_id, df):
    historial = df[df['usuario_id'] == usuario_id]
    print(f"\nUsuario: {historial['usuario_nombre'].iloc[0]}")
    for _, row in historial.iterrows():
        print(f"  Película: {row['pelicula_titulo']} | Clasificación: {row['pelicula_genero']} | Valoración: {row['puntuacion']}")

# Mostrar recomendaciones con contexto
def mostrar_recomendaciones(usuario_nombre, recomendaciones):
    print(f"\nUsuario: {usuario_nombre}")
    for i, pelicula in enumerate(recomendaciones, start=1):
        print(f"  Película {i}: {pelicula['titulo']} | Clasificación: {pelicula['genero']}")

# Programa principal
def main():
    connection = conectar_db()
    df = cargar_datos_visualizaciones(connection)
    ratings_matrix = crear_matriz_usuario_pelicula(df)

    # Normalización de datos
    normalized_ratings, mean_user_rating = normalizar_datos(ratings_matrix.values)

    # Dividir datos en entrenamiento y prueba
    train, test = train_test_split(normalized_ratings, test_size=0.2, random_state=42)

    # Entrenamiento del modelo
    print("\n=== Entrenamiento del Modelo ===")
    input_dim = ratings_matrix.shape[1]
    model, history = entrenar_modelo(train, test, input_dim)

    # Visualización del progreso del entrenamiento
    visualizar_entrenamiento(history)

    # Predicciones
    predicted_ratings = model.predict(normalized_ratings) + mean_user_rating

    # Visualización de la distribución de calificaciones predichas
    visualizar_distribucion(predicted_ratings)

    # Sorteo de usuarios para comparación
    usuarios_aleatorios = random.sample(ratings_matrix.index.tolist(), 10)

    # Mostrar historial y comparación para cada usuario
    for usuario_id in usuarios_aleatorios:
        mostrar_historial_usuario(usuario_id, df)
        visualizar_comparacion_usuario(usuario_id, ratings_matrix, predicted_ratings)
        usuario_nombre = df[df['usuario_id'] == usuario_id]['usuario_nombre'].iloc[0]
        recomendaciones = obtener_recomendaciones(usuario_id, ratings_matrix, predicted_ratings, connection)
        mostrar_recomendaciones(usuario_nombre, recomendaciones)

    connection.close()

if __name__ == "__main__":
    main()
