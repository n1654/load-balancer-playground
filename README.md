# Load balancer playground for devops school

## Description
This playground composed of one nginx container and two python containers that represent web-application.
Here you play with:
 - nginx configuration
 - flask configuration

## Diagram

                                                  ┌──────────────┐
                                                  │   python     │
                                 ┌───────────────►│       app    │
                                 │    tcp/5000    │              │
                                 │                │ 172.24.0.102 │
                                 │                └──────────────┘
            ┌──────────────┐     │
            │              ├─────┘
  tcp/80    │    Nginx     │
───────────►│              │
            │ 172.24.0.101 ├─────┐
            └──────────────┘     │
                                 │                ┌──────────────┐
                                 │                │   python     │
                                 │    tcp/5000    │       app    │
                                 └───────────────►│              │
                                                  │ 172.24.0.103 │
                                                  └──────────────┘

## Access
access app through nginx: `http://<host-IP>:60080`

access real server app 1 directly: `http://<host-IP>:5001/my-app/`
access real server app 2 directly: `http://<host-IP>:5002/my-app/`

`<host-IP>` - ip address of the host where Docker is running

## Host port mapping
| host:port | target:port | description |
|---|---|---|
| <host-IP>:60080 | 172.24.0.101:80 | nginx |
| <host-IP>:5001 | 172.24.0.102:5000 | python flask app |
| <host-IP>:5002 | 172.24.0.103:5000 | python flask app |
