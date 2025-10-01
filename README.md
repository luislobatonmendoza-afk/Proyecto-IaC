# Proyecto SmartRetail S.A.C. – Infraestructura como Código

## 🚀 Objetivo
Desplegar una arquitectura en AWS que simule la infraestructura de una empresa ficticia.  
Automatizamos todo con **Terraform + Ansible**, asegurando **seguridad, escalabilidad y monitoreo**.

---

## 🔧 Componentes

- **Nginx Proxy**: balancea la carga entre los frontends.
- **Frontend apps**: microservicios simples (http-echo).
- **Base de datos**: PostgreSQL para datos persistentes y Redis para cache.
- **Monitoreo**: Prometheus recolecta métricas, Grafana muestra dashboards.
- **Firewall (Security Groups)**: asegura accesos solo desde IPs y puertos necesarios.

---

## 🔒 Redes lógicas
- `app_net`: proxy ↔ apps.
- `persistence_net`: apps ↔ postgres/redis.
- `monitor_net`: prometheus ↔ grafana ↔ exporters.

---

## 🌍 Beneficios para la empresa
- Reducción de costos (infra como código).
- Escalabilidad automática (frontends en múltiples instancias).
- Seguridad reforzada (firewall + redes aisladas).
- Observabilidad (prometheus + grafana).

