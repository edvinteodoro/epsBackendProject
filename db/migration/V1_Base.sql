--CREATE DB
CREATE DATABASE PROCESOS_INGENIERIA;
USE PROCESOS_INGENIERIA;

-- PROCESOS_INGENIERIA.TIPO_SOLICITUD definition

CREATE TABLE `TIPO_SOLICITUD` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.VARIABLES_GLOBALES definition

CREATE TABLE `VARIABLES_GLOBALES` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `valor_num` double DEFAULT NULL,
  `valor_txt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.NOTIFICACION definition

CREATE TABLE `NOTIFICACION` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` int NOT NULL,
  `fecha` date NOT NULL,
  `leido` tinyint NOT NULL,
  `informacion` varchar(100) NOT NULL,
  `enlace` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.ETAPA_SOLICITUD definition

CREATE TABLE `ETAPA_SOLICITUD` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_solicitud_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ETAPA_SOLICITUD_id_IDX` (`id`) USING BTREE,
  KEY `ETAPA_TIPO_SOLICITUD_FK` (`tipo_solicitud_fk`),
  CONSTRAINT `ETAPA_TIPO_SOLICITUD_FK` FOREIGN KEY (`tipo_solicitud_fk`) REFERENCES `TIPO_SOLICITUD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.EXTRAORDINARIO definition

CREATE TABLE `EXTRAORDINARIO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `estado` varchar(100) NOT NULL,
  `id_estudiante` varchar(100) NOT NULL,
  `id_docente` varchar(100) NOT NULL,
  `id_secretaria` varchar(100) NOT NULL,
  `id_coordinador` varchar(100) NOT NULL,
  `etapa_solicitud_fk` int NOT NULL,
  `id_curso` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EXTRAORDINARIO_FK` (`etapa_solicitud_fk`),
  CONSTRAINT `EXTRAORDINARIO_FK` FOREIGN KEY (`etapa_solicitud_fk`) REFERENCES `ETAPA_SOLICITUD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.DICTAMEN_EQUIVALENCIA definition

CREATE TABLE `DICTAMEN_EQUIVALENCIA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` varchar(100) NOT NULL,
  `id_docente` varchar(100) NOT NULL,
  `id_secretaria` varchar(100) NOT NULL,
  `id_coordinador` varchar(100) NOT NULL,
  `nota` double NOT NULL,
  `etapa_solicitud_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DICTAMEN_EQUIVALENCIA_FK` (`etapa_solicitud_fk`),
  CONSTRAINT `DICTAMEN_EQUIVALENCIA_FK` FOREIGN KEY (`etapa_solicitud_fk`) REFERENCES `ETAPA_SOLICITUD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.DICTAMEN_CIERRE definition

CREATE TABLE `DICTAMEN_CIERRE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` varchar(100) NOT NULL,
  `id_coordinador` varchar(100) NOT NULL,
  `id_secretaria` varchar(100) NOT NULL,
  `nota` double DEFAULT NULL,
  `etapa_solicitud_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DICTAMEN_CIERRE_FK` (`etapa_solicitud_fk`),
  CONSTRAINT `DICTAMEN_CIERRE_FK` FOREIGN KEY (`etapa_solicitud_fk`) REFERENCES `ETAPA_SOLICITUD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.ACTA_COMPLEMENTO definition

CREATE TABLE `ACTA_COMPLEMENTO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` varchar(100) NOT NULL,
  `id_docente` varchar(100) DEFAULT NULL,
  `id_secretaroa` varchar(100) NOT NULL,
  `id_coordinador` varchar(100) DEFAULT NULL,
  `etapa_solicitud_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACTA_COMPLEMENTO_FK` (`etapa_solicitud_fk`),
  CONSTRAINT `ACTA_COMPLEMENTO_FK` FOREIGN KEY (`etapa_solicitud_fk`) REFERENCES `ETAPA_SOLICITUD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.CUARTA_OPORTUNIDAD definition

CREATE TABLE `CUARTA_OPORTUNIDAD` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` varchar(100) NOT NULL,
  `id_curso` varchar(100) DEFAULT NULL,
  `id_secretaria` varchar(100) NOT NULL,
  `id_coordinador` varchar(100) NOT NULL,
  `etapa_solicitud_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CUARTA_OPORTUNIDAD_FK` (`etapa_solicitud_fk`),
  CONSTRAINT `CUARTA_OPORTUNIDAD_FK` FOREIGN KEY (`etapa_solicitud_fk`) REFERENCES `ETAPA_SOLICITUD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.DESASIGNACION definition

CREATE TABLE `DESASIGNACION` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `estado` varchar(100) NOT NULL,
  `id_estudiante` varchar(100) NOT NULL,
  `curso_id` varchar(100) DEFAULT NULL,
  `docente_id` varchar(100) NOT NULL,
  `secretaria_id` varchar(100) NOT NULL,
  `coordinador_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `etapa_solicitud_fk` FOREIGN KEY (`id`) REFERENCES `ETAPA_SOLICITUD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.DOCUMENTO_EQUIVALENCIA definition

CREATE TABLE `DOCUMENTO_EQUIVALENCIA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_equivalencia_fk` int NOT NULL,
  `link_documento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENTO_EQUIVALENCIA_FK` (`id_equivalencia_fk`),
  CONSTRAINT `DOCUMENTO_EQUIVALENCIA_FK` FOREIGN KEY (`id_equivalencia_fk`) REFERENCES `DICTAMEN_EQUIVALENCIA` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.DOCUMENTO_CIERRE definition

CREATE TABLE `DOCUMENTO_CIERRE` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `link_doc` varchar(100) NOT NULL,
  `id_cierre_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENTO_CIERRE_FK` (`id_cierre_fk`),
  CONSTRAINT `DOCUMENTO_CIERRE_FK` FOREIGN KEY (`id_cierre_fk`) REFERENCES `DICTAMEN_CIERRE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.DOCUMENTO_ACTA definition

CREATE TABLE `DOCUMENTO_ACTA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_acta_fk` int NOT NULL,
  `link` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENTO_ACTA_FK` (`id_acta_fk`),
  CONSTRAINT `DOCUMENTO_ACTA_FK` FOREIGN KEY (`id_acta_fk`) REFERENCES `ACTA_COMPLEMENTO` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- PROCESOS_INGENIERIA.DOCUMENTO_CUARTA_OPORTUNIDAD definition

CREATE TABLE `DOCUMENTO_CUARTA_OPORTUNIDAD` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `id_cuarta_oportunidad_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENTO_CUARTA_OPORTUNIDAD_FK` (`id_cuarta_oportunidad_fk`),
  CONSTRAINT `DOCUMENTO_CUARTA_OPORTUNIDAD_FK` FOREIGN KEY (`id_cuarta_oportunidad_fk`) REFERENCES `CUARTA_OPORTUNIDAD` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
