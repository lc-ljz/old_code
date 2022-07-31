<!-- <template> -->
    <!-- <div> -->
        <!-- <img src="./assets/logo.png" alt="logo"> -->
        <!-- <School ref="school"></School>    ref取代id  -->
<!--        <button @click="showDom">显示dom</button>
        <hr>
        <Student name="李四" sex='女' :age='18'></Student>
    </div>
</template> -->

<!-- <script>
    //引入组件  组件中的style是放在一起的,除非加入scoped
    import School from './components/School.vue'
    import Student from './components/Student.vue' -->

    <!-- export default {
        name:"App",
        components:{
            School,
            Student
        },
        methods: {
            showDom(){
                console.log(this.$refs.school)
            }
        },
    }
</script>

<style>
    .title{
        background-color: red;
    }
</style> -->


<template>
    <div id="root">
        <div class="todo-container">
            <div class="todo-wrap">
                <Myheader></Myheader>
                <hr>
                <Mylist></Mylist>
                <hr>
                <Myfooter></Myfooter>
            </div>    
        </div>
    </div>
</template>

<script>

    import Myheader from './components/Myheader.vue'
    import Mylist from './components/Mylist.vue'
    import Myfooter from './components/Myfooter.vue'

    export default {
        name:"App",
        components:{Myheader,Mylist,Myfooter},
    }
</script>

<style lang="css">
    
</style>
