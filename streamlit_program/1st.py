import streamlit as st

st.set_page_config(page_title="Number Addition", page_icon="➕", layout = "centered")

st.title("Addition of Two Numbers")
st.caption("Enter two number and it will return addition of them")

form = st.form("add_form")
num1 = form.number_input("First Number")
num2 = form.number_input("Second Number")

submitted = form.form_submit_button("Calculate Sum")

if submitted:
    result = num1+num2
    st.divider()
    st.metric(label="Result", value=result)



