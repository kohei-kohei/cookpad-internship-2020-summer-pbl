<template>
  <div class="food-card">
    <img :src="url" :alt="title" />
    <p>{{ title }} {{ volume }}</p>
    <p class="nutrition">糖質：{{ suger }}g</p>
    <p class="nutrition">タンパク質：{{ protain }}g</p>
    <p class="nutrition">脂質：{{ fat }}g</p>
  </div>
</template>

<script>
export default {
  props: {
    url: {
      type: String,
    },
    title: {
      type: String,
      default: "タイトル",
    },
    volume: {
      type: String,
    },
    suger: {
      type: Number,
    },
    protain: {
      type: Number,
    },
    fat: {
      type: Number,
    },
  },
};
</script>

<style scoped>
.food-card {
  background-color: #fff;
  text-align: center;
  border: 1px solid #aaa;
  border-radius: 8px !important;
  width: calc(33.33333% - 42px);
  margin: 20px;
  height: 360px;
}
.flex {
  display: flex;
  align-items: center;
}
p {
  font-size: 20px;
  margin: 10px 0;
}
.nutrition {
  margin: 0;
}
img {
  width: 100%;
  height: 200px;
  border-radius: 8px 8px 0 0;
}
</style>
