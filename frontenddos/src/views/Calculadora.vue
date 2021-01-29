<template>
  <v-container fluid ma-0 pa-0 fill-height class="black">
    
    <v-row align="center"
      justify="center"> 
      <v-card class="pa-lg-4 mx-lg-16" width='300'>
        <v-form v-model="valid">
            <v-card-title class="justify-center"> Calculadora suma </v-card-title>

              <v-text-field
                v-model="operando1"
                :rules="numberRules"
                label="Primer operando"
              ></v-text-field>



              <v-text-field
                v-model="operando2"
                :rules="numberRules"
                label="Segundo operando"
              ></v-text-field>



              <v-text-field v-model="resultado" label="Resultado" disabled>
              </v-text-field>


              <v-btn
                class="mt-2"
                justify="center"
                width="80%"
                color="primary"
                v-on:click="calcularSuma"
                :style="{ left: '50%', transform: 'translateX(-50%)' }"
              >
                Calcular suma
              </v-btn>

        </v-form>
      </v-card>

      <v-form>
        <v-card class="pa-lg-4 mx-lg-5" width='300'>
            <v-card-title class="justify-center"> Calculadora factorial </v-card-title>
              <v-text-field
                v-model="operandoFact"
                :rules="numberRules"
                label="Operando"
              ></v-text-field>


              <v-text-field v-model="resultadoFact" label="Resultado" disabled>
              </v-text-field>


              <v-btn
                class="mt-2"
                justify="center"
                width="80%"
                color="primary"
                v-on:click="calcularFactorial"
                :style="{ left: '50%', transform: 'translateX(-50%)' }"
              >
                Calcular factorial
              </v-btn>
        </v-card>
      </v-form>
    </v-row>
    <p> probando jenkins </p>
  </v-container>
</template>

<script>
import axios from "axios";

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
    calcularSuma: function () {
      axios
        .post("http://159.203.75.95:30000/suma", {
          operando1: this.operando1,
          operando2: this.operando2,
        })
        .then((response) => {
          this.resultado = response.data.resultado;
        });
      console.log(this.resultado);
    },

    calcularFactorial: function () {
      axios
        .post("http://159.203.75.95:30000/factorial", {
          operando: this.operandoFact,
        })
        .then((response) => {
          this.resultadoFact = response.data.resultado;
        });
      console.log(this.resultadoFact);
    },

    save(date) {
      this.$refs.menu.save(date);
    },
  },
};
</script>