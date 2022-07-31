import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap';

// scss style
// import './assets/scss/index.scss';

// BootstrapVue目前还不支持Vue 3,Bootstrap4.5.3
// import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';
//  // install BootstrapVue
// createApp(App).use(BootstrapVue);
// createApp(App).use(IconsPlugin);

createApp(App).use(store).use(router).mount('#app');
