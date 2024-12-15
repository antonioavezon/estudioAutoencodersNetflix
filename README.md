# estudioAutoencodersNetflix

Este es un estudio del modelo Autoencoders, usando una base de datos mysql, para simular sugerencias de películas a usuarios. Corresponde a la semana 2 del módulo TAP005-11210-224081-ONL-CERTIFICADO DE ESPECIALIDAD V, año 2024. Profesor Juan Contreras.

Para lograr este estudio, he creado una base de datos mysql con 3 tablas, cuyo script se encuentra integrado. Ya pose data de usuarios, películas y las visualizaciones.

Introducción
El sistema de recomendación utiliza una base de datos con información sobre usuarios, películas y sus valoraciones. Su objetivo principal es predecir qué películas podrían interesar a un usuario basándose en patrones de preferencias identificados en los datos existentes. Para ello, el modelo emplea un autoencoder, una red neuronal diseñada para aprender y capturar relaciones complejas entre usuarios y películas, optimizando las recomendaciones.

Paso 1: Lectura y estructuración de los datos
El sistema comienza conectándose a la base de datos para extraer los datos relevantes:

Usuarios: Cada usuario tiene un ID único.
Películas: Cada película está asociada a características como género, duración, y otras clasificaciones.
Valoraciones: Las puntuaciones que los usuarios han asignado a las películas en una escala definida (por ejemplo, de 1 a 5).
Estos datos se organizan en un dataframe y posteriormente en una matriz usuario-película. En esta matriz:

Cada fila representa un usuario.
Cada columna representa una película.
En cada intersección, se registra la puntuación que el usuario otorgó a la película. Si no existe una puntuación, se asigna un valor de 0.
Esta matriz constituye la entrada principal para el modelo.
Además, los pesos iniciales del modelo se crean y almacenan automáticamente cuando las capas se definen.

Paso 2: División de los datos en conjuntos de entrenamiento y validación
Para garantizar un entrenamiento robusto y evitar que el modelo memorice los datos:

La matriz usuario-película se divide en dos subconjuntos:
80% para entrenamiento (D): Usado para ajustar los pesos del modelo.
20% para validación (R): Reservado para evaluar el rendimiento del modelo en datos no vistos.
Esta separación asegura que el modelo sea capaz de generalizar y realizar predicciones en datos nuevos.

Paso 3: Construcción del modelo de autoencoder
El modelo de autoencoder es una red neuronal compuesta de dos partes principales:

Codificador:

Las capas de codificación reducen gradualmente la dimensionalidad de los datos.
Por ejemplo:
De la entrada original (número de películas), se reducen los datos a 256, luego a 128, y finalmente a 64 neuronas.
Este proceso permite al modelo aprender patrones clave y representaciones comprimidas de las preferencias de los usuarios.
Decodificador:

Las capas de decodificación intentan reconstruir la entrada original a partir de las representaciones comprimidas.
Por ejemplo:
De 64 neuronas, se expande a 128, luego a 256, y finalmente a la dimensión original.
Cada capa realiza cálculos basados en pesos y sesgos que se actualizan durante el entrenamiento.

La función de activación ReLU (Rectified Linear Unit) introduce no linealidad al modelo, permitiéndole capturar relaciones más complejas.
La capa final usa sigmoid, que ajusta las salidas a un rango entre 0 y 1, facilitando la interpretación de las puntuaciones previstas.
Paso 4: Entrenamiento del modelo
En el entrenamiento:

Los datos de entrenamiento (D) pasan por el modelo.
Se calculan las salidas reconstruidas.
Se mide el error (diferencia entre la entrada y la salida reconstruida) usando una métrica como el error cuadrático medio (MSE).
Los pesos y sesgos se ajustan mediante retropropagación:
El gradiente descendente actualiza los pesos para minimizar el error.
Este proceso se repite por varias iteraciones (epochs) hasta que el error sea suficientemente bajo.
Paso 5: Validación del modelo
Tras el entrenamiento, el modelo se valida con el conjunto de validación (R):

Se predicen las puntuaciones para los datos de validación.
Se comparan las predicciones con las puntuaciones reales.
Se calcula el error (MSE) para evaluar el rendimiento del modelo.
Nota importante: La validación no ocurre entre capas ni modifica pesos durante el entrenamiento. Si el modelo no generaliza bien, se considera ajustar la arquitectura o parámetros antes de un nuevo entrenamiento.
Paso 6: Generación de recomendaciones
Con el modelo entrenado y validado:

Se predicen las puntuaciones para todas las películas no vistas por un usuario.
Estas puntuaciones se ordenan de mayor a menor.
Las 5 películas con las mejores puntuaciones se seleccionan como recomendaciones.
Paso 7: Personalización de las recomendaciones
El sistema no se limita a recomendar películas similares a las que el usuario ya ha visto. Para evitar que el usuario pierda interés, incluye películas de otros géneros, simulando un enfoque más diverso como el de servicios reales como Netflix.

Conclusión
El modelo basado en autoencoders ofrece una solución robusta para sistemas de recomendación al identificar patrones complejos en las preferencias de los usuarios. Si bien es eficiente, la validación del modelo asegura que las recomendaciones sean precisas y generalizables a datos nuevos. Si el rendimiento no es satisfactorio, se replantea la arquitectura o se ajustan los parámetros.
