<template>
  <div id="personal">
    <h3>個人ページ</h3>

    <p>名前： 鈴木 拓磨</p>
    <p>性別： 男性</p>
    <p>年齢： 26歳</p>
    <p>体重： 65kg</p>

    <el-button type="warning">編集</el-button>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
h3 {
  font-size: 32px;
  font-weight: normal;
  text-align: center;
  margin-bottom: 50px;
}
p {
  font-size: 24px;
  text-align: center;
}
.el-button {
  display: block;
  margin: 50px auto;
}
</style>
