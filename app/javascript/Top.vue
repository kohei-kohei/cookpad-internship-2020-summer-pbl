<template>
  <div id="top">
    <p>トップページ</p>

    <p class="sub_title">今日の食事</p>

    <div class="flex">
      <template v-for="(e, key) in foods">
        <FoodCard
          :key="key"
          :url="e.url"
          :title="e.name"
          :volume="e.amount"
          :nutrition="e.nutrition"
        ></FoodCard>
      </template>
      <div class="card" @click="foodDialogVisible = true">
        <p class="add">追加する</p>
        <i class="el-icon-circle-plus-outline"></i>
      </div>
    </div>

    <el-dialog title="何を食べた？" :visible.sync="foodDialogVisible">
      <el-form :model="foodForm">
        <el-form-item label="料理名" :label-width="formLabelWidth">
          <el-input v-model="foodForm.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="食べた量" :label-width="formLabelWidth">
          <el-input v-model="foodForm.volume" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="foodDialogVisible = false">追加する</el-button>
      </span>
    </el-dialog>

    <p class="sub_title">今日の運動</p>

    <div class="flex">
      <template v-for="(e, key) in exercises">
        <ExerciseCard
          @click.native="changeForm(e)"
          :key="key"
          :id="e.id"
          :title="e.name"
          :time="e.time"
          :momentum="e.momentum"
        ></ExerciseCard>
      </template>
      <div class="card" @click="newExercise">
        <p class="add">追加する</p>
        <i class="el-icon-circle-plus-outline"></i>
      </div>
    </div>

    <el-dialog title="どんな運動した？" :visible.sync="exerciseDialogVisible">
      <el-form :model="exerciseForm">
        <el-form-item label="運動名" :label-width="formLabelWidth">
          <el-select v-model="exerciseForm.name" placeholder="選択してください">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="運動時間(分)" :label-width="formLabelWidth">
          <el-select v-model="exerciseForm.time" placeholder="選択してください">
            <el-option v-for="i of 30" :key="i" :label="i*10" :value="i*10"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="addExercise" v-if="exerciseForm.id === -1">追加する</el-button>
        <div class="flex_button">
          <el-button type="danger" @click="deleteExercise" v-if="exerciseForm.id > -1">削除する</el-button>
          <el-button type="warning" @click="updateExercise" v-if="exerciseForm.id > -1">編集する</el-button>
        </div>
      </span>
    </el-dialog>

    <el-button type="warning" @click="goRecipe">レシピの提案</el-button>
  </div>
</template>

<script>
import axios from "axios";
import FoodCard from "FoodCard.vue";
import ExerciseCard from "ExerciseCard.vue";

export default {
  components: {
    FoodCard,
    ExerciseCard,
  },
  data() {
    return {
      foods: [
        {
          url:
            "https://anna-media.jp/wp-content/uploads/2019/04/DSC_8799-e1555980678847.jpg",
          name: "食パン",
          amount: "１枚",
          nutrition: "タンパク質：5g",
        },
        {
          url:
            "https://img2.mypl.net/image.php?id=2fdb4f1375e90b138dbfa1302dc9889872739d95_cms_image.jpg&p=s3-img-origin02&s=480_740&op=",
          name: "ラーメン",
          amount: "１杯",
          nutrition: "タンパク質：20g",
        },
      ],
      exercises: [],
      foodDialogVisible: false,
      exerciseDialogVisible: false,
      foodForm: {
        name: "",
        volume: "",
      },
      exerciseForm: {
        id: -1,
        name: "",
        time: 0,
        momentum: 0,
      },
      options: [
        {
          value: "フットサル",
          label: "フットサル",
        },
        {
          value: "ランニング",
          label: "ランニング",
        },
        {
          value: "腹筋",
          label: "腹筋",
        },
        {
          value: "腕立て",
          label: "腕立て",
        },
      ],
      formLabelWidth: "120px",
    };
  },
  mounted() {
    axios.get("/api/v1/exercises.json").then((response) => {
      this.exercises = response.data;
    });
  },
  methods: {
    exerciseFormInit() {
      this.$set(this.exerciseForm, "id", -1);
      this.$set(this.exerciseForm, "name", "");
      this.$set(this.exerciseForm, "time", 0);
      this.$set(this.exerciseForm, "momentum", 0);
    },
    updateCards() {
      axios.get("/api/v1/exercises.json").then((response) => {
        this.exercises = response.data;
      });
    },
    checkForm() {
      const exerciseName = this.exerciseForm.name;
      if (exerciseName === "") {
        alert("運動名を選択してください");
        return;
      }

      if (this.exerciseForm.time === 0) {
        alert("運動時間を選択してください");
        return;
      }

      // 入力されていたら運動量の計算
      let METs = 0;
      if (exerciseName === "フットサル") {
        METs = 9;
      } else if (exerciseName === "ランニング") {
        METs = 11;
      } else if (exerciseName === "腹筋" || exerciseName === "腕立て") {
        METs = 5;
      }
      const bodyWeight = 65;
      this.exerciseForm.momentum = Math.round(
        METs * bodyWeight * (this.exerciseForm.time / 60)
      );

      this.exerciseDialogVisible = false;
    },
    changeForm(e) {
      this.exerciseDialogVisible = true;
      this.$set(this.exerciseForm, "id", e.id);
      this.$set(this.exerciseForm, "name", e.name);
      this.$set(this.exerciseForm, "time", e.time);
      this.$set(this.exerciseForm, "momentum", e.momentum);
    },
    updateExercise() {
      this.checkForm();
      axios
        .patch(`/api/v1/exercises/${this.exerciseForm.id}`, this.exerciseForm)
        .then((response) => {
          this.exerciseFormInit();
          this.updateCards();
        })
        .catch((error) => {
          alert(error);
        });
    },
    deleteExercise() {
      axios
        .delete(`/api/v1/exercises/${this.exerciseForm.id}`)
        .then((response) => {
          this.exerciseFormInit();
          this.updateCards();
          this.exerciseDialogVisible = false;
        })
        .catch((error) => {
          alert(error);
        });
    },
    newExercise() {
      this.exerciseFormInit();
      this.exerciseDialogVisible = true;
    },
    addExercise() {
      this.checkForm();
      axios
        .post("/api/v1/exercises", this.exerciseForm)
        .then((response) => {
          this.exerciseFormInit();
          this.updateCards();
        })
        .catch((error) => {
          alert(error);
        });
    },
    goRecipe() {
      this.$router.push({ path: "recipe" });
    },
  },
};
</script>

<style scoped>
#top {
  margin: 20px 200px;
}
p {
  font-size: 24px;
  text-align: center;
  margin: 0 0 20px 0;
}
.sub_title {
  margin: 50px 0 0 0;
}
table {
  margin: 0 auto;
}
button {
  display: block;
  margin: 20px auto;
}
.flex {
  align-items: center;
  display: flex;
  flex-wrap: wrap;
  text-align: center;
}
.card {
  background-color: #fff;
  text-align: center;
  border: 1px solid #aaa;
  border-radius: 0.3em;
  background-color: #fff;
  width: calc(33.33333% - 42px);
  margin: 20px;
  height: 304px;
}
.add {
  margin-top: 100px;
}
.el-icon-circle-plus-outline {
  font-size: 50px;
}
.el-input {
  width: 160px;
}
#top >>> .el-dialog {
  width: 400px !important;
}
.flex_button {
  display: flex;
  justify-content: space-between;
}
</style>
