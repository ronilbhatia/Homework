const timeoutFunction = window.setTimeout(function() {
  alert("HAMMERTIME");
}, 5000);

const hammerTime = (time) => {
  window.setTimeout(function() {
    alert(`${time} is hammertime!`)
  }, 6000)
}
