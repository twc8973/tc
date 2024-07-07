<script setup lang="ts">
import { ref } from "vue";
async function submit() {
  //await new Promise((r) => setTimeout(r, 500));
  show.value = true;
}

function editable() {
  show.value = false;
}

class FormValues {
  name?: string;
  roomCount?: number;
  business?: string;
}

let value = ref(new FormValues());
let show = ref(false);

function totalBill(): string {
  if (value.value.roomCount === undefined) {
    return "???";
  }

  return "£" + value.value.roomCount * 10000;
}
</script>

<template>
  <div class="rounded-xl shadow-xl p-8 mx-auto my-16 max-w-[1050px]">
    <img
      src="../logo.jpeg"
      alt="FormKit Logo"
      width="244"
      height="50"
      class="mx-auto mb-8 w-48"
    />
    <FormKit
      type="form"
      :actions="false"
      #default="{ state: { valid } }"
      @submit="submit"
    >
      <FormKit
        type="text"
        name="name"
        label="Name"
        v-model="value.name"
        validation="required"
        :disabled="show"
      />

      <FormKit
        type="number"
        number
        name="room count"
        label="Room count"
        v-model="value.roomCount"
        validation="required"
        :disabled="show"
      />

      <FormKit
        type="select"
        label="What is your business?"
        name="business"
        v-model="value.business"
        :options="['Builder', 'Hair dresser', 'Accountant']"
        validation="required"
        :disabled="show"
      />

      <div v-bind:hidden="show">
        <FormKit type="submit" :disabled="!valid" />
      </div>
      <div v-bind:hidden="!show">
        <FormKit type="button" label="Edit" @click="editable()" />
      </div>
      <h1 class="mb-4 text-4xl font-extrabold" v-bind:hidden="!valid || !show">
        Total tax due: {{ totalBill() }}
      </h1>
    </FormKit>
  </div>
</template>
