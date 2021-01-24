<template>
<v-container>
  <v-form v-model="valid">
    <v-container mt-12>
      <v-col cols="12" md="6">
        <center><v-title > Calculadora suma </v-title></center>
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
  <v-form>
    <v-container>
      <v-col cols="12" md="6">
        <center><v-title > Calculadora factorial </v-title></center>
        <v-row rows="12" md="4">
          <v-text-field
            v-model="operandoFact"
            :rules="numberRules"
            label="Operando"
          ></v-text-field>
        </v-row>

        <v-row rows="12" md="4">
          <v-text-field
            v-model="resultadoFact"
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
            v-on:click="calcularFactorial"
            :style="{left: '50%', transform:'translateX(-50%)'}"
          >
            Calcular factorial
          </v-btn>
        </v-row>
      </v-col>
    </v-container>
  </v-form>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
    valid: false,
    operando1: null,
    operando2: null,
    operandoFact: null,
    numberRules: [],
    resultado: null,
    resultadoFact: null,
  }),
  methods: {
    calcularSuma: function(){
      axios.post('http://localhost:1818/suma',{operando1: this.operando1, operando2:this.operando2}).then(response=>{
      this.resultado = response.data.resultado;
      })
      console.log(this.resultado);
      },

    calcularFactorial: function(){
      axios.post('http://localhost:1818/factorial',{operando: this.operandoFact}).then(response=>{
      this.resultadoFact = response.data.resultado;
      })
      console.log(this.resultadoFact);
      },
    
    save(date) {
      this.$refs.menu.save(date);
    },
  },
};
</script>