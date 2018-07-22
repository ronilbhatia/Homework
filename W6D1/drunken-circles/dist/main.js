!function(t){var e={};function r(n){if(e[n])return e[n].exports;var o=e[n]={i:n,l:!1,exports:{}};return t[n].call(o.exports,o,o.exports,r),o.l=!0,o.exports}r.m=t,r.c=e,r.d=function(t,e,n){r.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},r.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},r.t=function(t,e){if(1&e&&(t=r(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(r.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var o in t)r.d(n,o,function(e){return t[e]}.bind(null,o));return n},r.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return r.d(e,"a",e),e},r.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},r.p="",r(r.s=0)}([function(t,e,r){const n=r(1),o=[];window.Game=function(t,e){this.xDim=t,this.yDim=e;for(let r=0;r<Game.NUM_CIRCLES;++r)o.push(n.randomCircle(t,e,Game.NUM_CIRCLES))},Game.NUM_CIRCLES=4e3,Game.prototype.render=function(t){t.clearRect(0,0,this.xDim,this.yDim),o.forEach(function(e){e.render(t)})},Game.prototype.moveCircles=function(){o.forEach(t=>{t.moveRandom(this.xDim,this.yDim)})},Game.prototype.start=function(t){const e=t.getContext("2d"),r=()=>{this.moveCircles(),this.render(e),requestAnimationFrame(r)};r()},t.exports=Game},function(t,e){const r=function(t,e,r,n){this.centerX=t,this.centerY=e,this.radius=r,this.color=n};r.randomCircle=function(t,e,n){return new r(t*Math.random(),e*Math.random(),r.radius(t,e,n),r.randomColor())};r.randomColor=function(){let t="#";for(let e=0;e<6;e++)t+="0123456789ABCDEF"[Math.floor(16*Math.random())];return t},r.radius=function(t,e,r){let n=t*e/r;return 2*Math.sqrt(n/Math.PI)},r.prototype.moveRandom=function(t,e){let r=2*Math.random()-1,n=2*Math.random()-1;this.centerX=Math.abs((this.centerX+r*this.radius*.1)%t),this.centerY=Math.abs((this.centerY+n*this.radius*.1)%e)},r.prototype.render=function(t){t.fillStyle=this.color,t.beginPath(),t.arc(this.centerX,this.centerY,this.radius,0,2*Math.PI,!1),t.fill()},t.exports=r}]);