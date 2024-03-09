pipeline {
  agent any
  stages {

    stage('Clean workspace directory') {
      steps {
        //  limpia el directorio de trabajo del proyecto
        bat 'echo Clean workspace directory'
        cleanWs notFailBuild: true
      }
    }

    stage('Cleanup stage') {
      steps {
        // Realiza tareas de limpieza adicionales si es necesario
        bat 'echo Cleanup stage'
      }
    }

    stage('Git checkout') {
      steps {
        // Realiza un checkout del repositorio Git especificado
        bat 'echo Git checkout'
        checkout scmGit(branches: [
          [name: '*/master']
        ], extensions: [], userRemoteConfigs: [
          [url: 'https://github.com/eberssgarcia/test-karate']
        ])
      }
    }

    stage('Restore package stage') {
      steps {
        // Restaurar paquetes o dependencias necesarias para el proyecto.
        bat 'echo Restore package'
      }
    }

    stage('Build stage') {
      steps {
        // Realiza la construcción del proyecto, que incluye compilar el código fuente utilizando Maven.
        bat 'echo Build'
        bat 'mvn clean compile'
      }
    }

    stage('Deploy') {
      steps {
        // Esta etapa puede incluir tareas relacionadas con la implementación o despliegue de la aplicación,
        // aunque en tu configuración actual solo imprime un mensaje en la consola
        bat 'echo Deploying the application..'
      }
    }

    stage('Test execution stage') {
      steps {
        // Esta etapa ejecuta las pruebas del proyecto utilizando Maven
        bat 'echo Test execution started'
        bat 'mvn test'
      }
    }

  }

  // Este bloque define acciones que se ejecutarán después de que se completen todas las etapas de la pipeline
  post {
    always {
      // Always: Este bloque se ejecuta siempre, independientemente del resultado de la construcción
      // Genera un reporte de pruebas Karate con la extensión Cucumber
      cucumber buildStatus: 'UNCHANGED',
        customCssFiles: '',
        customJsFiles: '',
        failedFeaturesNumber: -1,
        failedScenariosNumber: -1,
        failedStepsNumber: -1,
        fileIncludePattern: '**/*.json',
        jsonReportDirectory: 'target/karate-reports',
        pendingStepsNumber: -1,
        reportTitle: 'Karate Test Execution',
        skippedStepsNumber: -1,
        sortingMethod: 'ALPHABETICAL',
        undefinedStepsNumber: -1
    }

    // Failure: Este bloque se ejecuta si la construcción falla.
    failure {
      emailext subject: "${JOB_NAME} fallo ejecución",
        body: "El JOB ${JOB_NAME} ha fallado en la ejecución de las pruebas Karate. Puedes revisar el resultado [aquí](${BUILD_URL}execution/node/3/ws/target/cucumber-html-reports/overview-features.html).",
        to: "garciaayzanaeber@gmail.com"
    }

    // Success: Este bloque se ejecuta si la construcción tiene éxito.
    success {
      emailext subject: "${JOB_NAME} ejecuto correctamente",
        body: "El JOB ${JOB_NAME} ha ejecutado correctamente las pruebas Karate. Puedes revisar el resultado [aquí](${BUILD_URL}execution/node/3/ws/target/cucumber-html-reports/overview-features.html).",
        to: "garciaayzanaeber@gmail.com",
        attachLog: true
      //attachmentsPattern: "target/karate-reports/**/*.html"
    }

  }

}