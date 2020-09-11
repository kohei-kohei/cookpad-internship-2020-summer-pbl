<template>
  <div class="exercise-card">
    <img :src="url" :alt="title" />
    <p>{{ title }} {{ time }}分</p>
    <p>{{ momentum }}kcal</p>
  </div>
</template>

<script>
export default {
  props: {
    id: {
      type: Number,
    },
    title: {
      type: String,
      default: "タイトル",
    },
    time: {
      type: Number,
    },
    momentum: {
      type: Number,
      default: 100,
    },
  },
  computed: {
    url() {
      if (this.title === "フットサル") {
        return "https://with-asset.chouseisan.com/uploads/2018/07/22175832/DkkQ0ZIhMVTXTkq1HUwKX0Cs0FQAGzIlPLQ7zdtY-1400x860.jpeg";
      } else if (this.title === "ランニング") {
        return "https://d3ilon0y191ut0.cloudfront.net/wp-content/uploads/2019/10/28162821/mens-running.jpeg";
      } else if (this.title === "腹筋") {
        return "https://live-publishing.jp/media/wp-content/uploads/iStock-951904174.jpg";
      } else if (this.title === "腕立て") {
        return "https://live-publishing.jp/media/wp-content/uploads/i-883035238-4.jpg";
      }
    },
  },
};
</script>

<style scoped>
.card {
  background-color: #fff;
  text-align: center;
  border: 1px solid #aaa;
  border-radius: 8px !important;
  width: calc(33.33333% - 42px);
  margin: 20px;
}
.flex {
  display: flex;
  align-items: center;
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
</style>
