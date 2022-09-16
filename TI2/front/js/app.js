const getElement = (selector) => {
  const element = document.querySelector(selector)

  if (element) return element
  throw Error(
    `Please double check your class names, there is no ${selector} class`
  )
}

const links = getElement('.nav-links')
const navBtnDOM = getElement('.nav-btn')

navBtnDOM.addEventListener('click', () => {
  links.classList.toggle('show-links')
})

const date = getElement('#date')
const currentYear = new Date().getFullYear()
date.textContent = currentYear

function ingrSelec (valor) {
  console.log(valor);
  const bg = document.querySelector("#" + valor);
  if (bg.style.background == "rgba(255, 191, 133, 0.5)")
  {
    bg.style.background= "rgba(255, 191, 133, 0.0)"
  } else {
    bg.style.background= "rgba(255, 191, 133, 0.5)";
  }
}
