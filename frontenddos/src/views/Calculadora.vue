<template>
  <v-form v-model="valid">
    <v-container mt-12>
      <v-col>
        <v-row rows="12" md="4">
          <v-text-field
            v-model="operando1"
            :rules="numberRules"
            label="Primer operando"
          ></v-text-field>
        </v-row>

        <v-row rows="12" md="4">
          <v-text-field
            v-model="operando2"
            :rules="numberRules"
            label="Segundo operando"
          ></v-text-field>
        </v-row>

        <v-row rows="12" md="4">
          <v-text-field
            v-model="resultado"
            label="Resultado"
            disabled
          >
          </v-text-field>
        </v-row>
        <v-row>
          <v-btn
            class="mt-2"
            justify="center"
            width="40%"
            color="primary"
            v-on:click="calcularSuma"
            :style="{left: '50%', transform:'translateX(-50%)'}"
          >
            Calcular suma
          </v-btn>
        </v-row>
      </v-col>
    </v-container>
  </v-form>
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
    valid: false,
    operando1: 0,
    operando2: 0,
    numberRules: [],
    resultado: 0,
  }),
  methods: {
    calcularSuma: function(){
      axios.post('http://localhost:1818/suma',{operando1: this.operando1, operando2:this.operando2}).then(response=>{
      this.resultado = response.data.resultado;
      })
      console.log(this.resultado);
      },
    
    save(date) {
      this.$refs.menu.save(date);
    },
  },
};
</script>