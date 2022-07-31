<template>
  <div class="home">
    <div>
      <button type="button">Button</button>
      <button type="button" class="btn btn-primary">Primary</button>
      <button type="button" class="btn btn-danger">Danger</button>
      <button type="button" class="btn btn-success">Success</button>
      <button type="button" class="btn btn-warning">Warning</button>
    </div>
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue';

export default {
  name: 'Home',
  components: {
    HelloWorld,
  },
};
</script>
