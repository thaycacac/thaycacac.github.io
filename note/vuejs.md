---
title: Note VueJS
author: Thaycacac
---

## Interact with the DOM
- [x] `Binding`
- [x] `v-once`
- [x] `v-html`
- [x] `v-on`
- [x] `v-model`
- [x] Hoặc `enter` hoặc `space` sẽ thực hiện

```javascript
<input type="text" @keyup.enter.space="alert" />
```
- [x] `Code templates`

- [x] `Computed`

```javascript
computed: {
  output () {
    return this.counter > 10 ? 'Greater than 10' : 'Smaller than 10'
  }
},
methods: {
  result () {
    return this.counter > 10 ? 'Greater than 10' : 'Smaller than 10'
  }
}
```
methods sẽ luôn luôn thực hiện kể cả khi không thay đổi giá trị của counter còn computed sẽ chạy nếu như counter bị thay đổi
- [x] `Watch:` execute context sẽ bị ra global, vì thế nếu sử dụng dữ liệu ở data trước tiên phải gán  `var vm = this`

- *`Computed` phù hợp với việc giá trị tính toán của 1 biến thay đổi theo những thằng khác*
- *`Watch` thì hóng sự thay đổi của thằng khác để thực hiện 1 công việc nào đấy*
*2 thằng có thể làm việc của nhau, tuy nhiên nên xác định luôn là **computed để lấy giá trị, watch để thực hiện công việc***
- [x] `Dynamic Styling`

```javascript
<div
class="demo"
:class="{red: isRed, blue: isBlue}"
//:class="[color, {red: isRed}]"
:style="backgroundColor: #ff0000"
///:style="[myStyle, {height: width + 'px'}]"
></div>
```
## Conditionals and Rendering Lists
- [x] `v-if` đi với v-else và nó sẽ comment nội dung lại
- [x] `v-show` nó sẽ thêm thuộc tính **display: none**
- [x] `v-for:`  có thể sử dụng v-for cho mảng, object trong data, số

```javascript
<li v-for="item in items" :key="item.key"></li>
<li v-for="(item, i) in items"></li>
<div v-for="(value, key, index) in person">{{ value }}{{ key }}{{ index }}</div>
```
## VueJS Instance
## Vue Cliprops for parent child communication
## Components

```javascript
export default {
  data() {
    return {
    }
  },
  methods: {
  }
}
```
- [x] `User props`

```javascript
export default {
  props: ['name'] //<p>Name : {{ name }}</p>
}
```

```javascript
export default {
    props: {
      id: {
        type: String,
        required: true,
        default: 1
      },
      resetFn: Funcion//@click="resetFun()"
      //<name-component :resetFn="resetName"></name-component>
    }
}
```
- [x] `Change vue from component child to component parent`

```javascript
//child
methods: {
  resetName() {
    this.name = 'abcd'
    this.$emit('nameWasReset', this.name)
  }
}
```

```html
<!--parent-->
<name-component :name="cdef" @nameWasReset="name = $event"></name-component>
```
- [x] `Pass content with slots`
- [x] `Directives`
## Filter & Mixins
- [x] `Filter`
```javascript
Vue.filter('to-lowercase', (value) => {
  return value.toLowerCase()
})
```

```javascript
//fruitMixins
export const fruitMixin {
  data () {
    return {
      fruits: ['apple', 'banana', 'mango', 'melon'],
      filterText: ''
    }
  },
  computed: {
    filterFruit () {
      return this.fruits.filter((element) => {
        return element.match(this.filterText)
      })
    }
  }
}
```

```javascript
//list.vue
import { fruitMixin } from '../fruitMixins'
export default {
  mixins: [fruitMixin]
}
```

```html
<li v-for="fruit in filterFruit">{{ fruit }}</li>
```
## Transition

```html
<transition name="fade"
    enter-active-class="animate bounce"
    leave-active-class="animate shake"
>
    <div v-if="show"> abcd </div>
</transition>
```

```css
<style>
    .fade-enter {
      opacity: 0;
    }
    .fade-enter-active {
      transition: opacity 1s;
      opacity: 1;
    }
    .fade-leave {
    }
    .fade-leave-active {
      transition: opacity 1s;
      opacity: 0;
    }
</style>
```

[Animate.css](https://daneden.github.io/animate.css/)

## Routing

```java
const router = new VueRouter({
  routes,
  mode: 'history'
})
```
- [x] **Navigation**

```html
<ul>
  <router-link to="/" tag="li" active-class="active" exact><a>Home</a></router-link>
  <router-link to="/" tag="li" active-class="active"><a>Home</a></router-lin >
</ul>
```
- [x] `Imperative Navigation`

```javascript
methods: {
  navigateToHome () {
    this.$router.push('/')
  }
}
```
- [x] `Get params`

```javascript
data () {
  return {
    if: this.$router.params.id
  }
},//for dynamic
watch: {
  '$router'(to, from) {
    this.id = to.params.id
  }
}
```
- [x] `Redirect`

```javascript
{ path: '*', redirect: '/' }
```
- [x] `Default`
```javascript
{ path: '', name: 'home', components: {
  default: Home,
  'header-booton': Header//import
} }
```
- [x] `Animation route`

```html
<router-view name: header-top>
  <transition name="slide" mod="out-in">
    <router-view></router-view>
  </transition>
</router-view>
```
- [x] `All atribute`

```javascript
return {
  link: {
    name: 'userEdit',
    params: {
      id: this.$route.params.id
    },
    query: {
      locale: 'en',
      q: 100
    },
    hash: '#data'
  }
}
```
- [x] `Guard`

```javascript
{ path: '/user', component: User, beforeEnter: (to, from, next) => {
  next()
} }
```
>- [x] `Before Left (245)`

## VUEX
- [x] `State`

```javascript
export const store = new Vuex.store ({ 
  state: {
    counter: 0
  } 
})
//use
methods: {
  increment () {
    this.$store.state.count++
  },
  decrement () {
    this.$store.count--
  }
}
```
- [x] `Getter`

```javascript
getter: {
  doubleCounter: state => {
    return state.counter * 2
  }
}
//use
computed: {
  counter () {
    return this.$store.getters.doubleCounter;
  }
}
```
- [x] `Mapping Getter`

```javascript
getter: {
  doubleCounter: state => {
    return state.counter * 2
  },
  stringCouter: state => {
    return state.counter + 'Clicks'
  }
}
//use 
import { mapGetters } from 'vuex'
computed: {
  ...mapGetters([
    'doubleCouter',
    propertyName: 'stringCouter'//or
  ])
}
```
- [x] `Mutations`
 Between state and change component. Betwwen componet and mutations is commit

```javascript
mutations: {
   increment: state => {
     state.counter++;
   },
   decrement: state => {
     state.couter--
   }
}
//use
methods: {
  increment () {
    this.$store.commit('increment')
  },
  decrement () {
    this.$store.commit('decrement')
  }
}
//or
methods: {
  ...mapMutations([
    'increment',
    'deincrement'
  ])
}
```

- [x] `Action`
Between mutations and componenet. Betwwen actions and components is dispatch

```javascript
mutations: {
   increment: state => {
     state.counter++;
   },
   decrement: state => {
     state.couter--
   }
},
actions: {
  increment: context => {
    context.commit('increment')
  }
  //or
  increment: ({commit}) {
    commit('increment')
  },
  increment: ({commit})
}

//Use mapping actions
methods: {
  ...mapActions([
    'increment',
    'deincrement',
    increment(by) {
      this.$store.dispatch('increment', by)
    }
  ])
}
```
