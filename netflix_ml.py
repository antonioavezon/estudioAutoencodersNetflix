import pymysql
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
import os
import random

# Limitar mensajes en consola
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

# Configuración de conexión a MySQL
def conectar_db():
    return pymysql.connect(
        host="localhost",
        user="root",
        password="qwerty",
        database="netflix"
    )

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
    mean_user_rating = matriz.mean(axis=1).reshape(-1, 1)
    normalized = matriz - mean_user_rating
    return normalized, mean_user_rating

# Entrenar modelo
def entrenar_modelo(train, input_dim):
    model = Sequential([
        Dense(256, activation='relu', input_shape=(input_dim,)),
        Dense(128, activation='relu'),
        Dense(64, activation='relu'),
        Dense(128, activation='relu'),
        Dense(256, activation='relu'),
        Dense(input_dim, activation='sigmoid')
    ])
    model.compile(optimizer='adam', loss='mean_squared_error')
    model.fit(train, train, epochs=10, batch_size=32, validation_split=0.1, verbose=1)
    return model

# Obtener recomendaciones para un usuario
def obtener_recomendaciones(usuario_id, ratings_matrix, predicted_ratings, connection, top_n=5):
    usuario_idx = ratings_matrix.index.get_loc(usuario_id)
    predicciones_usuario = predicted_ratings[usuario_idx]
    peliculas_recomendadas_idx = np.argsort(-predicciones_usuario)[:top_n]
    
    recomendaciones = []
    for pelicula_idx in peliculas_recomendadas_idx:
        query = f"SELECT titulo, genero FROM peliculas WHERE id = {pelicula_idx + 1};"
        with connection.cursor() as cursor:
            cursor.execute(query)
            result = cursor.fetchone()
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
    model = entrenar_modelo(train, input_dim)

    # Predicciones
    predicted_ratings = model.predict(normalized_ratings) + mean_user_rating

    # Sorteo de usuarios
    usuarios_aleatorios = random.sample(ratings_matrix.index.tolist(), 10)

    # Mostrar historial de visualización
    print("\n=== Datos Preliminares: Vistas y Valoraciones de los Usuarios Seleccionados ===")
    for usuario_id in usuarios_aleatorios:
        mostrar_historial_usuario(usuario_id, df)

    # Mostrar recomendaciones
    print("\n=== Recomendaciones para los Usuarios Seleccionados ===")
    for usuario_id in usuarios_aleatorios:
        usuario_nombre = df[df['usuario_id'] == usuario_id]['usuario_nombre'].iloc[0]
        recomendaciones = obtener_recomendaciones(usuario_id, ratings_matrix, predicted_ratings, connection)
        mostrar_recomendaciones(usuario_nombre, recomendaciones)

    connection.close()

if __name__ == "__main__":
    main()
