cart = document.getElementById('cart')
cart.innerHTML = "<%= j render(@cart) %>"

notice = document.getElementById("notice")
# console.log(notice)
# console.log(notice.textContent)
if notice.textContent == "Your cart is currently empty"
    notice.style.display = "none"


# if notice
#     notice.style.display = "none"
#The above is what the book suggested (lines 11 & 12, but I felt like
#the modification I made on 4 through 8 was a bit more precise in terms of
#user stories)