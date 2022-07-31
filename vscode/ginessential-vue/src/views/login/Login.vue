<template>
  <div class="login">
    <div class="container">
      <div class="col-sm-3 col-md-3">
        <h3>登录</h3>
      </div>
      <div class="row"><!-- row form-group pull-center row -->
        <div class="col col-sm-2 col-md-2"><!--  col-sm-2 col-md-2 -->
            <label for="name" class="form-label">用户名:</label>
        </div>
        <div class="col col-sm-4 col-md-4" ><!-- col-sm-5 col-md-4 -->
            <input type="text" class="form-control" id="name"
                aria-describedby="nameHelp" placeholder="名称" name="name" v-model="user.name">
        </div>
      </div>
      <div class="row">
        <div class="col col-sm-3 col-md-2">
            <label for="telephone" class="form-label">电话号码:</label>
        </div>
        <div class="col col-sm-4 col-md-4" >
          <input type="number" class="form-control" id="telephone" placeholder="11位号码"
              name="telephone" v-model="user.telephone">
        </div>
      </div>
      <div class="row">
        <div class="col col-sm-2 col-md-2">
            <label for="password" class="form-label">密 码:</label>
        </div>
        <div class="col col-sm-4 col-md-4" >
          <input type="password" class="form-control" id="password" placeholder="密码"
              name="password" v-model="user.password">
        </div>
      </div>
      <div class="col-sm-9 col-md-5 form-group">
        <input type="submit" value="登录" class="btn btn-success">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {
        name: '',
        telephone: '',
        password: '',
      },
    };
  },
};
</script>

<style lang="scss" scoped>

</style>
