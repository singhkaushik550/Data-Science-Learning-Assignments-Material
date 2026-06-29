import streamlit as st
import random

# ---------------------------
# Title
# ---------------------------
st.set_page_config(page_title="Rock Paper Scissors", page_icon="🎮")

st.title("🎮 Rock Paper Scissors Game")
st.write("Play Best of 3 Rounds")

# ---------------------------
# Session State
# ---------------------------
if "user_score" not in st.session_state:
    st.session_state.user_score = 0

if "computer_score" not in st.session_state:
    st.session_state.computer_score = 0

if "draw_score" not in st.session_state:
    st.session_state.draw_score = 0

if "round" not in st.session_state:
    st.session_state.round = 1


choices = ["rock", "paper", "scissors"]

# ---------------------------
# User Choice
# ---------------------------
user = st.radio(
    "Choose your move",
    choices,
    horizontal=True
)

# ---------------------------
# Play Button
# ---------------------------
if st.button("Play Round"):

    computer = random.choice(choices)

    st.write(f"### You chose: **{user.capitalize()}**")
    st.write(f"### Computer chose: **{computer.capitalize()}**")

    # Winner Logic
    if user == computer:
        st.success("🤝 Draw")
        st.session_state.draw_score += 1

    elif (
        (user == "rock" and computer == "scissors")
        or (user == "paper" and computer == "rock")
        or (user == "scissors" and computer == "paper")
    ):
        st.balloons()
        st.success("🏆 You Win!")
        st.session_state.user_score += 1

    else:
        st.error("💻 Computer Wins!")
        st.session_state.computer_score += 1

    st.session_state.round += 1

# ---------------------------
# Scoreboard
# ---------------------------
st.divider()

st.subheader("📊 Scoreboard")

col1, col2, col3 = st.columns(3)

col1.metric("👤 You", st.session_state.user_score)
col2.metric("💻 Computer", st.session_state.computer_score)
col3.metric("🤝 Draw", st.session_state.draw_score)

st.write(f"### Current Round: {min(st.session_state.round,4)} / 3")

# ---------------------------
# Final Result
# ---------------------------
if st.session_state.round > 3:

    st.divider()

    st.header("🏁 Final Result")

    if st.session_state.user_score > st.session_state.computer_score:
        st.success("🎉 Congratulations! You are the Winner!")

    elif st.session_state.computer_score > st.session_state.user_score:
        st.error("💻 Computer is the Winner!")

    else:
        st.info("🤝 Match Draw!")

# ---------------------------
# Reset Button
# ---------------------------
if st.button("Reset Game"):

    st.session_state.user_score = 0
    st.session_state.computer_score = 0
    st.session_state.draw_score = 0
    st.session_state.round = 1

    st.rerun()