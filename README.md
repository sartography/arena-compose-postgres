## arena-compose-postgres

This application consists of a frontend and a backend service, a PostgreSQL database, and a connector proxy, all orchestrated with Docker Compose.

### Services and Default Ports:

- `spiffworkflow-frontend`: The frontend user interface for the workflow application.
- `spiffworkflow-backend`: The backend service providing API endpoints for the frontend.
- `spiffdb`: A PostgreSQL database service used by the backend to store workflow data.
- `spiffworkflow-connector`: A connector proxy service for external integrations.

### Getting Started:

1. Ensure Docker and Docker Compose are installed on your system.
2. Clone the repository and navigate to the directory containing the `docker-compose.yml` file. The default ports are set in this file, but you can change them if needed.
3. Run `make up` to start all services. The services will be available on the following default ports:
4. Access the frontend at `http://localhost:8001`, where `8001` is the default port for the frontend service.
5. Access the backend API at `http://localhost:8000/v1.0`, where `8000` is the default port for the backend service.
6. Run `make down` to stop all services.

### Database Access:

To access the PostgreSQL database from within the `spiffdb` container, use the following command:

```sh
psql -U spiffuser -d spiffworkflow
```

The default username is `spiffuser` and the password is `spiffpass`, as configured in the `docker-compose.yml` file.

### Health Checks:

Health checks are configured for the `spiffworkflow-backend` and `spiffdb` services to ensure they are ready before dependent services start.

### Troubleshooting:

If you encounter any issues with the services, check the logs using `docker-compose logs`.
