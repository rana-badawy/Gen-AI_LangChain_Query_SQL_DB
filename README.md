# Natural Language to SQL Query with Streamlit and Docker

This project provides an interface to convert natural language input into SQL queries and execute them against a MySQL database. The application uses Streamlit for the user interface and is containerized using Docker for ease of deployment.

## Features

- **Natural Language Processing**: Converts user input in natural language to SQL queries.
- **MySQL Integration**: Executes the generated SQL queries against a MySQL database.
- **Streamlit Interface**: Provides a web-based interface for user interaction.
- **Dockerized**: Containerized with Docker for consistent and portable deployment.

## Project Structure

- `Dockerfile`: Docker configuration file to build the image.
- `docker-compose.yml`: Docker Compose file to set up the application with necessary services.
- `few_shots.py`: Script for few-shot learning setup.
- `langchain_helper.py`: Helper functions for LangChain integration.
- `main.py`: Main application file to run the Streamlit app.
- `query_database_with_ai.ipynb`: Google Colab notebook containing the project code.

## Technologies Used

### AI and Natural Language Processing

- **LangChain**: This project leverages LangChain for natural language processing. LangChain helps in converting natural language input into SQL queries. The integration is handled in the `langchain_helper.py` file, which contains helper functions to facilitate this conversion.
- **Google PaLM**: The project uses Google PaLM as the large language model (LLM) to understand and process natural language input. PaLM is integrated through LangChain to generate accurate SQL queries from natural language queries.
- **Chroma**: Chroma is used as the vector database for storing embeddings and facilitating similarity search. This helps in efficiently handling and retrieving relevant data based on the input queries.
- **Few-Shot Learning**: The project employs few-shot learning techniques to improve the accuracy and relevance of the generated SQL queries. This is implemented in the `few_shots.py` file, where examples and contextual understanding are provided to fine-tune the model's responses.

### Frontend

- **Streamlit**: Streamlit is used for the user interface, providing a simple and interactive web-based interface for inputting natural language queries and displaying results.

### Containerization

- **Docker**: Docker is used to containerize the application, ensuring consistency across different environments and simplifying the deployment process. The configuration is provided in the `Dockerfile` and `docker-compose.yml`.

## Getting Started

### Prerequisites

- Docker
- Python

### Installation

1. **Clone the repository**

   ```sh
   git clone https://github.com/rana-badawy/Gen-AI_LangChain_Query_SQL_DB
   ```

2. **Add your Credentials**

   - Modify the `GOOGLE_API_KEY` in the `docker-compose.yml` file to include your key on Google Palm.
   - Add .env file to include your GOOGLE_API_KEY and Database username and password.

   
3. **Build and run the Docker container**   

   ```sh
   docker-compose up --build
   ```
4. **Create the database in Docker container**

   Use the SQL script in `create_db_script.sql` to create the database in the docker container**


5. **Access the Streamlit app**

   Open your web browser and navigate to http://localhost:8501.

## Usage

1. **Input**: Enter your question in natural language in the input field.
2. **Submit**: Click "Enter".
3. **Output**: The generated SQL query and the result from the MySQL database will be displayed.

## Notebook

The project also includes a Google Colab notebook `query_database_with_ai.ipynb` that you can use to experiment with the code before running it locally.
