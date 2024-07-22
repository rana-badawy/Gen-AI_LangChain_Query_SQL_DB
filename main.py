import streamlit as st
from langchain_helper import get_few_shot_db_chain

st.title("Products Database Q&A")

question = st.text_input("Question: ")

if question:
    chain, generate_query = get_few_shot_db_chain(question)

    query = generate_query.invoke({"question": question})
    response = chain.invoke({"question": question})

    st.header("Answer")
    st.write(query)
    st.write(response)