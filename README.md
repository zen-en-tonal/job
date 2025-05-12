# Cron Job Docker Image

This Docker image runs a single cron job defined via environment variables.

## 🧰 Features

- Define both the schedule and the command using environment variables
- Automatically sets up and starts `cron` inside the container
- Logs output to `/var/log/cron.log`

## 🚀 How to Use

### 1. Required Environment Variables

| Variable         | Description                              | Example                      |
|------------------|------------------------------------------|------------------------------|
| `CRON_COMMAND`   | The command to execute                   | `echo "Hello from cron"`     |
| `CRON_SCHEDULE`  | Cron schedule expression (cron format)   | `"* * * * *"` (every minute) |

### 2. Docker Run Example

```bash
docker run -e CRON_COMMAND='echo "Hello from cron"' \
           -e CRON_SCHEDULE='*/5 * * * *' \
           ghcr.io/zen-en-tonal/job:latest
````

This will run the specified command every 5 minutes.

### 3. Logging

All cron output is redirected to `/var/log/cron.log`.
To see the logs in real time:

```bash
docker exec -it <container_id> tail -f /var/log/cron.log
```

## 🛠 How It Works

The entrypoint script does the following:

1. Verifies that both `CRON_COMMAND` and `CRON_SCHEDULE` are set
2. Writes a cron job to `/etc/cron.d/myjob`
3. Installs it using `crontab`
4. Runs the `cron` daemon in the foreground

## 🧪 Development

You can build this image locally like so:

```bash
docker build -t cron-job-image .
```

And test with:

```bash
docker run -e CRON_COMMAND='date' -e CRON_SCHEDULE='* * * * *' cron-job-image
```

## 📄 License

MIT (or your preferred license)
