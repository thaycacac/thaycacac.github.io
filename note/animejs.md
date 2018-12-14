---
title: Note AnimeJS
author: Thaycacac
---

### 1. Set up
Firstly, install anime to your project
```javascript
$ npm install animejs
OR
$ yarn add animejs
```
*Then import library to use*
```javascript
import anime from 'animejs'
```

### 2. Animation properties

Below, there are some attributes of anime
```javascript
animate() {
  anime({
    targets: '.thaycacac', //class thaycacac in HTML
    translateX: { //move horizontally
      value: 50, //value is 50px
      duration: 500, //duration: 500 ms
      delay: 100, //delay after click 100ms
    },
    translateY: { //move vertically
      value: 50
    },
    rotate: '1turn', //rotation 1 turn or 360deg
    backgroundColor: '#FF0000', //switch from blue to red
    duration: 2000,
    loop: true, //allays loop(can number)
    scale: 2, //zoom 2x
    opacity: 0.5, //opacity from 1 to 0.5
    left: '20%', //move left 20%
    })
  }
}
```

Moreover, you and add attribute of css, example: paddingLeft, color,...
*If you want to run function immediately when load page:*
```javascript
mounted() {
  return this.animate()
}
```

### 3. Timeline
You can run animation step by step by this way:
```javascript
animate() {
  const timeline = anime.timeline()
  timeline.add({
    //step 1
  })
  timeline.add({
    //step 2
  })
}
```
Some attribute of anime in timeline
- ***offset*** : normal a step done after 1000ms, but you set offset -= 100 then that step done after 900ms
- ***offset*** : if your set offset = 1000, 2000, ... then that step run after 1000, 2000,... compared to the begin timeline
### 4. Ease
Easing can change acceleration
```javascript
easeIn	            easeOut	        easeInOut
easeInQuad	    easeOutQuad	        easeInOutQuad
easeInCubic	    easeOutCubic        easeInOutCubic
easeInQuart	    easeOutQuart        easeInOutQuart
easeInQuint	    easeOutQuint        easeInOutQuint
easeInSine	    easeOutSine	        easeInOutSine
easeInExpo	    easeOutExpo	        easeInOutExpo
easeInCirc	    easeOutCirc	        easeInOutCirc
easeInBack	    easeOutBack	        easeInOutBack
easeInElastic	    easeOutElastic	easeInOutElastic
```
### [**view demo**](https://codepen.io/juliangarnier/pen/mWdraw)
- [x] Multiple effects on one line
```javascript
duration: (el, i) => {
  return i*1500 + 1500
}
```
- [x] Parameter passed in html5
```html
<button class="button thaycacac" data-time = 3000>Oke</button>
```
```javascript
const anime = document.querySelector('.thaycacac')
//then
anime({
  targets: anime,
  duration: anime.getAttribute('data-time'))
})
```
- [x] Callback
You can use callback: **update, begin, complete, run**

Source link: [http://animejs.com/](http://animejs.com/)

### 5. Animation Text with Charming
```javascript
methods: {
      animate() {
        const element = document.querySelector('.title')
        charming(element, {
          tagName: 'b',
          classPrefix: 'letter'
        })
        anime({
          targets: '.title b',
            opacity: [0, 1],
            translateY: [-100,0],
          delay: function(el, i, l) { return i * 100; },
          // loop: true,
        })
      }
    },
    mounted() {
      return this.animate()
    }
```
### 6. Draw Illustrator
**HTML**

```html
<div class="myShape">
      <svg viewBox="0 0 541.34 211.86">
        <path class="cls-1" d="M352.5,70.5c-18.73-26.22-49.64-30.56-65-18-11.14,9.1-16.48,29-9,40,10.23,15,36.48,1.59,60,21,3,2.49,15.85,13.08,15,26-1.23,18.59-30.34,34.92-36,30-11.87-10.32,63.87-127.67,83-120,16.79,6.73-15.87,107.47,2,114,10.92,4,36.77-28.65,48.73-52.82a110.44,110.44,0,0,0,4.7-11c4.35-11.94,13.82-38,2.57-53.17-5.59-7.55-17.9-14.61-26-11-25.18,11.22-5.87,123.74,13,125,13.37.89,21.26-54.35,41-54,17.84.32,26.61,45.69,44,44,4.1-.4,9.33-6.43,19.78-18.5,8.63-10,13.54-18,25.35-25.34a33.37,33.37,0,0,1,5.87-3.16c12.28-4.84,29.06-1.45,36,9a19.65,19.65,0,0,1,2.24,4.56c6.2,18.54-15.54,50.88-29.24,48.44-10.94-1.94-15.24-25.77-16-37-.88-12.9.7-41.55,16-47s39,13.85,45,35c6.31,22.07-8.18,40.82-3,44,6,3.7,28.33-20,42-37,18.88-23.49,22.6-35.9,27-35,14.18,2.9,4.49,138.11,0,138-4-.1-20.73-109,24-138,14.17-9.18,35.91-11.24,43-3,6.06,7-.46,19.41,4,50,1.16,8,2.2,11.24,5,13,9.06,5.71,32.49-7,37-21,8.57-26.64-48.34-66.69-63-77C645.37-24.18,438.88,39.72,352.5,70.5Z"
          transform="translate(-274.53 -15.14)" />
      </svg>
    </div>
```
**JavaScript**

```javascript
export default {
    methods: {
      animate() {
        anime({
          targets: '.myShape path',
          strokeDashoffset: [anime.setDashoffset, 0],
          duration: 3000,
          delay: 1000,
          easing: 'easeOutSine',
          direction: 'alternate',
          loop: true
        })
      }
    },
    mounted() {
      return this.animate()
    }
  }
```
**CSS**

```css
 .myShape {
    width: 800px;
  }

  .cls-1 {
    animation: drawShape 2s infinite;
    fill: none;
    stroke: #000;
    stroke-miterlimit: 10;
     /* stroke-dasharray: 400;
    stroke-dashoffset: 1000; */
  }
```