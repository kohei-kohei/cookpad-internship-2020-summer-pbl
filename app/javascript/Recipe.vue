<template>
  <div id="recipe">
    <p class="sub-title">今日摂った栄養素はこちらです</p>
    <div class="result-flex">
      <div class="result">
        <p>糖質</p>
        <el-progress type="circle" :percentage="30" color="#F56C6C"></el-progress>
        <p>あと230g</p>
      </div>
      <div class="result">
        <p>タンパク質</p>
        <el-progress type="circle" :percentage="40" color="#E6A23C"></el-progress>
        <p>あと35g</p>
      </div>
      <div class="result">
        <p>脂質</p>
        <el-progress type="circle" :percentage="18" color="#F56C6C"></el-progress>
        <p>あと48g</p>
      </div>
    </div>

    <p class="sub-title">オススメのレシピ</p>
    <div class="flex">
      <template v-for="(recipe, key) in recipes">
        <div class="card" @click="goDetail" :key="key">
          <img :src="recipe.url" :alt="recipe.title" />
          <p>{{ recipe.title }}</p>
          <p class="nutrition">糖質：{{ recipe.suger }}g</p>
          <p class="nutrition">タンパク質：{{ recipe.protain }}g</p>
          <p class="nutrition">脂質：{{ recipe.fat }}g</p>
          <el-rate v-model="starValue[key]" disabled></el-rate>
        </div>
      </template>
    </div>

    <router-link to="/">入力画面に戻る</router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      recipes: [
        {
          url:
            "https://img.cpcdn.com/recipes/3571241/m/c20f8fa8a9b3dcf13c860ab94ef036bd?u=369673&p=1557239744",
          title: "ブロッコリーと豚コマの中華炒め",
          suger: 12.4,
          protain: 50.8,
          fat: 46.2,
        },
        {
          url:
            "https://img.cpcdn.com/recipes/6324425/m/3c0e48a9b5328bf092075496ca8badcc?u=21222539&p=1593343185",
          title: "ピーマンと鶏肉の味噌炒め",
          suger: 5.4,
          protain: 34.1,
          fat: 32.3,
        },
        {
          url:
            "https://img.cpcdn.com/recipes/6435381/m/a5d5fe68c85bc4d1cdf7fef5e66975e8?u=8829868&p=1599382561",
          title: "牛肉甘辛炒め",
          suger: 30.9,
          protain: 32.6,
          fat: 66.2,
        },
      ],
      starValue: [5, 3.6, 3]
    };
  },
  methods: {
    goDetail() {
      this.$router.push({ path: "/recipedetail" });
    },
  },
};
</script>

<style scoped>
#recipe {
  margin: 50px 200px;
  text-align: center;
}
.sub-title {
  font-size: 24px;
  text-align: center;
  margin-top: 0;
  margin-bottom: 10px;
}
.flex {
  align-items: center;
  display: flex;
  flex-wrap: wrap;
  text-align: center;
}
.result-flex {
  display: flex;
  margin: 30px auto 50px;
  width: 510px;
}
.result {
  margin: 0 20px;
}
.card {
  background-color: #fff;
  border: 1px solid #aaa;
  border-radius: 8px !important;
  text-align: center;
  width: calc(33.33333% - 42px);
  height: 390px;
  margin: 20px;
}
.nutrition {
  margin: 0;
}
img {
  width: 100%;
  height: 200px;
  border-radius: 8px 8px 0 0;
}
p {
  font-size: 20px;
  margin: 10px 0;
}
a {
  margin-top: 30px;
}
.el-rate {
  margin-top: 10px;
}
</style>
