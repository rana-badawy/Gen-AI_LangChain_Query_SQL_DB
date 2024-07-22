import os
from dotenv import load_dotenv
from langchain_community.utilities.sql_database import SQLDatabase
from langchain.chains import create_sql_query_chain
from langchain_community.llms import GooglePalm
from langchain_community.tools.sql_database.tool import QuerySQLDataBaseTool
from operator import itemgetter
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import PromptTemplate, ChatPromptTemplate, FewShotChatMessagePromptTemplate, MessagesPlaceholder
from langchain_core.runnables import RunnablePassthrough
from langchain_community.vectorstores import Chroma
from langchain_core.example_selectors import SemanticSimilarityExampleSelector
from langchain_community.embeddings import GooglePalmEmbeddings

from few_shots import few_shots

# Load environment variables
load_dotenv()


def get_few_shot_db_chain(question):
    google_api_key = os.environ['GOOGLE_API_KEY']

    db_user = os.environ['DB_USER']
    db_password = os.environ['DB_PASSWORD']
    db_host = "db"
    db_name = "products"

    # Initialize a Chroma vector store and delete existing collections
    vectorstore = Chroma()
    vectorstore.delete_collection()

    # Create a semantic similarity example selector
    example_selector = SemanticSimilarityExampleSelector.from_examples(
        few_shots,
        GooglePalmEmbeddings(),
        vectorstore,
        k=2,
        input_keys=["input"]
    )

    # Define a chat prompt template for examples
    example_prompt = ChatPromptTemplate.from_messages(
        [
            "\nQuestion: {input}\nSQLQuery: {query}"
        ]
    )

    # Define a few-shot chat message prompt template
    few_shots_prompt = FewShotChatMessagePromptTemplate(
        example_prompt=example_prompt,
        example_selector=example_selector,
        input_variables=["input", "top_k"]
    )

    # Connect to the MySQL database using the SQLDatabase utility
    db = SQLDatabase.from_uri(f"mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}")

    # Initialize the GooglePalm language model
    llm = GooglePalm(google_api_key=google_api_key, temperature=0.1)

    # Define the final prompt template for generating SQL queries
    final_prompt = ChatPromptTemplate.from_messages(
        [
            "You are a MySQL expert. Given an input question, create a syntactically correct MySQL query to run. Unless otherwise specificed.\n\nHere is the relevant table info: {table_info}\n\nBelow are a number of examples of questions and their corresponding SQL queries.",
            few_shots_prompt,
            "{input}"
        ]
    )
    # Define a prompt template for rephrasing the answer into a human form
    answer_prompt = PromptTemplate.from_template(
        """
        Given the following user question, corresponding SQL query, and SQL result, return the Answer putting it into a sentence using the user question.
    
        Question: {question}
        SQL Query: {query}
        SQL Result: {result}
        Answer:
        """
    )
    # Define a rephrase answer chain
    rephrase_answer = answer_prompt | llm | StrOutputParser()

    # Create a chain to generate SQL queries
    generate_query = create_sql_query_chain(llm, db, final_prompt)
    execute_query = QuerySQLDataBaseTool(db=db)

    # Define the final chain to process the query and return the answer
    chain = (
            RunnablePassthrough.assign(query=generate_query).assign(
                result=itemgetter("query") | execute_query
            ) | rephrase_answer
    )

    return chain, generate_query

"""
# Test
chain.invoke({"question": "How many Adidas Black t-shirts do we have left"})

chain.invoke({"question": "How much is the total price of the inventory for all extra small size t-shirts?"})

chain.invoke({"question": "Do we have any discounts on shorts?"})

chain.invoke({"question": "What are the discounts we have on shorts?"})

chain.invoke({"question": "What are the discounts we have on shorts? What is the brand and size for each short on discount?"})

chain.invoke({"question": "If we have to sell all the Adidas shorts today with discounts applied. How much revenue our store will generate?"})

chain.invoke({"question": "If we have to sell all the Adidas shorts today without discounts applied. How much revenue our store will generate?"})

chain.invoke({"question": "What would be the revenue difference if we sell all the Adidas shorts without discounts and with discounts applied?"})
"""
