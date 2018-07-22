document.addEventListener("DOMContentLoaded", function(){
  // document.querySelector("#mycanvas");
  var canvas = document.getElementById('mycanvas');
  var c = canvas.getContext('2d');
  c.fillStyle = 'red';
  c.fillRect(100, 100, 400, 300);

  var circle = canvas.getContext('2d');
  circle.beginPath();
  circle.arc(100,400,100,0,2*Math.PI);
  circle.strokeStyle = 'purple';
  circle.linewidth = 100;
  circle.stroke();
  circle.fillStyle = 'blue';
  circle.fill();

  var clear = canvas.getContext('2d');
  clear.clearRect(150, 140, 100, 100);

  var triangle = canvas.getContext('2d');
  triangle.beginPath();
  triangle.moveTo(499, 350);
  triangle.lineTo(499, 499);
  triangle.lineTo(250, 400);
  triangle.lineTo(499, 350);
  triangle.strokeStyle = 'black';
  triangle.stroke();
  triangle.fillStyle = 'turquoise';
  triangle.fill();
});
