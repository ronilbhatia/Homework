console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: 'GET',
  success: function(weather) {
    console.log("Here are the fetched json parameters of the weather");
    console.log(weather);
  },
});
// Add another console log here, outside your AJAX request
console.log("was gucci fam");
