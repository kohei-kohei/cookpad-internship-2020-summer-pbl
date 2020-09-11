<template>
  <div id="recipedetail">
    <p class="sub-title">{{ recipes.title }}</p>

    <div class="flex">
      <img :src="recipes.url" :alt="recipes.title" />

      <div class="ingredients">
        <p>材料</p>
        <ul>
          <li>豚コマ肉 200g</li>
          <li>ブロッコリー 1/2個</li>
          <li>オイスターソース・醤油 各大さじ1/2</li>
          <li>酒・みりん 各大さじ1</li>
          <li>ごま油 小さじ1</li>
        </ul>
      </div>
    </div>

    <div class="procedure">
      <p>手順</p>
      <ol>
        <li>ブロッコリーを一口大に切り、電子レンジで2分加熱する</li>
        <li>ごま油でブロッコリーを炒める</li>
        <li>豚肉を酒と醤油で下味をつけてからブロッコリーとは別に焼く</li>
        <li>ブロッコリーを戻してオイスターソースとみりんで味付けをする</li>
        <li>完成！</li>
      </ol>
    </div>

    <router-link to="/recipe">戻る</router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      recipes: {
        url:
          "https://img.cpcdn.com/recipes/3571241/m/c20f8fa8a9b3dcf13c860ab94ef036bd?u=369673&p=1557239744",
        title: "ブロッコリーと豚コマの中華炒め",
      },
    };
  },
};
</script>

<style scoped>
#recipedetail {
  margin: 50px 200px;
  text-align: center;
}
.sub-title {
  font-size: 24px;
  text-align: center;
  margin-top: 0;
  margin-bottom: 30px;
}
.flex {
  align-items: center;
  display: flex;
  text-align: center;
}
img {
  width: 500px;
}
ul {
  text-align: left;
}
ol {
  text-align: left;
  width: 500px;
  margin: 0 auto;
}
p {
  font-size: 20px;
  margin: 10px 0;
}
.ingredients {
  margin-left: 50px;
}
.procedure {
  margin-top: 50px;
  text-align: center;
}
</style>
